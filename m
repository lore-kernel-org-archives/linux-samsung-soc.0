From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: Add device tree node for G2D controller on Exynos5
Date: Thu, 20 Dec 2012 18:19:43 +0530
Message-ID: <CAEC9eQPV9U73+O6uW9=fkzWcr-4djriL5aTk-kF9smvcqvRKCA@mail.gmail.com>
References: <1354112989-3161-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:47237 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751386Ab2LTMto (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Dec 2012 07:49:44 -0500
Received: by mail-ie0-f177.google.com with SMTP id k13so4470417iea.22
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Dec 2012 04:49:43 -0800 (PST)
In-Reply-To: <1354112989-3161-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thomas.abraham@linaro.org

ping.

On Wed, Nov 28, 2012 at 7:59 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 581e57a..6d50c15 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -613,4 +613,10 @@
>                 reg = <0x14450000 0x10000>;
>                 interrupts = <0 94 0>;
>         };
> +
> +       g2d: g2d {
> +               compatible = "samsung,exynos-g2d-41";
> +               reg = <0x10850000 0x1000>;
> +               interrupts = <0 91 0>;
> +       };
>  };
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
