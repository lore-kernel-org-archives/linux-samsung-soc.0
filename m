From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: dts: Modify SPI nodes according generic DMA DT bindings
Date: Tue, 5 Mar 2013 15:36:48 +0530
Message-ID: <CAK9yfHwmjwN4ceCQ719Y2DY9keTEX8mt65bHkoHcTTRJc5p9rA@mail.gmail.com>
References: <1362477862-352-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:53269 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754561Ab3CEKGs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 05:06:48 -0500
Received: by mail-oa0-f51.google.com with SMTP id h2so10535867oag.38
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Mar 2013 02:06:48 -0800 (PST)
In-Reply-To: <1362477862-352-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, arnd@arndb.de, vinod.koul@intel.com, grant.likely@secretlab.ca

On 5 March 2013 15:34, Padmavathi Venna <padma.v@samsung.com> wrote:
> This patch removes custom way of adding spi dma channels and
> adds according to new generic DMA DT bindings on samsung exynos4
> and exynos5440 platforms.
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi    |   15 +++++++++------
>  arch/arm/boot/dts/exynos5440.dtsi |    5 +++--
>  2 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 1a62bcf..2449651 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -235,8 +235,9 @@
>                 compatible = "samsung,exynos4210-spi";
>                 reg = <0x13920000 0x100>;
>                 interrupts = <0 66 0>;
> -               tx-dma-channel = <&pdma0 7>; /* preliminary */
> -               rx-dma-channel = <&pdma0 6>; /* preliminary */
> +               dmas = <&pdma0 7
> +                       &pdma0 6>;
> +               dma-names = "tx", "rx";
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 status = "disabled";
> @@ -246,8 +247,9 @@
>                 compatible = "samsung,exynos4210-spi";
>                 reg = <0x13930000 0x100>;
>                 interrupts = <0 67 0>;
> -               tx-dma-channel = <&pdma1 7>; /* preliminary */
> -               rx-dma-channel = <&pdma1 6>; /* preliminary */
> +               dmas = <&pdma0 7
> +                       &pdma0 6>;

Shouldn't these be pdma1 as was earlier?
