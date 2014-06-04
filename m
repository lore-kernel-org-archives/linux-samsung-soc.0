From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: Re: [PATCH v3 13/15] ARM: dts: exynos5: add system register support
Date: Wed, 4 Jun 2014 17:20:21 +0530
Message-ID: <CAFp+6iFpSHWwH68BSNzetrTdxt2wpZC3y3WfQ+nuRDBeask_MA@mail.gmail.com>
References: <1401686571-22148-1-git-send-email-yj44.cho@samsung.com>
	<1401686571-22148-14-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f51.google.com ([209.85.192.51]:56670 "EHLO
	mail-qg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752351AbaFDLuW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jun 2014 07:50:22 -0400
In-Reply-To: <1401686571-22148-14-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, robh+dt <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, inki.dae@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, sw0312.kim@samsung.com, a.hajda@samsung.com

On Mon, Jun 2, 2014 at 10:52 AM, YoungJun Cho <yj44.cho@samsung.com> wrote:
> This patch adds sysreg device node, and sysreg property
> to fimd device node which is required to use I80 interface.

Same here. The system register nodes have been added to exynos5250 and
exynos5420 by the patch:
dfbbdbf ARM: dts: Add sysreg sytem controller node to exynos5250 and exynos5420

May be, you may want to move those two nodes to this common file (exynos5.dtsi).

>
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5.dtsi |    6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
> index 79d0608..95ee496 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -81,12 +81,18 @@
>                 status = "disabled";
>         };
>
> +       sys_reg: syscon@10050000 {
> +               compatible = "samsung,exynos5-sysreg", "syscon";
> +               reg = <0x10050000 0x500>;
> +       };
> +
>         fimd@14400000 {
>                 compatible = "samsung,exynos5250-fimd";
>                 interrupt-parent = <&combiner>;
>                 reg = <0x14400000 0x40000>;
>                 interrupt-names = "fifo", "vsync", "lcd_sys";
>                 interrupts = <18 4>, <18 5>, <18 6>;
> +               samsung,sysreg = <&sys_reg>;
>                 status = "disabled";
>         };
>
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
