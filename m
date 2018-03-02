From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: add bindings for USB physical
 connector
Date: Fri, 2 Mar 2018 15:13:15 +0200
Message-ID: <20180302131315.GA10598@kuha.fi.intel.com>
References: <20180227071134.28063-1-a.hajda@samsung.com>
 <CGME20180227071138eucas1p17e1e16f13f6d3e3b15a57dc93eb8cf3f@eucas1p1.samsung.com>
 <20180227071134.28063-2-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180227071134.28063-2-a.hajda@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Archit Taneja <architt@codeaurora.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Tue, Feb 27, 2018 at 08:11:29AM +0100, Andrzej Hajda wrote:
> +2. USB-C connector attached to CC controller (s2mm005), HS lines routed
> +to companion PMIC (max77865), SS lines to USB3 PHY and SBU to DisplayPort.
> +DisplayPort video lines are routed to the connector via SS mux in USB3 PHY.
> +
> +ccic: s2mm005@33 {
> +	...
> +	usb_con: connector {
> +		compatible = "usb-c-connector";
> +		label = "USB-C";

Is this child node really necessary? There will never be more then
one connector per CC line.

We should prefer device_graph* functions over of_graph* and
acpi_graph* functions in the drivers so we don't have to handle the
same thing multiple times with separate APIs. Is it still possible if
there is that connector child node?

> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				usb_con_hs: endpoint {
> +					remote-endpoint = <&max77865_usbc_hs>;
> +				};
> +			};
> +			port@1 {
> +				reg = <1>;
> +				usb_con_ss: endpoint {
> +					remote-endpoint = <&usbdrd_phy_ss>;
> +				};
> +			};
> +			port@2 {
> +				reg = <2>;
> +				usb_con_sbu: endpoint {
> +					remote-endpoint = <&dp_aux>;
> +				};
> +			};
> +		};
> +	};
> +};


Thanks,

-- 
heikki
