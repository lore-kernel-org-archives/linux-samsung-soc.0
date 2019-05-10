From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v3] usb: core: verify devicetree nodes for USB devices
Date: Fri, 10 May 2019 03:10:17 +0000
Message-ID: <VI1PR04MB5327AD56CA772284DFE663D08B0C0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <yw1xpnotufti.fsf@mansr.com>
        <CGME20190509084827eucas1p294962744fe70745c50b69a5349b5de68@eucas1p2.samsung.com>
        <20190509084726.5405-1-m.szyprowski@samsung.com> <yw1xlfzfv4ol.fsf@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <yw1xlfzfv4ol.fsf@mansr.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

=20
>=20
> Marek Szyprowski <m.szyprowski@samsung.com> writes:
>=20
> > Commit 69bec7259853 ("USB: core: let USB device know device node")
> > added support for attaching devicetree node for USB devices. The
> > mentioned commit however identifies the given USB device node only by t=
he 'reg'
> > property in the host controller children nodes. The USB device node
> > however also has to have a 'compatible' property as described in
> > Documentation/devicetree/bindings/usb/usb-device.txt. Lack for the
> > 'compatible' property check might result in assigning a devicetree
> > node, which is not intended to be the proper node for the given USB dev=
ice.
> >
> > This is important especially when USB host controller has child-nodes
> > for other purposes. For example, Exynos EHCI and OHCI drivers already
> > define child-nodes for each physical root hub port and assigns
> > respective PHY controller and parameters for them. Those binding
> > predates support for USB devicetree nodes.
> >
> > Checking for the proper compatibility string allows to mitigate the
> > conflict between USB device devicetree nodes and the bindings for USB
> > controllers with child nodes. It also fixes the side-effect of the
> > other commits, like 01fdf179f4b0 ("usb: core: skip interfaces disabled
> > in devicetree"), which incorrectly disables some devices on Exynos
> > based boards.
> >

Hi Marek,

The purpose of your patch is do not set of_node for device under USB contro=
ller, right?
I do not understand how 01fdf179f4b0 affect your boards, some nodes under
the USB controller with status is not "okay", but still want to be enumerat=
ed?

Peter

> > Reported-by: Markus Reichl <m.reichl@fivetechno.de>
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> > v3:
> > - replaced ad hoc checks by proper test for proper value of the
> >   compatible string in drivers/usb/core/of.c
> > v2:
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flkm=
l
> > .org%2Flkml%2F2019%2F5%2F8%2F321&amp;data=3D02%7C01%7Cpeter.chen%
> 40nxp.c
> >
> om%7Cd9336abb14a745fb152508d6d4afdbb5%7C686ea1d3bc2b4c6fa92cd99c5c3
> 016
> >
> 35%7C0%7C0%7C636930249105615889&amp;sdata=3DCIC09rcvf%2FFp5y6oRQtJ
> Hk%2Bb
> > k7QjvJHECpK36LT8ocU%3D&amp;reserved=3D0
> > v1:
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flkm=
l
> > .org%2Flkml%2F2019%2F5%2F7%2F715&amp;data=3D02%7C01%7Cpeter.chen%
> 40nxp.c
> >
> om%7Cd9336abb14a745fb152508d6d4afdbb5%7C686ea1d3bc2b4c6fa92cd99c5c3
> 016
> >
> 35%7C0%7C0%7C636930249105625893&amp;sdata=3DRbbKufAqSKRZpY726zWne
> 9cDhlK0
> > mlkBghhOmkqelY8%3D&amp;reserved=3D0
> > ---
> >  drivers/usb/core/hub.c |  3 +++
> >  drivers/usb/core/of.c  | 31 +++++++++++++++++++++++++++++++
> > include/linux/usb/of.h |  2 ++
> >  3 files changed, 36 insertions(+)
> >
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c index
> > 2f94568ba385..6f2438522d09 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/usb.h>
> >  #include <linux/usbdevice_fs.h>
> >  #include <linux/usb/hcd.h>
> > +#include <linux/usb/of.h>
> >  #include <linux/usb/otg.h>
> >  #include <linux/usb/quirks.h>
> >  #include <linux/workqueue.h>
> > @@ -5023,6 +5024,8 @@ static void hub_port_connect(struct usb_hub *hub,=
 int
> port1, u16 portstatus,
> >  		if (status < 0)
> >  			goto loop;
> >
> > +		usb_of_validate_device_node(udev);
> > +
> >  		if (udev->quirks & USB_QUIRK_DELAY_INIT)
> >  			msleep(2000);
> >
> > diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c index
> > 651708d8c908..2b6f16753edc 100644
> > --- a/drivers/usb/core/of.c
> > +++ b/drivers/usb/core/of.c
> > @@ -30,6 +30,12 @@ struct device_node *usb_of_get_device_node(struct
> usb_device *hub, int port1)
> >  	for_each_child_of_node(hub->dev.of_node, node) {
> >  		if (of_property_read_u32(node, "reg", &reg))
> >  			continue;
> > +		/*
> > +		 * idVendor and idProduct are not yet known, so check only
> > +		 * a presence of the compatible property.
> > +		 */
>=20
> This function could be called from anywhere, so that comment seems a bit
> misplaced.
>=20
> > +		if (!of_find_property(node, "compatible", NULL))
> > +			continue;
>=20
> What if there is a node with a "compatible" property for some entirely di=
fferent
> purpose?  Since that won't be caught, why bother with this test at all?
>=20
> >  		if (reg =3D=3D port1)
> >  			return node;
> > @@ -39,6 +45,31 @@ struct device_node *usb_of_get_device_node(struct
> > usb_device *hub, int port1)  }
> > EXPORT_SYMBOL_GPL(usb_of_get_device_node);
> >
> > +/**
> > + * usb_of_validate_device_node() - validate dt node of the probed USB
> > +device
> > + * @udev: USB device
> > + *
> > + * Validate devicetree node for the USB device. Compatible string
> > +must match
> > + * device's idVendor and idProduct, otherwise the of_node will be put
> > +and set
> > + * to NULL.
> > + */
> > +void usb_of_validate_device_node(struct usb_device *udev) {
> > +	char compatible[13];
> > +
> > +	if (!udev->dev.of_node)
> > +		return;
> > +
> > +	snprintf(compatible, sizeof(compatible), "usb%x,%x",
> > +		 le16_to_cpu(udev->descriptor.idVendor),
> > +		 le16_to_cpu(udev->descriptor.idProduct));
> > +
> > +	if (of_device_is_compatible(udev->dev.of_node, compatible) =3D=3D 0) =
{
> > +		of_node_put(udev->dev.of_node);
> > +		udev->dev.of_node =3D NULL;
> > +	}
> > +}
> > +
> >  /**
> >   * usb_of_has_combined_node() - determine whether a device has a combi=
ned
> node
> >   * @udev: USB device
> > diff --git a/include/linux/usb/of.h b/include/linux/usb/of.h index
> > dba55ccb9b53..9969efda03ad 100644
> > --- a/include/linux/usb/of.h
> > +++ b/include/linux/usb/of.h
> > @@ -24,6 +24,7 @@ bool usb_of_has_combined_node(struct usb_device
> > *udev);  struct device_node *usb_of_get_interface_node(struct usb_devic=
e *udev,
> >  		u8 config, u8 ifnum);
> >  struct device *usb_of_get_companion_dev(struct device *dev);
> > +void usb_of_validate_device_node(struct usb_device *udev);
> >  #else
> >  static inline enum usb_dr_mode
> >  of_usb_get_dr_mode_by_phy(struct device_node *np, int arg0) @@ -57,6
> > +58,7 @@ static inline struct device *usb_of_get_companion_dev(struct
> > device *dev)  {
> >  	return NULL;
> >  }
> > +static inline void usb_of_validate_device_node(struct usb_device
> > +*udev) { }
> >  #endif
> >
> >  #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_USB_SUPPORT)
> > --
> > 2.17.1
> >
>=20
> --
> M=E5ns Rullg=E5rd
