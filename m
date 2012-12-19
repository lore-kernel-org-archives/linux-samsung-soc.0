From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c-core: Add gpio based bus arbitration
 implementation
Date: Wed, 19 Dec 2012 12:32:01 +0000
Message-ID: <20121219123201.B636A3E0AD7@localhost>
References: <1355464254-12768-1-git-send-email-ch.naveen@samsung.com>
 <1355464254-12768-2-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355464254-12768-2-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, naveen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 14 Dec 2012 11:20:53 +0530, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> The arbitrator is a general purpose function which uses two GPIOs to
> communicate with another device to claim/release a bus.
> 
> i2c_transfer()
> 	if adapter->gpio_arbit
> 		i2c_bus_claim();
> 			__i2c_transfer();
> 		i2c_bus_release();
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Hi Naveen,

I'm not convinced on the design of this protocol. It won't scale beyond
2 bus masters and it seems very specific to the design of a specific
piece of hardware. I don't think it is mature enough to bake into the
core i2c infrastructure or bindings. Nor do I think it will handle other
busses properly.

I can see two alternatives here.
1) build in hooks for doing i2c bus claim/release, but don't put this
specific implementation into the core infrastructure
2) Create an i2c bridge driver. This would kind of be like an i2c
multiplexer, but it would only have one bus and it would include the
knowledge of how to use the GPIO lines for bus arbitration.

I think option 2 would be the cleanest option. It would be straight
forward to design a binding for it by placing a node between the i2c
bus and all the i2c clients. For example:

i2c@60000000 {
	compatible = "acme,some-i2c-device";
	#address-cells = <1>;
	#size-cells = <0>;

	i2c-bridge {
		#address-cells = <1>;
		#size-cells = <0>;
		compatible = "samaung,i2c-gpio-arbitrate";

		bus-arbitration-gpios = <&gpf0 3 1 0 0>, /* AP_CLAIM */
			<&gpe0 4 0 3 0>; /* EC_CLAIM */
	
		bus-arbitration-slew-delay-us = <10>;
		bus-arbitration-wait-retry-us = <2000>;
		bus-arbitration-wait-free-us = <50000>;

		i2c@52 {
			// Normal i2c device
		};
	};
};

I don't know what the state of the i2c subsystem is with regard to
supporting i2c multiplexer devices, so there might be some changes
needed there, but I can't see it being particularly complex. It should
just be a device in the middle. Any i2c device that is a child of the
bridge would send transfers to the bridge, and the bridge would be
responsible to claim the bus and then pass the transfer through
unchanged.

That eliminates the problem of trying to design an arbitration scheme
that works for all.

g.
