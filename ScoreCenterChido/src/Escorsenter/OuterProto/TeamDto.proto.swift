// Generated by the protocol buffer compiler.  DO NOT EDIT!
// Source file TeamDTO.proto

import Foundation
import ProtocolBuffers


internal func == (lhs: TeamDto, rhs: TeamDto) -> Bool {
  if (lhs === rhs) {
    return true
  }
  var fieldCheck:Bool = (lhs.hashValue == rhs.hashValue)
  fieldCheck = fieldCheck && (lhs.hasId == rhs.hasId) && (!lhs.hasId || lhs.id == rhs.id)
  fieldCheck = fieldCheck && (lhs.hasName == rhs.hasName) && (!lhs.hasName || lhs.name == rhs.name)
  fieldCheck = fieldCheck && (lhs.hasDescription == rhs.hasDescription) && (!lhs.hasDescription || lhs.description_ == rhs.description_)
  fieldCheck = fieldCheck && (lhs.hasLogo == rhs.hasLogo) && (!lhs.hasLogo || lhs.logo == rhs.logo)
  return (fieldCheck && (lhs.unknownFields == rhs.unknownFields))
}

internal struct TeamDtoRoot {
  internal static var sharedInstance : TeamDtoRoot {
   struct Static {
       static let instance : TeamDtoRoot = TeamDtoRoot()
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

final internal class TeamDto : GeneratedMessage, GeneratedMessageProtocol, Hashable {
  private(set) var hasId:Bool = false
  private(set) var id:Int64 = Int64(0)

  private(set) var hasName:Bool = false
  private(set) var name:String = ""

  private(set) var hasDescription:Bool = false
  private(set) var description_:String = ""

  private(set) var hasLogo:Bool = false
  private(set) var logo:String = ""

  required internal init() {
       super.init()
  }
  override internal func isInitialized() -> Bool {
   return true
  }
  override internal func writeToCodedOutputStream(output:CodedOutputStream) {
    if hasId {
      output.writeInt64(1, value:id)
    }
    if hasName {
      output.writeString(2, value:name)
    }
    if hasDescription {
      output.writeString(16, value:description_)
    }
    if hasLogo {
      output.writeString(17, value:logo)
    }
    unknownFields.writeToCodedOutputStream(output)
  }
  override internal func serializedSize() -> Int32 {
    var serialize_size:Int32 = memoizedSerializedSize
    if serialize_size != -1 {
     return serialize_size
    }

    serialize_size = 0
    if hasId {
      serialize_size += id.computeInt64Size(1)
    }
    if hasName {
      serialize_size += name.computeStringSize(2)
    }
    if hasDescription {
      serialize_size += description_.computeStringSize(16)
    }
    if hasLogo {
      serialize_size += logo.computeStringSize(17)
    }
    serialize_size += unknownFields.serializedSize()
    memoizedSerializedSize = serialize_size
    return serialize_size
  }
  internal class func parseArrayDelimitedFromInputStream(input:NSInputStream) -> Array<TeamDto> {
    var mergedArray = Array<TeamDto>()
    while let value = parseFromDelimitedFromInputStream(input) {
      mergedArray += [value]
    }
    return mergedArray
  }
  internal class func parseFromData(data:NSData) -> TeamDto {
    return TeamDto.Builder().mergeFromData(data, extensionRegistry:TeamDtoRoot.sharedInstance.extensionRegistry).build()
  }
  internal class func parseFromData(data:NSData, extensionRegistry:ExtensionRegistry) -> TeamDto {
    return TeamDto.Builder().mergeFromData(data, extensionRegistry:extensionRegistry).build()
  }
  internal class func parseFromInputStream(input:NSInputStream) -> TeamDto {
    return TeamDto.Builder().mergeFromInputStream(input).build()
  }
  internal class func parseFromDelimitedFromInputStream(input:NSInputStream) -> TeamDto? {
    return TeamDto.Builder().mergeDelimitedFromInputStream(input)?.build()
  }
  internal class func parseFromInputStream(input:NSInputStream, extensionRegistry:ExtensionRegistry) -> TeamDto {
    return TeamDto.Builder().mergeFromInputStream(input, extensionRegistry:extensionRegistry).build()
  }
  internal class func parseFromCodedInputStream(input:CodedInputStream) -> TeamDto {
    return TeamDto.Builder().mergeFromCodedInputStream(input).build()
  }
  internal class func parseFromCodedInputStream(input:CodedInputStream, extensionRegistry:ExtensionRegistry) -> TeamDto {
    return TeamDto.Builder().mergeFromCodedInputStream(input, extensionRegistry:extensionRegistry).build()
  }
  internal class func getBuilder() -> TeamDto.Builder {
    return TeamDto.classBuilder() as! TeamDto.Builder
  }
  internal func getBuilder() -> TeamDto.Builder {
    return classBuilder() as! TeamDto.Builder
  }
  internal override class func classBuilder() -> MessageBuilder {
    return TeamDto.Builder()
  }
  internal override func classBuilder() -> MessageBuilder {
    return TeamDto.Builder()
  }
  internal func toBuilder() -> TeamDto.Builder {
    return TeamDto.builderWithPrototype(self)
  }
  internal class func builderWithPrototype(prototype:TeamDto) -> TeamDto.Builder {
    return TeamDto.Builder().mergeFrom(prototype)
  }
  override internal func writeDescriptionTo(inout output:String, indent:String) {
    if hasId {
      output += "\(indent) id: \(id) \n"
    }
    if hasName {
      output += "\(indent) name: \(name) \n"
    }
    if hasDescription {
      output += "\(indent) description_: \(description_) \n"
    }
    if hasLogo {
      output += "\(indent) logo: \(logo) \n"
    }
    unknownFields.writeDescriptionTo(&output, indent:indent)
  }
  override internal var hashValue:Int {
      get {
          var hashCode:Int = 7
          if hasId {
             hashCode = (hashCode &* 31) &+ id.hashValue
          }
          if hasName {
             hashCode = (hashCode &* 31) &+ name.hashValue
          }
          if hasDescription {
             hashCode = (hashCode &* 31) &+ description_.hashValue
          }
          if hasLogo {
             hashCode = (hashCode &* 31) &+ logo.hashValue
          }
          hashCode = (hashCode &* 31) &+  unknownFields.hashValue
          return hashCode
      }
  }


  //Meta information declaration start

  override internal class func className() -> String {
      return "TeamDto"
  }
  override internal func className() -> String {
      return "TeamDto"
  }
  override internal func classMetaType() -> GeneratedMessage.Type {
      return TeamDto.self
  }
  //Meta information declaration end

  final internal class Builder : GeneratedMessageBuilder {
    private var builderResult:TeamDto = TeamDto()
    internal func getMessage() -> TeamDto {
        return builderResult
    }

    required override internal init () {
       super.init()
    }
    var hasId:Bool {
         get {
              return builderResult.hasId
         }
    }
    var id:Int64 {
         get {
              return builderResult.id
         }
         set (value) {
             builderResult.hasId = true
             builderResult.id = value
         }
    }
    func setId(value:Int64) -> TeamDto.Builder {
      self.id = value
      return self
    }
    internal func clearId() -> TeamDto.Builder{
         builderResult.hasId = false
         builderResult.id = Int64(0)
         return self
    }
    var hasName:Bool {
         get {
              return builderResult.hasName
         }
    }
    var name:String {
         get {
              return builderResult.name
         }
         set (value) {
             builderResult.hasName = true
             builderResult.name = value
         }
    }
    func setName(value:String) -> TeamDto.Builder {
      self.name = value
      return self
    }
    internal func clearName() -> TeamDto.Builder{
         builderResult.hasName = false
         builderResult.name = ""
         return self
    }
    var hasDescription:Bool {
         get {
              return builderResult.hasDescription
         }
    }
    var description_:String {
         get {
              return builderResult.description_
         }
         set (value) {
             builderResult.hasDescription = true
             builderResult.description_ = value
         }
    }
    func setDescription(value:String) -> TeamDto.Builder {
      self.description_ = value
      return self
    }
    internal func clearDescription() -> TeamDto.Builder{
         builderResult.hasDescription = false
         builderResult.description_ = ""
         return self
    }
    var hasLogo:Bool {
         get {
              return builderResult.hasLogo
         }
    }
    var logo:String {
         get {
              return builderResult.logo
         }
         set (value) {
             builderResult.hasLogo = true
             builderResult.logo = value
         }
    }
    func setLogo(value:String) -> TeamDto.Builder {
      self.logo = value
      return self
    }
    internal func clearLogo() -> TeamDto.Builder{
         builderResult.hasLogo = false
         builderResult.logo = ""
         return self
    }
    override internal var internalGetResult:GeneratedMessage {
         get {
            return builderResult
         }
    }
    internal override func clear() -> TeamDto.Builder {
      builderResult = TeamDto()
      return self
    }
    internal override func clone() -> TeamDto.Builder {
      return TeamDto.builderWithPrototype(builderResult)
    }
    internal override func build() -> TeamDto {
         checkInitialized()
         return buildPartial()
    }
    internal func buildPartial() -> TeamDto {
      var returnMe:TeamDto = builderResult
      return returnMe
    }
    internal func mergeFrom(other:TeamDto) -> TeamDto.Builder {
      if other == TeamDto() {
       return self
      }
      if other.hasId {
           id = other.id
      }
      if other.hasName {
           name = other.name
      }
      if other.hasDescription {
           description_ = other.description_
      }
      if other.hasLogo {
           logo = other.logo
      }
      mergeUnknownFields(other.unknownFields)
      return self
    }
    internal override func mergeFromCodedInputStream(input:CodedInputStream) -> TeamDto.Builder {
         return mergeFromCodedInputStream(input, extensionRegistry:ExtensionRegistry())
    }
    internal override func mergeFromCodedInputStream(input:CodedInputStream, extensionRegistry:ExtensionRegistry) -> TeamDto.Builder {
      var unknownFieldsBuilder:UnknownFieldSet.Builder = UnknownFieldSet.builderWithUnknownFields(self.unknownFields)
      while (true) {
        var tag = input.readTag()
        switch tag {
        case 0: 
          self.unknownFields = unknownFieldsBuilder.build()
          return self

        case 8 :
          id = input.readInt64()

        case 18 :
          name = input.readString()

        case 130 :
          description_ = input.readString()

        case 138 :
          logo = input.readString()

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
