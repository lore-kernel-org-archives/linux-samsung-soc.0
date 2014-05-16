From: Arun Kumar K <arun.kk@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Add PD entry to MFC codec on 5420
Date: Fri, 16 May 2014 10:42:23 +0530
Message-ID: <CALt3h790buGxX8JAsqnCr5yVZh-HCGWVmG1w06qyrLbYADCSfQ@mail.gmail.com>
References: <1398754183-30764-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f179.google.com ([209.85.128.179]:40061 "EHLO
	mail-ve0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752719AbaEPFMY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 May 2014 01:12:24 -0400
Received: by mail-ve0-f179.google.com with SMTP id oy12so2562995veb.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2014 22:12:23 -0700 (PDT)
In-Reply-To: <1398754183-30764-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Looks good.
Reviewed-by : Arun Kumar K <arun.kk@samsung.com>

On Tue, Apr 29, 2014 at 12:19 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> PD entry was missing in MFC codec node.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 6f662b5cc90d..2fd36b0a7568 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -131,6 +131,7 @@
>                 interrupts = <0 96 0>;
>                 clocks = <&clock CLK_MFC>;
>                 clock-names = "mfc";
> +               samsung,power-domain = <&mfc_pd>;
>         };
>
>         mmc_0: mmc@12200000 {
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
