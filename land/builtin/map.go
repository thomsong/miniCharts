package builtin

import (
	"fmt"
	"strings"

	"github.com/tzmfreedom/land/ast"
)

var MapType = createMapType()

func CreateMapType(keyClass, valueClass *ast.ClassType) *ast.ClassType {

	return &ast.ClassType{
		Name:            "Map",
		Modifiers:       MapType.Modifiers,
		Constructors:    MapType.Constructors,
		InstanceFields:  MapType.InstanceFields,
		InstanceMethods: MapType.InstanceMethods,
		StaticFields:    MapType.StaticFields,
		StaticMethods:   MapType.StaticMethods,
		Generics:        []*ast.ClassType{keyClass, valueClass},
		ToString:        MapType.ToString,
	}
}

func createMapType() *ast.ClassType {
	instanceMethods := ast.NewMethodMap()
	instanceMethods.Set(
		"get",
		[]*ast.Method{
			ast.CreateMethod(
				"get",
				T2type,
				[]*ast.Parameter{t1Parameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					key := params[0].StringValue()
					values := this.Extra["values"].(map[string]*ast.Object)
					if v := values[key]; v != nil {
						return v
					}
					return nil
				},
			),
		},
	)
	instanceMethods.Set(
		"put",
		[]*ast.Method{
			ast.CreateMethod(
				"put",
				T2type,
				[]*ast.Parameter{t1Parameter, t2Parameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					key := params[0].StringValue()
					values := this.Extra["values"].(map[string]*ast.Object)
					values[key] = params[1]
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
					return NewInteger(int64(len(this.Extra["values"].(map[string]*ast.Object))))
				},
			),
		},
	)
	instanceMethods.Set(
		"keySet",
		[]*ast.Method{
			ast.CreateMethod(
				"keySet",
				CreateListType(StringType),
				[]*ast.Parameter{},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					values := this.Extra["values"].(map[string]*ast.Object)
					records := make([]*ast.Object, len(values))
					
					i := 0
					for key, _ := range values {
						records[i] = NewString(key)
						i++
					}

					list := ast.CreateObject(ListType)
					list.Extra["records"] = records
					
					return list
				},
			),
		},
	)

	classType := ast.CreateClass(
		"Map",
		[]*ast.Method{},
		instanceMethods,
		nil,
	)
	classType.ToString = func(o *ast.Object) string {
		values := o.Extra["values"].(map[string]*ast.Object)
		parameters := make([]string, len(values))
		i := 0
		for k, v := range values {
			parameters[i] = fmt.Sprintf("%s => %s", k, String(v))
			i++
		}
		if len(parameters) > 0 {
			return fmt.Sprintf("<Map> { %s }", strings.Join(parameters, ", "))
		}
		return fmt.Sprintf("<Map> {}")
	}
	return classType
}

func init() {
	primitiveClassMap.Set("Map", MapType)
}
