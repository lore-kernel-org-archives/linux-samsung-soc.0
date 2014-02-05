From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v6 8/8] usb: ehci-exynos: Change to use phy provided by
 the generic phy framework
Date: Wed, 5 Feb 2014 09:30:35 -0800
Message-ID: <CAOesGMgKVe=zBGeZnTh3jY41KS88gVVDSLFZcRPS88F3-kEMBQ@mail.gmail.com>
References: <1391016574-25237-1-git-send-email-k.debski@samsung.com>
	<1391016574-25237-9-git-send-email-k.debski@samsung.com>
	<CAOesGMgKQrW=Rb6ZtpOVKAZ6dDzy82CzbmOJtKRb8x6JaS1QLg@mail.gmail.com>
	<054501cf228a$f45c61c0$dd152540$%debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <054501cf228a$f45c61c0$dd152540$%debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mateusz Krawczuk <mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, tjakobi-o02PS0xoJP9W0yFyLvAVXMxlOr/tl8fh@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Feb 5, 2014 at 7:57 AM, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Hi Olof,
>
> Thank you for your review.
>
>> From: Olof Johansson [mailto:olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org]
>> Sent: Wednesday, January 29, 2014 9:55 PM
>>
>> Hi,
>>
>> On Wed, Jan 29, 2014 at 9:29 AM, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> wrote:
>> > Change the phy provider used from the old one using the USB phy
>> > framework to a new one using the Generic phy framework.
>> >
>> > Signed-off-by: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> > ---
>> >  .../devicetree/bindings/usb/exynos-usb.txt         |   13 +++
>> >  drivers/usb/host/ehci-exynos.c                     |   97
>> +++++++++++++-------
>> >  2 files changed, 76 insertions(+), 34 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt
>> > b/Documentation/devicetree/bindings/usb/exynos-usb.txt
>> > index d967ba1..25e199a 100644
>> > --- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
>> > +++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
>> > @@ -12,6 +12,10 @@ Required properties:
>> >   - interrupts: interrupt number to the cpu.
>> >   - clocks: from common clock binding: handle to usb clock.
>> >   - clock-names: from common clock binding: Shall be "usbhost".
>> > +  - port: if in the SoC there are EHCI phys, they should be listed
>> here.
>> > +One phy per port. Each port should have its reg entry with a
>> > +consecutive number. Also it should contain phys and phy-names
>> entries
>> > +specifying the phy used by the port.
>> >
>> >  Optional properties:
>> >   - samsung,vbus-gpio:  if present, specifies the GPIO that @@ -27,6
>> > +31,15 @@ Example:
>> >
>> >                 clocks = <&clock 285>;
>> >                 clock-names = "usbhost";
>> > +
>> > +               #address-cells = <1>;
>> > +               #size-cells = <0>;
>> > +               port@0 {
>> > +                   reg = <0>;
>> > +                   phys = <&usb2phy 1>;
>> > +                   phy-names = "host";
>> > +                   status = "disabled";
>> > +               };
>> >         };
>> >
>> >  OHCI
>>
>> [...]
>>
>> > @@ -102,14 +132,26 @@ static int exynos_ehci_probe(struct
>> platform_device *pdev)
>> >                                         "samsung,exynos5440-ehci"))
>> >                 goto skip_phy;
>> >
>> > -       phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
>> > -       if (IS_ERR(phy)) {
>> > -               usb_put_hcd(hcd);
>> > -               dev_warn(&pdev->dev, "no platform data or transceiver
>> defined\n");
>> > -               return -EPROBE_DEFER;
>> > -       } else {
>> > -               exynos_ehci->phy = phy;
>> > -               exynos_ehci->otg = phy->otg;
>> > +       for_each_available_child_of_node(pdev->dev.of_node, child) {
>> > +               err = of_property_read_u32(child, "reg",
>> &phy_number);
>> > +               if (err) {
>> > +                       dev_err(&pdev->dev, "Failed to parse device
>> tree\n");
>> > +                       of_node_put(child);
>> > +                       return err;
>> > +               }
>> > +               if (phy_number >= PHY_NUMBER) {
>> > +                       dev_err(&pdev->dev, "Failed to parse device
>> tree - number out of range\n");
>> > +                       of_node_put(child);
>> > +                       return -EINVAL;
>> > +               }
>> > +               phy = devm_of_phy_get(&pdev->dev, child, 0);
>> > +               of_node_put(child);
>> > +               if (IS_ERR(phy)) {
>> > +                       dev_err(&pdev->dev, "Failed to get phy number
>> %d",
>> > +
>> phy_number);
>> > +                       return PTR_ERR(phy);
>> > +               }
>> > +               exynos_ehci->phy[phy_number] = phy;
>>
>> this looks like it is now breaking older device trees, where ports
>> might not be described. Since device tree interfaces need to be
>> backwards compatible, you still need to handle the old case of not
>> having ports described.
>>
>> There are two ways of doing this:
>>
>> 1. Fall back to the old behavior if there are no ports 2. Use a new
>> compatible value for the new model with port subnodes, and if the old
>> compatible value is used, then fall back to the old behavior.
>>
>> I'm guessing (1) might be easiest since you can check for the presence
>> of #address-cells to tell if this is just an old style node, or if it's
>> a new-style node without any ports below it.
>
> The ultimate goal is to remove the old phy driver. Unfortunately
> this has to be synced with the new USB3 phy driver by Vivek Gautam. I think
> he
> is also close to completion. What about this case? In the end the old driver
> will be removed and no longer be supported. Having backward compatibility in
> mind, it is possible to have the old and the new phy driver together in one
> kernel release. But do we want to have two drivers doing the same thing at
> the same time?

It is mostly irrelevant if there is a new driver or not -- the old
device tree has to keep working. In this case it would mean that the
new driver needs to work with older device trees as well, or people
will see functionality regressing.

The device tree is a description of the hardware, not an extension of
the driver.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
