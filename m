From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH v2 09/14] ARM: dts: s6e3fa0: add DT bindings
Date: Wed, 16 Apr 2014 23:45:01 +0200
Message-ID: <2105764.669WcFsSVk@avalon>
References: <CAK9yfHyJTpYNCwjCSAmFR-sHRMu5Z94k5eT78WmD-cwmYOEQyw@mail.gmail.com>
 <1397623138-11526-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1397623138-11526-1-git-send-email-yj44.cho@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, sachin.kamat@linaro.org, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi YoungJun,

Thank you for the patch.

On Wednesday 16 April 2014 13:38:57 YoungJun Cho wrote:
> This patch adds DT bindings for s6e3fa0 panel.
> The bindings describes panel resources, display timings, delays
> and physical size.
> 
> Changelog v2:
> - Adds unit address (commented by Sachin Kamat)
> 
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   52 +++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> 
> diff --git a/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt new file mode
> 100644
> index 0000000..889a74d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> @@ -0,0 +1,52 @@
> +Samsung S6E3FA0 AMOLED LCD 5.7 inch panel
> +
> +Required properties:
> +  - compatible: "samsung,s6e3fa0"
> +  - reg: the virtual channel number of a DSI peripheral
> +  - vdd3-supply: core voltage supply
> +  - vci-supply: voltage supply for analog circuits
> +  - reset-gpio: a GPIO spec for the reset pin
> +  - display-timings: timings for the connected panel as described by [1]
> +
> +Optional properties:
> +  - power-on-delay: delay after turning regulators on [ms]
> +  - reset-delay: delay after reset sequence [ms]
> +  - init-delay: delay after initialization sequence [ms]
> +  - panel-width-mm: physical panel width [mm]
> +  - panel-height-mm: physical panel height [mm]

Based on the next patch the panel seems to require quite a lot of device-
specific handling, although I might be mistaken as I'm not too familiar with 
DSI. If my understanding is correct, do we really need to specify all those 
properties in DT, or could they be hardcoded in the driver ? I would usually 
push for generic drivers that read device information from DT, but I'm 
wondering whether that is the right choice here.

If you decide to keep the information in DT I think you should document what 
happens when optional properties are not specified. I suppose the driver uses 
a default value, I would document it in the DT bindings.

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
> +		power-on-delay= <10>;
> +		reset-delay = <5>;
> +		init-delay = <120>;
> +		panel-width-mm = <71>;
> +		panel-height-mm = <126>;
> +
> +		display-timings {
> +			timing0: timing-0 {
> +				clock-frequency = <57153600>;
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
> +	};

-- 
Regards,

Laurent Pinchart
