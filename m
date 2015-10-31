From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v9 09/17] dt-bindings: add document for rockchip variant
 of analogix_dp
Date: Sat, 31 Oct 2015 14:40:43 +0800
Message-ID: <5634626B.8040405@rock-chips.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
 <1446273045-14736-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.133]:54309 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751373AbbJaGkw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 31 Oct 2015 02:40:52 -0400
In-Reply-To: <1446273045-14736-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>
Cc: Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org


On 10/31/2015 02:30 PM, Yakir Yang wrote:
> Rockchip DP driver is a helper driver of analogix_dp coder driver,
> so most of the DT property should be descriped in analogix_dp document.
>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Sorry about the duplicate signed-off, I would send a new version now.

> ---
> Changes in v9:
> - Document more details for 'ports' property.
>
> Changes in v8:
> - Modify the commit subject name. (Heiko)
>
> Changes in v7: None
> Changes in v6: None
> Changes in v5:
> - Split binding doc's from driver changes. (Rob)
> - Add eDP hotplug pinctrl property. (Heiko)
>
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>
>   .../display/rockchip/analogix_dp-rockchip.txt      | 91 ++++++++++++++++++++++
>   1 file changed, 91 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
>
> diff --git a/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
> new file mode 100644
> index 0000000..dae86c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
> @@ -0,0 +1,91 @@
> +Rockchip RK3288 specific extensions to the Analogix Display Port
> +================================
> +
> +Required properties:
> +- compatible: "rockchip,rk3288-edp";
> +
> +- reg: physical base address of the controller and length
> +
> +- clocks: from common clock binding: handle to dp clock.
> +	  of memory mapped region.
> +
> +- clock-names: from common clock binding:
> +	       Required elements: "dp" "pclk"
> +
> +- resets: Must contain an entry for each entry in reset-names.
> +	  See ../reset/reset.txt for details.
> +
> +- pinctrl-names: Names corresponding to the chip hotplug pinctrl states.
> +- pinctrl-0: pin-control mode. should be <&edp_hpd>
> +
> +- reset-names: Must include the name "dp"
> +
> +- rockchip,grf: this soc should set GRF regs, so need get grf here.
> +
> +- ports: there are 2 port nodes with endpoint definitions as defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> +    Port 0: contained 2 endpoints, connecting to the ouput of vop.
> +    Port 1: contained 1 endpoint, connecting to the input of panel.
> +
> +For the below properties, please refer to Analogix DP binding document:
> + * Documentation/devicetree/bindings/drm/bridge/analogix_dp.txt
> +- phys (required)
> +- phy-names (required)
> +- hpd-gpios (optional)
> +-------------------------------------------------------------------------------
> +
> +Example:
> +	dp-controller: dp@ff970000 {
> +		compatible = "rockchip,rk3288-dp";
> +		reg = <0xff970000 0x4000>;
> +		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_EDP>, <&cru PCLK_EDP_CTRL>;
> +		clock-names = "dp", "pclk";
> +		phys = <&dp_phy>;
> +		phy-names = "dp";
> +
> +		rockchip,grf = <&grf>;
> +		resets = <&cru 111>;
> +		reset-names = "dp";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&edp_hpd>;
> +
> +		status = "disabled";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			edp_in: port@0 {
> +				reg = <0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				edp_in_vopb: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&vopb_out_edp>;
> +				};
> +				edp_in_vopl: endpoint@1 {
> +					reg = <1>;
> +					remote-endpoint = <&vopl_out_edp>;
> +				};
> +			};
> +
> +			edp_out: port@1 {
> +				reg = <1>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				edp_out_panel: endpoint {
> +					reg = <0>;
> +					remote-endpoint = <&panel_in_edp>
> +				};
> +			};
> +		};
> +	};
> +
> +	pinctrl {
> +		edp {
> +			edp_hpd: edp-hpd {
> +				rockchip,pins = <7 11 RK_FUNC_2 &pcfg_pull_none>;
> +			};
> +		};
> +	};
