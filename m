From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 3/3] ARM: EXYNOS: Add G2D support to exynos5250
Date: Wed, 31 Jul 2013 14:52:21 +0900
Message-ID: <1bb701ce8db2$1f96e180$5ec4a480$@org>
References: <1373013749-14530-1-git-send-email-sachin.kamat@linaro.org>
 <1373013749-14530-3-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40557 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751684Ab3GaFwX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Jul 2013 01:52:23 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQS00GNODN772A0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Jul 2013 14:52:22 +0900 (KST)
In-reply-to: <1373013749-14530-3-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, patches@linaro.org, mturquette@linaro.org, inki.dae@samsung.com

Sachin Kamat wrote:
> 
> Adds G2D node to exynos5250 DT file.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> index ef57277..6f356ce 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -163,6 +163,14 @@
>  		clock-names = "watchdog";
>  	};
> 
> +	g2d@10850000 {
> +		compatible = "samsung,exynos5250-g2d";
> +		reg = <0x10850000 0x1000>;
> +		interrupts = <0 91 0>;
> +		clocks = <&clock 345>;
> +		clock-names = "fimg2d";
> +	};
> +
>  	codec@11000000 {
>  		compatible = "samsung,mfc-v6";
>  		reg = <0x11000000 0x10000>;
> --
> 1.7.9.5

Looks ok to me, applied.

Thanks,
Kukjin
