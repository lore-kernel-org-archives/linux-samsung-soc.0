From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Add vmmc regulator node in
 exynos4412-origen.dts
Date: Thu, 17 Jan 2013 10:26:18 +0100
Message-ID: <5436877.rqOLY7SjmE@amdc1227>
References: <1358401693-3361-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42797 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756172Ab3AQJ1X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 04:27:23 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGR003LQJL62HC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Jan 2013 18:27:22 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGR00HLHJLKAB00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Jan 2013 18:27:22 +0900 (KST)
In-reply-to: <1358401693-3361-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Hi Sachin,

On Thursday 17 of January 2013 11:18:12 Sachin Kamat wrote:
> Added vmmc regulator node in exynos4412-origen.dts file.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4412-origen.dts |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts
> b/arch/arm/boot/dts/exynos4412-origen.dts index df880c4..fe70bc6 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -27,6 +27,15 @@
>  		bootargs ="console=ttySAC2,115200";
>  	};
> 
> +	mmc_reg: voltage-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VMEM_VDD_2.8V";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		gpio = <&gpx1 1 0>;
> +		enable-active-high;
> +	};
> +
>  	serial@13800000 {
>  		status = "okay";
>  	};

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
