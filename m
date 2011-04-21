From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Cleanup Samsung stuff
Date: Thu, 21 Apr 2011 20:13:13 +0900
Message-ID: <031801cc0015$1eec2f10$5cc48d30$%kim@samsung.com>
References: <012801cbfe33$a76fa490$f64eedb0$%kim@samsung.com>
 <20110419080307.GA26650@sirena.org.uk>
 <BANLkTim2VJBoO-otakfVQaYsXLTyM91jsA@mail.gmail.com>
 <BANLkTikxV+4Zxf6Mh1se-h396G4m4qiwaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16260 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751318Ab1DULNW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Apr 2011 07:13:22 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LK0004ID1TO2130@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Apr 2011 20:13:20 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LK0007XS1U8QC@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Apr 2011 20:13:20 +0900 (KST)
In-reply-to: <BANLkTikxV+4Zxf6Mh1se-h396G4m4qiwaQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Domenico Andreoli' <cavokz@gmail.com>, 'Thomas Abraham' <thomas.ab@samsung.com>
Cc: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, 'LAK' <linux-arm-kernel@lists.infradead.org>, 'Russell King' <rmk+kernel@arm.linux.org.uk>

Domenico Andreoli wrote:
>=20
> On Tue, Apr 19, 2011 at 10:40 AM, Thomas Abraham <thomas.ab@samsung.c=
om>
> wrote:
> > On Tue, Apr 19, 2011 at 1:33 PM, Mark Brown
> > <broonie@opensource.wolfsonmicro.com> wrote:
> >> On Tue, Apr 19, 2011 at 10:46:47AM +0900, Kukjin Kim wrote:
> >>
> >>> - Device tree (with Linaro)
> >>
> >> What is going on with device tree? =A0I've asked a couple of times=
 about
> >> this in the other thread but I'm still not clear where the code is=
 or
> >> what could usefully be done with it.
> >
> > Currently I am working on supporting clkdev and Jeremy's common clo=
ck
> > for all of Samsung's platforms and then continue with the device tr=
ee
> > support for s5pv310.
>=20
> I already posted some patches that add DeviceTree to s3c24xx (gpio, s=
di).
> I'm hanging on sdi because I found that mmc-spi already has some DT
> support and I'm working to generalize it.
>=20
> If nobody opposes I'll continue with the effort.

Could you please send them to me and Ben Dooks?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
