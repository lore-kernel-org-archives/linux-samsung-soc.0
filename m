From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH V3 1/2] ARM: dts: Add FIMD node to exynos5
Date: Wed, 20 Mar 2013 17:09:57 +0530
Message-ID: <CAGm_ybgDtFp7BxWGmNO3+cg+Qzur2o+zvwzBpo9XVQRR06pWYQ@mail.gmail.com>
References: <1363774955-22784-1-git-send-email-l.krishna@samsung.com>
	<1363774955-22784-2-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:46886 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752002Ab3CTLj6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Mar 2013 07:39:58 -0400
Received: by mail-wg0-f49.google.com with SMTP id gg9so821136wgb.28
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Mar 2013 04:39:57 -0700 (PDT)
In-Reply-To: <1363774955-22784-2-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com

Hi Leela,

On Wed, Mar 20, 2013 at 3:52 PM, Leela Krishna Amudala
<l.krishna@samsung.com> wrote:
> This adds common FIMD device node for all Exynos5 SoCs
>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 24c52e6..bd270b7 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -775,4 +775,14 @@
>                         samsung,enable-mask = <1>;
>                 };
>         };
> +
> +       fimd {
> +               compatible = "samsung,exynos5250-fimd";
> +               interrupt-parent = <&combiner>;
> +               reg = <0x14400000 0x40000>;
> +               interrupt-names = "fifo", "vsync", "lcd_sys";
> +               interrupts = <18 4>, <18 5>, <18 6>;
> +               clocks = <&clock 133>, <&clock 339>;
> +               clock-names = "sclk_fimd1", "fimd1";

I think the clock-names should be "sclk_fimd", "fimd";
since in the fimd driver during fimd_probe() we are doing
devm_clk_get(dev, "sclk_fimd")  and devm_clk_get(dev, "fimd")

> +       };
>  };
> --
> 1.8.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
