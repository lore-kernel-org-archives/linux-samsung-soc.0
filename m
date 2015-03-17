From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: exynos3250: Add assigned clock parents to
 CMU node
Date: Tue, 17 Mar 2015 11:53:00 +0100
Message-ID: <5508078C.6010902@samsung.com>
References: <1425302250-13446-1-git-send-email-b.michalska@samsung.com>
 <1425302250-13446-3-git-send-email-b.michalska@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:50663 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753706AbbCQKxE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Mar 2015 06:53:04 -0400
In-reply-to: <1425302250-13446-3-git-send-email-b.michalska@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Beata Michalska <b.michalska@samsung.com>, kgene@kernel.org
Cc: tomasz.figa@gmail.com, mturquette@linaro.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, sw0312.kim@samsung.com

On 02/03/15 14:17, Beata Michalska wrote:
> Use assigned-clocks/assigned-clock-parents properties for
> CMU clock controller DT node to secure proper clock setup:
> switching the two muxes to root oscillator clock is not only
> required for proper powering down the ISP power domain,
> but it also reduces the risk of accessing the ISP CMU
> registers while the ISP power domain remains turned off
> (i.e. through the common clock framework by clk_summary)
> 
> Signed-off-by: Beata Michalska <b.michalska@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Kukjin, please merge this patch for v4.1. I merged the exynos3250
CMU ISP driver patch and we will have regression if $subject patch
is not applied, i.e. reading /sys/kernel/debug/clk/clk_summary
would cause system hang on exynos3250.

> ---
>  arch/arm/boot/dts/exynos3250.dtsi |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index 277b48b..6d6118e 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -172,6 +172,10 @@
>  			compatible = "samsung,exynos3250-cmu";
>  			reg = <0x10030000 0x20000>;
>  			#clock-cells = <1>;
> +			assigned-clocks = <&cmu CLK_MOUT_ACLK_400_MCUISP_SUB>,
> +					  <&cmu CLK_MOUT_ACLK_266_SUB>;
> +			assigned-clock-parents = <&cmu CLK_FIN_PLL>,
> +						 <&cmu CLK_FIN_PLL>;
>  		};
>  
>  		cmu_dmc: clock-controller@105C0000 {
> 

Thanks,
Sylwester
