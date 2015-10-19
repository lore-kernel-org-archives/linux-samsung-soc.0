From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/7] arm: dts: Add syscon-{reboot, poweroff} nodes for
 exynos4
Date: Mon, 19 Oct 2015 15:08:38 +0200
Message-ID: <5624EB56.5010401@osg.samsung.com>
References: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
 <1445234635-3950-3-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:34234 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753047AbbJSNIn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 09:08:43 -0400
In-Reply-To: <1445234635-3950-3-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello Alim,

On 10/19/2015 08:03 AM, Alim Akhtar wrote:
> This patch adds syscon-{reboot, poweroff} nodes to allow the
> generic syscon-{reboot, poweroff} driver to reset/poweroff exynos4 SoC.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 98c0a368b777..79015320cdb6 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -158,6 +158,20 @@
>  		interrupt-parent = <&gic>;
>  	};
>  
> +	poweroff: syscon-poweroff {
> +		compatible = "syscon-poweroff";
> +		regmap = <&pmu_system_controller>;
> +		offset = <0x330C>;
> +		mask = <0x5200>;
> +	};
> +
> +	reboot: syscon-reboot {
> +		compatible = "syscon-reboot";
> +		regmap = <&pmu_system_controller>;
> +		offset = <0x0400>;
> +		mask = <0x1>;
> +	};
> +

The same comment of patch 1/7 applies to the other
DTS changes. I would prefer if the the offset value
is documented but as I said it could be a follow up.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
