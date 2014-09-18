From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 1/2] usb: host: ehci-exynos: Remove unnecessary usb-phy support
Date: Thu, 18 Sep 2014 09:20:20 +0530
Message-ID: <CAFp+6iGVGJKrKZLBAsZG5o+EBCQgQUbayhP4UiQNQf6=SVcibA@mail.gmail.com>
References: <1410952662-4297-2-git-send-email-gautam.vivek@samsung.com>
	<Pine.LNX.4.44L0.1409171051520.1579-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1409171051520.1579-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Alan,


On Wed, Sep 17, 2014 at 8:27 PM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
> On Wed, 17 Sep 2014, Vivek Gautam wrote:
>
>> Now that we have completely moved from older USB-PHY drivers
>> to newer GENERIC-PHY drivers for PHYs available with USB controllers
>> on Exynos series of SoCs, we can remove the support for the same
>> in our host drivers too.
>>
>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> I don't see why you made your changes in this awkward way.  For
> instance...
>
>> @@ -59,49 +54,39 @@ static int exynos_ehci_get_phy(struct device *dev,
>>  {
>>       struct device_node *child;
>>       struct phy *phy;
>> -     int phy_number;
>> -     int ret = 0;
>> +     int phy_num;
>
> Why rename this variable?  Wasn't the original name good enough?

fair enough, don't need to rename the variable.

>
>> +     int ret;
>>
>>       for_each_available_child_of_node(dev->of_node, child) {
>> -             ret = of_property_read_u32(child, "reg", &phy_number);
>> +             ret = of_property_read_u32(child, "reg", &phy_num);
>>               if (ret) {
>>                       dev_err(dev, "Failed to parse device tree\n");
>>                       of_node_put(child);
>>                       return ret;
>>               }
>>
>> -             if (phy_number >= PHY_NUMBER) {
>> +             if (phy_num >= PHY_NUMBER) {
>>                       dev_err(dev, "Invalid number of PHYs\n");
>>                       of_node_put(child);
>>                       return -EINVAL;
>>               }
>>
>> -             phy = devm_of_phy_get(dev, child, NULL);
>> +             exynos_ehci->phy[phy_num] = devm_of_phy_get(dev, child, NULL);
>> +             phy = exynos_ehci->phy[phy_num];
>
> Why make two changes, resulting in more code, when you could have made
> just one change?
>
>                 phy = devm_of_phy_get(dev, child, NULL);
> +               exynos_ehci->phy[phy_num] = phy;

Right. i don't know what state of mind i was in while making these changes.
i should have kept the changes to minimal.

>
> Also, the patch description should mention that you are adding support
> for EPROBE_DEFER.

Sure, will add that description.




-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
