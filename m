From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] usb: ohci-exynos: Add facility to use phy provided by the
 generic phy framework
Date: Wed, 23 Apr 2014 13:07:28 +0530
Message-ID: <CAFp+6iGfsv7tLvaqCp6=BNSX3dtwuSLRGfOMDoFD4zSQHd9m3g@mail.gmail.com>
References: <1397136261-16408-1-git-send-email-gautam.vivek@samsung.com>
	<Pine.LNX.4.44L0.1404221350300.1326-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1404221350300.1326-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Alan,


On Tue, Apr 22, 2014 at 11:28 PM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:

Thanks for reviewing this. Please find my comments inline below.

> On Thu, 10 Apr 2014, Vivek Gautam wrote:
>
>> Add support to consume phy provided by Generic phy framework.
>> Keeping the support for older usb-phy intact right now, in order
>> to prevent any functionality break in absence of relevant
>> device tree side change for ohci-exynos.
>> Once we move to new phy in the device nodes for ohci, we can
>> remove the support for older phys.
>>
>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
>
>> +static int exynos_ohci_phyg_on(struct phy *phy, bool on)
>> +{
>> +     int ret = 0;
>> +
>> +     if (phy) {
>> +             if (on)
>> +                     ret = phy_power_on(phy);
>> +             else
>> +                     ret = phy_power_off(phy);
>> +     }
>> +
>> +     return ret;
>> +}
>
> This would be cleaner if you had separate routines for
> exynos_ohci_phyg_of and exynos_ohci_phyg_off.  For example:
>
> static int exynos_ohci_phyg_on(struct phy *phy)
> {
>         return phy ? phy_power_on(phy) : 0;
> }

Sure, i will make two separate routines here.

>
>> @@ -88,16 +104,49 @@ static int exynos_ohci_probe(struct platform_device *pdev)
>>                                       "samsung,exynos5440-ohci"))
>>               goto skip_phy;
>>
>> -     phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
>> -     if (IS_ERR(phy)) {
>> -             usb_put_hcd(hcd);
>> -             dev_warn(&pdev->dev, "no platform data or transceiver defined\n");
>> -             return -EPROBE_DEFER;
>> +     exynos_ohci->phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
>> +     if (IS_ERR(exynos_ohci->phy)) {
>> +             err = PTR_ERR(exynos_ohci->phy);
>> +             if (err == -ENXIO || err == -ENODEV) {
>> +                     exynos_ohci->phy = NULL;
>> +             } else if (err == -EPROBE_DEFER) {
>> +                     usb_put_hcd(hcd);
>> +                     return err;
>> +             } else {
>> +                     dev_err(&pdev->dev, "no usb2 phy configured\n");
>> +                     usb_put_hcd(hcd);
>> +                     return err;
>> +             }
>
> Instead of all the calls to usb_put_hcd() here and below, just goto
> fail_clk.  Or add a new fail_phy label at the same spot and goto it.

Sure, i can use a new label here.

>
> Otherwise this looks basically okay.

Sure, i will send the next version of this patch after rework.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
