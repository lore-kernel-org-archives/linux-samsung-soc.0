From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv5 4/5] ARM: dts: exynos5420 update the cooling cells for
 core cpu0
Date: Wed, 13 May 2015 19:12:22 +0900
Message-ID: <CAJKOXPcoc08Z5pspiY2twB++cvvEmawd3q27xsgDqohvgGjtRw@mail.gmail.com>
References: <1431499020-3912-1-git-send-email-linux.amoon@gmail.com>
	<1431499020-3912-5-git-send-email-linux.amoon@gmail.com>
	<CAJKOXPdKtMO3f8YzHXtuZ042jkFRL4wa978=TggSQk8FahubRg@mail.gmail.com>
	<CANAwSgTdQk6BGD4xxB6k=p=YOV+CHv_+Q_bSyrxiPsdXVps92g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANAwSgTdQk6BGD4xxB6k=p=YOV+CHv_+Q_bSyrxiPsdXVps92g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lukasz Majewski <l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

2015-05-13 19:07 GMT+09:00 Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> On 13 May 2015 at 13:01, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> 2015-05-13 15:36 GMT+09:00 Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>>> update the cooling level for cpu0 to avoid following message.
>>
>> Capitalize sentence.
>> In commit subject add missing colon after "exynos5420".
>>
>>>
>>> root@odroidxu3:~# dmesg | grep ther
>>
>> This command not needed, we all know how to use dmesg and grep.
>>
>>> [    0.241511] /thermal-zones/cpu-thermal/cooling-maps/map0:
>>>                          could not get #cooling-cells for /cpus/cpu@0
>>>
>>> Tested-by: Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org>
>>> Acked-by: Lukasz Majewski <l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Signed-off-by: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/exynos5420.dtsi | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
>>> index 4531753..c75ed16 100644
>>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>>> @@ -61,6 +61,10 @@
>>>                         reg = <0x0>;
>>>                         clock-frequency = <1800000000>;
>>>                         cci-control-port = <&cci_control1>;
>>> +
>>> +                       cooling-min-level = <10>;
>>> +                       cooling-max-level = <7>;
>>> +                       #cooling-cells = <2>; /* min followed by max */
>>
>> I might be missing something but I do not understand which cooling
>> levels are referenced here. In my exynos5420.dtsi file there are no
>> frequencies for cpu0 node. Could you help me understand this?
>>
>> Best regards,
>> Krzysztof
>
> Hi Krzysztof,
>
> http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/cpufreq/cpufreq-dt.txt
> http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/thermal/thermal.txt#L201
>
> These two documents provide the description on cooling-min-level and
> cooling-max-level.
>
> I will correctly update the value in the next updated patch.

I know these files and AFAIU your does not follow the documentation.
So this is why I am asking: you are referencing cooling level 7 and
10, please show where are these cooling levels defined.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
