From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH 2/3] ARM: dts: Add MFC node for exynos 5420
Date: Wed, 19 Jun 2013 17:34:10 +0530
Message-ID: <CANuQgHGR1vDgz6TkCYKr5XtBLVdXng+tF90NShae_4Cqse3G+g@mail.gmail.com>
References: <1371631969-10076-1-git-send-email-arun.kk@samsung.com>
	<1371631969-10076-2-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:51461 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934341Ab3FSMEM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 08:04:12 -0400
Received: by mail-oa0-f52.google.com with SMTP id g12so6307642oah.25
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2013 05:04:10 -0700 (PDT)
In-Reply-To: <1371631969-10076-2-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, k.debski@samsung.com, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, arunkk.samsung@gmail.com

On 19 June 2013 14:22, Arun Kumar K <arun.kk@samsung.com> wrote:
> The patch adds MFC nodes for exynos 5420 and for
> smdk 5420 board.
>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |    5 +++++
>  arch/arm/boot/dts/exynos5420.dtsi         |    8 ++++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> index 08607df..682532c 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -30,4 +30,9 @@
>                         clock-frequency = <24000000>;
>                 };
>         };
> +
> +       codec@11000000 {
> +               samsung,mfc-r = <0x43000000 0x800000>;
> +               samsung,mfc-l = <0x51000000 0x800000>;
> +       };
>  };
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 8474d63..cb74356 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -100,4 +100,12 @@
>                 clocks = <&clock 260>, <&clock 131>;
>                 clock-names = "uart", "clk_uart_baud0";
>         };
> +
> +       codec@11000000 {
> +               compatible = "samsung,mfc-v7";
> +               reg = <0x11000000 0x10000>;
> +               interrupts = <0 96 0>;
> +               clocks = <&clock 401>;
> +               clock-names = "mfc";
> +       };
Is it not possible to move the common part of this node to common
exynos5.dtsi? As exynos5250 is using same property values.
>  };
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--
with warm regards,
Chander Kashyap
