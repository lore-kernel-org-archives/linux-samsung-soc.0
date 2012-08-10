From: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 0/5] usb: phy: samsung: Introducing usb phy driver for
 samsung SoCs
Date: Fri, 10 Aug 2012 13:04:48 +0530
Message-ID: <CAD6zSYPT_K9bTP=8k-Q+5N-yAVjDx86Haay27OLuPsqz38pczA@mail.gmail.com>
References: <1344582631-13658-1-git-send-email-p.paneri@samsung.com>
	<20120810070623.GL1689@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120810070623.GL1689-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Aug 10, 2012 at 12:36 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> On Fri, Aug 10, 2012 at 12:40:26PM +0530, Praveen Paneri wrote:
>> Changes from v3:
>> Replaced susbsys_initcall()/module_exit() by module_platform_driver().
>> Accordingly in the hsotg driver returned -EPROBE_DEFER until phy driver
>> is registered
>> Removed unnecessary devm_usb_put_phy() call from the hsotg driver remove.
>>
>> Changes from v2:
>> Changed the driver filenames to samsung-usbphy
>> Changed 's3c' to 'samsung' for platform device as well as platform data
>> Moved platform data structure to a separate file
>> Rectified coding style related errors
>>
>> Changes from v1:
>> Rebased patches to latest usb-next branch
>> Changed the name 'sec_usbphy' to 'samsung_usbphy'
>>
>> This patch set introduces a phy driver for samsung SoCs. It uses the existing
>> transceiver infrastructure to provide phy control functions. Use of this driver
>> can be extended for usb host phy as well. Over the period of time all the phy
>> related code for most of the samsung SoCs can be integrated here.
>> Removing the existing phy code from mach-s3c64xx. Same can be done for other SoCs
>> when they start supporting this phy driver.
>> This driver is tested with smdk6410 and Exynos4210(with DT).
>>
>> Praveen Paneri (5):
>>   usb: phy: samsung: Introducing usb phy driver for hsotg
>>   usb: s3c-hsotg: Adding phy driver support
>>   ARM: S3C64XX: Removing old phy setup code
>>   ARM: S3C64XX: Enabling samsung-usbphy driver
>>   ARM: Exynos4210: Enabling samsung-usbphy driver
>
> just one idea. It looks like after introducing the PHY, you converted
> all users to create the phy device. I wonder if you should have a
Not all
> patch 6/6 which will remove pdata->init support from s3c_hsotg.c and
> stick to using phy driver.
This will make the hsotg driver unusable for others (in mach-s5pv210
and mach-exynos) which are not supported in the phy driver as of now.
My idea was to drop the pdata->init when the last user gets the phy
support. Need some time for that :-)

Praveen
>
> --
> balbi
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
