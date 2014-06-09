From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add missing clock/pin-control entries for I2S0
 on Exynos4
Date: Mon, 09 Jun 2014 11:53:31 +0200
Message-ID: <5395841B.8000702@samsung.com>
References: <1402133454-28445-1-git-send-email-tushar.b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:39372 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932628AbaFIJxm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jun 2014 05:53:42 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N6W008IQBHFCE80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Jun 2014 10:53:39 +0100 (BST)
In-reply-to: <1402133454-28445-1-git-send-email-tushar.b@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.b@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Tushar,

On 07/06/14 11:30, Tushar Behera wrote:
> I2S driver uses 3 clocks under different conditions. Added two
> missing clocks.
> 
> Additionally updated pin-control property for this node.
> 
> Signed-off-by: Tushar Behera <tushar.b@samsung.com>
> ---
> Based on next-20140606.
> 
> Tested on Exynos4210-based Origen boards with private patches for
> codec/machine driver.
> 
>  arch/arm/boot/dts/exynos4.dtsi |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index fbaf426..10bb081 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -55,11 +55,15 @@
>  	i2s0: i2s@03830000 {
>  		compatible = "samsung,s5pv210-i2s";
>  		reg = <0x03830000 0x100>;
> -		clocks = <&clock_audss EXYNOS_I2S_BUS>;
> -		clock-names = "iis";
> +		clocks = <&clock_audss EXYNOS_I2S_BUS>,
> +			<&clock_audss EXYNOS_I2S_BUS>,
> +			<&clock_audss EXYNOS_SCLK_I2S>;
> +		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
>  		dmas = <&pdma0 12>, <&pdma0 11>, <&pdma0 10>;
>  		dma-names = "tx", "rx", "tx-sec";
>  		samsung,idma-addr = <0x03000000>;
> +		pinctrl-0 = <&i2s0_bus>;
> +		pinctrl-names = "default";
>  		status = "disabled";
>  	};

I assumed those properties you're adding here belong to board or
to SoC type specific dts. It doesn't hurt ot have it like this,
but what do you think about moving this to  arch/arm/boot/dts/
exynos4210(4x12).dtsi ? For instance pinctrl definitions are
in SoC specific dts.

--
Thanks,
Sylwester
