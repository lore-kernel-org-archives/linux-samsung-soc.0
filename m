From: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 1/5] usb: phy: samsung: Introducing usb phy driver for hsotg
Date: Tue, 7 Aug 2012 15:35:43 +0530
Message-ID: <CAD6zSYMnBAQuoH3N2HtSKfnbhRg6c3Ac27kf=fRQY++_+12d5A@mail.gmail.com>
References: <1344324524-2286-1-git-send-email-p.paneri@samsung.com>
	<1344324524-2286-2-git-send-email-p.paneri@samsung.com>
	<201208071011.23558.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201208071011.23558.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Aug 7, 2012 at 1:41 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote=
:
> Am Dienstag, 7. August 2012, 09:28:40 schrieb Praveen Paneri:
>> This driver uses usb_phy interface to interact with s3c-hsotg. Suppo=
rts
>> phy_init and phy_shutdown functions to enable/disable phy. Tested wi=
th
>> smdk6410 and smdkv310. More SoCs can be brought under later.
>>
>> Signed-off-by: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  .../devicetree/bindings/usb/samsung-usbphy.txt     |    9 +
>>  drivers/usb/phy/Kconfig                            |    8 +
>>  drivers/usb/phy/Makefile                           |    1 +
>>  drivers/usb/phy/samsung_usbphy.c                   |  355
>> ++++++++++++++++++++ drivers/usb/phy/samsung_usbphy.h               =
    |
>>  48 +++
>>  include/linux/platform_data/s3c-hsotg.h            |    5 +
>>  6 files changed, 426 insertions(+), 0 deletions(-)
>>  create mode 100644
>> Documentation/devicetree/bindings/usb/samsung-usbphy.txt create mode
>> 100644 drivers/usb/phy/samsung_usbphy.c
>>  create mode 100644 drivers/usb/phy/samsung_usbphy.h
>>
>
> [...]
>
>> diff --git a/include/linux/platform_data/s3c-hsotg.h
>> b/include/linux/platform_data/s3c-hsotg.h index 8b79e09..25ed31e 100=
644
>> --- a/include/linux/platform_data/s3c-hsotg.h
>> +++ b/include/linux/platform_data/s3c-hsotg.h
>> @@ -35,6 +35,11 @@ struct s3c_hsotg_plat {
>>       int (*phy_exit)(struct platform_device *pdev, int type);
>>  };
>>
>> +struct s3c_usbphy_plat {
>> +     void (*pmu_isolation)(int on);
>> +};
>> +
>>  extern void s3c_hsotg_set_platdata(struct s3c_hsotg_plat *pd);
>> +extern void s3c_usbphy_set_platdata(struct s3c_usbphy_plat *pd);
>>
>>  #endif /* __LINUX_USB_S3C_HSOTG_H */
>
> hmm, I'm not completely sure about this being in the s3c-hsotg header=
, as on
> s3c2443/2416/2450 it's the s3c-hsudc that will be (hopefully) using t=
he phy in
> the future.
Okay then I will make a new header file for this. Not only hsudc, we
intent to use it for usb host phy as well so it's a valid point.

Praveen
>
>
> Heiko
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
