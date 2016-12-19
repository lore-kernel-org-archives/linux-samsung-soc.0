From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] drm/panel: Add support for S6E3HA2 panel driver on
 TM2 board
Date: Mon, 19 Dec 2016 12:55:53 -0600
Message-ID: <20161219185553.bxizmi2yegk5ca6b@rob-hp-laptop>
References: <1481695445-13088-1-git-send-email-hoegeun.kwon@samsung.com>
 <1481695445-13088-2-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1481695445-13088-2-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: thierry.reding@gmail.com, kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Donghwa Lee <dh09.lee@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hyungwon Hwang <human.hwang@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Dec 14, 2016 at 03:04:04PM +0900, Hoegeun Kwon wrote:
> This patch add support for MIPI-DSI based S6E3HA2 AMOLED panel
> driver. This panel has 1440x2560 resolution in 5.7-inch physical
> panel in the TM2 device.
> 
> Signed-off-by: Donghwa Lee <dh09.lee@samsung.com>
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>  .../bindings/display/panel/samsung,s6e3ha2.txt     |  52 ++
>  drivers/gpu/drm/panel/Kconfig                      |   6 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      | 756 +++++++++++++++++++++
>  4 files changed, 815 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
>  create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
> new file mode 100644
> index 0000000..1f41f24
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
> @@ -0,0 +1,52 @@
> +Samsung S6E3HA2 5.7" 1440x2560 AMOLED panel
> +
> +Required properties:
> +  - compatible: "samsung,s6e3ha2"
> +  - reg: the virtual channel number of a DSI peripheral
> +  - vdd3-supply: core voltage supply
> +  - vci-supply: voltage supply for analog circuits
> +  - reset-gpios: a GPIO spec for the reset pin
> +  - enable-gpios: a GPIO spec for the panel enable pin
> +  - te-gpios: a GPIO spec for the tearing effect synchronization signal gpio pin

Need to specify the GPIOs as active high or low.

> +
> +Optional properties:
> +  - display-timings: timings for the connected panel as described by [1]
> +
> +The device node can contain one 'port' child node with one child
> +'endpoint' node, according to the bindings defined in [2]. This
> +node should describe panel's video bus.
> +
> +[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
> +[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +
> +	panel@0 {
> +		compatible = "samsung,s6e3ha2";
> +		reg = <0>;

reg doesn't really work here unless this node is a child of the DSI 
controller node. But if it is a child node, then you don't need the OF 
graph.

> +		vdd3-supply = <&ldo27_reg>;
> +		vci-supply = <&ldo28_reg>;
> +		reset-gpios = <&gpg0 0 GPIO_ACTIVE_HIGH>;
> +		enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
> +		te-gpios = <&gpf1 3 GPIO_ACTIVE_HIGH>;
> +
> +		display-timings {
> +			timing-0 {
> +				clock-frequency = <0>;
> +				hactive = <1440>;
> +				vactive = <2560>;
> +				hfront-porch = <1>;
> +				hback-porch = <1>;
> +				hsync-len = <1>;
> +				vfront-porch = <1>;
> +				vback-porch = <15>;
> +				vsync-len = <1>;
> +			};
> +		};
> +
> +		port {
> +			dsi_in: endpoint {
> +				remote-endpoint = <&dsi_out>;
> +			};
> +		};
> +	};
