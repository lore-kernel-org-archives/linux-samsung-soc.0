From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3 07/12] ARM: EXYNOS: add interrupt definitions for EXYNOS5250
Date: Wed, 14 Mar 2012 10:57:32 +0530
Message-ID: <CAJuYYwTFEV06C+gWEoXDtKoqhujA8HphNuLLJs3EBzaKnTvcfQ@mail.gmail.com>
References: <1331652643-12626-1-git-send-email-kgene.kim@samsung.com>
	<1331652643-12626-8-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:44478 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755141Ab2CNF1d convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Mar 2012 01:27:33 -0400
Received: by vcqp1 with SMTP id p1so1512662vcq.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Mar 2012 22:27:32 -0700 (PDT)
In-Reply-To: <1331652643-12626-8-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, olof@lixom.net

On 13 March 2012 21:00, Kukjin Kim <kgene.kim@samsung.com> wrote:
> ARM: EXYNOS: irqs.h for exynos4 and exynos5 - WIP
> This patch adds the interrupt definitions for EXYNOS5250 at
> <mach/irqs.h> file. Basically, now it is needed for EXYNOS5250
> interrupt and will be updated for single zImage next time.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-exynos/common.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 97 ++++=
--
> =A0arch/arm/mach-exynos/dev-ahci.c =A0 =A0 =A0 =A0 =A0| =A0 =A04 +-
> =A0arch/arm/mach-exynos/dev-audio.c =A0 =A0 =A0 =A0 | =A0 =A04 +-
> =A0arch/arm/mach-exynos/include/mach/irqs.h | =A0580 ++++++++++++++++=
++++++--------
> =A0arch/arm/mach-exynos/mct.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 23 +-
> =A0arch/arm/plat-s5p/irq-pm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 25 +-
> =A0arch/arm/plat-samsung/irq-vic-timer.c =A0 =A0| =A0 16 +
> =A07 files changed, 548 insertions(+), 201 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/com=
mon.c
> index 7fdb139..0b53018 100644
> --- a/arch/arm/mach-exynos/common.c


[...]

> =A0 =A0 =A0 =A0for (irq =3D 0 ; irq <=3D 15 ; irq++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0eint0_15_data[irq] =3D IRQ_EINT(irq);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_set_handler_data(exynos4_get_irq_nr=
(irq),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0&eint0_15_data[irq]);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_set_chained_handler(exynos4_get_irq=
_nr(irq),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (soc_is_exynos5250()) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_set_handler_data(ex=
ynos4_eint0_15_src_int[irq],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0&eint0_15_data[irq]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_set_chained_handler=
(exynos4_eint0_15_src_int[irq],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_irq_eint0_15);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_set_handler_data(ex=
ynos5_eint0_15_src_int[irq],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0&eint0_15_data[irq]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_set_chained_handler=
(exynos5_eint0_15_src_int[irq],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0exynos4_irq_eint0_15);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0}

The external interrupt numbers for Exynos4 and Exynos5 have been
swapped. This needs to be fixed.

Thanks,
Thomas.
