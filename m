From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 1/4] mfd: Add DT bindings documentation for Samsung
 Exynos LPASS
Date: Fri, 5 Aug 2016 14:36:28 +0100
Message-ID: <20160805133628.GG5243@dell>
References: <1467738785-31410-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467738785-31410-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, ideal.song@samsung.com, inki.dae@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 05 Jul 2016, Sylwester Nawrocki wrote:

> This patch adds documentation of the DT bindings for the Samsung
> Exynos SoC Low Power Audio Subsystem.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> 
> There were few rather significant additions since v3 and I had to drop tags:
>  Acked-by: Rob Herring <robh@kernel.org>
>  Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> Changes since v3:
>  - moved to Documentation/devicetree/bindings/mfd,
>  - added #address-cells, #size-cells, ranges as required
>    properties,
>  - added description of the IP block subnodes and links
>    to their binding's documentation.
> 
> Changes since v2:
>  - none.
> ---
>  .../bindings/mfd/samsung,exynos5433-lpass.txt       | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt
> new file mode 100644
> index 0000000..7e97c0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt
> @@ -0,0 +1,21 @@
> +

Nit: This line is superfluous.

> +Samsung Exynos SoC Low Power Audio Subsystem (LPASS)
> +
> +Required properties:
> +
> + - compatible : "samsung,exynos5433-lpass"
> + - reg : should contain the LPASS top SFR region location and size
> + - samsung,pmu-syscon : the phandle to the Power Management Unit node
> + - #address-cells: should be 1
> + - #size-cells: should be 1
> + - ranges: must be present

These look so much better like:

- compatible  	   	  : "samsung,exynos5433-lpass"
- reg		   	  : should contain the LPASS top SFR region location and size
- samsung,pmu-syscon 	  : the phandle to the Power Management Unit node
- #address-cells	  : should be 1
- #size-cells		  : should be 1
- ranges		  : must be present

> +Each IP block of the Low Power Audio Subsystem should be specified
> +as an optional sub-node. For "samsung,exynos5433-lpass" compatible
> +this includes: UART, SLIMBUS, PCM, I2S, DMAC, Timers 0...4, WDT 0...1
> +devices.
> +
> +Bindings of the sub-nodes are described in:
> + Documentation/devicetree/bindings/serial/samsung_uart.txt
> + Documentation/devicetree/bindings/sound/samsung-i2s.txt
> + Documentation/devicetree/bindings/dma/arm-pl330.txt

Use relative path names:

../serial/samsung_uart.txt
../sound/samsung-i2s.txt
../dma/arm-pl330.txt

Missing example?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
