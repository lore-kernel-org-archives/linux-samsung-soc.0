From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v8 3/3] arm64: dts: exynos: Add support for S6E3HA2 panel
 device on TM2 board
Date: Wed, 11 Jan 2017 11:28:13 +0100
Message-ID: <b3d5424a-7a91-0a2d-050b-3a629c686816@samsung.com>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas1p4b29b1308a0b8088afd46a475770d4b00@epcas1p4.samsung.com>
 <1484116439-7275-4-git-send-email-hoegeun.kwon@samsung.com>
 <f292435b-8faa-d2e9-17f6-99a4d00173c5@samsung.com>
 <5875EF69.1070803@samsung.com>
 <581db2a8-e357-a3ba-9464-fa8f83f95c09@samsung.com>
 <94285a63-68df-494c-872b-41c5810a3251@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43519 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761334AbdAKK2V (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 05:28:21 -0500
In-reply-to: <94285a63-68df-494c-872b-41c5810a3251@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: hoegeun kwon <hoegeun.kwon@samsung.com>, Inki Dae <inki.dae@samsung.com>, krzk@kernel.org, robh@kernel.org, thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, jh80.chung@samsung.com, andi.shyti@samsung.com, Hyungwon Hwang <human.hwang@samsung.com>

On 11.01.2017 11:23, hoegeun kwon wrote:
>
> On 01/11/2017 06:39 PM, Andrzej Hajda wrote:
>> On 11.01.2017 09:40, Inki Dae wrote:
>>> 2017년 01월 11일 16:46에 Andrzej Hajda 이(가) 쓴 글:
>>>> On 11.01.2017 07:33, Hoegeun Kwon wrote:
>>>>> From: Hyungwon Hwang <human.hwang@samsung.com>
>>>>>
>>>>> This patch add the panel device tree node for S6E3HA2 display
>>>>> controller to TM2 dts.
>>>>>
>>>>> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
>>>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>>>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>>>>> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
>>>>> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 12 ++++++++++++
>>>>>   1 file changed, 12 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>>>>> index ddba2f8..6d362f9 100644
>>>>> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>>>>> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>>>>> @@ -18,6 +18,18 @@
>>>>>   	compatible = "samsung,tm2", "samsung,exynos5433";
>>>>>   };
>>>>>   
>>>>> +&dsi {
>>>>> +	panel@0 {
>>>>> +		compatible = "samsung,s6e3ha2";
>>>>> +		reg = <0>;
>>>>> +		vdd3-supply = <&ldo27_reg>;
>>>>> +		vci-supply = <&ldo28_reg>;
>>>>> +		reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
>>>>> +		enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
>>>>> +		te-gpios = <&gpf1 3 GPIO_ACTIVE_HIGH>;
>>>> The same here (as in 1st comment) , te-gpios should be dropper - decon
>>>> uses hw-trigger.
>>> Reasonable to remove te-gpios property but this change would make MIPI-DSI driver probing to be failed so MIPI-DSI driver should be fixed together.
>>>
>>> Thanks.
>> OK, I forgot it was not yet ported to mainline.
>>
>> Regards
>> Andrzej
> I received a reply while I was writing the mail.
> so, how about removing te-gpios later?

I think this is a good solution, just do not forget to change it to
optional in bindings, to make it removable.

Regards
Andrzej
