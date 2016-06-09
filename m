From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: Fix broken architected timer interrupt
 trigger
Date: Thu, 9 Jun 2016 10:05:38 -0500
Message-ID: <575985C2.4050109@opensource.altera.com>
References: <1465235791-7064-1-git-send-email-marc.zyngier@arm.com>
 <1465235791-7064-3-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1465235791-7064-3-git-send-email-marc.zyngier@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liu Gang <Gang.Liu@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Hou Zhiqiang <B48286@freescale.com>, Michal Simek <michal.simek@xilinx.com>, Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Ray Jui <rjui@broadcom.com>, Tirumalesh Chalamarla <tchalamarla@cavium.com>, linux-samsung-soc@vger.kernel.org, Yuan Yao <yao.yuan@nxp.com>, Wenbin Song <Wenbin.Song@freescale.com>, Jan Glauber <jglauber@cavium.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-amlogic@lists.infradead.org, Mingkai Hu <Mingkai.Hu@freescale.com>, =?UTF-8?Q?S=c3=b6ren_Brin
List-Id: linux-samsung-soc@vger.kernel.org

On 06/06/2016 12:56 PM, Marc Zyngier wrote:
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
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> index 445aa67..c2b9bcb 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> @@ -255,10 +255,10 @@
>  		/* Local timer */
>  		timer {
>  			compatible = "arm,armv8-timer";
> -			interrupts = <1 13 0xf01>,
> -				     <1 14 0xf01>,
> -				     <1 11 0xf01>,
> -				     <1 10 0xf01>;
> +			interrupts = <1 13 0xf08>,
> +				     <1 14 0xf08>,
> +				     <1 11 0xf08>,
> +				     <1 10 0xf08>;

For SOCFPGA:

Acked-by: Dinh Nguyen <dinguyen@opensource.altera.com>

Thanks,
Dinh
