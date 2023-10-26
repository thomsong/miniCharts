package builtin

import (
	"fmt"
	"strconv"

	"github.com/dustin/go-humanize"
	"github.com/tzmfreedom/land/ast"
)

var LongType = IntegerType;

var _LongType = &ast.ClassType{
	Name:            "Long",
	InstanceMethods: ast.NewMethodMap(),
	StaticMethods:   ast.NewMethodMap(),
	ToString: func(o *ast.Object) string {
		return fmt.Sprintf("%d", o.IntegerValue())
	},
}

var longTypeParameter = &ast.Parameter{
	Type: LongType,
	Name: "_",
}

func init() {
	LongType.InstanceMethods.Set(
		"format",
		[]*ast.Method{
			ast.CreateMethod(
				"format",
				StringType,
				[]*ast.Parameter{},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					value := this.IntegerValue()
					return NewString(humanize.Comma(int64(value)))
				},
			),
		},
	)
	LongType.InstanceMethods.Set(
		"intValue",
		[]*ast.Method{
			ast.CreateMethod(
				"intValue",
				IntegerType,
				[]*ast.Parameter{},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					return NewInteger(this.IntegerValue())
				},
			),
		},
	)
	LongType.StaticMethods.Set(
		"valueOf",
		[]*ast.Method{
			ast.CreateMethod(
				"valueOf",
				LongType,
				[]*ast.Parameter{stringTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					value, err := strconv.ParseInt(params[0].StringValue(), 10, 64)
					if err != nil {
						panic(err)
					}
					return NewLong(value)
				},
			),
		},
	)

	primitiveClassMap.Set("_Long", LongType)
	primitiveClassMap.Set("Long", LongType)
}
