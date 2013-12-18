From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: Add regulator entries to Exynos5420 SMDK board
Date: Wed, 18 Dec 2013 16:16:02 +0100
Message-ID: <6615089.743e1d93MS@amdc1227>
References: <1386236664-27763-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17850 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754774Ab3LRPQT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 10:16:19 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MY000H3RD36I710@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Dec 2013 15:16:18 +0000 (GMT)
In-reply-to: <1386236664-27763-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Sachin,

On Thursday 05 of December 2013 15:14:24 Sachin Kamat wrote:
> Added regulator entries to Exynos5420 SMDK board.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> Changes since v1:
> Changed node name
> ---
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |  216 +++++++++++++++++++++++++++++
>  1 file changed, 216 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> index fb5a1e25c632..62e1ebe4e989 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -120,4 +120,220 @@
>  			reg = <0x50>;
>  		};
>  	};
> +
> +	hsi2c_4: i2c@12CA0000 {
> +		status = "okay";
> +
> +		s2mps11_pmic@66 {

Just pmic@66 is enough.

> +			compatible = "samsung,s2mps11-pmic";
> +			reg = <0x66>;
> +			s2mps11,buck2-ramp-delay = <12>;
> +			s2mps11,buck34-ramp-delay = <12>;
> +			s2mps11,buck16-ramp-delay = <12>;
> +			s2mps11,buck6-ramp-enable = <1>;
> +			s2mps11,buck2-ramp-enable = <1>;
> +			s2mps11,buck3-ramp-enable = <1>;
> +			s2mps11,buck4-ramp-enable = <1>;
> +
> +			s2mps11_osc: clocks {
> +				#clock-cells = <1>;
> +				clock-output-names = "s2mps11_ap",
> +						"s2mps11_cp", "s2mps11_bt";
> +			};
> +
> +			regulators {
> +				ldo1_reg: LDO1 {
> +					regulator-name = "vdd_ldo1";

Is this the name as written on the PCB or board schematics?
+ the same for all regulators below.

Best regards,
Tomasz
 
