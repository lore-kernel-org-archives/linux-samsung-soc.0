From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH Resend 2/2] ARM: dts: Add heartbeat gpio-leds support to
 Origen
Date: Sat, 08 Sep 2012 11:31:12 +0900
Message-ID: <24d701cd8d6a$03804480$0a80cd80$%kim@samsung.com>
References: <1347008770-11421-1-git-send-email-sachin.kamat@linaro.org>
 <1347008770-11421-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25170 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751030Ab2IHCbP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Sep 2012 22:31:15 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MA00049SEZ82P30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 08 Sep 2012 11:31:13 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MA000G0RF01TX00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 08 Sep 2012 11:31:13 +0900 (KST)
In-reply-to: <1347008770-11421-2-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org

Sachin Kamat wrote:
> 
> Adds heartbeat gpio-leds support to Origen board.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4210-origen.dts |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts
> b/arch/arm/boot/dts/exynos4210-origen.dts
> index c37edf0..d69a799 100644
> --- a/arch/arm/boot/dts/exynos4210-origen.dts
> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
> @@ -91,6 +91,14 @@
>  		};
>  	};
> 
> +	leds {
> +		compatible = "gpio-leds";
> +		status {
> +			gpios = <&gpx1 3 0 0x10000 2>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
>  	keypad@100A0000 {
>  		status = "disabled";
>  	};
> --
> 1.7.4.1

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
