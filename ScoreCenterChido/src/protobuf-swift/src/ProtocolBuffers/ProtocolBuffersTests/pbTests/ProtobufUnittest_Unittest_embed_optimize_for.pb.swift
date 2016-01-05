// Generated by the protocol buffer compiler.  DO NOT EDIT!

import Foundation
import ProtocolBuffers


internal extension ProtobufUnittest{}

internal func == (lhs: ProtobufUnittest.TestEmbedOptimizedForSize, rhs: ProtobufUnittest.TestEmbedOptimizedForSize) -> Bool {
  if (lhs === rhs) {
    return true
  }
  var fieldCheck:Bool = (lhs.hashValue == rhs.hashValue)
  fieldCheck = fieldCheck && (lhs.hasOptionalMessage == rhs.hasOptionalMessage) && (!lhs.hasOptionalMessage || lhs.optionalMessage == rhs.optionalMessage)
  fieldCheck = fieldCheck && (lhs.repeatedMessage == rhs.repeatedMessage)
  return (fieldCheck && (lhs.unknownFields == rhs.unknownFields))
}

internal extension ProtobufUnittest {
  internal struct UnittestEmbedOptimizeForRoot {
    internal static var sharedInstance : UnittestEmbedOptimizeForRoot {
     struct Static {
         static let instance : UnittestEmbedOptimizeForRoot = UnittestEmbedOptimizeForRoot()
     }
     return Static.instance
    }
    internal var extensionRegistry:ExtensionRegistry

    init() {
      extensionRegistry = ExtensionRegistry()
      registerAllExtensions(extensionRegistry)
      ProtobufUnittest.UnittestOptimizeForRoot.sharedInstance.registerAllExtensions(extensionRegistry)
    }
    internal func registerAllExtensions(registry:ExtensionRegistry) {
    }
  }

  final internal class TestEmbedOptimizedForSize : GeneratedMessage, GeneratedMessageProtocol {
    private(set) var hasOptionalMessage:Bool = false
    private(set) var optionalMessage:ProtobufUnittest.TestOptimizedForSize!
    private(set) var repeatedMessage:Array<ProtobufUnittest.TestOptimizedForSize>  = Array<ProtobufUnittest.TestOptimizedForSize>()
    required internal init() {
         super.init()
    }
    override internal func isInitialized() -> Bool {
      if hasOptionalMessage {
       if !optionalMessage.isInitialized() {
         return false
       }
      }
      var isInitrepeatedMessage:Bool = true
      for oneElementrepeatedMessage in repeatedMessage {
          if (!oneElementrepeatedMessage.isInitialized()) {
              isInitrepeatedMessage = false
              break 
          }
      }
      if !isInitrepeatedMessage {
       return isInitrepeatedMessage
       }
     return true
    }
    override internal func writeToCodedOutputStream(output:CodedOutputStream) {
      if hasOptionalMessage {
        output.writeMessage(1, value:optionalMessage)
      }
      for oneElementrepeatedMessage in repeatedMessage {
          output.writeMessage(2, value:oneElementrepeatedMessage)
      }
      unknownFields.writeToCodedOutputStream(output)
    }
    override internal func serializedSize() -> Int32 {
      var serialize_size:Int32 = memoizedSerializedSize
      if serialize_size != -1 {
       return serialize_size
      }

      serialize_size = 0
      if hasOptionalMessage {
          if let varSizeoptionalMessage = optionalMessage?.computeMessageSize(1) {
              serialize_size += varSizeoptionalMessage
          }
      }
      for oneElementrepeatedMessage in repeatedMessage {
          serialize_size += oneElementrepeatedMessage.computeMessageSize(2)
      }
      serialize_size += unknownFields.serializedSize()
      memoizedSerializedSize = serialize_size
      return serialize_size
    }
    internal class func parseFromData(data:NSData) -> ProtobufUnittest.TestEmbedOptimizedForSize {
      return ProtobufUnittest.TestEmbedOptimizedForSize.builder().mergeFromData(data, extensionRegistry:ProtobufUnittest.UnittestEmbedOptimizeForRoot.sharedInstance.extensionRegistry).build()
    }
    internal class func parseFromData(data:NSData, extensionRegistry:ExtensionRegistry) -> ProtobufUnittest.TestEmbedOptimizedForSize {
      return ProtobufUnittest.TestEmbedOptimizedForSize.builder().mergeFromData(data, extensionRegistry:extensionRegistry).build()
    }
    internal class func parseFromInputStream(input:NSInputStream) -> ProtobufUnittest.TestEmbedOptimizedForSize {
      return ProtobufUnittest.TestEmbedOptimizedForSize.builder().mergeFromInputStream(input).build()
    }
    internal class func parseFromInputStream(input:NSInputStream, extensionRegistry:ExtensionRegistry) ->ProtobufUnittest.TestEmbedOptimizedForSize {
      return ProtobufUnittest.TestEmbedOptimizedForSize.builder().mergeFromInputStream(input, extensionRegistry:extensionRegistry).build()
    }
    internal class func parseFromCodedInputStream(input:CodedInputStream) -> ProtobufUnittest.TestEmbedOptimizedForSize {
      return ProtobufUnittest.TestEmbedOptimizedForSize.builder().mergeFromCodedInputStream(input).build()
    }
    internal class func parseFromCodedInputStream(input:CodedInputStream, extensionRegistry:ExtensionRegistry) -> ProtobufUnittest.TestEmbedOptimizedForSize {
      return ProtobufUnittest.TestEmbedOptimizedForSize.builder().mergeFromCodedInputStream(input, extensionRegistry:extensionRegistry).build()
    }
    internal class func builder() -> ProtobufUnittest.TestEmbedOptimizedForSizeBuilder {
      return ProtobufUnittest.TestEmbedOptimizedForSize.classBuilder() as! ProtobufUnittest.TestEmbedOptimizedForSizeBuilder
    }
    internal func builder() -> ProtobufUnittest.TestEmbedOptimizedForSizeBuilder {
      return classBuilder() as! ProtobufUnittest.TestEmbedOptimizedForSizeBuilder
    }
    internal override class func classBuilder() -> MessageBuilder {
      return ProtobufUnittest.TestEmbedOptimizedForSizeBuilder()
    }
    internal override func classBuilder() -> MessageBuilder {
      return ProtobufUnittest.TestEmbedOptimizedForSize.builder()
    }
    internal func toBuilder() -> ProtobufUnittest.TestEmbedOptimizedForSizeBuilder {
      return ProtobufUnittest.TestEmbedOptimizedForSize.builderWithPrototype(self)
    }
    internal class func builderWithPrototype(prototype:ProtobufUnittest.TestEmbedOptimizedForSize) -> ProtobufUnittest.TestEmbedOptimizedForSizeBuilder {
      return ProtobufUnittest.TestEmbedOptimizedForSize.builder().mergeFrom(prototype)
    }
    override internal func writeDescriptionTo(inout output:String, indent:String) {
      if hasOptionalMessage {
        output += "\(indent) optionalMessage {\n"
        optionalMessage?.writeDescriptionTo(&output, indent:"\(indent)  ")
        output += "\(indent) }\n"
      }
      var repeatedMessageElementIndex:Int = 0
      for oneElementrepeatedMessage in repeatedMessage {
          output += "\(indent) repeatedMessage[\(repeatedMessageElementIndex)] {\n"
          oneElementrepeatedMessage.writeDescriptionTo(&output, indent:"\(indent)  ")
          output += "\(indent)}\n"
          repeatedMessageElementIndex++
      }
      unknownFields.writeDescriptionTo(&output, indent:indent)
    }
    override internal var hashValue:Int {
        get {
            var hashCode:Int = 7
            if hasOptionalMessage {
                if let hashValueoptionalMessage = optionalMessage?.hashValue {
                    hashCode = (hashCode &* 31) &+ hashValueoptionalMessage
                }
            }
            for oneElementrepeatedMessage in repeatedMessage {
                hashCode = (hashCode &* 31) &+ oneElementrepeatedMessage.hashValue
            }
            hashCode = (hashCode &* 31) &+  unknownFields.hashValue
            return hashCode
        }
    }


    //Meta information declaration start

    override internal class func className() -> String {
        return "ProtobufUnittest.TestEmbedOptimizedForSize"
    }
    override internal func className() -> String {
        return "ProtobufUnittest.TestEmbedOptimizedForSize"
    }
    override internal func classMetaType() -> GeneratedMessage.Type {
        return ProtobufUnittest.TestEmbedOptimizedForSize.self
    }
    //Meta information declaration end

  }

  final internal class TestEmbedOptimizedForSizeBuilder : GeneratedMessageBuilder {
    private var builderResult:ProtobufUnittest.TestEmbedOptimizedForSize

    required override internal init () {
       builderResult = ProtobufUnittest.TestEmbedOptimizedForSize()
       super.init()
    }
    var hasOptionalMessage:Bool {
         get {
             return builderResult.hasOptionalMessage
         }
    }
    var optionalMessage:ProtobufUnittest.TestOptimizedForSize! {
         get {
             return builderResult.optionalMessage
         }
         set (value) {
             builderResult.hasOptionalMessage = true
             builderResult.optionalMessage = value
         }
    }
    func setOptionalMessage(value:ProtobufUnittest.TestOptimizedForSize!)-> ProtobufUnittest.TestEmbedOptimizedForSizeBuilder {
      self.optionalMessage = value
      return self
    }
    internal func mergeOptionalMessage(value:ProtobufUnittest.TestOptimizedForSize) -> ProtobufUnittest.TestEmbedOptimizedForSizeBuilder {
      if (builderResult.hasOptionalMessage) {
        builderResult.optionalMessage = ProtobufUnittest.TestOptimizedForSize.builderWithPrototype(builderResult.optionalMessage).mergeFrom(value).buildPartial()
      } else {
        builderResult.optionalMessage = value
      }
      builderResult.hasOptionalMessage = true
      return self
    }
    internal func clearOptionalMessage() -> ProtobufUnittest.TestEmbedOptimizedForSizeBuilder {
      builderResult.hasOptionalMessage = false
      builderResult.optionalMessage = nil
      return self
    }
    var repeatedMessage:Array<ProtobufUnittest.TestOptimizedForSize> {
         get {
             return builderResult.repeatedMessage
         }
         set (value) {
             builderResult.repeatedMessage = value
         }
    }
    func setRepeatedMessage(value:Array<ProtobufUnittest.TestOptimizedForSize>)-> ProtobufUnittest.TestEmbedOptimizedForSizeBuilder {
      self.repeatedMessage = value
      return self
    }
    internal func clearRepeatedMessage() -> ProtobufUnittest.TestEmbedOptimizedForSizeBuilder {
      builderResult.repeatedMessage.removeAll(keepCapacity: false)
      return self
    }
    override internal var internalGetResult:GeneratedMessage {
         get {
            return builderResult
         }
    }
    internal override func clear() -> ProtobufUnittest.TestEmbedOptimizedForSizeBuilder {
      builderResult = ProtobufUnittest.TestEmbedOptimizedForSize()
      return self
    }
    internal override func clone() -> ProtobufUnittest.TestEmbedOptimizedForSizeBuilder {
      return ProtobufUnittest.TestEmbedOptimizedForSize.builderWithPrototype(builderResult)
    }
    internal override func build() -> ProtobufUnittest.TestEmbedOptimizedForSize {
         checkInitialized()
         return buildPartial()
    }
    internal func buildPartial() -> ProtobufUnittest.TestEmbedOptimizedForSize {
      var returnMe:ProtobufUnittest.TestEmbedOptimizedForSize = builderResult
      return returnMe
    }
    internal func mergeFrom(other:ProtobufUnittest.TestEmbedOptimizedForSize) -> ProtobufUnittest.TestEmbedOptimizedForSizeBuilder {
      if (other == ProtobufUnittest.TestEmbedOptimizedForSize()) {
       return self
      }
      if (other.hasOptionalMessage) {
          mergeOptionalMessage(other.optionalMessage)
      }
      if !other.repeatedMessage.isEmpty  {
         builderResult.repeatedMessage += other.repeatedMessage
      }
      mergeUnknownFields(other.unknownFields)
      return self
    }
    internal override func mergeFromCodedInputStream(input:CodedInputStream) ->ProtobufUnittest.TestEmbedOptimizedForSizeBuilder {
         return mergeFromCodedInputStream(input, extensionRegistry:ExtensionRegistry())
    }
    internal override func mergeFromCodedInputStream(input:CodedInputStream, extensionRegistry:ExtensionRegistry) -> ProtobufUnittest.TestEmbedOptimizedForSizeBuilder {
      var unknownFieldsBuilder:UnknownFieldSetBuilder = UnknownFieldSet.builderWithUnknownFields(self.unknownFields)
      while (true) {
        var tag = input.readTag()
        switch tag {
        case 0: 
          self.unknownFields = unknownFieldsBuilder.build()
          return self

        case 10 :
          var subBuilder:ProtobufUnittest.TestOptimizedForSizeBuilder = ProtobufUnittest.TestOptimizedForSize.builder()
          if hasOptionalMessage {
            subBuilder.mergeFrom(optionalMessage)
          }
          input.readMessage(subBuilder, extensionRegistry:extensionRegistry)
          optionalMessage = subBuilder.buildPartial()

        case 18 :
          var subBuilder = ProtobufUnittest.TestOptimizedForSize.builder()
          input.readMessage(subBuilder,extensionRegistry:extensionRegistry)
          repeatedMessage += [subBuilder.buildPartial()]

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
