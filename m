From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCHv5 4/5] ARM: dts: exynos5420 update the cooling cells for
 core cpu0
Date: Wed, 13 May 2015 16:31:44 +0530
Message-ID: <CANAwSgT6gAqGhz6kU1qh_OxyTR6TyYQiV=NR-zwfnoZQDswHng@mail.gmail.com>
References: <1431499020-3912-1-git-send-email-linux.amoon@gmail.com>
 <1431499020-3912-5-git-send-email-linux.amoon@gmail.com> <CAJKOXPdKtMO3f8YzHXtuZ042jkFRL4wa978=TggSQk8FahubRg@mail.gmail.com>
 <CANAwSgTdQk6BGD4xxB6k=p=YOV+CHv_+Q_bSyrxiPsdXVps92g@mail.gmail.com> <CAJKOXPcoc08Z5pspiY2twB++cvvEmawd3q27xsgDqohvgGjtRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:36855 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752856AbbEMLCG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 07:02:06 -0400
In-Reply-To: <CAJKOXPcoc08Z5pspiY2twB++cvvEmawd3q27xsgDqohvgGjtRw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Lukasz Majewski <l.majewski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Markus Reichl <m.reichl@fivetechno.de>, Eduardo Valentin <edubezval@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Krzysztof,

Yep these values are wrong.

These cooling-max-level and cooling-min-level values come with cpufreq
operating-points
Which is not present in the dts right now.

So I will update for now with this value.
cooling-min-level = <0>;
cooling-max-level = <7>;

-Anand Moon

On 13 May 2015 at 15:42, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
> 2015-05-13 19:07 GMT+09:00 Anand Moon <linux.amoon@gmail.com>:
>> On 13 May 2015 at 13:01, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
>>> 2015-05-13 15:36 GMT+09:00 Anand Moon <linux.amoon@gmail.com>:
>>>> update the cooling level for cpu0 to avoid following message.
>>>
>>> Capitalize sentence.
>>> In commit subject add missing colon after "exynos5420".
>>>
>>>>
>>>> root@odroidxu3:~# dmesg | grep ther
>>>
>>> This command not needed, we all know how to use dmesg and grep.
>>>
>>>> [    0.241511] /thermal-zones/cpu-thermal/cooling-maps/map0:
>>>>                          could not get #cooling-cells for /cpus/cpu@0
>>>>
>>>> Tested-by: Markus Reichl <m.reichl@fivetechno.de>
>>>> Acked-by: Lukasz Majewski <l.majewski@samsung.com>
>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>>> ---
>>>>  arch/arm/boot/dts/exynos5420.dtsi | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
>>>> index 4531753..c75ed16 100644
>>>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>>>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>>>> @@ -61,6 +61,10 @@
>>>>                         reg = <0x0>;
>>>>                         clock-frequency = <1800000000>;
>>>>                         cci-control-port = <&cci_control1>;
>>>> +
>>>> +                       cooling-min-level = <10>;
>>>> +                       cooling-max-level = <7>;
>>>> +                       #cooling-cells = <2>; /* min followed by max */
>>>
>>> I might be missing something but I do not understand which cooling
>>> levels are referenced here. In my exynos5420.dtsi file there are no
>>> frequencies for cpu0 node. Could you help me understand this?
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Hi Krzysztof,
>>
>> http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/cpufreq/cpufreq-dt.txt
>> http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/thermal/thermal.txt#L201
>>
>> These two documents provide the description on cooling-min-level and
>> cooling-max-level.
>>
>> I will correctly update the value in the next updated patch.
>
> I know these files and AFAIU your does not follow the documentation.
> So this is why I am asking: you are referencing cooling level 7 and
> 10, please show where are these cooling levels defined.
