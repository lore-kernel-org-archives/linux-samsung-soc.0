From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v5 0/6] dt-bindings: add bindings for USB physical
 connector
Date: Wed, 07 Mar 2018 11:12:13 +0900
Message-ID: <5A9F4A7D.9020409@samsung.com>
References: <CGME20180227071137eucas1p104aeeb0fd926fe985e250174d9d65b2e@eucas1p1.samsung.com>
        <20180227071134.28063-1-a.hajda@samsung.com>
        <c4a773b6-a24e-4e72-3cc4-ebafeac232c1@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <c4a773b6-a24e-4e72-3cc4-ebafeac232c1@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Rob and Andrzej,

On 2018년 03월 06일 21:53, Andrzej Hajda wrote:
> Hi Rob, Chanwoo, Krzysztof,
> 
> 
> On 27.02.2018 08:11, Andrzej Hajda wrote:
>> Hi,
>>
>> Thanks for reviews of previous iterations.
>>
>> This patchset introduces USB physical connector bindings, together with
>> working example.
>> I have removed RFC prefix - the patchset seems to be heading
>> to a happy end :)
>>
>> v5: fixed extra parenthesis in dts, renamed extcon function.
>> v4: improved binding descriptions, added missing reg in dts.
>> v3: Separate binding for Samsung 11-pin connector, added full-blown USB-C
>>     example.
>> v2: I have addressed comments by Rob and Laurent, thanks 
>>
>> Changes in datail are described in the patches.
>>
>> Regards
>> Andrzej
>>
>>
>> Andrzej Hajda (5):
>>   dt-bindings: add bindings for USB physical connector
>>   dt-bindings: add bindings for Samsung micro-USB 11-pin connector
>>   arm64: dts: exynos: add micro-USB connector node to TM2 platforms
>>   arm64: dts: exynos: add OF graph between MHL and USB connector
>>   extcon: add possibility to get extcon device by OF node
>>
>> Maciej Purski (1):
>>   drm/bridge/sii8620: use micro-USB cable detection logic to detect MHL
> 
> It looks like all patches received R-B or acks (I forgot add Krzysztof's
> acks for dts part).
> Now I have a question how to merge them.
> The only functional dependency is between bridge and extcon, and from
> the formal PoV bindings should be merged 1st.
> I can merge it:
> 1. All patches via drm-misc tree.
> 2. All patches except dts via drm-misc, and Krzysztof will merge dts via
> samsung-soc tree.
> 
> Is it OK, for all? Better ideas?

Krzysztof picked the dts patches. I'll make the immutable branch based on v4.16-rc1
and apply them except for dts patchs. And I'll send the immutable branch to Rob and Andrzej.


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
