From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Exynos5420: add clock entries to gsc power domain
Date: Wed, 16 Oct 2013 15:36:04 +0530
Message-ID: <CAL1wa8cFA-ww3CGAYA=AVmpbvAu48zZagSz1K_sqK28sFNoRaA@mail.gmail.com>
References: <1381836054-6590-1-git-send-email-l.krishna@samsung.com>
 <1381836054-6590-2-git-send-email-l.krishna@samsung.com> <3629005.VyZGZ4FEyV@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:54271 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760310Ab3JPKG0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Oct 2013 06:06:26 -0400
In-Reply-To: <3629005.VyZGZ4FEyV@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, devicetree@vger.kernel.org, khw0178.kim@samsung.com, prathyush.k@samsung.com, cpgs@samsung.com

Hi Tomasz,

On Wed, Oct 16, 2013 at 12:19 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Leela,
>
> On Tuesday 15 of October 2013 16:50:53 Leela Krishna Amudala wrote:
>> Add clock nodes for oscillator clock, input clocks and parents of input
>> clocks to gsc power domain so that we can set/restore the input
>> clocks while powering on and powering off a domain.
>>
>> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5420.dtsi |    3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
>> b/arch/arm/boot/dts/exynos5420.dtsi index 09aa06c..7f0296c 100644
>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> @@ -116,6 +116,9 @@
>>       gsc_pd: power-domain@10044000 {
>>               compatible = "samsung,exynos4210-pd";
>>               reg = <0x10044000 0x20>;
>> +             clocks = <&clock 1>, <&clock 1032>, <&clock 1033>,
>> +                      <&clock 1034>, <&clock 1035>;
>> +             clock-names = "oscclk", "pclk0", "clk0", "pclk1", "clk1";
>
> This does not seem right. Do you have any actual code that uses this?
>

I'm not sure whether the code that uses this is present or not.
For time being I'll discard this patch from the series and will post it later.

Best Wishes,
Leela Krishna.

> Best regards,
> Tomasz
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
