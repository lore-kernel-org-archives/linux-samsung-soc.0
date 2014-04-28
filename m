From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] usb: ohci-exynos: Add facility to use phy provided
 by the generic phy framework
Date: Mon, 28 Apr 2014 09:36:12 +0530
Message-ID: <CAFp+6iG2s5Ddj2F2Xfy3fm9VyW7_G-+YDpeL3iVhur3gng7KvA@mail.gmail.com>
References: <1398424683-20168-2-git-send-email-gautam.vivek@samsung.com>
	<Pine.LNX.4.44L0.1404251031260.1140-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1404251031260.1140-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,


On Fri, Apr 25, 2014 at 8:06 PM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
> On Fri, 25 Apr 2014, Vivek Gautam wrote:
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
>
>> +static int exynos_ohci_phyg_on(struct phy *phy[])
>> +{
>> +     int i;
>> +     int ret = 0;
>> +
>> +     for (i = 0; ret == 0 && i < PHY_NUMBER; i++)
>> +             if (phy[i])
>> +                     ret = phy_power_on(phy[i]);
>> +     if (ret)
>> +             for (i--; i >= 0; i--)
>> +                     if (phy[i])
>> +                             phy_power_off(phy[i]);
>> +
>> +     return ret;
>> +}
>> +
>> +static int exynos_ohci_phyg_off(struct phy *phy[])
>> +{
>> +     int i;
>> +     int ret = 0;
>> +
>> +     for (i = 0; ret == 0 && i < PHY_NUMBER; i++)
>> +             if (phy[i])
>> +                     ret = phy_power_off(phy[i]);
>> +
>> +     return ret;
>> +}
>
> You probably shouldn't break out of this loop if ret is nonzero; you
> should continue to power off the remaining phys.

ok, will remove the 'ret' check in for loop.

>
> I'd be inclined to put these two routines directly into
> exynos_ohci_phy_enable() and exynos_ohci_phy_disable(), since they
> aren't used anywhere else.

Sure, will make these routines as a part of exynos_ohci_phy_enable()
and exynos_ohci_phy_disable().

>
>> @@ -151,6 +253,7 @@ skip_phy:
>>
>>  fail_add_hcd:
>>       exynos_ohci_phy_disable(pdev);
>> +     exynos_ohci_phyg_off(exynos_ohci->phy_g);
>
> Why did you add this line?  It doesn't do anything useful, because
> exynos_ohci_phy_disable() already calls exynos_ohci_phyg_off().

Ah ! my bad, will remove this.


-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
