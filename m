From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] drm/bridge/sii8620: add external connector handle
Date: Fri, 11 Aug 2017 12:40:39 +0300
Message-ID: <2097016.rlxulirhWA@avalon>
References: <1502371530-32260-1-git-send-email-m.purski@samsung.com> <6478480.TjcUCueU5y@avalon> <5ce6bd99-c50e-84c2-f21f-eb611cac94c2@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34169 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751416AbdHKJkW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Aug 2017 05:40:22 -0400
In-Reply-To: <5ce6bd99-c50e-84c2-f21f-eb611cac94c2@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Maciej Purski <m.purski@samsung.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, architt@codeaurora.org, will.deacon@arm.com, catalin.marinas@arm.com, a.hajda@samsung.com, b.zolnierkie@samsung.com, krzk@kernel.org

Hi Marek,

On Friday 11 Aug 2017 08:39:31 Marek Szyprowski wrote:
> On 2017-08-10 15:39, Laurent Pinchart wrote:
> > On Thursday 10 Aug 2017 15:25:29 Maciej Purski wrote:
> >> The driver should be switched on if an external connector is plugged and
> >> switched off if it is unplugged. Extcon is optional. If it is not found,
> >> the driver stays in "always-on" mode.
> >> 
> >> Signed-off-by: Maciej Purski <m.purski@samsung.com>
> >> ---
> >> 
> >>   .../bindings/display/bridge/sil-sii8620.txt        |  4 ++
> >>   drivers/gpu/drm/bridge/sil-sii8620.c               | 83 ++++++++++++++-
> >>   2 files changed, 85 insertions(+), 2 deletions(-)
> >> 
> >> diff --git
> >> a/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
> >> b/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt index
> >> 9409d9c..1f230bf 100644
> >> --- a/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
> >> +++ b/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
> >> @@ -10,6 +10,9 @@ Required properties:
> >>   	- clocks, clock-names: specification and name of "xtal" clock
> >>   	- video interfaces: Device node can contain video interface port
> >>   			    node for HDMI encoder according to [1].
> >> 
> >> +Optional properties:
> >> +	- extcon: phandle to external connector for MHL cable changes
> >> +		  detection
> > 
> > The sii8620 DT node should model its connection to the MHL connector using
> > OF graph, connecting a port to the MHL connector DT node through
> > endpoints. I believe the extcon property should then be added to the MHL
> > connector DT node, not the bridge.
> 
> I don't get this. Generic extcon bindings doesn't define connector DT
> node, so I don't see how could we use endpoint DT approach here. Could you
> give the example?

Sure, here you are.

&hsi2c_7 {
	...

        sii8620@39 {
                reg = <0x39>;
                compatible = "sil,sii8620";
                cvcc10-supply = <&ldo36_reg>;
                iovcc18-supply = <&ldo34_reg>;
                interrupt-parent = <&gpf0>;
                interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
                reset-gpios = <&gpv7 0 GPIO_ACTIVE_LOW>;
                clocks = <&pmu_system_controller 0>;
                clock-names = "xtal";

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

	                port@0 {
				reg = <0>;
        	                mhl_to_hdmi: endpoint {
                	                remote-endpoint = <&hdmi_to_mhl>;
	                        };
        	        };
	                port@1 {
				reg = <1>;
        	                mhl_bridge_out: endpoint {
                	                remote-endpoint = <&mhl_connector_in>;
	                        };
        	        };
		};
        };
};

/ {
	mhl-connector {
		compatible = "mhl-connector";
		extcon = <&muic>;

	        port {
        	        mhl_connector_in: endpoint {
                	        remote-endpoint = <&mhl_bridge_out>;
	                };
        	};
	};
};

Note that there's currently no DT binding for MHL connectors. One needs to be 
developed, the HDMI connector DT binding can be used as a source of 
inspiration.

> >>   [1]: Documentation/devicetree/bindings/media/video-interfaces.txt

-- 
Regards,

Laurent Pinchart
