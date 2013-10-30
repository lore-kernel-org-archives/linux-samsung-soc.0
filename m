From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V4 1/3] ARM: dts: Add pmu sysreg node to Exynos5 dtsi file
Date: Wed, 30 Oct 2013 15:42:47 +0100
Message-ID: <1713455.GWPmumZDIq@amdc1227>
References: <1383126673-29033-1-git-send-email-l.krishna@samsung.com>
 <1383126673-29033-2-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:65520 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753225Ab3J3Omv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Oct 2013 10:42:51 -0400
In-reply-to: <1383126673-29033-2-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, wim@iguana.be, devicetree@vger.kernel.org, dianders@chromium.org, linux-watchdog@vger.kernel.org, cpgs@samsung.com, sachin.kamat@linaro.org

Hi Leela,

On Wednesday 30 of October 2013 15:21:11 Leela Krishna Amudala wrote:
> This patch adds pmusysreg node to Exynos5 dtsi file to handle PMU
> register accesses in a centralized way using syscon driver
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5.dtsi |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
> index e52b038..918e732 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -106,4 +106,9 @@
>  		#size-cells = <0>;
>  		status = "disabled";
>  	};
> +
> +	pmu_sys_reg: pmusysreg@1004000 {

Please keep the node name generic, syscon should be fine. Also there is
a typo in unit-address suffix. The label could also have a better name,
like pmu_syscon.

Best regards,
Tomasz

> +		compatible = "syscon";
> +		reg = <0x10040000 0x5000>;
> +	};
>  };
> 
