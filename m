From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 3/4] USB: ehci-s5p: Add phy driver support
Date: Thu, 20 Dec 2012 09:51:53 -0800
Message-ID: <CAD=FV=XsqZGxhcFzFfHnFxYyT2P+HVBWP9fn6LfRAwPfb06QrA@mail.gmail.com>
References: <1355841786-13307-1-git-send-email-gautam.vivek@samsung.com>
	<1355841786-13307-4-git-send-email-gautam.vivek@samsung.com>
	<CAD=FV=WLVpwBo1g41BYwMUdedN3MJcmfaWwYow=RfsLC5bX1jg@mail.gmail.com>
	<CAFp+6iGe3Hz6OiVNDa=8c98CyNGaELfg-uRbCO0kFdpdv_gQpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFp+6iGe3Hz6OiVNDa=8c98CyNGaELfg-uRbCO0kFdpdv_gQpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Dec 19, 2012 at 10:37 PM, Vivek Gautam
<gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Thu, Dec 20, 2012 at 5:00 AM, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>
>> On Tue, Dec 18, 2012 at 6:43 AM, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>> +static void s5p_ehci_phy_enable(struct s5p_ehci_hcd *s5p_ehci)
>>> +{
>>> +       struct platform_device *pdev = to_platform_device(s5p_ehci->dev);
>>> +
>>> +       if (s5p_ehci->phy) {
>>> +               samsung_usbphy_set_type(s5p_ehci->phy, USB_PHY_TYPE_HOST);
>>
>> This confuses me.  Why are you setting the type to host here?
>>
> Being in host controller, before calling usb_phy_init() we set type to
> Host since, with certain SOCs
> like 4210, same register has different bit settings for HOST type and
> device type. So setting this
> to Host type here make the flow of usb_phy_init to go in the direction of Host.

OK.  I think I need to study the code more...

>>>
>>> +       phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
>>> +       if (IS_ERR_OR_NULL(phy)) {
>>> +               /* Fallback to pdata */
>>> +               if (!pdata) {
>>> +                       dev_err(&pdev->dev, "no platform data or transceiver defined\n");
>>> +                       return -EPROBE_DEFER;
>>
>> Shouldn't you return -EINVAL like the old code did?
>
> We are deferring the probe since the usb-phy transceiver may get
> probed after ehci/ohci controllers.
> And if we return -EINVAL like the previous code, we would end up not
> setting the phy.

OK.  Something is wrong here then, since this really isn't an error:
* It should be commented about why you're deferring.
* You shouldn't have a dev_err for something that's not fatal.

Ideally we'd want something that would force probing to happen in the
right order.  I spent a little time looking and didn't see anything,
but maybe I'm missing something obvious.  If nothing pops out, the
defer seems OK as long as it is commented well.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
