package ast

import (
	"fmt"
	"strings"
)

type Object struct {
	ClassType      *ClassType
	InstanceFields *ObjectMap
	Final          bool
	Extra          map[string]interface{}
}

func CreateObject(t *ClassType) *Object {
	return &Object{
		ClassType:      t,
		InstanceFields: NewObjectMap(),
		Extra:          map[string]interface{}{},
	}
}

func (o *Object) Value() interface{} {
	return o.Extra["value"]
}

func (o *Object) IntegerValue() int64 {
	return o.Value().(int64)
}

func (o *Object) DoubleValue() float64 {
	return o.Value().(float64)
}

func (o *Object) BoolValue() bool {
	return o.Value().(bool)
}

func (o *Object) StringValue() string {
	value := o.Value();
	valueType := fmt.Sprintf("%T", value)
	
	if valueType != "string" {
		return o.ClassType.ToString(o)
	}

	return value.(string)
}

/**
 * ObjectMap
 */
type ObjectMap struct {
	Data map[string]*Object
}

func NewObjectMap() *ObjectMap {
	return &ObjectMap{
		Data: map[string]*Object{},
	}
}

func (m *ObjectMap) Set(k string, n *Object) {
	m.Data[strings.ToLower(k)] = n
}

func (m *ObjectMap) Get(k string) (*Object, bool) {
	n, ok := m.Data[strings.ToLower(k)]
	return n, ok
}

func (m *ObjectMap) All() map[string]*Object {
	if m == nil {
		return map[string]*Object{};
	}
	return m.Data
}
