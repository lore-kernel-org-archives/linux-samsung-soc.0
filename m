From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable WiFi-Ex as a module instead
 built-in
Date: Tue, 29 Sep 2015 15:57:52 +0200
Message-ID: <560A98E0.9010606@osg.samsung.com>
References: <1443530546-3066-1-git-send-email-javier@osg.samsung.com>
 <560A9012.2090802@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <560A9012.2090802@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Thierry Reding <treding@nvidia.com>, Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Andreas,

On 09/29/2015 03:20 PM, Andreas F=E4rber wrote:
> Am 29.09.2015 um 14:42 schrieb Javier Martinez Canillas:
>> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/ex=
ynos_defconfig
>> index d4f6063d8a72..5aad617f02c7 100644
>> --- a/arch/arm/configs/exynos_defconfig
>> +++ b/arch/arm/configs/exynos_defconfig
>> @@ -64,8 +64,8 @@ CONFIG_SMSC911X=3Dy
>>  CONFIG_USB_USBNET=3Dy
>>  CONFIG_USB_NET_SMSC75XX=3Dy
>>  CONFIG_USB_NET_SMSC95XX=3Dy
>> -CONFIG_MWIFIEX=3Dy
>> -CONFIG_MWIFIEX_SDIO=3Dy
>> +CONFIG_MWIFIEX=3Dm
>> +CONFIG_MWIFIEX_SDIO=3Dm
>>  CONFIG_INPUT_EVDEV=3Dy
>>  CONFIG_KEYBOARD_GPIO=3Dy
>>  CONFIG_KEYBOARD_CROS_EC=3Dy
>=20
> Makes sense,
>=20
> Reviewed-by: Andreas F=E4rber <afaerber@suse.de>
>=20

Thanks.

> What about multi_v7?
>

Already enables these options as a module.
=20
> Cheers,
> Andreas
>=20

Best regards,
--=20
Javier Martinez Canillas
Open Source Group
Samsung Research America
