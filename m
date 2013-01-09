From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/3] ARM: dts: exynos5: Add power domain clocks to pd node
 of Gscaler and MFC
Date: Wed, 9 Jan 2013 09:25:28 -0800
Message-ID: <CAJuYYwTv-YCQnOXA8sFOipvnd4+jE_WqmdsAphteofumSdYF4w@mail.gmail.com>
References: <1357736081-19390-1-git-send-email-prasanna.ps@samsung.com>
	<1357736081-19390-2-git-send-email-prasanna.ps@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f182.google.com ([209.85.210.182]:40251 "EHLO
	mail-ia0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754923Ab3AIRZ3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 12:25:29 -0500
Received: by mail-ia0-f182.google.com with SMTP id x2so1718334iad.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jan 2013 09:25:28 -0800 (PST)
In-Reply-To: <1357736081-19390-2-git-send-email-prasanna.ps@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Prasanna Kumar <prasanna.ps@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, jhbird.choi@samsung.com

On 9 January 2013 04:54, Prasanna Kumar <prasanna.ps@samsung.com> wrote:
> Power domain clks are added to Gscaler and MFC pd nodes.
> These clocks are saved during power off.
>
> Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 6d0e87c..8043be3 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -558,11 +558,13 @@
>         pd_gsc: gsc-power-domain@0x10044000 {
>                 compatible = "samsung,exynos4210-pd";
>                 reg = <0x10044000 0x20>;
> +               samsung,exynos-pd-clks ="aclk_266_gscl","aclk_300_gscl";

Passing clock names from dts is generally discouraged. These clock
names are linux specific. dts/dtsi files should only describe the
hardware and not have any linux specific entries in them. Common clock
framework can be used here to specify the clock.

>         };
>
>         pd_mfc: mfc-power-domain@0x10044040 {
>                 compatible = "samsung,exynos4210-pd";
>                 reg = <0x10044040 0x20>;
> +               samsung,exynos-pd-clks ="aclk_333";

same as above comment.

Thanks,
Thomas.

>         };
>
>         gsc_0:  gsc@0x13e00000 {
> --
> 1.7.5.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
