From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos: Remove unneeded unit names in
 Exynos5433 nodes
Date: Tue, 10 Jan 2017 20:51:09 +0200
Message-ID: <20170110185109.n3x25yxbaarzikcd@kozik-lap>
References: <1484069912-6534-1-git-send-email-javier@osg.samsung.com>
 <1484069912-6534-4-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1484069912-6534-4-git-send-email-javier@osg.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jan 10, 2017 at 02:38:32PM -0300, Javier Martinez Canillas wrote:
> The "samsung,exynos5433-mipi-video-phy" and "samsung,exynos5250-dwusb3"
> DT bindings don't specify a reg property for these nodes, so having a
> unit name leads to the following DTC warnings:
> 
> Node /soc/video-phy@105c0710 has a unit name, but no reg property
> Node /soc/usb@15400000 has a unit name, but no reg property
> Node /soc/usb@15a00000 has a unit name, but no reg property
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 3695ddaf2e04..17e5dafd392c 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -706,7 +706,7 @@
>  			interrupts = <GIC_PPI 9 0xf04>;
>  		};
>  
> -		mipi_phy: video-phy@105c0710 {
> +		mipi_phy: video-phy {
>  			compatible = "samsung,exynos5433-mipi-video-phy";
>  			#phy-cells = <1>;
>  			samsung,pmu-syscon = <&pmu_system_controller>;
> @@ -1285,7 +1285,7 @@
>  			status = "disabled";
>  		};
>  
> -		usbdrd30: usb@15400000  {
> +		usbdrd30: usb-0  {

How about "usbdrd" instead of "usb-0"? It would be still quite a generic
description of a class.

>  			compatible = "samsung,exynos5250-dwusb3";
>  			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>,
>  				<&cmu_fsys CLK_SCLK_USBDRD30>;
> @@ -1332,7 +1332,7 @@
>  			status = "disabled";
>  		};
>  
> -		usbhost30: usb@15a00000 {
> +		usbhost30: usb-1 {

usbhost?

Best regards,
Krzysztof

>  			compatible = "samsung,exynos5250-dwusb3";
>  			clocks = <&cmu_fsys CLK_ACLK_USBHOST30>,
>  				<&cmu_fsys CLK_SCLK_USBHOST30>;
> -- 
> 2.7.4
> 
