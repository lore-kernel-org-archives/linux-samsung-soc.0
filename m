From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] ARM: dts: exynos4: add nodes for jpeg codec
Date: Thu, 5 Mar 2015 13:41:28 +0100
Message-ID: <CABxcv=nq4v_L4De=nXrhKuXGgGxVPYKohvWRxq2c9=io2Mf6TQ@mail.gmail.com>
References: <1425558488-7039-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:38947 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751125AbbCEMla (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Mar 2015 07:41:30 -0500
Received: by wiwl15 with SMTP id l15so2713065wiw.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2015 04:41:29 -0800 (PST)
In-Reply-To: <1425558488-7039-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>

Hello Marek,

Patch looks good to me. Just a small comment below so feel free to add my

Reviewed by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On Thu, Mar 5, 2015 at 1:28 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> This patch adds nodes for hardware JPEG codec found in Exynos 4210 and
> 4x12 SoCs.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi    | 9 +++++++++
>  arch/arm/boot/dts/exynos4x12.dtsi | 4 ++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 77ea547..1bd630a 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -685,6 +685,15 @@
>                 #include "exynos4412-tmu-sensor-conf.dtsi"
>         };
>
> +       jpeg-codec@11840000 {
> +               compatible = "samsung,exynos4210-jpeg";
> +               reg = <0x11840000 0x1000>;
> +               interrupts = <0 88 0>;
> +               clocks = <&clock CLK_JPEG>;
> +               clock-names = "jpeg";
> +               samsung,power-domain = <&pd_cam>;

Shouldn't you use the generic "power-domains" property here instead?

Best regards,
Javier
