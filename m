From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: Fix broken architected timer interrupt
 trigger
Date: Tue, 07 Jun 2016 09:08:14 +0200
Message-ID: <575672DE.4060504@samsung.com>
References: <1465235791-7064-1-git-send-email-marc.zyngier@arm.com>
 <1465235791-7064-3-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38496 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751181AbcFGHIV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 03:08:21 -0400
In-reply-to: <1465235791-7064-3-git-send-email-marc.zyngier@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Dinh Nguyen <dinguyen@opensource.altera.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Duc Dang <dhdang@apm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Kukjin Kim <kgene@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Tirumalesh Chalamarla <tchalamarla@cavium.com>, Jan Glauber <jglauber@cavium.com>, Hou Zhiqiang <B48286@freescale.com>, Wenbin Song <Wenbin.Song@freescale.com>, Yuan Yao <yao.yuan@nxp.com>, Liu Gang <Gang.Liu@nxp.com>, Mingkai Hu <Mingkai.Hu@freescale.com>, Rajes

On 06/06/2016 07:56 PM, Marc Zyngier wrote:
> The ARM architected timer specification mandates that the interrupt
> associated with each timer is level triggered (which corresponds to
> the "counter >= comparator" condition).
> 
> A number of DTs are being remarkably creative, declaring the interrupt
> to be edge triggered. A quick look at the TRM for the corresponding ARM
> CPUs clearly shows that this is wrong, and I've corrected those.
> For non-ARM designs (and in the absence of a publicly available TRM),
> I've made them active low as well, which can't be completely wrong
> as the GIC cannot disinguish between level low and level high.
> 
> The respective maintainers are of course welcome to prove me wrong.
> 
> While I was at it, I took the liberty to fix a couple of related issue,
> such as some spurious affinity bits on ThunderX, and their complete
> absence on ls1043a (both of which seem to be related to copy-pasting
> from other DTs).
> 
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> ---
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi    | 8 ++++----
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi          | 8 ++++----
>  arch/arm64/boot/dts/apm/apm-storm.dtsi               | 8 ++++----
>  arch/arm64/boot/dts/broadcom/ns2.dtsi                | 8 ++++----
>  arch/arm64/boot/dts/cavium/thunder-88xx.dtsi         | 8 ++++----
>  arch/arm64/boot/dts/exynos/exynos7.dtsi              | 8 ++++----
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi       | 8 ++++----
>  arch/arm64/boot/dts/marvell/armada-ap806.dtsi        | 8 ++++----
>  arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi | 8 ++++----
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi               | 8 ++++----
>  10 files changed, 40 insertions(+), 40 deletions(-)
> 

(...)

> diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> index ca663df..1628315 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> @@ -473,10 +473,10 @@
>  
>  		timer {
>  			compatible = "arm,armv8-timer";
> -			interrupts = <1 13 0xff01>,
> -				     <1 14 0xff01>,
> -				     <1 11 0xff01>,
> -				     <1 10 0xff01>;
> +			interrupts = <1 13 0xff08>,
> +				     <1 14 0xff08>,
> +				     <1 11 0xff08>,
> +				     <1 10 0xff08>;
>  		};
>  
>  		pmu_system_controller: system-controller@105c0000 {

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

I got a conflicting patch in my tree so it would be nice if your fix
went to current release cycle:
https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git/commit/?h=next/dt64&id=8b77005c40376816885b100bcd358887d29e323f

Best regards,
Krzysztof
