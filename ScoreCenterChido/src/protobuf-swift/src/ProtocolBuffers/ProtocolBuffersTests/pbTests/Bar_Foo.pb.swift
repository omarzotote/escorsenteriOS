// Generated by the protocol buffer compiler.  DO NOT EDIT!

import Foundation
import ProtocolBuffers


internal struct Bar { }

internal func == (lhs: Bar.Foo, rhs: Bar.Foo) -> Bool {
  if (lhs === rhs) {
    return true
  }
  var fieldCheck:Bool = (lhs.hashValue == rhs.hashValue)
  fieldCheck = fieldCheck && (lhs.hasHello == rhs.hasHello) && (!lhs.hasHello || lhs.hello == rhs.hello)
  return (fieldCheck && (lhs.unknownFields == rhs.unknownFields))
}

internal extension Bar {
  internal struct FooRoot {
    internal static var sharedInstance : FooRoot {
     struct Static {
         static let instance : FooRoot = FooRoot()
     }
     return Static.instance
    }
    internal var extensionRegistry:ExtensionRegistry

    init() {
      extensionRegistry = ExtensionRegistry()
      registerAllExtensions(extensionRegistry)
    }
    internal func registerAllExtensions(registry:ExtensionRegistry) {
    }
  }

  final internal class Foo : GeneratedMessage, GeneratedMessageProtocol {
    private(set) var hasHello:Bool = false
    private(set) var hello:String = ""

    required internal init() {
         super.init()
    }
    override internal func isInitialized() -> Bool {
     return true
    }
    override internal func writeToCodedOutputStream(output:CodedOutputStream) {
      if hasHello {
        output.writeString(1, value:hello)
      }
      unknownFields.writeToCodedOutputStream(output)
    }
    override internal func serializedSize() -> Int32 {
      var serialize_size:Int32 = memoizedSerializedSize
      if serialize_size != -1 {
       return serialize_size
      }

      serialize_size = 0
      if hasHello {
        serialize_size += hello.computeStringSize(1)
      }
      serialize_size += unknownFields.serializedSize()
      memoizedSerializedSize = serialize_size
      return serialize_size
    }
    internal class func parseFromData(data:NSData) -> Bar.Foo {
      return Bar.Foo.builder().mergeFromData(data, extensionRegistry:Bar.FooRoot.sharedInstance.extensionRegistry).build()
    }
    internal class func parseFromData(data:NSData, extensionRegistry:ExtensionRegistry) -> Bar.Foo {
      return Bar.Foo.builder().mergeFromData(data, extensionRegistry:extensionRegistry).build()
    }
    internal class func parseFromInputStream(input:NSInputStream) -> Bar.Foo {
      return Bar.Foo.builder().mergeFromInputStream(input).build()
    }
    internal class func parseFromInputStream(input:NSInputStream, extensionRegistry:ExtensionRegistry) ->Bar.Foo {
      return Bar.Foo.builder().mergeFromInputStream(input, extensionRegistry:extensionRegistry).build()
    }
    internal class func parseFromCodedInputStream(input:CodedInputStream) -> Bar.Foo {
      return Bar.Foo.builder().mergeFromCodedInputStream(input).build()
    }
    internal class func parseFromCodedInputStream(input:CodedInputStream, extensionRegistry:ExtensionRegistry) -> Bar.Foo {
      return Bar.Foo.builder().mergeFromCodedInputStream(input, extensionRegistry:extensionRegistry).build()
    }
    internal class func builder() -> Bar.FooBuilder {
      return Bar.Foo.classBuilder() as! Bar.FooBuilder
    }
    internal func builder() -> Bar.FooBuilder {
      return classBuilder() as! Bar.FooBuilder
    }
    internal override class func classBuilder() -> MessageBuilder {
      return Bar.FooBuilder()
    }
    internal override func classBuilder() -> MessageBuilder {
      return Bar.Foo.builder()
    }
    internal func toBuilder() -> Bar.FooBuilder {
      return Bar.Foo.builderWithPrototype(self)
    }
    internal class func builderWithPrototype(prototype:Bar.Foo) -> Bar.FooBuilder {
      return Bar.Foo.builder().mergeFrom(prototype)
    }
    override internal func writeDescriptionTo(inout output:String, indent:String) {
      if hasHello {
        output += "\(indent) hello: \(hello) \n"
      }
      unknownFields.writeDescriptionTo(&output, indent:indent)
    }
    override internal var hashValue:Int {
        get {
            var hashCode:Int = 7
            if hasHello {
               hashCode = (hashCode &* 31) &+ hello.hashValue
            }
            hashCode = (hashCode &* 31) &+  unknownFields.hashValue
            return hashCode
        }
    }


    //Meta information declaration start

    override internal class func className() -> String {
        return "Bar.Foo"
    }
    override internal func className() -> String {
        return "Bar.Foo"
    }
    override internal func classMetaType() -> GeneratedMessage.Type {
        return Bar.Foo.self
    }
    //Meta information declaration end

  }

  final internal class FooBuilder : GeneratedMessageBuilder {
    private var builderResult:Bar.Foo

    required override internal init () {
       builderResult = Bar.Foo()
       super.init()
    }
    var hasHello:Bool {
         get {
              return builderResult.hasHello
         }
    }
    var hello:String {
         get {
              return builderResult.hello
         }
         set (value) {
             builderResult.hasHello = true
             builderResult.hello = value
         }
    }
    func setHello(value:String)-> Bar.FooBuilder {
      self.hello = value
      return self
    }
    internal func clearHello() -> Bar.FooBuilder{
         builderResult.hasHello = false
         builderResult.hello = ""
         return self
    }
    override internal var internalGetResult:GeneratedMessage {
         get {
            return builderResult
         }
    }
    internal override func clear() -> Bar.FooBuilder {
      builderResult = Bar.Foo()
      return self
    }
    internal override func clone() -> Bar.FooBuilder {
      return Bar.Foo.builderWithPrototype(builderResult)
    }
    internal override func build() -> Bar.Foo {
         checkInitialized()
         return buildPartial()
    }
    internal func buildPartial() -> Bar.Foo {
      var returnMe:Bar.Foo = builderResult
      return returnMe
    }
    internal func mergeFrom(other:Bar.Foo) -> Bar.FooBuilder {
      if (other == Bar.Foo()) {
       return self
      }
      if other.hasHello {
           hello = other.hello
      }
      mergeUnknownFields(other.unknownFields)
      return self
    }
    internal override func mergeFromCodedInputStream(input:CodedInputStream) ->Bar.FooBuilder {
         return mergeFromCodedInputStream(input, extensionRegistry:ExtensionRegistry())
    }
    internal override func mergeFromCodedInputStream(input:CodedInputStream, extensionRegistry:ExtensionRegistry) -> Bar.FooBuilder {
      var unknownFieldsBuilder:UnknownFieldSetBuilder = UnknownFieldSet.builderWithUnknownFields(self.unknownFields)
      while (true) {
        var tag = input.readTag()
        switch tag {
        case 0: 
          self.unknownFields = unknownFieldsBuilder.build()
          return self

        case 10 :
          hello = input.readString()

        default:
          if (!parseUnknownField(input,unknownFields:unknownFieldsBuilder, extensionRegistry:extensionRegistry, tag:tag)) {
             unknownFields = unknownFieldsBuilder.build()
             return self
          }
        }
      }
    }
  }

}

// @@protoc_insertion_point(global_scope)
