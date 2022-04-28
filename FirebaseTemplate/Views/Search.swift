//
//  Search.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/27/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct Search: View {
    let Search = [ "طب العائلة", "دكتور عيون", "دكتور قلب", "دكتور انف واذن وحنجرة", "دكتور أسنان", "جراحة تجميلية", "جراحة السمنة", "الامراض الجلدية", "أمراض النساء والولادة", "أمراض المسالك البولية", "أحمد فاضل", "بدر قاسم", "جاسم علي", "جميلة خالد", "فاطمة محمد", "محمد علي", "ذكر" ,"أنثى","A+", "A-", "B+", "B-","AB+", "AB-", "O+", "O-","٣٠ مل", "٥٠ مل", "١٠٠ مل", "١٥٠ مل","٢٠٠ مل", "٢٥٠ مل", "٣٠٠ مل", "٣٣٠ مل", "٤٠٠ مل", "٥٠٠ مل", "٦٠٠ مل", "٨٠٠ مل", "١٠٠٠ مل", "فيتامين سي","ماغنيسيوم", "اي ٤٠٠","مغنيسيوم مع فيتامين باء ٦", "زينك","اليرجوديل", "فيسس","اوترفين", "تونيمير"
        ,"ادفيل" ,"بروفين","اولفين" ,"باندول ادفانس","باندول اكسترا",
         
    ]
    @State var searchingFor = ""
    var body: some View {
        List {
            TextField("ابحث هنا", text: $searchingFor)
            
            ForEach(Search, id: \.self) { i in
                if i.contains(searchingFor) || searchingFor.isEmpty {
                    Text(i)
                }
            }
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
