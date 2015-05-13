From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 01/13] ARM: dts: Add labels to Exynos4 nodes
Date: Wed, 13 May 2015 18:42:16 +0900
Message-ID: <CAJKOXPfUVKvFTSgCdK4rpeGDe7oDwP3-dViXxwtXiQ-vSpCKSQ@mail.gmail.com>
References: <1431351773-2031-1-git-send-email-k.kozlowski.k@gmail.com>
	<1431351773-2031-2-git-send-email-k.kozlowski.k@gmail.com>
	<5553125A.6090404@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5553125A.6090404-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

2015-05-13 17:59 GMT+09:00 Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On 05/11/15 22:42, Krzysztof Kozlowski wrote:
>> Add new labels to certain nodes so they could be easily referenced by
>> Exynos4 board DTS files.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/exynos4.dtsi            | 22 +++++++++++-----------
>>  arch/arm/boot/dts/exynos4210-pinctrl.dtsi |  6 +++---
>>  arch/arm/boot/dts/exynos4210.dtsi         |  6 +++---
>>  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |  8 ++++----
>>  arch/arm/boot/dts/exynos4x12.dtsi         |  2 +-
>>  5 files changed, 22 insertions(+), 22 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
>> index 1c74c1296ab7..0ec292d25b6e 100644
>> --- a/arch/arm/boot/dts/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>
> [...]
>
>> diff --git a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
>> index a7c212891674..4704e7bb2628 100644
>> --- a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
>> +++ b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
>> @@ -15,7 +15,7 @@
>>  */
>>
>>  / {
>> -     pinctrl@11400000 {
>> +     pinctrl_0: pinctrl@11400000 {
>>               gpa0: gpa0 {
>>                       gpio-controller;
>>                       #gpio-cells = <2>;
>> @@ -421,7 +421,7 @@
>>               };
>>       };
>>
>> -     pinctrl@11000000 {
>> +     pinctrl_1: pinctrl@11000000 {
>>               gpj0: gpj0 {
>>                       gpio-controller;
>>                       #gpio-cells = <2>;
>> @@ -822,7 +822,7 @@
>>               };
>>       };
>>
>> -     pinctrl@03860000 {
>> +     pinctrl_3: pinctrl@03860000 {
>
> Maybe,
> +       pinctrl_2: pinctrl@03860000 { ?
Yes, you are right. Actually I made mistake here because in
exynos4210.dtsi these labels are defined.

I will fix it and re-spin.

Thanks for feedback,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
