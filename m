From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add CPU cooling binding for Exynos3250-based
 Rinato/Monk board
Date: Wed, 29 Jul 2015 15:35:00 +0900
Message-ID: <55B87414.10800@samsung.com>
References: <1435815465-501-1-git-send-email-cw00.choi@samsung.com>
 <5594D22C.4040206@samsung.com> <5594D5F4.3060508@samsung.com>
 <5594E57C.2010300@samsung.com>
 <CAJKOXPfknRZ0ewSv=awo1ay4uWHAXM_kCiLPN4MpxN2-bSNq0g@mail.gmail.com>
 <092101d0b8c2$e2b39310$a81ab930$@kernel.org> <559C6C8E.2070309@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:35364 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752970AbbG2GfC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jul 2015 02:35:02 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS800RYDKYCYD70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Jul 2015 15:35:00 +0900 (KST)
In-reply-to: <559C6C8E.2070309@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, =?UTF-8?B?J0JhcnTFgm9taWVqIMW7b8WCbmll?= =?UTF-8?B?cmtpZXdpY3on?= <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, =?UTF-8?B?J8WBdWthc3ogTWFqZXdza2kn?= <l.majewski@samsung.com>, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org

Dear Kukjin,

Please pick this patch because exynos3250-cpufreq patch-set
was already merged on linux-samsung.git.

Thanks,
Chanwoo Choi

On 07/08/2015 09:19 AM, Krzysztof Kozlowski wrote:
> On 07.07.2015 23:40, Kukjin Kim wrote:
>> Krzysztof Kozlowski wrote:
>>>
>>> 2015-07-02 16:17 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
>>>> On 02.07.2015 15:11, Chanwoo Choi wrote:
>>>>> On 07/02/2015 02:54 PM, Krzysztof Kozlowski wrote:
>>>>>> On 02.07.2015 14:37, Chanwoo Choi wrote:
>>>>>>> This patch add the cooling device to control the overheating issue on
>>>>>>> Exynos3250-based Rinato/Monk board.
>>>>>>>
>>>>>>> Cc: Kukjin Kim <kgene@kernel.org>
>>>>>>> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>>>>>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>>>>>>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>>>>>>> ---
>>>>>>> Depends on:
>>>>>>> This patch needs the cpufreq support of Exynos3250 SoC. So, this patch has the
>>>>>>> dependency on patch[1] which support the generic cpufreq for Exynos3250 SoC.
>>>>>>> [1] https://lkml.org/lkml/2015/7/1/696
>>>>>>>     : [PATCH v6 0/3] cpufreq: Use cpufreq-dt driver for Exynos3250
>>>>>>>
>>>>>>>  arch/arm/boot/dts/exynos3250-monk.dts   | 15 +++++++++++++++
>>>>>>>  arch/arm/boot/dts/exynos3250-rinato.dts | 15 +++++++++++++++
>>>>>>>  arch/arm/boot/dts/exynos3250.dtsi       |  1 +
>>>>>>>  3 files changed, 31 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
>>>>>>> index 7863265d4868..540a0adf2be6 100644
>>>>>>> --- a/arch/arm/boot/dts/exynos3250-monk.dts
>>>>>>> +++ b/arch/arm/boot/dts/exynos3250-monk.dts
>>>>>>> @@ -116,6 +116,21 @@
>>>>>>>             min-microvolt = <1100000>;
>>>>>>>             max-microvolt = <2700000>;
>>>>>>>     };
>>>>>>> +
>>>>>>> +   thermal-zones {
>>>>>>> +           cpu_thermal: cpu-thermal {
>>>>>>> +                   cooling-maps {
>>>>>>> +                           map0 {
>>>>>>> +                                   /* Correspond to 500MHz at freq_table */
>>>>>>> +                                   cooling-device = <&cpu0 5 5>;
>>>>>>> +                           };
>>>>>>> +                           map1 {
>>>>>>> +                                   /* Correspond to 200MHz at freq_table */
>>>>>>> +                                   cooling-device = <&cpu0 8 8>;
>>>>>>> +                           };
>>>>>>> +                   };
>>>>>>> +           };
>>>>>>> +   };
>>>>>>>  };
>>>>>>>
>>>>>>>  &adc {
>>>>>>> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
>>>>>>> index ddd7ac283045..0e62a6435e07 100644
>>>>>>> --- a/arch/arm/boot/dts/exynos3250-rinato.dts
>>>>>>> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
>>>>>>> @@ -107,6 +107,21 @@
>>>>>>>             min-microvolt = <1100000>;
>>>>>>>             max-microvolt = <2700000>;
>>>>>>>     };
>>>>>>> +
>>>>>>> +   thermal-zones {
>>>>>>> +           cpu_thermal: cpu-thermal {
>>>>>>> +                   cooling-maps {
>>>>>>> +                           map0 {
>>>>>>> +                                   /* Corresponds to 500MHz */
>>>>>>> +                                   cooling-device = <&cpu0 5 5>;
>>>>>>> +                           };
>>>>>>> +                           map1 {
>>>>>>> +                                   /* Corresponds to 200MHz */
>>>>>>> +                                   cooling-device = <&cpu0 8 8>;
>>>>>>> +                           };
>>>>>>> +                   };
>>>>>>> +           };
>>>>>>> +   };
>>>>>>>  };
>>>>>>>
>>>>>>>  &adc {
>>>>>>> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
>>>>>>> index e0f3b2ed41a3..a4931b660ddb 100644
>>>>>>> --- a/arch/arm/boot/dts/exynos3250.dtsi
>>>>>>> +++ b/arch/arm/boot/dts/exynos3250.dtsi
>>>>>>> @@ -55,6 +55,7 @@
>>>>>>>                     clock-frequency = <1000000000>;
>>>>>>>                     clocks = <&cmu CLK_ARM_CLK>;
>>>>>>>                     clock-names = "cpu";
>>>>>>> +                   #cooling-cells = <2>;
>>>>>>>
>>>>>>
>>>>>> Don't you need also cooling-{min,max}-state properties?
>>>>>
>>>>> Yes, it is well working without cooling-{min,max}-state or cooling-{min,max}-level.
>>>>>
>>>>> I look for the some code to parse "cooling-{min,max}-state or cooling-{min,max}-level"
>>>>> in drivers/thermal/*. But, there are no any code to parse it.
>>>>>
>>>>> But, Documentation/devicetree/bindings/thermal/thermal.txt contains just the 'cooling-{min,max}-
>>> state.
>>>>>
>>>>> I think that there are mismatch between document and thermal core driver.
>>>>
>>>> Thanks for explanation, looks good.
>>>> Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> Dear Kukjin,
>>>
>>> Recent four patchsets (4210 CPU OPP in DTS, cpufreq-dt 5250,
>>> cpufreq-dt 3250, this patch) are actually an one continuous chain.
>>> Dependencies are already in mainline. Are you gonna to pick up
>>> everything?
>>>
>> Yes, I want and I will. BTW maybe clk change is required together? If so, as you
>> know we need to get ack from clk guy. Is my understanding right?
> 
> Right. I think the samsung clock and cpufreq patches still need acks.
> 
> Best regards,
> Krzysztof
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
