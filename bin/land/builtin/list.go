package builtin

import (
	"sort"

	"github.com/tzmfreedom/land/ast"
)

var ListType = &ast.ClassType{Name: "List"}

var ListTypeParameter = &ast.Parameter{
	Type: ListType,
	Name: "_",
}

func CreateListType(classType *ast.ClassType) *ast.ClassType {
	return &ast.ClassType{
		Name:            "List",
		Modifiers:       ListType.Modifiers,
		Constructors:    ListType.Constructors,
		InstanceFields:  ListType.InstanceFields,
		InstanceMethods: ListType.InstanceMethods,
		StaticFields:    ListType.StaticFields,
		StaticMethods:   ListType.StaticMethods,
		Generics:        []*ast.ClassType{classType},
		ToString:        ListType.ToString,
	}
}

func CreateListTypeRef(typeRef *ast.TypeRef) *ast.TypeRef {
	return &ast.TypeRef{
		Name:       []string{"List"},
		Parameters: []*ast.TypeRef{typeRef},
	}
}

func CreateListTypeParameter(classType *ast.ClassType) *ast.Parameter {
	return &ast.Parameter{
		Type: CreateListType(classType),
		Name: "_",
	}
}

func CreateListObject(classType *ast.ClassType, records []*ast.Object) *ast.Object {
	listObj := ast.CreateObject(ListType)
	listObj.Extra["records"] = records
	return listObj
}

var T1type = &ast.ClassType{Name: "T:1"}
var T2type = &ast.ClassType{Name: "T:2"}

var t1Parameter = &ast.Parameter{
	Type: T1type,
	Name: "_",
}

var t2Parameter = &ast.Parameter{
	Type: T2type,
	Name: "_",
}

var t1TypeRef = &ast.TypeRef{
	Name:       []string{"T:1"},
	Parameters: []*ast.TypeRef{},
}

var t2TypeRef = &ast.TypeRef{
	Name:       []string{"T:2"},
	Parameters: []*ast.TypeRef{},
}

func createListType() {
	instanceMethods := ast.NewMethodMap()
	instanceMethods.Set(
		"add",
		[]*ast.Method{
			ast.CreateMethod(
				"add",
				nil,
				[]*ast.Parameter{t1Parameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					records := this.Extra["records"].([]*ast.Object)
					listElement := params[0]
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

	instanceMethods.Set(
		"indexof",
		[]*ast.Method{
			ast.CreateMethod(
				"indexof",
				IntegerType,
				[]*ast.Parameter{
					objectTypeParameter,
				},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					checker := extra["interpreter"].(EqualChecker)
					target := params[0]
					records := this.Extra["records"].([]*ast.Object)
					idx := 0
					for _, record := range records {
						if checker.Equals(record, target) {
							return NewInteger(int64(idx))
						}

						idx++;
					}
					return NewInteger(-1)
				},
			),
		},
	)

	ListType.Constructors = []*ast.Method{
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
					Type: CreateListType(T1type),
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
	ListType.InstanceFields = ast.NewFieldMap()
	ListType.StaticFields = ast.NewFieldMap()
	ListType.InstanceMethods = instanceMethods
	ListType.StaticMethods = ast.NewMethodMap()
}

func init() {
	createListType()
	primitiveClassMap.Set("list", ListType)
	// primitiveClassMap.Set("set", ListType)
}
