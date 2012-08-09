From: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 1/5] usb: phy: samsung: Introducing usb phy driver for hsotg
Date: Thu, 9 Aug 2012 15:26:48 +0530
Message-ID: <CAD6zSYO4b6FXAdAKBnz1xU1TW3=rtqLdnD+X7-K8jxFVTaPtuA@mail.gmail.com>
References: <1344411661-17821-1-git-send-email-p.paneri@samsung.com>
	<1344411661-17821-2-git-send-email-p.paneri@samsung.com>
	<20120809092853.GJ12174@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120809092853.GJ12174-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Aug 9, 2012 at 2:58 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> On Wed, Aug 08, 2012 at 01:10:57PM +0530, Praveen Paneri wrote:
>> +static int __init samsung_usbphy_driver_init(void)
>> +{
>> +     return platform_driver_register(&samsung_usbphy_driver);
>> +}
>> +subsys_initcall(samsung_usbphy_driver_init);
>
> let's make use of the module_platform_driver() and have dependent
> drivers return -EPROBE_DEFER until this has registered.
Thanks! I will modify accordingly and resend.

Praveen
>
> --
> balbi
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
