From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: dts: Fix SPI interrupt numbers for Exynos5420
Date: Sun, 4 May 2014 21:06:25 +0530
Message-ID: <CAK9yfHwJW+oSDonnJTiFMgT6F+1A9-h4z1x_uye3hAc3qPS=Sw@mail.gmail.com>
References: <1397134692-22149-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:43758 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751071AbaEDPgZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 May 2014 11:36:25 -0400
Received: by mail-ob0-f170.google.com with SMTP id uy5so1639220obc.29
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 May 2014 08:36:25 -0700 (PDT)
In-Reply-To: <1397134692-22149-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>

On 10 April 2014 18:28, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Updated as per the user manual.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index c3a9a66c5767..6f662b5cc90d 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -385,7 +385,7 @@
>         spi_0: spi@12d20000 {
>                 compatible = "samsung,exynos4210-spi";
>                 reg = <0x12d20000 0x100>;
> -               interrupts = <0 66 0>;
> +               interrupts = <0 68 0>;
>                 dmas = <&pdma0 5
>                         &pdma0 4>;
>                 dma-names = "tx", "rx";
> @@ -401,7 +401,7 @@
>         spi_1: spi@12d30000 {
>                 compatible = "samsung,exynos4210-spi";
>                 reg = <0x12d30000 0x100>;
> -               interrupts = <0 67 0>;
> +               interrupts = <0 69 0>;
>                 dmas = <&pdma1 5
>                         &pdma1 4>;
>                 dma-names = "tx", "rx";
> @@ -417,7 +417,7 @@
>         spi_2: spi@12d40000 {
>                 compatible = "samsung,exynos4210-spi";
>                 reg = <0x12d40000 0x100>;
> -               interrupts = <0 68 0>;
> +               interrupts = <0 70 0>;
>                 dmas = <&pdma0 7
>                         &pdma0 6>;
>                 dma-names = "tx", "rx";
> --

Ping Kukjin. This is also a fix patch and should go in rc.

-- 
With warm regards,
Sachin
