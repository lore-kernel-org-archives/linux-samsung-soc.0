From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] usb: phy: samsung: Add PHY support for USB 3.0 controller
Date: Tue, 5 Feb 2013 12:06:57 +0530
Message-ID: <CAFp+6iHOT0Ge4KGn_Nw=4N3ipCeSuMQBy4+cRoH4ODR0Ct2cWQ@mail.gmail.com>
References: <1358168377-22919-3-git-send-email-gautam.vivek@samsung.com>
	<1359368782-30224-1-git-send-email-gautam.vivek@samsung.com>
	<077f01cdfeaf$4f7b8780$ee729680$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <077f01cdfeaf$4f7b8780$ee729680$@samsung.com>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,


On Wed, Jan 30, 2013 at 11:31 AM, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Vivek Gautam wrote:
>>
>> Adding PHY driver support for USB 3.0 controller for Samsung's
>> SoCs.
>>
>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>
>> Changes from v3:
>>  - Making SAMSUNG_USB3PHY dependent on SAMSUNG_USBPHY.
>>  - Adding USB_DWC3 to dependencies of SAMSUNG_USB2PHY since
>>    dwc3 controller also looks for USB2 type PHY.
>>
>>  drivers/usb/phy/Kconfig          |   11 +-
>>  drivers/usb/phy/Makefile         |    1 +
>>  drivers/usb/phy/samsung-usb3.c   |  349
>> ++++++++++++++++++++++++++++++++++++++
>>  drivers/usb/phy/samsung-usbphy.h |   81 +++++++++
>>  4 files changed, 441 insertions(+), 1 deletions(-)
>>  create mode 100644 drivers/usb/phy/samsung-usb3.c
>>
>> diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
>> index cc0d230..9325a95 100644
>> --- a/drivers/usb/phy/Kconfig
>> +++ b/drivers/usb/phy/Kconfig
>> @@ -52,14 +52,23 @@ config SAMSUNG_USBPHY
>>       help
>>         Enable this to support Samsung USB phy controllers for Samsung
>>         SoCs.
>> +       Further enable USB 2.0 type PHY or USB 3.0 type PHY as required
>> +       for USB controllers in use.
>>
>>  if SAMSUNG_USBPHY
>>
>>  config SAMSUNG_USB2PHY
>>       bool "Samsung USB 2.0 PHY controller Driver"
>> -     depends on USB_S3C_HSOTG || USB_EHCI_S5P ||
>> USB_OHCI_EXYNOS
>> +     depends on USB_S3C_HSOTG || USB_EHCI_S5P ||
>> USB_OHCI_EXYNOS || USB_DWC3
>>       help
>>         Enable this to support Samsung USB 2.0 (High Speed) phy controller
>>         for Samsung SoCs.
>>
>> +config SAMSUNG_USB3PHY
>> +     bool "Samsung USB 3.0 PHY controller Driver"
>> +     depends on USB_DWC3
>> +     help
>> +       Enable this to support Samsung USB 3.0 (Super Speed) phy
>> controller
>> +       for samsung SoCs.
>> +
>>  endif
>
> It mean, when USB_DWC3 is selected, we can select only one USB2PHY or
> USB3PHY?
>

Actually, DWC3 expects both USB2PHY and USB3PHY, so went this way.
But this seems bad :-(
Will remove these dependencies as suggested by Felipe also.

> [...]
>
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id samsung_usbphy_dt_match[] = {
>> +     {
>> +             .compatible = "samsung,exynos5250-usb3-phy",
>> +             .data = &usb3_phy_exynos5
>> +     },
>> +     {},
>> +};
>> +MODULE_DEVICE_TABLE(of, samsung_usbphy_dt_match);
>> +#endif
>> +
>> +static struct platform_device_id samsung_usbphy_driver_ids[] = {
>> +     {
>> +             .name           = "exynos5250-usb3-phy",
>
> According to the name of file, exynos5250-usb3phy? Just it is imho...
>

Ok, sure will amend this.

>> +             .driver_data    = (unsigned long)&usb3_phy_exynos5,
>> +     },
>> +     {},
>> +};
>> +
>> +MODULE_DEVICE_TABLE(platform, samsung_usbphy_driver_ids);
>> +
>> +static struct platform_driver samsung_usb3_phy_driver = {
>> +     .probe          = samsung_usb3_phy_probe,
>> +     .remove         = samsung_usb3_phy_remove,
>> +     .id_table       = samsung_usbphy_driver_ids,
>> +     .driver         = {
>> +             .name   = "samsung-usb3-phy",
>> +             .owner  = THIS_MODULE,
>> +             .of_match_table =
>> of_match_ptr(samsung_usbphy_dt_match),
>> +     },
>> +};
>> +
>> +module_platform_driver(samsung_usb3_phy_driver);
>> +
>> +MODULE_DESCRIPTION("Samsung USB 3.0 phy controller");
>> +MODULE_AUTHOR("Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:samsung-usb3-phy");
>
> I want you to use same naming rule.
>

Sure.


-- 
Thanks & Regards
Vivek
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
