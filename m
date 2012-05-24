From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 5/6] ARM: dts: Add nodes for spi controllers for Samsung
 Exynos4 platforms
Date: Thu, 24 May 2012 16:43:27 +0900
Message-ID: <006c01cd3980$e814b240$b83e16c0$%kim@samsung.com>
References: <1337334392-6441-1-git-send-email-thomas.abraham@linaro.org>
 <1337334392-6441-6-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60079 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753000Ab2EXHna (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 May 2012 03:43:30 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4I00GMEO2T3YS0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 May 2012 16:43:29 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4I00972O4FXL40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 May 2012 16:43:28 +0900 (KST)
In-reply-to: <1337334392-6441-6-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, jaswinder.singh@linaro.org, 'Kyoungil Kim' <ki0351.kim@samsung.com>

Thomas Abraham wrote:
> 
> Add device nodes for the three instances of spi controllers in Exynos4
> platforms. Enable instance spi 2 for smdkv310 board and disable all
> spi instances for origen board.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4210-origen.dts   |   12 ++++++++
>  arch/arm/boot/dts/exynos4210-smdkv310.dts |   44
> +++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos4210.dtsi         |   30 +++++++++++++++++++
>  3 files changed, 86 insertions(+), 0 deletions(-)

[...]

> +	aliases {
> +		spi0 = &spi_0;
> +		spi1 = &spi_1;
> +		spi2 = &spi_2;
> +	};
> +

Do we need above aliases?

[...]

> 
> +	spi_2: spi@13940000 {
> +		gpios = <&gpc1 1 5 3 0>,
> +			<&gpc1 3 5 3 0>,
> +			<&gpc1 4 5 3 0>;
> +
> +		w25x80@0 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			compatible = "w25x80";
> +			reg = <0>;
> +			spi-max-frequency = <10000>;
> +
> +			controller-data {
> +				cs-gpio = <&gpc1 2 1 0 3>;
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
> +


Is there a serial flash(w25x80) is connected via SPI2 on smdkv310?

[...]

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
