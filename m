From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C64XX: Remove un-used code
Date: Fri, 19 Aug 2011 14:29:44 +0900
Message-ID: <001d01cc5e31$00c9dee0$025d9ca0$%kim@samsung.com>
References: <1313498488-4296-1-git-send-email-banajit.g@samsung.com>
 <20110819015955.GA1212@sirena.org.uk>
 <CABK8_vR6bB_0TfQtbA7F9+w9dSXajMdd1SS5o+LscMrDcCY1tg@mail.gmail.com>
 <20110819045346.GA26979@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:29611 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750859Ab1HSF34 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 01:29:56 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ50041FTWWHPO0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 14:29:44 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ500N1QTXL2B@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 14:29:45 +0900 (KST)
In-reply-to: <20110819045346.GA26979@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Banajit Goswami' <banajit.goswami@gmail.com>
Cc: 'Banajit Goswami' <banajit.g@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Mark Brown wrote:
>=20
> On Fri, Aug 19, 2011 at 09:40:29AM +0530, Banajit Goswami wrote:
> > On Fri, Aug 19, 2011 at 7:29 AM, Mark Brown
> > <broonie@opensource.wolfsonmicro.com> wrote:
> > > On Tue, Aug 16, 2011 at 06:11:28PM +0530, Banajit Goswami wrote:
> > >> Remove un-used backlight code for SMDK6410 board
>=20
> > > Is the data actually wrong? =A0If not it'd seem better to finish =
hooking
> > > it up properly than to remove it.
>=20
> > No, this code is no longer needed, as we are having a common backli=
ght
> > infrastructure , which serves the same purpose.
>=20
> Ideally your commit log should make this clear - it looks like you're
> just deleting unreferenced code.

Yes, I agree with your opinion...It was difficult to know why it is un-=
used
code when I applied that.

OK, I will amend its commit log in my tree to clear.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
