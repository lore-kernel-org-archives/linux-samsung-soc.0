From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v3] ARM: dts: exynos3250: add JPEG codec device node
Date: Tue, 21 Oct 2014 13:54:24 +0530
Message-ID: <CAGcde9HK+gDiPSL-XSMUU_cE4XvxLATvH0sz+K6SbE_4_miTOg@mail.gmail.com>
References: <1410268169-18424-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:63797 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754410AbaJUIYr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Oct 2014 04:24:47 -0400
Received: by mail-wg0-f42.google.com with SMTP id z12so715859wgg.25
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2014 01:24:45 -0700 (PDT)
In-Reply-To: <1410268169-18424-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Hi Jacek Anaszewski,

On Tue, Sep 9, 2014 at 6:39 PM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index 1d52de6..bbc1e4c 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -216,6 +216,19 @@
>                         interrupts = <0 240 0>;
>                 };
>
> +               jpeg-codec@11830000 {
> +                       compatible = "samsung,exynos3250-jpeg";
> +                       reg = <0x11830000 0x1000>;
> +                       interrupts = <0 171 0>;
> +                       clocks = <&cmu CLK_JPEG>, <&cmu CLK_SCLK_JPEG>;
> +                       clock-names = "jpeg", "sclk";
> +                       samsung,power-domain = <&pd_cam>;
> +                       assigned-clocks = <&cmu CLK_MOUT_CAM_BLK>, <&cmu CLK_SCLK_JPEG>;
> +                       assigned-clock-rates = <0>, <150000000>;
> +                       assigned-clock-parents = <&cmu CLK_DIV_MPLL_PRE>;
> +                       status = "disabled";
> +               };
> +
>                 mshc_0: mshc@12510000 {
>                         compatible = "samsung,exynos5250-dw-mshc";
>                         reg = <0x12510000 0x1000>;
> --
> 1.7.9.5
>

I tested this patch on Exynos3250 based Espresso board, hence please
feel free to add.

Tested-by: Pankaj Dubey <pankaj.dubey@samsung.com>

Thanks,
Pankaj Dubey
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
