From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Add ADMA node to Exynos5420
Date: Mon, 24 Feb 2014 09:22:49 +0900
Message-ID: <530A90D9.8060006@samsung.com>
References: <1391599711-30328-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:63586 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750976AbaBXAW4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 23 Feb 2014 19:22:56 -0500
Received: by mail-pa0-f43.google.com with SMTP id rd3so5795616pab.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2014 16:22:56 -0800 (PST)
In-Reply-To: <1391599711-30328-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, broonie@linaro.org

On 02/05/14 20:28, Sachin Kamat wrote:
> Added ADMA mode to Exynos5420 DT file.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/boot/dts/exynos5420.dtsi |   11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index cb9612fd2190..376d177e8810 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -281,6 +281,17 @@
>   		interrupt-parent =<&gic>;
>   		ranges;
>
> +		adma: adma@03880000 {
> +			compatible = "arm,pl330", "arm,primecell";
> +			reg =<0x03880000 0x1000>;
> +			interrupts =<0 110 0>;
> +			clocks =<&clock_audss EXYNOS_ADMA>;
> +			clock-names = "apb_pclk";
> +			#dma-cells =<1>;
> +			#dma-channels =<6>;
> +			#dma-requests =<16>;
> +		};
> +
>   		pdma0: pdma@121A0000 {
>   			compatible = "arm,pl330", "arm,primecell";
>   			reg =<0x121A0000 0x1000>;

OK, applied with 2/2 patch.

Thanks,
Kukjin
