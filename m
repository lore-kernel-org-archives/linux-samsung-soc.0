From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/6] rtc: rtc-s3c: Fix access unit from byte to word on
 RTCCON
Date: Wed, 27 Oct 2010 16:58:13 +0900
Message-ID: <000401cb75ac$b6eab190$24c014b0$%kim@samsung.com>
References: <1286494879-2932-1-git-send-email-kgene.kim@samsung.com>
 <1286494879-2932-2-git-send-email-kgene.kim@samsung.com>
 <AANLkTi=+BH7nJFt5Amz_q=6HAn9STfXjKbCS6jSQeW5y@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53785 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758721Ab0J0H5z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Oct 2010 03:57:55 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAX004RVVGH4AC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Oct 2010 16:57:53 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAX009LHVGHRG@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Oct 2010 16:57:53 +0900 (KST)
In-reply-to: <AANLkTi=+BH7nJFt5Amz_q=6HAn9STfXjKbCS6jSQeW5y@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, p_gortmaker@yahoo.com, a.zummo@towertech.it, ben-linux@fluff.org, akpm@linux-foundation.org, 'Changhwan Youn' <chaos.youn@samsung.com>

MyungJoo Ham wrote:
>=20
> On Fri, Oct 8, 2010 at 8:41 AM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> > From: Changhwan Youn <chaos.youn@samsung.com>
> >
> > S3C2410_RTCCON of TYPE_S3C64XX RTC should be read/written by
> > readw and writew, because TYPE_S3C64XX RTC uses bit 8 and 9.
> > And TYPE_S3C2410 RTC also can access it by readw and writew.
> >
> > Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> > [atul.dahiya@samsung.com: tested on smdk2416]
> > Tested-by: Atul Dahiya <atul.dahiya@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > ---
> > =A0drivers/rtc/rtc-s3c.c | =A0 36 ++++++++++++++++++---------------=
---
> > =A01 files changed, 18 insertions(+), 18 deletions(-)
>=20
> Hello,
>=20
Hi,
>=20
> Sorry for a late reply...
>=20
Yeah, too late :-(

> Anyway, I have a small question in this rtc-s3c.c driver.
>=20
> Is there any reason to use read/write b/w to access registers of rtc-=
s3c?
>=20
See the git comment.

> Why don't we use readl/writel when accessing registers in this driver=
s

I don't know why we should use readl/writel for all case...
even though we can use just word or byte access.

> and just forget which registers require at least 8 or 16 or 32 bits?
>=20
> In fact, it appears that readw/writew accesses 16bits, not 32bits in

Yes...

> ARM machines, which may incur problems with TICCNT/CURTICCNT
> registers.
>=20
I can't get your comment...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
