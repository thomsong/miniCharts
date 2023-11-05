package builtin

import (
	"fmt"
	"io"
	"os"

	"github.com/tzmfreedom/land/ast"
)


func init() {
	assert := ast.CreateClass(
		"Assert",
		nil,
		nil,
		&ast.MethodMap{
			Data: map[string][]*ast.Method{
				"areequal": {
					&ast.Method{
						Name:      "areequal",
						Modifiers: []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{
							objectTypeParameter,
							objectTypeParameter,
						},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							expected := parameter[0]
							actual := parameter[1]

							checker := extra["interpreter"].(EqualChecker)
							if !checker.Equals(expected, actual) {
								node := extra["node"].(ast.Node)
								
								errors := extra["errors"].([]*TestError)
								conditionMsg := fmt.Sprintf("expected: %s\nactual:   %s", String(expected), String(actual))
								extra["errors"] = append(errors, &TestError{
									Node: node,
									Message:  "",
									Condition: conditionMsg,
								})

								loc := node.GetLocation()
								fmt.Fprintf(extra["stderr"].(io.Writer), "System.AssertException: Assertion Failed\n")
								fmt.Fprintf(extra["stderr"].(io.Writer), "  expected: %s\n  actual:   %s\n  at %s %d:%d\n", String(expected), String(actual),loc.FileName, loc.Line, loc.Column)

								isTestRunning := extra["isTestRunning"] != nil && extra["isTestRunning"].(bool) == true
								if !isTestRunning {
									os.Exit(0)
								}
							}

							return nil
						},
					},

					&ast.Method{
						Name:      "areequal",
						Modifiers: []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{
							objectTypeParameter,
							objectTypeParameter,
							stringTypeParameter,
						},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							expected := parameter[0]
							actual := parameter[1]
							msg := parameter[2].StringValue()

							checker := extra["interpreter"].(EqualChecker)
							if !checker.Equals(expected, actual) {
								node := extra["node"].(ast.Node)
								
								errors := extra["errors"].([]*TestError)
								conditionMsg := fmt.Sprintf("expected: %s\nactual:   %s", String(expected), String(actual))
								extra["errors"] = append(errors, &TestError{
									Node: node,
									Message:  msg,
									Condition: conditionMsg,
								})

								loc := node.GetLocation()
								fmt.Fprintf(extra["stderr"].(io.Writer), "System.AssertException: Assertion Failed\n")
								fmt.Fprintf(extra["stderr"].(io.Writer), " %s\n", msg)
								fmt.Fprintf(extra["stderr"].(io.Writer), "  expected: %s\n  actual:   %s\n  at %s %d:%d\n", String(expected), String(actual),loc.FileName, loc.Line, loc.Column)

								isTestRunning := extra["isTestRunning"] != nil && extra["isTestRunning"].(bool) == true
								if !isTestRunning {
									os.Exit(0)
								}
							}
							return nil
						},
					},
				},
				"arenotequal": {
					&ast.Method{
						Name:      "arenotequal",
						Modifiers: []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{
							objectTypeParameter,
							objectTypeParameter,
						},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							expected := parameter[0]
							actual := parameter[1]

							checker := extra["interpreter"].(EqualChecker)
							if checker.Equals(expected, actual) {
								node := extra["node"].(ast.Node)
								
								errors := extra["errors"].([]*TestError)
								conditionMsg := fmt.Sprintf("expected: %s\nactual:   %s", String(expected), String(actual))
								extra["errors"] = append(errors, &TestError{
									Node: node,
									Message:  "",
									Condition: conditionMsg,
								})

								loc := node.GetLocation()
								fmt.Fprintf(extra["stderr"].(io.Writer), "System.AssertException: Assertion Failed\n")
								fmt.Fprintf(extra["stderr"].(io.Writer), "  expected: %s\n  actual:   %s\n  at %s %d:%d\n", String(expected), String(actual),loc.FileName, loc.Line, loc.Column)

								isTestRunning := extra["isTestRunning"] != nil && extra["isTestRunning"].(bool) == true
								if !isTestRunning {
									os.Exit(0)
								}
							}
							return nil
						},
					},

					&ast.Method{
						Name:      "arenotequal",
						Modifiers: []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{
							objectTypeParameter,
							objectTypeParameter,
							stringTypeParameter,
						},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							expected := parameter[0]
							actual := parameter[1]
							msg := parameter[2].StringValue()

							checker := extra["interpreter"].(EqualChecker)
							if checker.Equals(expected, actual) {
								node := extra["node"].(ast.Node)
								
								errors := extra["errors"].([]*TestError)
								conditionMsg := fmt.Sprintf("expected: %s\nactual:   %s", String(expected), String(actual))
								extra["errors"] = append(errors, &TestError{
									Node: node,
									Message:  msg,
									Condition: conditionMsg,
								})

								loc := node.GetLocation()
								fmt.Fprintf(extra["stderr"].(io.Writer), "System.AssertException: Assertion Failed\n")
								fmt.Fprintf(extra["stderr"].(io.Writer), " %s\n", msg)
								fmt.Fprintf(extra["stderr"].(io.Writer), "  expected: %s\n  actual:   %s\n  at %s %d:%d\n", String(expected), String(actual),loc.FileName, loc.Line, loc.Column)

								isTestRunning := extra["isTestRunning"] != nil && extra["isTestRunning"].(bool) == true
								if !isTestRunning {
									os.Exit(0)
								}
							}
							return nil
						},
					},
				},
				"fail": {
					&ast.Method{
						Name:      "fail",
						Modifiers: []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							node := extra["node"].(ast.Node)
							
							errors := extra["errors"].([]*TestError)
							extra["errors"] = append(errors, &TestError{
								Node: node,
								Message:  "",
								Condition: "",
							})

							fmt.Fprintf(extra["stderr"].(io.Writer), "System.AssertException: Assertion Failed\n")
							
							isTestRunning := extra["isTestRunning"] != nil && extra["isTestRunning"].(bool) == true
							if !isTestRunning {
								os.Exit(0)
							}
						
							return nil
						},
					},

					&ast.Method{
						Name:      "fail",
						Modifiers: []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{
							stringTypeParameter,
						},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							msg := parameter[0].StringValue()
							node := extra["node"].(ast.Node)
							
							errors := extra["errors"].([]*TestError)
							extra["errors"] = append(errors, &TestError{
								Node: node,
								Message:  msg,
								Condition: "",
							})

							fmt.Fprintf(extra["stderr"].(io.Writer), "System.AssertException: Assertion Failed\n")
							fmt.Fprintf(extra["stderr"].(io.Writer), " %s\n", msg)

							isTestRunning := extra["isTestRunning"] != nil && extra["isTestRunning"].(bool) == true
							if !isTestRunning {
								os.Exit(0)
							}
						
							return nil
						},
					},
				},
				"isfalse": {
					&ast.Method{
						Name:      "isfalse",
						Modifiers: []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{
							booleanTypeParameter,
						},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							actual := parameter[0].BoolValue()
							node := extra["node"].(ast.Node)
							
							if (actual) {
								errors := extra["errors"].([]*TestError)
								extra["errors"] = append(errors, &TestError{
									Node: node,
									Message:  "",
									Condition: "expected: false\nactual:   true",
								})

								loc := node.GetLocation()
								fmt.Fprintf(extra["stderr"].(io.Writer), "System.AssertException: Assertion Failed\n")
								fmt.Fprintf(extra["stderr"].(io.Writer),"  expected: false\n  actual:   true\n  at %s %d:%d\n", loc.FileName, loc.Line, loc.Column)

								isTestRunning := extra["isTestRunning"] != nil && extra["isTestRunning"].(bool) == true
								if !isTestRunning {
									os.Exit(0)
								}
							}

							return nil
						},
					},

					&ast.Method{
						Name:      "isfalse",
						Modifiers: []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{
							booleanTypeParameter,
							stringTypeParameter,
						},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							actual := parameter[0].BoolValue()
							msg := parameter[1].StringValue()
							
							node := extra["node"].(ast.Node)
							
							if (actual) {
								errors := extra["errors"].([]*TestError)
								extra["errors"] = append(errors, &TestError{
									Node: node,
									Message:  msg,
									Condition: "expected: false\nactual:   true",
								})

								loc := node.GetLocation()
								fmt.Fprintf(extra["stderr"].(io.Writer), "System.AssertException: Assertion Failed\n")
								fmt.Fprintf(extra["stderr"].(io.Writer), " %s\n", msg)
								fmt.Fprintf(extra["stderr"].(io.Writer),"  expected: false\n  actual:   true\n  at %s %d:%d\n", loc.FileName, loc.Line, loc.Column)

								isTestRunning := extra["isTestRunning"] != nil && extra["isTestRunning"].(bool) == true
								if !isTestRunning {
									os.Exit(0)
								}
							}

							return nil
						},
					},
				},
				"istrue": {
					&ast.Method{
						Name:      "istrue",
						Modifiers: []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{
							booleanTypeParameter,
						},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							actual := parameter[0].BoolValue()
							node := extra["node"].(ast.Node)
							
							if (!actual) {
								errors := extra["errors"].([]*TestError)
								extra["errors"] = append(errors, &TestError{
									Node: node,
									Message:  "",
									Condition: "expected: true\nactual:   false",
								})

								loc := node.GetLocation()
								fmt.Fprintf(extra["stderr"].(io.Writer), "System.AssertException: Assertion Failed\n")
								fmt.Fprintf(extra["stderr"].(io.Writer),"  expected: true\n  actual:   false\n  at %s %d:%d\n", loc.FileName, loc.Line, loc.Column)

								isTestRunning := extra["isTestRunning"] != nil && extra["isTestRunning"].(bool) == true
								if !isTestRunning {
									os.Exit(0)
								}
							}

							return nil
						},
					},

					&ast.Method{
						Name:      "istrue",
						Modifiers: []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{
							booleanTypeParameter,
							stringTypeParameter,
						},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							expected := parameter[0].BoolValue()
							msg := parameter[1].StringValue()
							
							node := extra["node"].(ast.Node)
							
							if (!expected) {
								errors := extra["errors"].([]*TestError)
								extra["errors"] = append(errors, &TestError{
									Node: node,
									Message:  msg,
									Condition: "expected: true\nactual:   false",
								})

								loc := node.GetLocation()
								fmt.Fprintf(extra["stderr"].(io.Writer), "System.AssertException: Assertion Failed\n")
								fmt.Fprintf(extra["stderr"].(io.Writer), " %s\n", msg)
								fmt.Fprintf(extra["stderr"].(io.Writer),"  expected: true\n  actual:   false\n  at %s %d:%d\n", loc.FileName, loc.Line, loc.Column)

								isTestRunning := extra["isTestRunning"] != nil && extra["isTestRunning"].(bool) == true
								if !isTestRunning {
									os.Exit(0)
								}
							}

							return nil
						},
					},
				},
				"isnull": {
					&ast.Method{
						Name:      "isnull",
						Modifiers: []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{
							objectTypeParameter,
						},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							actual := parameter[0]
							node := extra["node"].(ast.Node)
							conditionMsg := fmt.Sprintf("expected: null\nactual:   %s", String(actual))
							if (actual.ClassType.Name != "null") {
								errors := extra["errors"].([]*TestError)
								extra["errors"] = append(errors, &TestError{
									Node: node,
									Message:  "",
									Condition: conditionMsg,
								})

								loc := node.GetLocation()
								fmt.Fprintf(extra["stderr"].(io.Writer), "System.AssertException: Assertion Failed\n")
								fmt.Fprintf(extra["stderr"].(io.Writer),"  expected: null\n  actual:   %s\n  at %s %d:%d\n",String(actual), loc.FileName, loc.Line, loc.Column)

								isTestRunning := extra["isTestRunning"] != nil && extra["isTestRunning"].(bool) == true
								if !isTestRunning {
									os.Exit(0)
								}
							}

							return nil
						},
					},

					&ast.Method{
						Name:      "isnull",
						Modifiers: []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{
							objectTypeParameter,
							stringTypeParameter,
						},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							actual := parameter[0]
							msg := parameter[1].StringValue()
							
							node := extra["node"].(ast.Node)
							conditionMsg := fmt.Sprintf("expected: null\nactual:   %s", String(actual))
							if (actual.ClassType.Name != "null") {
								errors := extra["errors"].([]*TestError)
								extra["errors"] = append(errors, &TestError{
									Node: node,
									Message:  msg,
									Condition: conditionMsg,
								})

								loc := node.GetLocation()
								fmt.Fprintf(extra["stderr"].(io.Writer), "System.AssertException: Assertion Failed\n")
								fmt.Fprintf(extra["stderr"].(io.Writer), " %s\n", msg)
								fmt.Fprintf(extra["stderr"].(io.Writer),"  expected: null\n  actual:   %s\n  at %s %d:%d\n",String(actual), loc.FileName, loc.Line, loc.Column)

								isTestRunning := extra["isTestRunning"] != nil && extra["isTestRunning"].(bool) == true
								if !isTestRunning {
									os.Exit(0)
								}
							}

							return nil
						},
					},
				},
				"isnotnull": {
					&ast.Method{
						Name:      "isnotnull",
						Modifiers: []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{
							objectTypeParameter,
						},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							actual := parameter[0]
							node := extra["node"].(ast.Node)
							
							if (actual.ClassType.Name == "null") {
								errors := extra["errors"].([]*TestError)
								extra["errors"] = append(errors, &TestError{
									Node: node,
									Message:  "",
									Condition: "expected: not null\nactual:   null",
								})

								loc := node.GetLocation()
								fmt.Fprintf(extra["stderr"].(io.Writer), "System.AssertException: Assertion Failed\n")
								fmt.Fprintf(extra["stderr"].(io.Writer),"  expected: not null\n  actual:   null\n  at %s %d:%d\n", loc.FileName, loc.Line, loc.Column)

								isTestRunning := extra["isTestRunning"] != nil && extra["isTestRunning"].(bool) == true
								if !isTestRunning {
									os.Exit(0)
								}
							}

							return nil
						},
					},

					&ast.Method{
						Name:      "isnotnull",
						Modifiers: []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{
							objectTypeParameter,
							stringTypeParameter,
						},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							actual := parameter[0]
							msg := parameter[1].StringValue()
							
							node := extra["node"].(ast.Node)
							
							if (actual.ClassType.Name == "null") {
								errors := extra["errors"].([]*TestError)
								extra["errors"] = append(errors, &TestError{
									Node: node,
									Message:  msg,
									Condition: "expected: not null\nactual:   null",
								})

								loc := node.GetLocation()
								fmt.Fprintf(extra["stderr"].(io.Writer), "System.AssertException: Assertion Failed\n")
								fmt.Fprintf(extra["stderr"].(io.Writer), " %s\n", msg)
								fmt.Fprintf(extra["stderr"].(io.Writer),"  expected: not null\n  actual:   null\n  at %s %d:%d\n", loc.FileName, loc.Line, loc.Column)

								isTestRunning := extra["isTestRunning"] != nil && extra["isTestRunning"].(bool) == true
								if !isTestRunning {
									os.Exit(0)
								}
							}

							return nil
						},
					},
				},
				"isinstanceoftype": {
					&ast.Method{
						Name:      "isinstanceoftype",
						Modifiers: []*ast.Modifier{ast.PublicModifier()},
						Parameters: []*ast.Parameter{
							objectTypeParameter,
							objectTypeParameter,
						},
						NativeFunction: func(this *ast.Object, parameter []*ast.Object, extra map[string]interface{}) interface{} {
							// instance := parameter[0]
							expectedType := parameter[1]
							
							// fmt.Printf("instance: %s\n",instance.ClassType.Name);
							// fmt.Printf("expectedType: %T\n",expectedType);
							node := extra["node"].(ast.Node)
							
							errors := extra["errors"].([]*TestError)
								extra["errors"] = append(errors, &TestError{
									Node: node,
									Message:  fmt.Sprintf("%s",expectedType.ClassType.Name),
									Condition: "expected: true\nactual:   false",
								})
							

							return nil
						},
					},
				},
			},
		},
	)

	primitiveClassMap.Set("assert", assert)
}

type TestError struct {
	Node    ast.Node
	Condition string
	Message string
}
