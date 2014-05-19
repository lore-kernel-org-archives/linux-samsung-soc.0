From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Fix SPI interrupt numbers for Exynos5420
Date: Tue, 20 May 2014 01:14:37 +0900
Message-ID: <537A2DED.9090204@samsung.com>
References: <1397134692-22149-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:63880 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751608AbaESQOm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 12:14:42 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz1so5983042pad.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2014 09:14:42 -0700 (PDT)
In-Reply-To: <1397134692-22149-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 04/10/14 21:58, Sachin Kamat wrote:
> Updated as per the user manual.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/boot/dts/exynos5420.dtsi |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index c3a9a66c5767..6f662b5cc90d 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -385,7 +385,7 @@
>   	spi_0: spi@12d20000 {
>   		compatible = "samsung,exynos4210-spi";
>   		reg =<0x12d20000 0x100>;
> -		interrupts =<0 66 0>;
> +		interrupts =<0 68 0>;
>   		dmas =<&pdma0 5
>   			&pdma0 4>;
>   		dma-names = "tx", "rx";
> @@ -401,7 +401,7 @@
>   	spi_1: spi@12d30000 {
>   		compatible = "samsung,exynos4210-spi";
>   		reg =<0x12d30000 0x100>;
> -		interrupts =<0 67 0>;
> +		interrupts =<0 69 0>;
>   		dmas =<&pdma1 5
>   			&pdma1 4>;
>   		dma-names = "tx", "rx";
> @@ -417,7 +417,7 @@
>   	spi_2: spi@12d40000 {
>   		compatible = "samsung,exynos4210-spi";
>   		reg =<0x12d40000 0x100>;
> -		interrupts =<0 68 0>;
> +		interrupts =<0 70 0>;
>   		dmas =<&pdma0 7
>   			&pdma0 6>;
>   		dma-names = "tx", "rx";

Applied, thanks.

- Kukjin
