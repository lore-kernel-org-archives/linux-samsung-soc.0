From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH v2 1/5] dt-bindings: add bindings for USB physical
 connector
Date: Mon, 5 Feb 2018 00:08:36 -0600
Message-ID: <20180205060836.pybxzt5e2kdu2wew@rob-hp-laptop>
References: <20180131134435.12216-1-a.hajda@samsung.com>
 <CGME20180131134457eucas1p128394aef86e0d76cfc6ccb72ee22d4b1@eucas1p1.samsung.com>
 <20180131134435.12216-2-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180131134435.12216-2-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Archit Taneja <architt@codeaurora.org>, linux-samsung-soc@vger.kernel.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 31, 2018 at 02:44:31PM +0100, Andrzej Hajda wrote:
> These bindings allow to describe most known standard USB connectors
> and it should be possible to extend it if necessary.
> USB connectors, beside USB can be used to route other protocols,
> for example UART, Audio, MHL. In such case every device passing data
> through the connector should have appropriate graph bindings.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
> v2:
> - moved connector type(A,B,C) to compatible string (Rob),
> - renamed size property to type (Rob),
> - changed type description to be less confusing (Laurent),
> - removed vendor specific compatibles (implied by graph port number),

How so? More below...

> - added requirement of connector being a child of IC (Rob),
> - removed max-mode (subtly suggested by Rob, it should be detected anyway
>   by USB Controller in runtime, downside is that device is not able to
>   report its real capabilities, maybe better would be to make it optional(?)),
> - assigned port numbers to data buses (Rob).
> 
> Regards
> Andrzej
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  .../bindings/connector/usb-connector.txt           | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/connector/usb-connector.txt
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
> new file mode 100644
> index 000000000000..02020f5d760a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
> @@ -0,0 +1,48 @@
> +USB Connector
> +=============
> +
> +USB connector node represents physical USB connector. It should be
> +a child of USB interface controller.
> +
> +Required properties:
> +- compatible: describes type of the connector, must be one of:
> +    "usb-a-connector", "usb-b-connector", "usb-c-connector",

Nit: one per line.

> +
> +Optional properties:
> +- label: symbolic name for the connector
> +- type: size of the connector, should be specified in case of USB-A, USB-B
> +  non-standard (large) connector sizes: "mini", "micro"
> +
> +Required nodes:
> +- any data bus to the connector should be modeled using the OF graph bindings
> +  specified in bindings/graph.txt, unless the bus is between parent node and
> +  the connector. Since single connector can have multpile data buses every bus
> +  has assigned OF graph port number as follows:
> +    0: High Speed (HS), present in all connectors,
> +    1: Super Speed (SS), present in SS capable connectors,
> +    2: Sideband use (SBU), present in USB-C,
> +    3: Mobile High-Definition Link (MHL), present in 11-pin Samsung micro-USB

This is un-muxed unlike Type-C where the signals are muxed with USB SS. 
That makes me think the Samsung connector should have its own compatible 
string.

Can we go ahead and define the video modes of Type-C? Normally, if 2 
data streams are mutually exclusive, then they are a single port with 2 
endpoints. So we'd either have 2 endpoints on port 1 or we stick with 
port 3 is always video. We can still know what is mutually exclusive 
based on the compatible. 

> +
> +Example
> +-------
> +
> +muic_max77843@66 {
> +	...
> +	musb_con: connector {
> +		compatible = "usb-b-connector";
> +		label = "micro-USB";
> +		type = "micro";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@3 {
> +				reg = <3>;
> +				musb_con_mhl_in: endpoint {
> +					remote-endpoint = <&mhl_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> -- 
> 2.15.1
> 
