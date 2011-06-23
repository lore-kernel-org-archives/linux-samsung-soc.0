From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM:SAMSUNG: Move S3C DMA driver to drivers/dma
Date: Thu, 23 Jun 2011 15:47:14 +0900
Message-ID: <015901cc3171$658d5b50$30a811f0$%kim@samsung.com>
References: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com>
 <BANLkTintADbXSiV07VTMbFfmUV+4-q2-gw@mail.gmail.com>
 <BANLkTimjWNf3PxHXj3o5qubH5g7gMHjhFg@mail.gmail.com>
 <20110607081527.GB20929@n2100.arm.linux.org.uk>
 <BANLkTin66PhYGmVSOJcuZr8wDH_iNgjhZQ@mail.gmail.com>
 <20110607182923.GA28451@n2100.arm.linux.org.uk>
 <BANLkTikLFCyzU3UApjjwfX0Vjujo9WAFZA@mail.gmail.com>
 <20110607223614.GC28451@n2100.arm.linux.org.uk> <4DF10FC1.9030406@samsung.com>
 <BANLkTimqi=NcQ8jVjYpe4zo1-nPazV=HOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25956 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752680Ab1FWGrU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jun 2011 02:47:20 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN8002JHDIUQNM0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Jun 2011 15:47:19 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LN800950DIVD9@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Jun 2011 15:47:19 +0900 (KST)
In-reply-to: <BANLkTimqi=NcQ8jVjYpe4zo1-nPazV=HOg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Jassi Brar' <jassisinghbrar@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'root' <alim.akhtar@samsung.com>

kyungmin78@gmail.com wrote:
>=20
> 2011/6/10 Kukjin Kim <kgene.kim@samsung.com>:
> > On 06/07/11 15:36, Russell King - ARM Linux wrote:
> >> I see no effort from the Samsung folk to even start considering mo=
ving
> >> to common APIs - I see precisely the opposite. =A0They seem to hav=
e a
> >> strong desire to invent their own new APIs all the time rather tha=
n
> >> look at existing APIs and discuss how they can be used or adapted =
so
> >> they work for Samsung.
> >>
> >> That is not sustainable, and if it continues, it will probably res=
ult
> >> in Samsung stuff being chucked out of mainline. =A0We are most def=
initely
> >> at the point where custom APIs are no longer permissible, especial=
ly
> >> for any new SoCs.
> >
> > Hi Russell and everyone,
> >
> > Sorry for late participation on this :(
> > I'm out of my office for biz. trip so it was hard to check my e-mai=
l
> > and will be back to my country this weekend.
> >
> > Anyway, I and my colleagues know what we have to do for Linux world=
=2E
> > And as I know, we are preparing some stuff for it so please don't
> > expect the worst :)
> >
> > I should be back on this after discussing with my colleagues.
> Any updates? still need more time?

As a note, our engineers are working on this now.
If any updates about that, will post...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
