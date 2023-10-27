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
	system := ast.CreateClass(
		"System",
		nil,
		nil,
		&ast.MethodMap{
			Data: map[string][]*ast.Method{
				"env": {
					ast.CreateMethod(
						"env",
						StringType,
						[]*ast.Parameter{
							objectTypeParameter,
						},
						func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							return NewString(os.Getenv(parameter[0].StringValue()))
						},
					),
				},
				"debug": {
					&ast.Method{
						Name:       "debug",
						Modifiers:  []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{objectTypeParameter},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							o := parameter[0]
							stdout := extra["stdout"].(io.Writer)
							fmt.Fprintln(stdout, String(o))
							return nil
						},
					},
				},
			},
		},
	)

	primitiveClassMap.Set("system", system)
}
