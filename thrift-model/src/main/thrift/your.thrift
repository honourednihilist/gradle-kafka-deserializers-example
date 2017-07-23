namespace java com.github.honourednihilist.gradle.kafka.deserializers.example.model.gen

typedef bool boolean
typedef i16 short
typedef i32 int
typedef i64 long

struct YourBaseStruct {
    1: optional boolean yourBoolean
    2: optional byte yourByte
    3: optional short yourShort
    4: optional int yourInt
    5: optional long yourLong
    6: optional double yourDouble
    7: optional string yourString
    8: optional binary yourBinary
}

struct YourContainersStruct {
    1: optional list<int> yourList
    2: optional set<long> yourSet
    3: optional map<int, string> yourMap
}

struct YourCompositeStruct {
    1: optional YourBaseStruct yourBaseStruct
    2: optional YourContainersStruct yourContainersStruct
}

enum YourEnum {
    YES = 1,
    NO = 0
}

exception YourException {
    1: optional string message
    2: optional YourException cause
}

service YourService {
    YourEnum request(1: YourCompositeStruct params)
}
