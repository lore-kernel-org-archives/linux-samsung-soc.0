From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 2/2] ARM: SAMSUNG: Cleanup resources by using macro
Date: Wed, 05 Oct 2011 10:17:16 +0900
Message-ID: <01f101cc82fc$85a4a0b0$90ede210$%kim@samsung.com>
References: <005901cc817e$51a56d00$f4f04700$%kim@samsung.com>
 <1957187.UuLfeIqa6D@wuerfel> <019301cc8293$79a6f510$6cf4df30$%kim@samsung.com>
 <201110041726.03056.arnd@arndb.de>
 <CAH9JG2UR+QY=Ni7BTThgUBf2iBUKX9cdkbq_XRia4aQXDwEeSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19859 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757505Ab1JEBRT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Oct 2011 21:17:19 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSK008W1JKTD4C0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Oct 2011 10:17:17 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSK00DRYJKSEU60@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 05 Oct 2011 10:17:17 +0900 (KST)
In-reply-to: <CAH9JG2UR+QY=Ni7BTThgUBf2iBUKX9cdkbq_XRia4aQXDwEeSg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org

Kyungmin Park wrote:
>=20
> On Wed, Oct 5, 2011 at 12:26 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tuesday 04 October 2011, Kukjin Kim wrote:
> >> > I think the string concatenation really just obfuscates the code=
, and
> >> > it does not actually save much at all. When you replace
> >> >
> >> > + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, WDT, SZ_1K),
> >> > + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(WDT),
> >> >
> >> > with
> >> >
> >> > + =A0 =A0 =A0 [0] =3D DEFINE_RES_MEM(S3C_PA_WDT, SZ_1K),
> >> > + =A0 =A0 =A0 [1] =3D DEFINE_RES_IRQ(IRQ_WDT),
> >> >
> >> > you need practically no extra space, but you gain the advantages=
 that
> >> >
> >> > * Someone using grep for DEFINE_RES_MEM finds all memory resourc=
es
> without
> >> > =A0 having to look up what your macros do an where they are used=
=2E
> >> > * Someone using grep to look for S3C_PA_WDT finds the place wher=
e it
is
> >> used.
> >> > * Someone reading the resource definition immediately knows what=
 the
> >> > =A0 macro does if familiar with other platforms using that macro=
=2E
> >>
> >> Yes, right. But I'm preparing to reduce the 'soc' part to consolid=
ate
some
> >> duplicated resources and platform data after this and the new
SAMSUNG_RES
> >> macro will be used.
> There are tools for source browsing e.g., ctags, cscope, grep, git
> grep and so on.
> If you create new SAMSUNG_RES, these tools can't find macro and
> symbols properly.
>=20
> Please use the existing macros for own purpose.
>=20
OK, it makes sense to me.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Thank you,
> Kyungmin Park
> >
> > Hmm, can't you instead change the names of these constants to be
> > always the same? That would let you use the regular DEFINE_RES_*
> > definitions without having to introduce your own.
