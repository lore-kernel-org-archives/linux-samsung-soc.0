From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 4/7] arm: dts: Add syscon-{reboot, poweroff} nodes for
 exynos5410 SoC
Date: Mon, 19 Oct 2015 15:10:07 +0200
Message-ID: <5624EBAF.3080506@osg.samsung.com>
References: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
 <1445234635-3950-5-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:34242 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753049AbbJSNKP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 09:10:15 -0400
In-Reply-To: <1445234635-3950-5-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello Alim,

On 10/19/2015 08:03 AM, Alim Akhtar wrote:
> This patch adds syscon-{reboot, poweroff} nodes to allow the
> generic syscon-{reboot, poweroff} driver to reset/poweroff exynos5410 SoC.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5410.dtsi |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
> index 731eefd23fa9..b9bef8b5ffc9 100644
> --- a/arch/arm/boot/dts/exynos5410.dtsi
> +++ b/arch/arm/boot/dts/exynos5410.dtsi
> @@ -102,6 +102,20 @@
>  			reg = <0x10040000 0x5000>;
>  		};
>  
> +		poweroff: syscon-poweroff {
> +			compatible = "syscon-poweroff";
> +			regmap = <&pmu_system_controller>;
> +			offset = <0x330C>;
> +			mask = <0x5200>;
> +		};
> +
> +		reboot: syscon-reboot {
> +			compatible = "syscon-reboot";
> +			regmap = <&pmu_system_controller>;
> +			offset = <0x0400>;
> +			mask = <0x1>;
> +		};
> +

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
