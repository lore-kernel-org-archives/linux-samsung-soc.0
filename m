From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 2/3] ARM: S5P: Add initial map for GPIO2 and GPIO3
Date: Sun, 22 Aug 2010 12:33:02 +0900
Message-ID: <AANLkTimBMaVaZTEXG2HDYf1F98kYnRfWDn_BnT=pL85U@mail.gmail.com>
References: <1282307628-5254-1-git-send-email-kgene.kim@samsung.com>
	<1282307628-5254-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:38880 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751816Ab0HVDdF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Aug 2010 23:33:05 -0400
Received: by wwf26 with SMTP id 26so2663880wwf.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Aug 2010 20:33:03 -0700 (PDT)
In-Reply-To: <1282307628-5254-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Jongpill Lee <boyko.lee@samsung.com>

NAK.

This approach don't make a common GPIO framework. I already send the
common GPIO framework which send the base address to GPIO framework
and handle it regradless GPIO is one or three.

http://lists.infradead.org/pipermail/linux-arm-kernel/2010-August/02251=
3.html

With this patch, we can use the common GPIO framework and remove the
VA_GPIO dependency.

Thank you,
Kyungmin Park

On Fri, Aug 20, 2010 at 9:33 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> From: Jongpill Lee <boyko.lee@samsung.com>
>
> This patch adds initial map for GPIO2 and GPIO3.
> S5PV310/S5PC210 has separated GPIO1, GPIO2 and GPIO3.
>
> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-s5pv310/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 10 ++=
++++++++
> =A0arch/arm/plat-s5p/include/plat/map-s5p.h | =A0 =A02 ++
> =A02 files changed, 12 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv310/cpu.c b/arch/arm/mach-s5pv310/cpu.=
c
> index 196c9f1..db4f55a 100644
> --- a/arch/arm/mach-s5pv310/cpu.c
> +++ b/arch/arm/mach-s5pv310/cpu.c
> @@ -45,6 +45,16 @@ static struct map_desc s5pv310_iodesc[] __initdata=
 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(S5PV310_PA_L2CC),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_4K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_GPIO2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PV310_PA_GPIO2),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_GPIO3,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PV310_PA_GPIO3),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_256K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> =A0 =A0 =A0 =A0},
> =A0};
>
> diff --git a/arch/arm/plat-s5p/include/plat/map-s5p.h b/arch/arm/plat=
-s5p/include/plat/map-s5p.h
> index 54e9fb9..bc52595 100644
> --- a/arch/arm/plat-s5p/include/plat/map-s5p.h
> +++ b/arch/arm/plat-s5p/include/plat/map-s5p.h
> @@ -15,6 +15,8 @@
>
> =A0#define S5P_VA_CHIPID =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x00700000)
> =A0#define S5P_VA_GPIO =A0 =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x00500000)
> +#define S5P_VA_GPIO2 =A0 =A0 =A0 =A0 =A0 S3C_ADDR(0x00510000)
> +#define S5P_VA_GPIO3 =A0 =A0 =A0 =A0 =A0 S3C_ADDR(0x00520000)
> =A0#define S5P_VA_SYSTIMER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x=
01200000)
> =A0#define S5P_VA_SROMC =A0 =A0 =A0 =A0 =A0 S3C_ADDR(0x01100000)
>
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
