import Foundation

let JSONString = """
[
        {
            "id": 7,
            "date": "2022.04.06  5:46 PM",
            "content": "피가 때까지 어디 시들어 이상의 소담스러운 같은 것이다",
            "writer": {
                "id": 1,
                "name": "tmfrlrkvlek",
                "profile": ""
            },
            "reply_check_permission": false,
            "remaining_time": "52분 남음"
        },
        {
            "id": 5,
            "date": "2022.04.06 11:57 AM",
            "content": "품고 우리는 소금이라 부패뿐이다. 따뜻한 살았으며, 천",
            "writer": {
                "id": 1,
                "name": "tmfrlrkvlek",
                "profile": ""
            },
            "reply_check_permission": true,
            "remaining_time": null
        },
        {
            "id": 4,
            "date": "2022.04.06  2:55 AM",
            "content": "품고 우리는 소금이라 부패뿐이다. 따뜻한 살았으며, 천",
            "writer": {
                "id": 1,
                "name": "tmfrlrkvlek",
                "profile": ""
            },
            "reply_check_permission": true,
            "remaining_time": null
        },
        {
            "id": 3,
            "date": "2022.04.06  2:18 AM",
            "content": "온갖 인간의 그것을 옷을 수 구하지 실로 그들의 소금이",
            "writer": {
                "id": 1,
                "name": "tmfrlrkvlek",
                "profile": ""
            },
            "reply_check_permission": true,
            "remaining_time": null
        },
        {
            "id": 2,
            "date": "2022.04.06  2:13 AM",
            "content": "이상, 가치를 같은 황금시대의 고동을 같지 말이다. 청",
            "writer": {
                "id": 1,
                "name": "tmfrlrkvlek",
                "profile": ""
            },
            "reply_check_permission": true,
            "remaining_time": null
        },
        {
            "id": 1,
            "date": "2022.04.05  3:05 PM",
            "content": "용기가 못하다 어디 소금이라 꽃이 되는 설레는 가는 뿐",
            "writer": {
                "id": 1,
                "name": "tmfrlrkvlek",
                "profile": ""
            },
            "reply_check_permission": true,
            "remaining_time": null
        }
    ]
"""

struct Story : Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id, date, content, writer
        case replyCheckPermission = "reply_check_permission"
        case remainingTime = "remaining_time"
    }
    
    enum WriterKeys: String, CodingKey {
        case writerID = "id"
        case writerName = "name"
        case writerProfile = "profile"
    }
    
    let id: Int
    let date: String
    let content: String
    let replyCheckPermission : Bool
    let remainingTime : String?
    let writerID : Int
    let writerName : String
    let writerProfile : String
    
    init(from decoder: Decoder) throws {
        let codingKeys = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try codingKeys.decode(Int.self, forKey:.id)
        self.date = try codingKeys.decode(String.self, forKey:.date)
        self.content = try codingKeys.decode(String.self, forKey:.content)
        self.replyCheckPermission = try codingKeys.decode(Bool.self, forKey:.replyCheckPermission)
        self.remainingTime = try codingKeys.decodeIfPresent(String.self, forKey:.remainingTime)
        
        let writerKeys = try codingKeys.nestedContainer(keyedBy: WriterKeys.self, forKey: .writer)
        
        self.writerID = try writerKeys.decode(Int.self, forKey: .writerID)
        self.writerName = try writerKeys.decode(String.self, forKey: .writerName)
        self.writerProfile = try writerKeys.decode(String.self, forKey: .writerProfile)
    }
    
    func encode(to encoder: Encoder) throws {
        var codingKeys = encoder.container(keyedBy: CodingKeys.self)
        try codingKeys.encode(self.id, forKey: .id)
        try codingKeys.encode(self.date, forKey: .date)
        try codingKeys.encode(self.content, forKey: .content)
        try codingKeys.encode(self.replyCheckPermission, forKey: .replyCheckPermission)
        try codingKeys.encode(self.remainingTime, forKey: .remainingTime)

        var writerKeys = codingKeys.nestedContainer(keyedBy: WriterKeys.self, forKey: .writer)
        try writerKeys.encode(self.writerID, forKey: .writerID)
        try writerKeys.encode(self.writerName, forKey: .writerName)
        try writerKeys.encode(self.writerProfile, forKey: .writerProfile)
      }
}

func loadJson() -> [Story]{
    let jsonData = JSONString.data(using: .utf8)!
    let data = jsonData
    do {
        let decoder = JSONDecoder()
        let storyData = try decoder.decode([Story].self, from: data)
        print(storyData)
        print("Rows in array: \(storyData.count)")
        
        return storyData
    } catch {
        print(error)
        return []
    }
}
