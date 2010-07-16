From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 3/3] i2c/busses: Select I2C bus support for S5PV210 and
	S5P6440.
Date: Fri, 16 Jul 2010 22:41:29 +0900
Message-ID: <AANLkTikqjZVKDgCIuZ0QCvzrzdrNmGUOq2YZyqb0TKZn@mail.gmail.com>
References: <1279285999-27555-1-git-send-email-kgene.kim@samsung.com>
	<1279285999-27555-4-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:58139 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965397Ab0GPNla convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jul 2010 09:41:30 -0400
In-Reply-To: <1279285999-27555-4-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, Naveen Krishna Ch <ch.naveen@samsung.com>

On Fri, Jul 16, 2010 at 10:13 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> From: Naveen Krishna Ch <ch.naveen@samsung.com>
>
> This patch is to select support I2C channels 0, 1 and 2 for S5PV210 a=
nd S5P6440.
>
> Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0drivers/i2c/busses/Kconfig | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index bceafbf..e553fe8 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -523,7 +523,7 @@ config I2C_PXA_SLAVE
>
> =A0config I2C_S3C2410
> =A0 =A0 =A0 =A0tristate "S3C2410 I2C Driver"
> - =A0 =A0 =A0 depends on ARCH_S3C2410 || ARCH_S3C64XX
> + =A0 =A0 =A0 depends on ARCH_S3C2410 || ARCH_S3C64XX || ARCH_S5PV210=
 || ARCH_S5P6440

Are there any SoCs don't have i2c? If no, how about to just depends on
PLAT_SAMSUNG.

Thank you,
Kyungmin Park
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Say Y here to include support for I2C controller i=
n the
> =A0 =A0 =A0 =A0 =A0Samsung S3C2410 based System-on-Chip devices.
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
