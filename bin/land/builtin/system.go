package builtin

import (
	"fmt"
	"io"
	"os"

	"github.com/tzmfreedom/land/ast"
)

const (
	InfoColor    = "\033[1;34m%s\033[0m"
	NoticeColor  = "\033[1;36m%s\033[0m"
	WarningColor = "\033[1;33m%s\033[0m"
	ErrorColor   = "\033[1;31m%s\033[0m"
	DebugColor   = "\033[0;36m%s\033[0m"
	SuccessColor   = "\033[1;32m%s\033[0m"

	GrayColor   = "\033[2;37m%s\033[0m"
	WhiteColor   = "\033[1;37m%s\033[0m"
)

type EqualChecker interface {
	Equals(*ast.Object, *ast.Object) bool
}

func init() {
	staticMethods := ast.NewMethodMap()
	// instanceFields := ast.NewFieldMap()
	
	system := ast.CreateClass(
		"System",
		[]*ast.Method{
			ast.CreateMethod(
				"System",
				nil,
				[]*ast.Parameter{},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					return nil
				},
			),
		},
		nil,
		staticMethods,
	)

	

	staticMethods.Set(
		"env",
		[]*ast.Method{
			ast.CreateMethod(
				"env",
				StringType,
				[]*ast.Parameter{stringTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					return NewString(os.Getenv(params[0].StringValue()))
				},
			),
		},
	)

	staticMethods.Set(
		"debug",
		[]*ast.Method{
			ast.CreateMethod(
				"debug",
				StringType,
				[]*ast.Parameter{objectTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					o := params[0]
					stdout := extra["stdout"].(io.Writer)
					fmt.Fprintln(stdout, String(o))
					return nil
				},
			),
			ast.CreateMethod(
				"debug",
				StringType,
				[]*ast.Parameter{stringTypeParameter, objectTypeParameter},
				func(this *ast.Object, params []*ast.Object, extra map[string]interface{}) interface{} {
					errorLevel := params[0].StringValue()
					o := params[1]
					stdout := extra["stdout"].(io.Writer)
					stderr := extra["stderr"].(io.Writer)

					if errorLevel == "ERROR" {
						fmt.Fprintln(stderr, String(o))
					} else {
						fmt.Fprintln(stdout, String(o))
					}
					
					return nil
				},
			),
		},
	)

	primitiveClassMap.Set("system", system)
}
