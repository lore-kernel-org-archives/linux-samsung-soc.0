From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v4 4/5] Documentation: devicetree: add PPMU events
 description
Date: Thu, 27 Jun 2019 12:31:08 +0200
Message-ID: <3fdba210-2ca1-9fe3-c886-25d1d13bb133@partner.samsung.com>
References: <CGME20190605091304eucas1p21e0717cafa17a14de569f1773cc7abe5@eucas1p2.samsung.com>
        <20190605091236.24263-1-l.luba@partner.samsung.com>
        <20190605091236.24263-5-l.luba@partner.samsung.com>
        <CAGTfZH2kTNWtx=Jp1UJaLN50Qxbq+Q9ThV4vhQ240QbOy1TRMQ@mail.gmail.com>
        <7498059d-95f7-e154-cf49-bcbc8ee6fdb9@partner.samsung.com>
        <CAJKOXPc6304D=HNQnrvhBH6qKxhkf=VQ2Gg6Q2FMP2hYOTYSDQ@mail.gmail.com>
        <776f58c2-a05c-8fa8-c7f5-458dc17926f6@partner.samsung.com>
        <99a47066-3713-77fa-4afb-6f2f17a2721a@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <99a47066-3713-77fa-4afb-6f2f17a2721a@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, cwchoi00@gmail.com
Cc: devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, robh+dt@kernel.org, mark.rutland@arm.com, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, kgene@kernel.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chanwoo,

On 6/27/19 3:11 AM, Chanwoo Choi wrote:
> Hi Lukasz,
> 
> On 19. 6. 26. 오후 11:17, Lukasz Luba wrote:
>> Hi Krzysztof,
>>
>> On 6/26/19 4:03 PM, Krzysztof Kozlowski wrote:
>>> On Wed, 26 Jun 2019 at 15:58, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>>>>
>>>> Hi Chanwoo,
>>>>
>>>> On 6/26/19 10:23 AM, Chanwoo Choi wrote:
>>>>> Hi Lukasz,
>>>>>
>>>>> 2019년 6월 5일 (수) 18:14, Lukasz Luba <l.luba@partner.samsung.com
>>>>> <mailto:l.luba@partner.samsung.com>>님이 작성:
>>>>>
>>>>>       Extend the documenation by events description with new 'event-data-type'
>>>>>       field. Add example how the event might be defined in DT.
>>>>>
>>>>>       Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com
>>>>>       <mailto:l.luba@partner.samsung.com>>
>>>>>       Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com
>>>>>       <mailto:cw00.choi@samsung.com>>
>>>>>       ---
>>>>>         .../bindings/devfreq/event/exynos-ppmu.txt    | 26 +++++++++++++++++--
>>>>>         1 file changed, 24 insertions(+), 2 deletions(-)
>>>>>
>>>>>
>>>>>
>>>>> Acked-by: Chanwoo Choi <cw00.choi@samsung.com
>>>>
>>>> Thank you for the ACKs for this a 2/5 patch.
>>>> Do you think the v4 could be merged now?
>>>
>>> I think you have all necessary acks. I can take the DTS patch (5/5)
>>> although probably for next merge window as I just sent one.
>> There was one patch 3/5
>> https://protect2.fireeye.com/url?k=82dd0d0cbe2abd04.82dc8643-d13ecd7e5f989b8d&u=https://lkml.org/lkml/2019/6/5/215
>> which was waiting ACK or I missed the email somehow.
> 
> When I was in vacation, your patches are removed on my email account
> because of the email expiration. So, I replied with my Ack through
> gmail account on mobile phone. But, there are some problem. My reply
> didn't arrive the mailing list.
> 
> I have no any way to reply about this at company. After leaving one's
> office, I'll reply with Ack again at home.
> 
OK, no worries, it is not an emergency issue.
Regards,
Lukasz
