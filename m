From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: dts: Specify Odroid X2/U3 audio clock parents and
 rates
Date: Mon, 06 Oct 2014 18:39:33 +0200
Message-ID: <5432C5C5.7020206@samsung.com>
References: <1410360223-18363-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:52559 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752355AbaJFQjh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Oct 2014 12:39:37 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ND100A5X7QQVC90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 06 Oct 2014 17:42:26 +0100 (BST)
In-reply-to: <1410360223-18363-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com

On 10/09/14 16:43, Sylwester Nawrocki wrote:
> This ensures the core and the audio subsystem clocks are configured
> properly, as expected by the sound machine driver. These bits are
> missing to obtain proper audio sample rates in kernel v3.17, where
> audio support for Odroid X2/U3 was first added.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> It would be good to have it applied as a fix for v3.17.

Anything happened to this patch ? I can't see it neither in Linus' nor
-next tree. And we are already at 3.18 merge window.

>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi |   10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index adadaf9..b40f766 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -45,6 +45,16 @@
>  		compatible = "samsung,odroidx2-audio";
>  		samsung,i2s-controller = <&i2s0>;
>  		samsung,audio-codec = <&max98090>;
> +		assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
> +				<&clock_audss EXYNOS_MOUT_I2S>,
> +				<&clock_audss EXYNOS_DOUT_SRP>,
> +				<&clock_audss EXYNOS_DOUT_AUD_BUS>;
> +		assigned-clock-parents = <&clock CLK_FOUT_EPLL>,
> +				<&clock_audss EXYNOS_MOUT_AUDSS>;
> +		assigned-clock-rates = <0>,
> +				<0>,
> +				<192000000>,
> +				<19200000>;
>  	};
> 
>  	mmc@12550000 {
> --
> 1.7.9.5
