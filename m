From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 1/3] phy: Add exynos-simple-phy driver
Date: Wed, 14 May 2014 22:01:49 +0200
Message-ID: <5373CBAD.2010505@gmail.com>
References: <1400095043-685-1-git-send-email-rahul.sharma@samsung.com>
 <1400095043-685-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1400095043-685-2-git-send-email-rahul.sharma@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: t.stanislaws@samsung.com, devicetree@vger.kernel.org, kgene.kim@samsung.com, joshi@samsung.com, kishon@ti.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, grant.likely@linaro.org, sylvester.nawrocki@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Rahul, Tomasz,

On 14.05.2014 21:17, Rahul Sharma wrote:
> From: Tomasz Stanislawski <t.stanislaws@samsung.com>
> 
> Add exynos-simple-phy driver to support a single register
> PHY interfaces present on Exynos4 SoC.
> 
> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> 
> ---
>  .../devicetree/bindings/phy/samsung-phy.txt        |   56 ++++++
>  drivers/phy/Kconfig                                |    5 +
>  drivers/phy/Makefile                               |    1 +
>  drivers/phy/exynos-simple-phy.c                    |  189 ++++++++++++++++++++
>  include/dt-bindings/phy/exynos-simple-phy.h        |   27 +++
>  5 files changed, 278 insertions(+)
>  create mode 100644 drivers/phy/exynos-simple-phy.c
>  create mode 100644 include/dt-bindings/phy/exynos-simple-phy.h
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
> index 2049261..12ad9cf 100644
> --- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
> @@ -161,3 +161,59 @@ Example:
>  		usbdrdphy0 = &usb3_phy0;
>  		usbdrdphy1 = &usb3_phy1;
>  	};
> +
> +Samsung S5P/EXYNOS SoC series SIMPLE PHY
> +-------------------------------------------------
> +
> +Required properties:
> +- compatible : should be one of the listed compatibles:
> +	- "samsung,exynos4210-simple-phy"
> +	- "samsung,exynos4412-simple-phy"
> +	- "samsung,exynos5250-simple-phy"
> +	- "samsung,exynos5420-simple-phy"
> +- samsung,pmureg-phandle - handle to syscon to control PMU registers
> +- #phy-cells : from the generic phy bindings, must be 1;
> +
> +For "samsung,exynos4210-simple-phy" compatible PHYs the second cell in
> +the PHY specifier identifies the PHY and the supported phys for exynos4210
> +are:
> +  HDMI_PHY,
> +  DAC_PHY,
> +  ADC_PHY,
> +  PCIE_PHY,
> +  SATA_PHY.
> +
> +For "samsung,exynos4412-simple-phy" compatible PHYs the second cell in
> +the PHY specifier identifies the PHY and the supported phys for exynos4412
> +are:
> +  HDMI_PHY,
> +  ADC_PHY.
> +
> +For "samsung,exynos5250-simple-phy" compatible PHYs the second cell in
> +the PHY specifier identifies the PHY and the supported phys for exynos5250
> +are:
> +  HDMI_PHY,
> +  ADC_PHY,
> +  SATA_PHY.
> +
> +For "samsung,exynos5420-simple-phy" compatible PHYs the second cell in
> +the PHY specifier identifies the PHY and the supported phys for exynos5420
> +are:
> +  HDMI_PHY,
> +  ADC_PHY.
> +
> +Example:
> +Simple PHY provider node:
> +
> +	simplephys: simple-phys@10040000 {
> +		compatible = "samsung,exynos5250-simple-phy";

Missing reg property or unnecessary @unit-address suffix in node name.

> +		samsung,pmu-syscon = <&pmu_system_controller>;
> +		#phy-cells = <1>;
> +	};

In general, the idea is quite good, but I think this should rather bind
to the main PMU node, since this is just a part of the PMU, not another
device in the system. This also means that the PMU node itself should be
the PHY provider.

Otherwise looks good.

Best regards,
Tomasz
