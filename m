From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/4] ARM: SAMSUNG: cleanup of rtc register definitions
Date: Wed, 21 Dec 2011 16:19:53 +0900
Message-ID: <064701ccbfb0$ef40ea60$cdc2bf20$%kim@samsung.com>
References: <201112121543.42299.heiko@sntech.de>
 <201112121545.15211.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62693 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750733Ab1LUHT5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Dec 2011 02:19:57 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWJ00E7BLOP7AI0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Dec 2011 16:19:55 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWJ009YKLP5Y670@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 21 Dec 2011 16:19:55 +0900 (KST)
In-reply-to: <201112121545.15211.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, ben-linux@fluff.org, a.zummo@towertech.it
Cc: rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
>=20
> regs-rtc.h uses a mixture of tabs and spaces and also (x<<y)
> to format bits. So, before adding new stuff clean up the formatting
> and also add spaces to the bit definitions (i.e. (x << y) )
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm/plat-samsung/include/plat/regs-rtc.h |   66
++++++++++++---------
> ----
>  1 files changed, 32 insertions(+), 34 deletions(-)
>=20
> diff --git a/arch/arm/plat-samsung/include/plat/regs-rtc.h
> b/arch/arm/plat-samsung/include/plat/regs-rtc.h
> index 30b7cc1..d9d9bdc 100644
> --- a/arch/arm/plat-samsung/include/plat/regs-rtc.h
> +++ b/arch/arm/plat-samsung/include/plat/regs-rtc.h
> @@ -18,51 +18,49 @@
>  #define S3C2410_INTP_ALM	(1 << 1)
>  #define S3C2410_INTP_TIC	(1 << 0)
>=20
> -#define S3C2410_RTCCON	      S3C2410_RTCREG(0x40)
> -#define S3C2410_RTCCON_RTCEN  (1<<0)
> -#define S3C2410_RTCCON_CLKSEL (1<<1)
> -#define S3C2410_RTCCON_CNTSEL (1<<2)
> -#define S3C2410_RTCCON_CLKRST (1<<3)
> -#define S3C64XX_RTCCON_TICEN  (1<<8)
> +#define S3C2410_RTCCON		S3C2410_RTCREG(0x40)
> +#define S3C2410_RTCCON_RTCEN	(1 << 0)
> +#define S3C2410_RTCCON_CLKSEL	(1 << 1)
> +#define S3C2410_RTCCON_CNTSEL	(1 << 2)
> +#define S3C2410_RTCCON_CLKRST	(1 << 3)
> +#define S3C64XX_RTCCON_TICEN	(1 << 8)
>=20
> -#define S3C64XX_RTCCON_TICMSK (0xF<<7)
> -#define S3C64XX_RTCCON_TICSHT (7)
> +#define S3C64XX_RTCCON_TICMSK	(0xF << 7)
> +#define S3C64XX_RTCCON_TICSHT	(7)
>=20
> -#define S3C2410_TICNT	      S3C2410_RTCREG(0x44)
> -#define S3C2410_TICNT_ENABLE  (1<<7)
> +#define S3C2410_TICNT		S3C2410_RTCREG(0x44)
> +#define S3C2410_TICNT_ENABLE	(1 << 7)
>=20
> -#define S3C2410_RTCALM	      S3C2410_RTCREG(0x50)
> -#define S3C2410_RTCALM_ALMEN  (1<<6)
> -#define S3C2410_RTCALM_YEAREN (1<<5)
> -#define S3C2410_RTCALM_MONEN  (1<<4)
> -#define S3C2410_RTCALM_DAYEN  (1<<3)
> -#define S3C2410_RTCALM_HOUREN (1<<2)
> -#define S3C2410_RTCALM_MINEN  (1<<1)
> -#define S3C2410_RTCALM_SECEN  (1<<0)
> +#define S3C2410_RTCALM		S3C2410_RTCREG(0x50)
> +#define S3C2410_RTCALM_ALMEN	(1 << 6)
> +#define S3C2410_RTCALM_YEAREN	(1 << 5)
> +#define S3C2410_RTCALM_MONEN	(1 << 4)
> +#define S3C2410_RTCALM_DAYEN	(1 << 3)
> +#define S3C2410_RTCALM_HOUREN	(1 << 2)
> +#define S3C2410_RTCALM_MINEN	(1 << 1)
> +#define S3C2410_RTCALM_SECEN	(1 << 0)
>=20
>  #define S3C2410_RTCALM_ALL \
>    S3C2410_RTCALM_ALMEN | S3C2410_RTCALM_YEAREN | S3C2410_RTCALM_MONE=
N |\
>    S3C2410_RTCALM_DAYEN | S3C2410_RTCALM_HOUREN | S3C2410_RTCALM_MINE=
N |\
>    S3C2410_RTCALM_SECEN
>=20
> +#define S3C2410_ALMSEC		S3C2410_RTCREG(0x54)
> +#define S3C2410_ALMMIN		S3C2410_RTCREG(0x58)
> +#define S3C2410_ALMHOUR		S3C2410_RTCREG(0x5c)
>=20
> -#define S3C2410_ALMSEC	      S3C2410_RTCREG(0x54)
> -#define S3C2410_ALMMIN	      S3C2410_RTCREG(0x58)
> -#define S3C2410_ALMHOUR	      S3C2410_RTCREG(0x5c)
> +#define S3C2410_ALMDATE		S3C2410_RTCREG(0x60)
> +#define S3C2410_ALMMON		S3C2410_RTCREG(0x64)
> +#define S3C2410_ALMYEAR		S3C2410_RTCREG(0x68)
>=20
> -#define S3C2410_ALMDATE	      S3C2410_RTCREG(0x60)
> -#define S3C2410_ALMMON	      S3C2410_RTCREG(0x64)
> -#define S3C2410_ALMYEAR	      S3C2410_RTCREG(0x68)
> -
> -#define S3C2410_RTCRST	      S3C2410_RTCREG(0x6c)
> -
> -#define S3C2410_RTCSEC	      S3C2410_RTCREG(0x70)
> -#define S3C2410_RTCMIN	      S3C2410_RTCREG(0x74)
> -#define S3C2410_RTCHOUR	      S3C2410_RTCREG(0x78)
> -#define S3C2410_RTCDATE	      S3C2410_RTCREG(0x7c)
> -#define S3C2410_RTCDAY	      S3C2410_RTCREG(0x80)
> -#define S3C2410_RTCMON	      S3C2410_RTCREG(0x84)
> -#define S3C2410_RTCYEAR	      S3C2410_RTCREG(0x88)
> +#define S3C2410_RTCRST		S3C2410_RTCREG(0x6c)
>=20
> +#define S3C2410_RTCSEC		S3C2410_RTCREG(0x70)
> +#define S3C2410_RTCMIN		S3C2410_RTCREG(0x74)
> +#define S3C2410_RTCHOUR		S3C2410_RTCREG(0x78)
> +#define S3C2410_RTCDATE		S3C2410_RTCREG(0x7c)
> +#define S3C2410_RTCDAY		S3C2410_RTCREG(0x80)
> +#define S3C2410_RTCMON		S3C2410_RTCREG(0x84)
> +#define S3C2410_RTCYEAR		S3C2410_RTCREG(0x88)
>=20
>  #endif /* __ASM_ARCH_REGS_RTC_H */
> --
> 1.7.5.4

Looks good to me, but how about cleanup useless definitions together li=
ke
following?

Actually, S3C2410_RTCCON_CLKSEL, S3C64XX_RTCCON_TICMSK,
S3C64XX_RTCCON_TICSHT, S3C2410_RTCALM_ALL, S3C2410_RTCRST and S3C2410_R=
TCDAY
are not used.

And I'm not sure we really need to define the S3C2410_RTCREG(x), but th=
is
can be sorted out next time with similar others.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
