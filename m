From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Fix on SECTION_SIZE_BITS on	S5PV210/S5PC110.
Date: Wed, 07 Jul 2010 08:49:16 +0900
Message-ID: <013301cb1d65$daf2f8d0$90d8ea70$%kim@samsung.com>
References: <1278391007-11144-1-git-send-email-kgene.kim@samsung.com>
 <AANLkTimqquLc7lW7TdMD2q84d4uATvHKppt5gVfKcMFT@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:27516 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751545Ab0GFXtO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Jul 2010 19:49:14 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L55003SYU609I80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Jul 2010 08:49:12 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5500FL5U60KI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Jul 2010 08:49:12 +0900 (KST)
In-reply-to: <AANLkTimqquLc7lW7TdMD2q84d4uATvHKppt5gVfKcMFT@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Kyungmin Park wrote:
>=20
> On Tue, Jul 6, 2010 at 1:36 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> > This patch fixes on SECTION_SIZE_BITS for Sparsemem on S5PV210/S5PC=
110.
> > Because smallest size of a bank on S5PV210/S5PC110 is aligned by 16=
MB.
> > So each section's maximum size should be 16MB.
>=20
> Could you explain what's the problem?
>=20
The size of a section for use in Sparsemem should be a power of 2.
And as you know, S5PC110 D-type has only 80MiB in a bank(DMC0).

80 =3D 2^4 * 5, thus should be 16MiB.

In case the section size is greater than 16MiB, a section will have a h=
ole
in it.

> Even though 80MiB is used at logical size. it used the physical 128Mi=
B
> so. it's reasonable to use 128MiB align instead of 16MiB. Are there
> boards use 64MiB or less?
>=20
> I think if decrease the SECTIONS_SIZE_BITS, it wastes the memory.
>=20
> Thank you,
> Kyungmin Park
>=20
> >
> > Reported-by: Kyongho Cho <pullip.cho@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0arch/arm/mach-s5pv210/include/mach/memory.h | =A0 =A08 ++++++--
> > =A01 files changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/mach-s5pv210/include/mach/memory.h
b/arch/arm/mach-
> s5pv210/include/mach/memory.h
> > index 379117e..4a372d8 100644
> > --- a/arch/arm/mach-s5pv210/include/mach/memory.h
> > +++ b/arch/arm/mach-s5pv210/include/mach/memory.h
> > @@ -16,8 +16,12 @@
> > =A0#define PHYS_OFFSET =A0 =A0 =A0 =A0 =A0 =A0UL(0x20000000)
> > =A0#define CONSISTENT_DMA_SIZE =A0 =A0(SZ_8M + SZ_4M + SZ_2M)
> >
> > -/* Maximum of 256MiB in one bank */
> > +/* Sparsemem support. Each section is a maximum of 16MB.
> > + * Because there are many different memory type on S5PC110(MCP),
> > + * and there is a case that having 80MB, 128MB or 256MB in one
> > + * bank.
> > +*/
> > =A0#define MAX_PHYSMEM_BITS =A0 =A0 =A0 32
> > -#define SECTION_SIZE_BITS =A0 =A0 =A028
> > +#define SECTION_SIZE_BITS =A0 =A0 =A024
> >
> > =A0#endif /* __ASM_ARCH_MEMORY_H */
> > --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
