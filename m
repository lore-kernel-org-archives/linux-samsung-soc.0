From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: exynos: Replace small letter of base
 address/offset on Exynos5433
Date: Thu, 12 Jan 2017 08:34:20 +0200
Message-ID: <CAJKOXPd3bXWVP5p=vrbsuTaRaLpA+_StG4QW4LCpRbsrhOTuPg@mail.gmail.com>
References: <CGME20170111005552epcas1p4a1f6ed88022b46544dec4b3801583267@epcas1p4.samsung.com>
 <1484096148-17120-1-git-send-email-cw00.choi@samsung.com> <20170111162613.lxkc7k75f6q3fsz2@kozik-lap>
 <CAGTfZH0H_kA9cRPG4Vqh3iLZncfXqfKDFiSYEXV1zp+9yFP25Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGTfZH0H_kA9cRPG4Vqh3iLZncfXqfKDFiSYEXV1zp+9yFP25Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cwchoi00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 11, 2017 at 11:22 PM, Chanwoo Choi <cwchoi00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 2017-01-12 1:26 GMT+09:00 Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>> On Wed, Jan 11, 2017 at 09:55:48AM +0900, Chanwoo Choi wrote:
>>> This patch replaces the small letter of base address, offset and hex value
>>> with the capital letter to keep the consistency on Exynos5433.
>>>
>>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 14 +++++++-------
>>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>>> index abaf6b4d599d..d7ed1a68b6fd 100644
>>> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>>> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>>> @@ -231,7 +231,7 @@
>>>               compatible = "arm,psci";
>>>               method = "smc";
>>>               cpu_off = <0x84000002>;
>>> -             cpu_on = <0xC4000003>;
>>> +             cpu_on = <0xc4000003>;
>>
>> There is no point of such "improvements". This is just unnecessary
>> churn.
>>
>> Sometimes such things are accepted as part of some bigger work (vide
>> recent Andrzej's sysmmu for HDMI/TV). But on its own? No sense at all.
>
> Do you mean that this patch is not reasonable? or
> The modification of cpu_on property is only not reasonable?
>
> It is simple for the consistency to use the hex value in dts file.

The patch is not reasonable (as sent alone).

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
