From: Thomas Pietrowski <thopiekar@gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos5422-odroid*: remove fimd node
Date: Wed, 11 Nov 2015 19:07:22 +0100
Message-ID: <CAE-5t2sCU4097Mpx+o1Wk2pDD7u_xtH7jsOOd_BmYQq1XA8W9g@mail.gmail.com>
References: <1447151049-25370-1-git-send-email-m.szyprowski@samsung.com>
	<56428F34.7060003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f171.google.com ([209.85.160.171]:34788 "EHLO
	mail-yk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750794AbbKKSHW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Nov 2015 13:07:22 -0500
Received: by ykfs79 with SMTP id s79so62252258ykf.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2015 10:07:22 -0800 (PST)
In-Reply-To: <56428F34.7060003@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

When I was trying to build kernel 4.3.0 (from linux-stable) with
EXYNOS_IOMMU I was getting an kernel oop on boot, which forced me to
restart, so the kernel was not usable. Sadly I didn't make a paste of
it.
Can try to reproduce this error and send it if you like.

Are you not getting this error when building the kernel with it? (I
also own a Odroid U3+.)

Regards :)

2015-11-11 1:43 GMT+01:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
> On 10.11.2015 19:24, Marek Szyprowski wrote:
>> FIMD device is not used at all on Exynos5422-based Odroid XU3-lite and
>> XU4. XU3 board teorethically can support FIMD with DisplayPort
>
> s/teorethically/theoretically/
>
>> connector, but due to hw limitation/design it doesn't work in most
>> cases. It is also not even enabled in XU3 dts file.
>>
>> FIMD node was enabled mainly due to limitation of early Exynos DRM
>> driver, which didn't initialize properly when no FIMD device was
>> available. This node can be now safetly removed from XU3-common dtsi and
>
> s/safetly/safely/
>
>> added layer to Odroid XU3 dts, when Display Port driver gets enabled.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 5 -----
>>  1 file changed, 5 deletions(-)
>
> Tested on Odroid XU4 board (HDMI, IOMMU enabled):
>
> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
>
> No need for respin, the changelog fixes above can be done during applying.
>
>
> BTW, do you know why we don't have EXYNOS_IOMMU enabled in defconfig?
> Any reasons against?
>
> Best regards,
> Krzysztof
>
>
>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>> index 1af5bdc..9134217 100644
>> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>> @@ -67,11 +67,6 @@
>>                       <19200000>;
>>  };
>>
>> -&fimd {
>> -     status = "okay";
>> -};
>> -
>> -
>>  &hdmi {
>>       status = "okay";
>>       hpd-gpio = <&gpx3 7 GPIO_ACTIVE_HIGH>;
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
