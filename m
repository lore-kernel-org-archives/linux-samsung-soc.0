From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Cleanup Samsung stuff
Date: Thu, 21 Apr 2011 20:15:29 +0900
Message-ID: <031901cc0015$6e4cc560$4ae65020$%kim@samsung.com>
References: <012801cbfe33$a76fa490$f64eedb0$%kim@samsung.com>
 <20110419080307.GA26650@sirena.org.uk>
 <BANLkTim2VJBoO-otakfVQaYsXLTyM91jsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:54567 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752114Ab1DULPe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Apr 2011 07:15:34 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LK000M4M1XXTC30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Apr 2011 20:15:33 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LK000GXR1XXBO@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Apr 2011 20:15:33 +0900 (KST)
In-reply-to: <BANLkTim2VJBoO-otakfVQaYsXLTyM91jsA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.ab@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'LAK' <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>

Thomas Abraham wrote:
>=20
> On Tue, Apr 19, 2011 at 1:33 PM, Mark Brown
> <broonie@opensource.wolfsonmicro.com> wrote:
> > On Tue, Apr 19, 2011 at 10:46:47AM +0900, Kukjin Kim wrote:
> >
> >> - Device tree (with Linaro)
> >
> > What is going on with device tree? =A0I've asked a couple of times =
about
> > this in the other thread but I'm still not clear where the code is =
or
> > what could usefully be done with it.
>=20
> The initial work on Samsung's s5pv310 is available at
> http://lists.ozlabs.org/pipermail/devicetree-discuss/2011-
> February/004350.html
>=20
> It is based on Grant's tree.
> git://git.secretlab.ca/git/linux-2.6 devicetree/test
>=20
> Currently I am working on supporting clkdev and Jeremy's common clock
> for all of Samsung's platforms and then continue with the device tree
> support for s5pv310.
>=20
Hi Thomas,

Thanks for your reply.

I also will review your patches of device tree and supporting clkdev so=
on.

If any updates after your posting, please let me know :)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
