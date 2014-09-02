From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] irqchip: exynos-combiner: Fix compilation error on
 ARM64
Date: Tue, 2 Sep 2014 13:56:21 -0400
Message-ID: <20140902175621.GG30467@titan.lakedaemon.net>
References: <1409671492-7725-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:65465 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751815AbaIBR4h convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Sep 2014 13:56:37 -0400
Content-Disposition: inline
In-Reply-To: <1409671492-7725-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-kernel@vger.kernel.org, naveenkrishna.ch@gmail.com, Thomas Gleixner <tglx@linutronix.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Naveen,

On Tue, Sep 02, 2014 at 08:54:52PM +0530, Naveen Krishna Chatradhi wrot=
e:
> The following compilation error occurs on 64-bit Exynos7 SoC:
>=20
> drivers/irqchip/exynos-combiner.c: In function =E2=80=98combiner_irq_=
domain_map=E2=80=99:
> drivers/irqchip/exynos-combiner.c:162:2: error: implicit declaration =
of function =E2=80=98set_irq_flags=E2=80=99 [-Werror=3Dimplicit-functio=
n-declaration]
>   set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);
>   ^
> drivers/irqchip/exynos-combiner.c:162:21: error: =E2=80=98IRQF_VALID=E2=
=80=99 undeclared (first use in this function)
>   set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);
>                      ^
> drivers/irqchip/exynos-combiner.c:162:21: note: each undeclared ident=
ifier is reported only once for each function it appears in
> drivers/irqchip/exynos-combiner.c:162:34: error: =E2=80=98IRQF_PROBE=E2=
=80=99 undeclared (first use in this function)
>   set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);
>=20
> Fix the build error by including asm/hardirq.h.
>=20
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/irqchip/exynos-combiner.c |    2 ++
>  1 file changed, 2 insertions(+)

Please include me in the Cc on future irqchip fixes, I almost missed
this one.

thx,

Jason.
