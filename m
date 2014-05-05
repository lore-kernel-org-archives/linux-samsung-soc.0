From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC v3 PATCH v6 11/16] ARM: dts: s6e3fa0: add DT bindings
Date: Mon, 05 May 2014 12:35:17 +0200
Message-ID: <53676965.4020800@samsung.com>
References: <1398563412-21781-1-git-send-email-yj44.cho@samsung.com>
 <1398563412-21781-12-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53833 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756187AbaEEKfW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 May 2014 06:35:22 -0400
In-reply-to: <1398563412-21781-12-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com

On 04/27/2014 03:50 AM, YoungJun Cho wrote:
> This patch adds DT bindings for s6e3fa0 panel.
> The bindings describes panel resources, display timings and cpu mode timings.
> 
> Changelog v2:
> - Adds unit address (commented by Sachin Kamat)
> Changelog v3:
> - Removes optional delay, size properties (commented by Laurent Pinchart)
> - Adds OLED detection, TE gpio properties
> Changelog v4:
> - Moves CPU timings relevant properties from FIMD DT
>   (commeted by Laurent Pinchart, Andrzej Hajda)
> Changelog v5:
> - Fixes gpio property names (commented by Andrzej Hajda)
> Changelog v6:
> - Renames CPU timings to CPU mode timings
> - Modifies CPU mode timings internal properties relevant things
>   (commeted by Laurent Pinchart, Andrzej Hajda)
> 
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   68 ++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> 
> diff --git a/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> new file mode 100644
> index 0000000..9f06645
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> @@ -0,0 +1,68 @@
> +Samsung S6E3FA0 AMOLED LCD 5.7 inch panel
> +
> +Required properties:
> +  - compatible: "samsung,s6e3fa0"
> +  - reg: the virtual channel number of a DSI peripheral
> +  - vdd3-supply: core voltage supply
> +  - vci-supply: voltage supply for analog circuits
> +  - reset-gpios: a GPIO spec for the reset pin
> +  - det-gpios: a GPIO spec for the OLED detection pin
> +  - te-gpios: a GPIO spec for the TE pin
> +  - display-timings: timings for the connected panel as described by [1]

This still bothers me, it forces users to provide bunch of fake
properties (four porches, two syncs and clock-frequency) just because we
need to pass somehow pixel width and height. And do we really need pixel
dimension to be passed via DT? I guess it could be:
- hardcoded into the driver,
- derived from the panel id,
- maybe read from the panel, this is the best option I guess but I am
not sure if panel provides an API for this.

Regards
Andrzej


> +  - cpu-mode-timings: CPU interface timings for the connected panel,
> +      and it contains following properties.
> +        Required properties:
> +          - wr-active: clock cycles for the active period of CS enable in CPU
> +              interface.
> +        Optional properties:
> +          - cs-setup: clock cycles for the active period of address signal
> +              enable until chip select is enable in CPU interface.
> +              If not specified, the default value(0) will be used.
> +          - wr-setup: clock cycles for the active period of CS signal enable
> +              until write signal is enable in CPU interface.
> +              If not specified, the default value(0) will be used.
> +          - wr-hold: clock cycles for the active period of CS disable until
> +              write signal is disable in CPU interface.
> +              If not specified, the default value(0) will be used.
> +
> +Optional properties:
> +
> +The device node can contain one 'port' child node with one child 'endpoint'
> +node, according to the bindings defined in [2]. This node should describe
> +panel's video bus.
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
> +		reset-gpios = <&gpy7 4 0>;
> +		det-gpios = <&gpg0 6 0>;
> +		te-gpios = <&gpd1 7 0>;
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
> +		cpu-mode-timings {
> +			cs-setup = <0>;
> +			wr-setup = <0>;
> +			wr-active = <1>;
> +			wr-hold = <0>;
> +		};
> +	};
> 
