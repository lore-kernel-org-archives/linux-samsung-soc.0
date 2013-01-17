From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: Add sdhci node for exynos4412-origen
Date: Thu, 17 Jan 2013 10:27:56 +0100
Message-ID: <4471687.zDioPuf0LJ@amdc1227>
References: <1358401693-3361-1-git-send-email-sachin.kamat@linaro.org>
 <1358401693-3361-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:50577 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756334Ab3AQJ2E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 04:28:04 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGR00MROJMFS7T0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Jan 2013 18:28:02 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGR00HUBJMPAB00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Jan 2013 18:28:02 +0900 (KST)
In-reply-to: <1358401693-3361-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Hi Sachin,

On Thursday 17 of January 2013 11:18:13 Sachin Kamat wrote:
> Added sdhci node for exynos4412-origen.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4412-origen.dts |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts
> b/arch/arm/boot/dts/exynos4412-origen.dts index fe70bc6..4eba374 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -36,6 +36,14 @@
>  		enable-active-high;
>  	};
> 
> +	sdhci@12530000 {
> +		bus-width = <4>;
> +		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
> +		pinctrl-names = "default";
> +		vmmc-supply = <&mmc_reg>;
> +		status = "okay";
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
