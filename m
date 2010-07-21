From: Kyungmin Park <kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v2 3/3] i2c/busses: Select I2C bus support for S5PV210 and
	S5P6440.
Date: Wed, 21 Jul 2010 22:41:18 +0900
Message-ID: <AANLkTilygLmO9n0oconz73C6Bjtsgbh0cbfnJ1zU9YMb@mail.gmail.com>
References: <1279717167-24456-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1279717167-24456-1-git-send-email-kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, Naveen Krishna Ch <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

I don't want to modify Kconfig anymore. it's simple to modify driver it=
self.

Think the usage of I2c. I think there's no case don't use it.

At this time modify Kconfig once, and just fix the driver if new SoCs
are arrives.
Of course we can modify Kconfig one more, If there's really new IPs of
I2C are created. but I expect we also need to define new PLAT_SAMSUNG2

Thank you,
Kyungmin Park

On Wed, Jul 21, 2010 at 9:59 PM, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wro=
te:
> From: Naveen Krishna Ch <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> This patch is to select support I2C channels 0, 1 and 2 for S5PV210 a=
nd S5P6440.
>
> Signed-off-by: Naveen Krishna Ch <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Changes since v1:
> - Modifed the Kconfig help comments.
>
> =A0drivers/i2c/busses/Kconfig | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index bceafbf..27c96ec 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -523,10 +523,10 @@ config I2C_PXA_SLAVE
>
> =A0config I2C_S3C2410
> =A0 =A0 =A0 =A0tristate "S3C2410 I2C Driver"
> - =A0 =A0 =A0 depends on ARCH_S3C2410 || ARCH_S3C64XX
> + =A0 =A0 =A0 depends on ARCH_S3C2410 || ARCH_S3C64XX || ARCH_S5P6440=
 || ARCH_S5PV210
> =A0 =A0 =A0 =A0help
> - =A0 =A0 =A0 =A0 Say Y here to include support for I2C controller in=
 the
> - =A0 =A0 =A0 =A0 Samsung S3C2410 based System-on-Chip devices.
> + =A0 =A0 =A0 =A0 Say Y here to include support for I2C controller in=
 the Samsung
> + =A0 =A0 =A0 =A0 S3C2410, S3C64XX, S5P6440 and S5PV210 based System-=
on-Chip devices.
>
> =A0config I2C_S6000
> =A0 =A0 =A0 =A0tristate "S6000 I2C support"
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
