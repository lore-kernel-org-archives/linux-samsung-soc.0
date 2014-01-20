From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH V12 1/3] ARM: dts: Add pmu sysreg node to exynos5250 and
 exynos5420 dtsi files
Date: Mon, 20 Jan 2014 13:09:14 +0900
Message-ID: <CAL1wa8cfE7_HfkMOx8jKM6p+xjMFGXaE9X1DsN1pfbt11x62jg@mail.gmail.com>
References: <1386308868-30264-1-git-send-email-l.krishna@samsung.com>
	<1386308868-30264-2-git-send-email-l.krishna@samsung.com>
	<20140110074113.GB12119@spo001.leaseweb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:62964 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752503AbaATEJP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 19 Jan 2014 23:09:15 -0500
In-Reply-To: <20140110074113.GB12119@spo001.leaseweb.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wim Van Sebroeck <wim@iguana.be>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dianders@chromium.org, t.figa@samsung.com, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, cpgs@samsung.com, linux@roeck-us.net

On 1/10/14, Wim Van Sebroeck <wim@iguana.be> wrote:
> Hi Leela,
>
>> This patch adds pmusysreg node to exynos5250 and exynos5420 dtsi files to
>> handle PMU register accesses in a centralized way using syscon driver
>>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>> Reviewed-by: Doug Anderson <dianders@chromium.org>
>> Tested-by: Doug Anderson <dianders@chromium.org>
>> ---
> ...
>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
>> b/arch/arm/boot/dts/exynos5420.dtsi
>> index b1fa334..cd47db0 100644
>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> @@ -402,4 +402,9 @@
>>  		clock-names = "gscl";
>>  		samsung,power-domain = <&gsc_pd>;
>>  	};
>
> I can't add this patch since there is no "gscl" in the current linux-tree.
> Is this depending on another patch or are we going to fix this in another
> way?
>

Hi Kgene,

Driver changes has been merged to Wim's tree, so can you please pick
this patch into your tree.

Best Wishes,
Leela krishna.

> Kind regards,
> Wim.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
