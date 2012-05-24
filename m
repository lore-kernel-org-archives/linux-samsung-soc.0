From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 6/6] ARM: dts: Add nodes for spi controllers for Samsung
 Exynos5 platforms
Date: Thu, 24 May 2012 16:49:44 +0900
Message-ID: <006d01cd3981$c8b0d950$5a128bf0$%kim@samsung.com>
References: <1337334392-6441-1-git-send-email-thomas.abraham@linaro.org>
 <1337334392-6441-7-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39833 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751055Ab2EXHtq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 May 2012 03:49:46 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4I0032FOE82YQ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 May 2012 16:49:45 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4I009XJOEWXL50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 May 2012 16:49:45 +0900 (KST)
In-reply-to: <1337334392-6441-7-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, jaswinder.singh@linaro.org, 'Kyoungil Kim' <ki0351.kim@samsung.com>

Thomas Abraham wrote:
> 
> Add device nodes for the three instances of spi controllers in Exynos5
> platforms and enable instance spi 1 for smdk5250 board.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |   47
> ++++++++++++++++++++++++++++-
>  arch/arm/boot/dts/exynos5250.dtsi         |   46
> ++++++++++++++++++++++++++++
>  2 files changed, 92 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> index 49945cc..dca572d 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts

[...]

> -		bootargs = "root=/dev/ram0 rw ramdisk=8192
> console=ttySAC1,115200";
> +		bootargs ="root=/dev/ram0 rw ramdisk=8192
> initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";

Yes, we need above. But it should be separated patch from here.

[...]

> +	spi_1: spi@12d30000 {
> +		gpios = <&gpa2 4 2 3 0>,
> +			<&gpa2 6 2 3 0>,
> +			<&gpa2 7 2 3 0>;
> +
> +		w25q80bw@0 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			compatible = "w25x80";
> +			reg = <0>;
> +			spi-max-frequency = <10000>;
> +
> +			controller-data {
> +				cs-gpio = <&gpa2 5 1 0 3>;
> +				samsung,spi-feedback-delay = <0>;
> +			};
> +
> +			partition@0 {
> +				label = "U-Boot";
> +				reg = <0x0 0x40000>;
> +				read-only;
> +			};
> +
> +			partition@40000 {
> +				label = "Kernel";
> +				reg = <0x40000 0xc0000>;
> +			};
> +		};
> +	};

See my previous comments on 5/6.

[...]

> +	combiner:interrupt-controller@10440000 {
> +		compatible = "samsung,exynos4210-combiner";
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		samsung,combiner-nr = <32>;
> +		reg = <0x10440000 0x1000>;
> +		interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
> +			     <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
> +			     <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
> +			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
> +			     <0 16 0>, <0 17 0>, <0 18 0>, <0 19 0>,
> +			     <0 20 0>, <0 21 0>, <0 22 0>, <0 23 0>,
> +			     <0 24 0>, <0 25 0>, <0 26 0>, <0 27 0>,
> +			     <0 28 0>, <0 29 0>, <0 30 0>, <0 31 0>;
> +	};

Already merged above in my tree.

[...]

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
