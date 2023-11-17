package builtin

import (
	"fmt"
	"math"
	"strconv"

	"github.com/tzmfreedom/land/ast"
)

var DoubleType = &ast.ClassType{
	Name:            "Double",
	InstanceMethods: ast.NewMethodMap(),
	StaticMethods:   ast.NewMethodMap(),
	ToString: func(o *ast.Object) string {
		return fmt.Sprintf("%f", o.Value().(float64))
	},
}

var doubleTypeParameter = &ast.Parameter{
	Type: DoubleType,
	Name: "_",
}

func init() {
	DoubleType.InstanceMethods.Set(
		"format",
		[]*ast.Method{
			ast.CreateMethod(
				"format",
				StringType,
				[]*ast.Parameter{},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					value := this.DoubleValue()
					strValue := fmt.Sprintf("%g",value)
					return NewString(strValue)
				},
			),
		},
	)
	DoubleType.InstanceMethods.Set(
		"intValue",
		[]*ast.Method{
			ast.CreateMethod(
				"intValue",
				IntegerType,
				[]*ast.Parameter{},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					value := this.DoubleValue()
					return NewInteger(int64(value))
				},
			),
		},
	)
	DoubleType.InstanceMethods.Set(
		"longValue",
		[]*ast.Method{
			ast.CreateMethod(
				"longValue",
				LongType,
				[]*ast.Parameter{},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					value := this.DoubleValue()
					return NewLong(int64(value))
				},
			),
		},
	)
	DoubleType.InstanceMethods.Set(
		"round",
		[]*ast.Method{
			ast.CreateMethod(
				"round",
				LongType,
				[]*ast.Parameter{},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					value := this.DoubleValue()
					return NewLong(int64(math.Round(value)))
				},
			),
		},
	)

	DoubleType.InstanceMethods.Set(
		"setScale",
		[]*ast.Method{
			ast.CreateMethod(
				"setScale",
				DoubleType,
				[]*ast.Parameter{IntegerTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					places := int(params[0].IntegerValue())
					
					// this.Extra["value"] = append(records, listElement)

					// return NewString(fmt.Sprintf("%." + strconv.Itoa(places) + "f", this.DoubleValue()))

					return NewDouble(math.Round(this.DoubleValue() * math.Pow10(places)) / math.Pow10(places))
					// value := this.DoubleValue()
					// /places := params[0].IntegerValue()

					// return NewString(String.valueOf(math.Round(value * math.Pow10(places))/math.Pow10(places)))
				},
			),
		},
	)

	DoubleType.StaticMethods.Set(
		"valueOf",
		[]*ast.Method{
			ast.CreateMethod(
				"valueOf",
				DoubleType,
				[]*ast.Parameter{IntegerTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					value  := params[0].IntegerValue()
					return NewDouble(float64(value))
				},
			),
			ast.CreateMethod(
				"valueOf",
				DoubleType,
				[]*ast.Parameter{stringTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					value, err := strconv.ParseFloat(params[0].StringValue(), 64)
					if err != nil {
						panic(err)
					}
					return NewDouble(value)
				},
			),
			ast.CreateMethod(
				"valueOf",
				ObjectType,
				[]*ast.Parameter{},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					if this.ClassType == DoubleType {
						return this
					}
					panic("no expected type")
				},
			),
		},
	)

	primitiveClassMap.Set("Double", DoubleType)
	primitiveClassMap.Set("Decimal", DoubleType)
}
