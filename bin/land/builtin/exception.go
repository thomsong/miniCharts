package builtin

import (
	"fmt"
	"strings"

	"github.com/tzmfreedom/land/ast"
)

var ExceptionType = &ast.ClassType{}

var exceptionTypeParameter = &ast.Parameter{
	Type: ExceptionType,
	Name: "_",
}

func createExceptionType() {
	instanceMethods := ast.NewMethodMap()
	instanceMethods.Set(
		"getMessage",
		[]*ast.Method{
			ast.CreateMethod(
				"getMessage",
				StringType,
				[]*ast.Parameter{},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					// return this.Extra["message"]
					node := this.Extra["throw_node"].(ast.Node)
					
					loc := node.GetLocation()

					file := strings.Split(loc.FileName, "/classes/")[1]
					// fmt.Println(this);
					
					
					output := fmt.Sprintf("Uncaught %s: %s\n", this.ClassType, String(this.Extra["message"].(*ast.Object)))
					output += fmt.Sprintf("  Class %s line %d, column %d", file, loc.Line, loc.Column);
					
					return NewString(output)
				},
			),
		},
	)

	ExceptionType.Constructors = []*ast.Method{
		{
			Modifiers:  []*ast.Modifier{ast.PublicModifier()},
			Parameters: []*ast.Parameter{},
			NativeFunction: func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
				this.Extra["message"] = Null
				this.Extra["exception"] = Null
				return nil
			},
		},
		{
			Modifiers:  []*ast.Modifier{ast.PublicModifier()},
			Parameters: []*ast.Parameter{stringTypeParameter},
			NativeFunction: func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
				this.Extra["message"] = params[0]
				this.Extra["exception"] = Null
				return nil
			},
		},
		{
			Modifiers:  []*ast.Modifier{ast.PublicModifier()},
			Parameters: []*ast.Parameter{exceptionTypeParameter},
			NativeFunction: func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
				this.Extra["message"] = Null
				this.Extra["exception"] = params[0]
				return nil
			},
		},
	}
	ExceptionType.InstanceFields = ast.NewFieldMap()
	ExceptionType.StaticFields = ast.NewFieldMap()
	ExceptionType.InstanceMethods = instanceMethods
	ExceptionType.StaticMethods = ast.NewMethodMap()
	ExceptionType.ToString = func(o *ast.Object) string {
		return fmt.Sprintf("<%s> { message => %s } ", ExceptionType.Name, String(o.Extra["message"].(*ast.Object)))
	}
}

func init() {
	createExceptionType()
	primitiveClassMap.Set("Exception", ExceptionType)
}
