From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RESEND PATCH] ARM: EXYNOS: Fix the sequence of secondary CPU boot
 for Exynos3250
Date: Wed, 11 Jun 2014 09:52:19 +0200
Message-ID: <1402473139.24049.6.camel@AMDC1943>
References: <1402442827-2321-1-git-send-email-cw00.choi@samsung.com>
 <5397963F.30109@gmail.com> <53979871.2020903@samsung.com>
 <53979B52.5000902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:64497 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755279AbaFKHwK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jun 2014 03:52:10 -0400
In-reply-to: <53979B52.5000902@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux@arm.linux.org.uk, kgene.kim@samsung.com, t.figa@samsung.com, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On =C5=9Bro, 2014-06-11 at 01:57 +0200, Tomasz Figa wrote:
> On 11.06.2014 01:44, Chanwoo Choi wrote:
> > On 06/11/2014 08:35 AM, Tomasz Figa wrote:
> >> Hi Chanwoo,
> >>
> >> On 11.06.2014 01:27, Chanwoo Choi wrote:
> >>> This patch set AUTOWAKEUP_EN bit to ARM_CORE_CONFIGURATION regist=
er
> >>> because Exynos3250 removes WFE in secure mode so that turn on aut=
omatically
> >>> after setting CORE_LOCAL_PWR_EN. Also, This patch use dbs_sev() m=
acro
> >>> to guarantee the data synchronization of command instead of IPI_W=
AKEUP
> >>> because Exynos3250 don't have WFE mode in secue mode.
> >>>
> >>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> >>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> >>> ---
> >>>  arch/arm/mach-exynos/platsmp.c  | 9 ++++++++-
> >>>  arch/arm/mach-exynos/pm.c       | 8 ++++++--
> >>>  arch/arm/mach-exynos/regs-pmu.h | 4 ++++
> >>>  3 files changed, 18 insertions(+), 3 deletions(-)
> >>>
> >>
> >> This patch seems to be unneeded with Krzysztof's patch send a whil=
e ago
> >> [1]. As reported by Krzysztof, that patch apparently fixes SMP sup=
port
> >> on Exynos3250 and is much smaller and less invasive.
> >>
> >> [1] - http://thread.gmane.org/gmane.linux.kernel.samsung-soc/32809
> >=20
> > OK,
> > But Krzysztof's patch didn't include set S5P_CORE_AUTOWAKEUP_EN in =
EXYNOS_ARM_CORE_CONFIGURATION(cpu).
> > and then use arch_send_wakeup_ipi_mask(cpumask_of(cpu)) command ins=
tead of dsb_sev(). Exynos3250 don't need
> > send IPI message.
>=20
> I don't know technical details about CPU boot-up on Exynos3250 as I
> haven't worked too much with this platform. According to my conversat=
ion
> with Krzysztof, he found S5P_CORE_AUTOWAKEUP_EN and dsb_sev() to be n=
ot
> needed. Instead S5P_CORE_WAKEUP_FROM_LOCAL_CFG can be set in
> EXYNOS_ARM_CORE1_STATUS and then normal arch_send_wakeup_ipi_mask()
> used. He might be able to provide more details.

I tried to avoid setting S5P_CORE_AUTOWAKEUP_EN because of simple
reason: in my SoC documentation this field is not documented. The
ARM_CORE_CONFIGURATION register has only "LOCAL_PWR_CFG" field and
nothing more.

As for the IPI wakeup - I think it makes code cleaner than adding 'if'
statement for specific chipset.

Best regards,
Krzysztof
