From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC v2 PATCH v4 09/14] ARM: dts: s6e3fa0: add DT bindings
Date: Tue, 22 Apr 2014 16:02:43 +0200
Message-ID: <53567683.1020206@samsung.com>
References: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
 <1398083321-8668-10-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1398083321-8668-10-git-send-email-yj44.cho@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YoungJun Cho <yj44.cho@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sachin.kamat@linaro.org, sw0312.kim@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 04/21/2014 02:28 PM, YoungJun Cho wrote:
> This patch adds DT bindings for s6e3fa0 panel.
> The bindings describes panel resources, display timings and cpu timings.
> 
> Changelog v2:
> - Adds unit address (commented by Sachin Kamat)
> Changelog v3:
> - Removes optional delay, size properties (commented by Laurent Pinchart)
> - Adds OLED detection, TE gpio properties
> Changelog v4:
> - Moves CPU timings relevant properties from FIMD DT
>   (commeted by Laurent Pinchart, Andrzej Hajda)
> 
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   63 ++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> 
> diff --git a/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> new file mode 100644
> index 0000000..9eeb38b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> @@ -0,0 +1,63 @@
> +Samsung S6E3FA0 AMOLED LCD 5.7 inch panel
> +
> +Required properties:
> +  - compatible: "samsung,s6e3fa0"
> +  - reg: the virtual channel number of a DSI peripheral
> +  - vdd3-supply: core voltage supply
> +  - vci-supply: voltage supply for analog circuits
> +  - reset-gpio: a GPIO spec for the reset pin
> +  - det-gpio: a GPIO spec for the OLED detection pin
> +  - te-gpio: a GPIO spec for the TE pin

Just FYI, according to DT documentation [1] gpio spec should be in form
[name]-gpios, however there is plenty bindings with -gpio suffix, so I
am not sure if it is really enforced. On the other side it is enforced
by descriptor based gpio framework[2]. Integer-based gpio framework
used in your driver is obsolete according to [2].

[1]: Documentation/devicetree/bindings/gpio/gpio.txt
[2]: Documentation/gpio/gpio.txt

Regards
Andrzej

> +  - display-timings: timings for the connected panel as described by [1]
> +  - cpu-timings: CPU interface timings for the connected panel, and it contains
> +        following optional properties.
> +          - cs-setup: clock cycles for the active period of address signal
> +                enable until chip select is enable in CPU interface
> +          - wr-setup: clock cycles for the active period of CS signal enable
> +                until write signal is enable in CPU interface
> +          - wr-act: clock cycles for the active period of CS enable in CPU
> +                interface
> +          - wr-hold: clock cycles for the active period of CS disable until
> +                write signal is disable in CPU interface
> +
> +Optional properties:
> +
> +The device node can contain one 'port' child node with one child
> +'endpoint' node, according to the bindings defined in [2]. This
> +node should describe panel's video bus.
> +
> +[1]: Documentation/devicetree/bindings/video/display-timing.txt
> +[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +
> +	panel@0 {
> +		compatible = "samsung,s6e3fa0";
> +		reg = <0>;
> +		vdd3-supply = <&vcclcd_reg>;
> +		vci-supply = <&vlcd_reg>;
> +		reset-gpio = <&gpy7 4 0>;
> +		det-gpio = <&gpg0 6 0>;
> +		te-gpio = <&gpd1 7 0>;
> +
> +		display-timings {
> +			timing0: timing-0 {
> +				clock-frequency = <0>;
> +				hactive = <1080>;
> +				vactive = <1920>;
> +				hfront-porch = <2>;
> +				hback-porch = <2>;
> +				hsync-len = <1>;
> +				vfront-porch = <1>;
> +				vback-porch = <4>;
> +				vsync-len = <1>;
> +			};
> +		};
> +
> +		cpu-timings {
> +			cs-setup = <0>;
> +			wr-setup = <0>;
> +			wr-act = <1>;
> +			wr-hold = <0>;
> +		};
> +	};
> 
