package builtin

import (
	"sort"

	"github.com/tzmfreedom/land/ast"
)

var SetType = &ast.ClassType{Name: "List"}

var SetTypeParameter = &ast.Parameter{
	Type: SetType,
	Name: "_",
}

func CreateSetType(classType *ast.ClassType) *ast.ClassType {
	return &ast.ClassType{
		Name:            "List",
		Modifiers:       SetType.Modifiers,
		Constructors:    SetType.Constructors,
		InstanceFields:  SetType.InstanceFields,
		InstanceMethods: SetType.InstanceMethods,
		StaticFields:    SetType.StaticFields,
		StaticMethods:   SetType.StaticMethods,
		Generics:        []*ast.ClassType{classType},
		ToString:        SetType.ToString,
	}
}

func CreateSetTypeRef(typeRef *ast.TypeRef) *ast.TypeRef {
	return &ast.TypeRef{
		Name:       []string{"List"},
		Parameters: []*ast.TypeRef{typeRef},
	}
}

func CreateSetTypeParameter(classType *ast.ClassType) *ast.Parameter {
	return &ast.Parameter{
		Type: CreateSetType(classType),
		Name: "_",
	}
}

func CreateSetObject(classType *ast.ClassType, records []*ast.Object) *ast.Object {
	listObj := ast.CreateObject(SetType)
	listObj.Extra["records"] = records
	return listObj
}

func createSetType() {
	instanceMethods := ast.NewMethodMap()
	instanceMethods.Set(
		"add",
		[]*ast.Method{
			ast.CreateMethod(
				"add",
				nil,
				[]*ast.Parameter{t1Parameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					checker := extra["interpreter"].(EqualChecker)
					listElement := params[0]
					records := this.Extra["records"].([]*ast.Object)
					for _, record := range records {
						if checker.Equals(record, listElement) {
							return nil
						}
					}
					
					this.Extra["records"] = append(records, listElement)
					return nil
				},
			),
		},
	)
	instanceMethods.Set(
		"get",
		[]*ast.Method{
			ast.CreateMethod(
				"get",
				ObjectType,
				[]*ast.Parameter{IntegerTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					listElementIndex := params[0].IntegerValue()

					records := this.Extra["records"].([]*ast.Object)
					return NewString(String(records[listElementIndex]));
				},
			),
		},
	)

	instanceMethods.Set(
		"sort",
		[]*ast.Method{
			ast.CreateMethod(
				"sort",
				nil,
				[]*ast.Parameter{},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					records := this.Extra["records"].([]*ast.Object)
					sort.SliceStable(records, func(i, j int) bool {
						return String(records[i]) < String(records[j])
					})
					return nil
				},
			),
		},
	)
	instanceMethods.Set(
		"size",
		[]*ast.Method{
			ast.CreateMethod(
				"size",
				IntegerType,
				[]*ast.Parameter{},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					return NewInteger(int64(len(this.Extra["records"].([]*ast.Object))))
				},
			),
		},
	)
	instanceMethods.Set(
		"contains",
		[]*ast.Method{
			ast.CreateMethod(
				"contains",
				BooleanType,
				[]*ast.Parameter{
					objectTypeParameter,
				},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					checker := extra["interpreter"].(EqualChecker)
					target := params[0]
					records := this.Extra["records"].([]*ast.Object)
					for _, record := range records {
						if checker.Equals(record, target) {
							return NewBoolean(true)
						}
					}
					return NewBoolean(false)
				},
			),
		},
	)

	SetType.Constructors = []*ast.Method{
		{
			Modifiers:  []*ast.Modifier{ast.PublicModifier()},
			Parameters: []*ast.Parameter{},
			NativeFunction: func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
				return nil
			},
		},
		{
			Modifiers: []*ast.Modifier{ast.PublicModifier()},
			Parameters: []*ast.Parameter{
				{
					Type: CreateSetType(T1type),
					Name: "list",
				},
			},
			NativeFunction: func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
				listObj := params[0]
				listParams := listObj.Extra["records"].([]*ast.Object)
				newListParams := make([]*ast.Object, len(listParams))
				for i, listParam := range listParams {
					newListParams[i] = &ast.Object{
						ClassType: listParam.ClassType,
					}
				}
				this.Extra = map[string]interface{}{
					"records": newListParams,
				}
				return nil
			},
		},
	}
	SetType.InstanceFields = ast.NewFieldMap()
	SetType.StaticFields = ast.NewFieldMap()
	SetType.InstanceMethods = instanceMethods
	SetType.StaticMethods = ast.NewMethodMap()
}

func init() {
	createSetType()
	primitiveClassMap.Set("set", SetType)
}
