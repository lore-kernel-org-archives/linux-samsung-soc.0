From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: dts: exynos4412-origen: Add MSHC node
Date: Fri, 08 Feb 2013 14:41:33 -0800
Message-ID: <1a5601ce064d$738b23b0$5aa16b10$@samsung.com>
References: <1360236442-24811-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31725 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1947091Ab3BHWlv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Feb 2013 17:41:51 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHX001A2B1P13F0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:41:49 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHX00G7KB1N7V60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:41:49 +0900 (KST)
In-reply-to: <1360236442-24811-1-git-send-email-sachin.kamat@linaro.org>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Added MSHC node to Origen-4412 board.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4412-origen.dts |   20 ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts
> b/arch/arm/boot/dts/exynos4412-origen.dts
> index 1df7ebd..14709da 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -48,6 +48,26 @@
>  		status = "okay";
>  	};
> 
> +	mshc@12550000 {
> +		pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
> +		pinctrl-names = "default";
> +		status = "okay";
> +
> +		num-slots = <1>;
> +		supports-highspeed;
> +		broken-cd;
> +		fifo-depth = <0x80>;
> +		card-detect-delay = <200>;
> +		samsung,dw-mshc-ciu-div = <3>;
> +		samsung,dw-mshc-sdr-timing = <2 3>;
> +		samsung,dw-mshc-ddr-timing = <1 2>;
> +
> +		slot@0 {
> +			reg = <0>;
> +			bus-width = <8>;
> +		};
> +	};
> +
>  	codec@13400000 {
>  		samsung,mfc-r = <0x43000000 0x800000>;
>  		samsung,mfc-l = <0x51000000 0x800000>;
> --
> 1.7.4.1

Applied, thanks.

- Kukjin
