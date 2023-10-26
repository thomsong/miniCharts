package builtin

import (
	"fmt"
	"math"
	"strconv"

	"github.com/dustin/go-humanize"
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
					return NewString(humanize.Commaf(value))
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
				StringType,
				[]*ast.Parameter{IntegerTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					places := int(params[0].IntegerValue())

					return NewString(fmt.Sprintf("%." + strconv.Itoa(places) + "f", this.DoubleValue()))
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
				StringType,
				[]*ast.Parameter{},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					value, err := strconv.ParseFloat(this.StringValue(), 64)
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
