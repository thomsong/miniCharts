package builtin

import (
	"math"
	"math/rand"
	"time"

	"github.com/tzmfreedom/land/ast"
)

func init() {
	instanceMethods := ast.NewMethodMap()
	staticMethods := ast.NewMethodMap()
	mathType := ast.CreateClass(
		"Math",
		[]*ast.Method{
			ast.CreateMethod(
				"Math",
				nil,
				[]*ast.Parameter{},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					return nil
				},
			),
		},
		instanceMethods,
		staticMethods,
	)

	staticMethods.Set(
		"cos",
		[]*ast.Method{
			ast.CreateMethod(
				"cos",
				DoubleType,
				[]*ast.Parameter{doubleTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					return NewDouble(math.Cos(params[0].DoubleValue()))
				},
			),
			ast.CreateMethod(
				"cos",
				DoubleType,
				[]*ast.Parameter{IntegerTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					return NewDouble(math.Cos(float64(params[0].IntegerValue())))
				},
			),
		},
	)

	staticMethods.Set(
		"sin",
		[]*ast.Method{
			ast.CreateMethod(
				"sin",
				DoubleType,
				[]*ast.Parameter{doubleTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					return NewDouble(math.Sin(params[0].DoubleValue()))
				},
			),
			ast.CreateMethod(
				"sin",
				DoubleType,
				[]*ast.Parameter{IntegerTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					return NewDouble(math.Sin(float64(params[0].IntegerValue())))
				},
			),
		},
	)

	staticMethods.Set(
		"floor",
		[]*ast.Method{
			ast.CreateMethod(
				"floor",
				IntegerType,
				[]*ast.Parameter{doubleTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					return NewInteger(int64(math.Floor(params[0].DoubleValue())))
				},
			),
		},
	)
	staticMethods.Set(
		"abs",
		[]*ast.Method{
			ast.CreateMethod(
				"abs",
				DoubleType,
				[]*ast.Parameter{doubleTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					return NewDouble(math.Abs(params[0].DoubleValue()))
				},
			),
		},
	)
	staticMethods.Set(
		"ceil",
		[]*ast.Method{
			ast.CreateMethod(
				"ceil",
				IntegerType,
				[]*ast.Parameter{doubleTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					return NewInteger(int64(math.Ceil(params[0].DoubleValue())))
				},
			),
		},
	)
	staticMethods.Set(
		"min",
		[]*ast.Method{
			ast.CreateMethod(
				"min",
				IntegerType,
				[]*ast.Parameter{IntegerTypeParameter,IntegerTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					return NewInteger( int64( math.Min( float64(params[0].IntegerValue()), float64(params[1].IntegerValue()) ) ) )
				},
			),
		},
	)

	staticMethods.Set(
		"max",
		[]*ast.Method{
			ast.CreateMethod(
				"max",
				IntegerType,
				[]*ast.Parameter{IntegerTypeParameter,IntegerTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					return NewInteger( int64( math.Max( float64(params[0].IntegerValue()), float64(params[1].IntegerValue()) ) ) )
				},
			),
		},
	)

	staticMethods.Set(
		"round",
		[]*ast.Method{
			ast.CreateMethod(
				"round",
				IntegerType,
				[]*ast.Parameter{doubleTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					return NewInteger(int64(math.Round(params[0].DoubleValue())))
				},
			),
		},
	)
	staticMethods.Set(
		"random",
		[]*ast.Method{
			ast.CreateMethod(
				"random",
				DoubleType,
				[]*ast.Parameter{},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					rand.Seed(time.Now().UnixNano())
					return NewDouble(rand.Float64())
				},
			),
		},
	)

	primitiveClassMap.Set("Math", mathType)
}
