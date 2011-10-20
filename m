From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: Samsung: gpio-interrupts: fix offset calculation
Date: Thu, 20 Oct 2011 23:34:00 +0900
Message-ID: <CAH9JG2WtKi7PA3VHAx+4LEZio56c_PO-1-yAMw6DPm58fv-dUg@mail.gmail.com>
References: <1318932982-15745-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:46867 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932115Ab1JTOeC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Oct 2011 10:34:02 -0400
Received: by qabj40 with SMTP id j40so2184091qab.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Oct 2011 07:34:01 -0700 (PDT)
In-Reply-To: <1318932982-15745-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>

Hi Kukjin and Arnd,

If there's chance to merge for 3.1 bugfix. It's required to run 2nd
GPIO banks for exynos4210.
and it should be applied for stable tree also.

Thank you,
Kyungmin Park

On Tue, Oct 18, 2011 at 7:16 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Offsets of the irq controller registers were calculated correctly onl=
y
> for first GPIO bank. This patch fixes calculation of the register
> offsets for all GPIO banks.
>
> Reported-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> =A0arch/arm/plat-s5p/irq-gpioint.c | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/plat-s5p/irq-gpioint.c b/arch/arm/plat-s5p/irq-=
gpioint.c
> index a566523..1fdfaa4 100644
> --- a/arch/arm/plat-s5p/irq-gpioint.c
> +++ b/arch/arm/plat-s5p/irq-gpioint.c
> @@ -163,9 +163,9 @@ static __init int s5p_gpioint_add(struct samsung_=
gpio_chip *chip)
> =A0 =A0 =A0 =A0ct->chip.irq_mask =3D irq_gc_mask_set_bit;
> =A0 =A0 =A0 =A0ct->chip.irq_unmask =3D irq_gc_mask_clr_bit;
> =A0 =A0 =A0 =A0ct->chip.irq_set_type =3D s5p_gpioint_set_type,
> - =A0 =A0 =A0 ct->regs.ack =3D PEND_OFFSET + REG_OFFSET(chip->group);
> - =A0 =A0 =A0 ct->regs.mask =3D MASK_OFFSET + REG_OFFSET(chip->group)=
;
> - =A0 =A0 =A0 ct->regs.type =3D CON_OFFSET + REG_OFFSET(chip->group);
> + =A0 =A0 =A0 ct->regs.ack =3D PEND_OFFSET + REG_OFFSET(group - bank-=
>start);
> + =A0 =A0 =A0 ct->regs.mask =3D MASK_OFFSET + REG_OFFSET(group - bank=
->start);
> + =A0 =A0 =A0 ct->regs.type =3D CON_OFFSET + REG_OFFSET(group - bank-=
>start);
> =A0 =A0 =A0 =A0irq_setup_generic_chip(gc, IRQ_MSK(chip->chip.ngpio),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 IRQ_GC_IN=
IT_MASK_CACHE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 IRQ_NOREQ=
UEST | IRQ_NOPROBE, 0);
> --
> 1.7.1.569.g6f426
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
