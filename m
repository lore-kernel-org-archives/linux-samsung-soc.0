From: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v7 0/5] usb: phy: samsung: Introducing usb phy driver for
 samsung SoCs
Date: Fri, 9 Nov 2012 17:45:45 +0530
Message-ID: <CAD6zSYNa1WXkUrRa-Ja_RtXMgdRwK=YXoxQRwoEfj8Jaw8oVAQ@mail.gmail.com>
References: <1351573057-22249-1-git-send-email-p.paneri@samsung.com>
	<20121109115440.GC8078@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121109115440.GC8078-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Lukasz Majewski <l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,

On Fri, Nov 9, 2012 at 5:24 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On Tue, Oct 30, 2012 at 10:27:32AM +0530, Praveen Paneri wrote:
>> Changes from v6:
>> Modified register definitions according to the existing ones.
>> Changed default PHY clk selection for SoCs.
>> Improved binding text and rebased to the latest usb-next.
>>
>> Changes from v5:
>> Moved clk_get() to driver's probe function. Now reference clock frequency
>> selection value is stored in samsung_usbphy structure for later use. Used
>> IS_ENABLED() instead of #ifdef in samsung_usbphy_get_driver_data().
>>
>> Changes from v4:
>> Moved header file contents to driver's source file
>> Removed unnecessary print message from driver's probe function
>> Dropped the Free Software Foundation address from the header
>> Changed the platform data code to use __initdata
>>
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
> guys I can't wait any longer. If I don't get proper Acks today, I will
> go ahead without all the PHY changes from Samsung :-s

Can you please ack this patch series.

Thanks,

Praveen
>
> --
> balbi
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
