package compiler

import (
	"fmt"

	"github.com/tzmfreedom/land/ast"
)

type ClassRegisterVisitor struct{}

func (v *ClassRegisterVisitor) VisitClassDeclaration(n *ast.ClassDeclaration) (interface{}, error) {
	t := &ast.ClassType{}
	t.Name = n.Name
	t.Modifiers = n.Modifiers
	t.ImplementClassRefs = n.ImplementClassRefs
	t.InnerClasses = ast.NewClassMap()
	t.SuperClassRef = n.SuperClassRef
	t.Location = n.Location
	t.Annotations = n.Annotations
	t.Parent = n.Parent

	err := v.setDeclaration(n.Declarations, t)
	if err != nil {
		return nil, err
	}
	return t, nil
}

func (v *ClassRegisterVisitor) VisitModifier(n *ast.Modifier) (interface{}, error) {
	return ast.VisitModifier(v, n)
}

func (v *ClassRegisterVisitor) VisitAnnotation(n *ast.Annotation) (interface{}, error) {
	return ast.VisitAnnotation(v, n)
}

func (v *ClassRegisterVisitor) VisitInterfaceDeclaration(n *ast.InterfaceDeclaration) (interface{}, error) {
	t := &ast.ClassType{}
	t.Name = n.Name
	t.Modifiers = n.Modifiers
	t.InnerClasses = ast.NewClassMap()
	t.Location = n.Location
	t.Annotations = n.Annotations
	t.Parent = n.Parent
	t.Interface = true

	err := v.setMethods(n.Methods, t)
	for _, methods := range t.InstanceMethods.All() {
		for _, method := range methods {
			method.Modifiers = []*ast.Modifier{ast.PublicModifier()}
		}
	}

	if err != nil {
		return nil, err
	}
	return t, nil
}

func (v *ClassRegisterVisitor) VisitIntegerLiteral(n *ast.IntegerLiteral) (interface{}, error) {
	return ast.VisitIntegerLiteral(v, n)
}

func (v *ClassRegisterVisitor) VisitParameter(n *ast.Parameter) (interface{}, error) {
	return ast.VisitParameter(v, n)
}

func (v *ClassRegisterVisitor) VisitArrayAccess(n *ast.ArrayAccess) (interface{}, error) {
	return ast.VisitArrayAccess(v, n)
}

func (v *ClassRegisterVisitor) VisitBooleanLiteral(n *ast.BooleanLiteral) (interface{}, error) {
	return ast.VisitBooleanLiteral(v, n)
}

func (v *ClassRegisterVisitor) VisitBreak(n *ast.Break) (interface{}, error) {
	return ast.VisitBreak(v, n)
}

func (v *ClassRegisterVisitor) VisitContinue(n *ast.Continue) (interface{}, error) {
	return ast.VisitContinue(v, n)
}

func (v *ClassRegisterVisitor) VisitDml(n *ast.Dml) (interface{}, error) {
	return ast.VisitDml(v, n)
}

func (v *ClassRegisterVisitor) VisitDoubleLiteral(n *ast.DoubleLiteral) (interface{}, error) {
	return ast.VisitDoubleLiteral(v, n)
}

func (v *ClassRegisterVisitor) VisitFieldDeclaration(n *ast.FieldDeclaration) (interface{}, error) {
	return ast.VisitFieldDeclaration(v, n)
}

func (v *ClassRegisterVisitor) VisitTry(n *ast.Try) (interface{}, error) {
	return ast.VisitTry(v, n)
}

func (v *ClassRegisterVisitor) VisitCatch(n *ast.Catch) (interface{}, error) {
	return ast.VisitCatch(v, n)
}

func (v *ClassRegisterVisitor) VisitFinally(n *ast.Finally) (interface{}, error) {
	return ast.VisitFinally(v, n)
}

func (v *ClassRegisterVisitor) VisitFor(n *ast.For) (interface{}, error) {
	return ast.VisitFor(v, n)
}

func (v *ClassRegisterVisitor) VisitForControl(n *ast.ForControl) (interface{}, error) {
	return ast.VisitForControl(v, n)
}

func (v *ClassRegisterVisitor) VisitEnhancedForControl(n *ast.EnhancedForControl) (interface{}, error) {
	return ast.VisitEnhancedForControl(v, n)
}

func (v *ClassRegisterVisitor) VisitIf(n *ast.If) (interface{}, error) {
	return ast.VisitIf(v, n)
}

func (v *ClassRegisterVisitor) VisitMethodDeclaration(n *ast.MethodDeclaration) (interface{}, error) {
	return ast.VisitMethodDeclaration(v, n)
}

func (v *ClassRegisterVisitor) VisitMethodInvocation(n *ast.MethodInvocation) (interface{}, error) {
	return ast.VisitMethodInvocation(v, n)
}

func (v *ClassRegisterVisitor) VisitNew(n *ast.New) (interface{}, error) {
	return ast.VisitNew(v, n)
}

func (v *ClassRegisterVisitor) VisitNullLiteral(n *ast.NullLiteral) (interface{}, error) {
	return ast.VisitNullLiteral(v, n)
}

func (v *ClassRegisterVisitor) VisitUnaryOperator(n *ast.UnaryOperator) (interface{}, error) {
	return ast.VisitUnaryOperator(v, n)
}

func (v *ClassRegisterVisitor) VisitBinaryOperator(n *ast.BinaryOperator) (interface{}, error) {
	return ast.VisitBinaryOperator(v, n)
}

func (v *ClassRegisterVisitor) VisitInstanceofOperator(n *ast.InstanceofOperator) (interface{}, error) {
	return ast.VisitInstanceofOperator(v, n)
}

func (v *ClassRegisterVisitor) VisitReturn(n *ast.Return) (interface{}, error) {
	return ast.VisitReturn(v, n)
}

func (v *ClassRegisterVisitor) VisitThrow(n *ast.Throw) (interface{}, error) {
	return ast.VisitThrow(v, n)
}

func (v *ClassRegisterVisitor) VisitSoql(n *ast.Soql) (interface{}, error) {
	return ast.VisitSoql(v, n)
}

func (v *ClassRegisterVisitor) VisitSosl(n *ast.Sosl) (interface{}, error) {
	return ast.VisitSosl(v, n)
}

func (v *ClassRegisterVisitor) VisitStringLiteral(n *ast.StringLiteral) (interface{}, error) {
	return ast.VisitStringLiteral(v, n)
}

func (v *ClassRegisterVisitor) VisitSwitch(n *ast.Switch) (interface{}, error) {
	return ast.VisitSwitch(v, n)
}

func (v *ClassRegisterVisitor) VisitTrigger(n *ast.Trigger) (interface{}, error) {
	return ast.VisitTrigger(v, n)
}

func (v *ClassRegisterVisitor) VisitTriggerTiming(n *ast.TriggerTiming) (interface{}, error) {
	return ast.VisitTriggerTiming(v, n)
}

func (v *ClassRegisterVisitor) VisitVariableDeclaration(n *ast.VariableDeclaration) (interface{}, error) {
	return ast.VisitVariableDeclaration(v, n)
}

func (v *ClassRegisterVisitor) VisitVariableDeclarator(n *ast.VariableDeclarator) (interface{}, error) {
	return ast.VisitVariableDeclarator(v, n)
}

func (v *ClassRegisterVisitor) VisitWhen(n *ast.When) (interface{}, error) {
	return ast.VisitWhen(v, n)
}

func (v *ClassRegisterVisitor) VisitWhenType(n *ast.WhenType) (interface{}, error) {
	return ast.VisitWhenType(v, n)
}

func (v *ClassRegisterVisitor) VisitWhile(n *ast.While) (interface{}, error) {
	return ast.VisitWhile(v, n)
}

func (v *ClassRegisterVisitor) VisitNothingStatement(n *ast.NothingStatement) (interface{}, error) {
	return ast.VisitNothingStatement(v, n)
}

func (v *ClassRegisterVisitor) VisitCastExpression(n *ast.CastExpression) (interface{}, error) {
	return ast.VisitCastExpression(v, n)
}

func (v *ClassRegisterVisitor) VisitFieldAccess(n *ast.FieldAccess) (interface{}, error) {
	return ast.VisitFieldAccess(v, n)
}

func (v *ClassRegisterVisitor) VisitType(n *ast.TypeRef) (interface{}, error) {
	return ast.VisitType(v, n)
}

func (v *ClassRegisterVisitor) VisitBlock(n *ast.Block) (interface{}, error) {
	return ast.VisitBlock(v, n)
}

func (v *ClassRegisterVisitor) VisitGetterSetter(n *ast.GetterSetter) (interface{}, error) {
	return ast.VisitGetterSetter(v, n)
}

func (v *ClassRegisterVisitor) VisitPropertyDeclaration(n *ast.PropertyDeclaration) (interface{}, error) {
	return ast.VisitPropertyDeclaration(v, n)
}

func (v *ClassRegisterVisitor) VisitArrayInitializer(n *ast.ArrayInitializer) (interface{}, error) {
	return ast.VisitArrayInitializer(v, n)
}

func (v *ClassRegisterVisitor) VisitArrayCreator(n *ast.ArrayCreator) (interface{}, error) {
	return ast.VisitArrayCreator(v, n)
}

func (v *ClassRegisterVisitor) VisitSoqlBindVariable(n *ast.SoqlBindVariable) (interface{}, error) {
	return ast.VisitSoqlBindVariable(v, n)
}

func (v *ClassRegisterVisitor) VisitTernalyExpression(n *ast.TernalyExpression) (interface{}, error) {
	return ast.VisitTernalyExpression(v, n)
}

func (v *ClassRegisterVisitor) VisitMapCreator(n *ast.MapCreator) (interface{}, error) {
	return ast.VisitMapCreator(v, n)
}

func (v *ClassRegisterVisitor) VisitSetCreator(n *ast.SetCreator) (interface{}, error) {
	return ast.VisitSetCreator(v, n)
}

func (v *ClassRegisterVisitor) VisitName(n *ast.Name) (interface{}, error) {
	return ast.VisitName(v, n)
}

func (v *ClassRegisterVisitor) VisitConstructorDeclaration(n *ast.ConstructorDeclaration) (interface{}, error) {
	return ast.VisitConstructorDeclaration(v, n)
}

func (v *ClassRegisterVisitor) setDeclaration(declarations []ast.Node, t *ast.ClassType) error {
	t.InstanceFields = ast.NewFieldMap()
	t.StaticFields = ast.NewFieldMap()
	t.InstanceMethods = ast.NewMethodMap()
	t.StaticMethods = ast.NewMethodMap()
	t.Constructors = []*ast.Method{}

	for _, d := range declarations {
		switch decl := d.(type) {
		case *ast.ConstructorDeclaration:
			t.Constructors = append(
				t.Constructors,
				ast.NewConstructor(t, decl),
			)
		case *ast.MethodDeclaration:
			// TODO: check method name and signature to prevent conflict
			if decl.IsStatic() {
				t.StaticMethods.Add(decl.Name, ast.NewMethod(t, decl))
			} else {
				t.InstanceMethods.Add(decl.Name, ast.NewMethod(t, decl))
			}
		case *ast.PropertyDeclaration:
			identifier := decl.Identifier
			if decl.IsStatic() {
				if _, ok := t.StaticFields.Get(identifier); ok {
					return fmt.Errorf("Field %s is already defined", identifier)
				}
				var setter ast.Node
				var getter ast.Node
				for _, getterSetter := range decl.GetterSetters {
					if getterSetter.IsGet() {
						getter = getterSetter
					} else {
						setter = getterSetter
					}
				}
				t.StaticFields.Set(
					identifier,
					&ast.Field{
						TypeRef:    decl.TypeRef,
						Modifiers:  decl.Modifiers,
						Name:       identifier,
						Expression: &ast.NullLiteral{},
						Getter:     getter,
						Setter:     setter,
					},
				)
			} else {
				if _, ok := t.InstanceFields.Get(identifier); ok {
					return fmt.Errorf("Field %s is already defined", identifier)
				}
				var setter ast.Node
				var getter ast.Node
				for _, getterSetter := range decl.GetterSetters {
					if getterSetter.IsGet() {
						getter = getterSetter
					} else {
						setter = getterSetter
					}
				}
				t.InstanceFields.Set(
					identifier,
					&ast.Field{
						TypeRef:    decl.TypeRef,
						Modifiers:  decl.Modifiers,
						Name:       identifier,
						Expression: &ast.NullLiteral{},
						Getter:     getter,
						Setter:     setter,
					},
				)
			}
		case *ast.FieldDeclaration:
			if decl.IsStatic() {
				for _, d := range decl.Declarators {
					if _, ok := t.StaticFields.Get(d.Name); ok {
						return fmt.Errorf("Field %s is already defined", d.Name)
					}
					t.StaticFields.Set(
						d.Name,
						&ast.Field{
							TypeRef:    decl.TypeRef,
							Modifiers:  decl.Modifiers,
							Name:       d.Name,
							Expression: d.Expression,
						},
					)
				}
			} else {
				for _, d := range decl.Declarators {
					if _, ok := t.InstanceFields.Get(d.Name); ok {
						return fmt.Errorf("Field %s is already defined", d.Name)
					}
					t.InstanceFields.Set(
						d.Name,
						&ast.Field{
							TypeRef:    decl.TypeRef,
							Modifiers:  decl.Modifiers,
							Name:       d.Name,
							Expression: d.Expression,
						},
					)
				}
			}
		case *ast.ClassDeclaration:
			r, err := decl.Accept(v)
			if err != nil {
				return err
			}
			class := r.(*ast.ClassType)
			if _, ok := t.InnerClasses.Get(class.Name); ok {
				return fmt.Errorf("Class %s is already defined", class.Name)
			}
			t.InnerClasses.Set(class.Name, class)
		}
	}
	return nil
}

func (v *ClassRegisterVisitor) setMethods(methods []*ast.MethodDeclaration, t *ast.ClassType) error {
	t.InstanceFields = ast.NewFieldMap()
	t.StaticFields = ast.NewFieldMap()
	t.InstanceMethods = ast.NewMethodMap()
	t.StaticMethods = ast.NewMethodMap()
	t.Constructors = []*ast.Method{}

	for _, d := range methods {
		// TODO: check method name and signature to prevent conflict
		if d.IsStatic() {
			t.StaticMethods.Add(d.Name, ast.NewMethod(t, d))
		} else {
			t.InstanceMethods.Add(d.Name, ast.NewMethod(t, d))
		}
	}
	return nil
}
