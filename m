From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 1/3] ARM: SAMSUNG: Change the 3rd HSMMC interrupt name for compatibility
Date: Sun, 22 Aug 2010 12:33:44 +0900
Message-ID: <AANLkTikTdABkHC_uKC1HDMQi5HZ8vrB4BOXnKD6BFU12@mail.gmail.com>
References: <1282307628-5254-1-git-send-email-kgene.kim@samsung.com>
	<1282307628-5254-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:64958 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751816Ab0HVDdp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Aug 2010 23:33:45 -0400
Received: by wwb24 with SMTP id 24so360481wwb.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Aug 2010 20:33:44 -0700 (PDT)
In-Reply-To: <1282307628-5254-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

On Fri, Aug 20, 2010 at 9:33 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> This patch changes the 3rd HSMMC interrupt name for compatibility
> from IRQ_MMC to IRQ_HSMMC3.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-s5pv210/include/mach/irqs.h | =A0 =A02 +-
> =A0arch/arm/mach-s5pv310/include/mach/irqs.h | =A0 =A05 +++++
> =A0arch/arm/plat-samsung/dev-hsmmc3.c =A0 =A0 =A0 =A0| =A0 =A04 ++--
> =A03 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/mac=
h-s5pv210/include/mach/irqs.h
> index e1c020e..cdb8ae4 100644
> --- a/arch/arm/mach-s5pv210/include/mach/irqs.h
> +++ b/arch/arm/mach-s5pv210/include/mach/irqs.h
> @@ -109,7 +109,7 @@
>
> =A0#define IRQ_IPC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P=
_IRQ_VIC3(0)
> =A0#define IRQ_HOSTIF =A0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC3(1)
> -#define IRQ_MMC3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC3(2)
> +#define IRQ_HSMMC3 =A0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC3(2)
> =A0#define IRQ_CEC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P=
_IRQ_VIC3(3)
> =A0#define IRQ_TSI =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P=
_IRQ_VIC3(4)
> =A0#define IRQ_MDNIE0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC3(5)
> diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/mac=
h-s5pv310/include/mach/irqs.h
> index 4cdedda..522352f 100644
> --- a/arch/arm/mach-s5pv310/include/mach/irqs.h
> +++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
> @@ -68,6 +68,11 @@
>
> =A0#define IRQ_IIC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0COM=
BINER_IRQ(27, 0)
>
> +#define IRQ_HSMMC0 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 0)
> +#define IRQ_HSMMC1 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 1)
> +#define IRQ_HSMMC2 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 2)
> +#define IRQ_HSMMC3 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 3)
> +
> =A0/* Set the default NR_IRQS */
>
> =A0#define NR_IRQS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0COM=
BINER_IRQ(MAX_COMBINER_NR, 0)
> diff --git a/arch/arm/plat-samsung/dev-hsmmc3.c b/arch/arm/plat-samsu=
ng/dev-hsmmc3.c
> index 85aaf0f..335bc35 100644
> --- a/arch/arm/plat-samsung/dev-hsmmc3.c
> +++ b/arch/arm/plat-samsung/dev-hsmmc3.c
> @@ -33,8 +33,8 @@ static struct resource s3c_hsmmc3_resource[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.flags =A0=3D IORESOURCE_MEM,
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0[1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_MMC3,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_MMC3,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_HSMMC3,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_HSMMC3,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.flags =A0=3D IORESOURCE_IRQ,
> =A0 =A0 =A0 =A0}
> =A0};
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
