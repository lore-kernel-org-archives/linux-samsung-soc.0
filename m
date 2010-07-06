From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5P: Add PMU device
Date: Tue, 06 Jul 2010 12:12:37 +0900
Message-ID: <009f01cb1cb9$188332d0$49899870$%kim@samsung.com>
References: <1278294411-5104-1-git-send-email-jy0922.shim@samsung.com>
 <4C31C47C.1050905@gmail.com> <006c01cb1c41$a0af5c10$e20e1430$%kim@samsung.com>
 <AANLkTik3WGvkUsvKHllgSlj9fJJy90y7L4me4tywCoE0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:61399 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754834Ab0GFDMe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jul 2010 23:12:34 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L54008X18WXM710@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Jul 2010 12:12:33 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L540091A8WW7T@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Jul 2010 12:12:33 +0900 (KST)
In-reply-to: <AANLkTik3WGvkUsvKHllgSlj9fJJy90y7L4me4tywCoE0@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: 'Maurus Cuelenaere' <mcuelenaere@gmail.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Kyungmin Park wrote:
>=20
> On Mon, Jul 5, 2010 at 9:57 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> > Maurus Cuelenaere wrote:
> >>
> >> =A0Op 05-07-10 03:46, Joonyoung Shim schreef:
> >> > This patch adds an initcall for the s5p platforms so that they
register
> >> > their PMU IRQs with the PMU framework in the Kernel.
> >> >
> >> > Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> >> > ---
> >> > =A0arch/arm/mach-s5p6442/include/mach/irqs.h | =A0 =A02 +-
> >> > =A0arch/arm/mach-s5pc100/include/mach/irqs.h | =A0 =A01 +
> >> > =A0arch/arm/mach-s5pv210/include/mach/irqs.h | =A0 =A01 +
> >> > =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A01 +
> >> > =A0arch/arm/plat-s5p/dev-pmu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 37
> >> +++++++++++++++++++++++++++++
> >> > =A05 files changed, 41 insertions(+), 1 deletions(-)
> >> > =A0create mode 100644 arch/arm/plat-s5p/dev-pmu.c
> >>
> >> Wouldn't it be better if this was in plat-samsung? I can see that =
the
S3C6410
> >> datasheet mentions a PMU_IRQ_ENABLE bit in SYS_OTHERS so I suspect
> that it
> >> has
> >> the same functionality (even though there's no mention of which
interrupt this
> >> is).
> >>
> > Yes, I also found PMU_IRQ_ENABLE bit in System Others register of
S3C6410
> datasheet. But as your comments, could not found the interrupt number=
 and
any
> description...Actually, need to check whether it's available or not.
> >
> > And S5P6440 has it.
> > So Joonyoung, it would be helpful if you could add 6440 PMUIRQ
(VIC1[23]) in
> this patch.
>=20
> It's another story. Can you explain the difference between 6440 and 6=
442?
> As I heard it's same chip and type is difference. If true, how about
> to delete the 6442 directory?
> It makes a single kernel simple.
>=20

I remember, already explained about that.
Hmm..Where did you hear wrong information that they are same? :-(
Absolutely, they are different !! not same chip.
=2E..

But actually, I'm working on merge some S5P SoCs...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
