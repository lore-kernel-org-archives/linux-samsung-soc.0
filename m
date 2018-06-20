From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: add OF graph between USB-PHY
 and MUIC
Date: Wed, 20 Jun 2018 20:28:44 +0200
Message-ID: <20180620182844.5nmlj5djbjgwy3wn@kozik-lap>
References: <20180515121239.18192-1-a.hajda@samsung.com>
 <CGME20180515121251eucas1p160dd3dcff49f0dad845ed6be98f33bbe@eucas1p1.samsung.com>
 <20180515121239.18192-3-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180515121239.18192-3-a.hajda@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, May 15, 2018 at 02:12:39PM +0200, Andrzej Hajda wrote:
> OF graph describes USB data lanes between USB-PHY and respective MUIC.
> Since graph is present and DWC driver can use it to get extcon, obsolete
> extcon property can be removed.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  .../dts/exynos/exynos5433-tm2-common.dtsi     | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)

dtc W=1 now complains with:
===
Warning (graph_child_address):
/soc/hsi2c@14d90000/max77843@66/max77843-muic/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
===

Do you plan to add more ports soon?

Best regards,
Krzysztof

> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index 03453b822093..042e5894a138 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -868,6 +868,18 @@
>  					};
>  				};
>  			};
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					muic_to_usb: endpoint {
> +						remote-endpoint = <&usb_to_muic>;
> +					};
> +				};
> +			};
>  		};
>  
>  		regulators {
> @@ -1287,12 +1299,17 @@
>  
>  &usbdrd_dwc3 {
>  	dr_mode = "otg";
> -	extcon = <&muic>;
>  };
>  
>  &usbdrd30_phy {
>  	vbus-supply = <&safeout1_reg>;
>  	status = "okay";
> +
> +	port {
> +		usb_to_muic: endpoint {
> +			remote-endpoint = <&muic_to_usb>;
> +		};
> +	};
>  };
>  
>  &xxti {
> -- 
> 2.17.0
> 
