From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/4] rtc-s3c: make room for more variants in devicetree
 block
Date: Thu, 05 Jan 2012 11:32:18 +0900
Message-ID: <00f601cccb52$3ee9d390$bcbd7ab0$%kim@samsung.com>
References: <201112211014.30695.heiko@sntech.de> <4F042D61.2070309@samsung.com>
 <201201041251.42509.heiko@sntech.de> <201201041512.55126.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49959 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752753Ab2AECcW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jan 2012 21:32:22 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LXB00BAQ0CRKMB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 Jan 2012 11:32:21 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LXB00M0B0DUTUZ0@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 05 Jan 2012 11:32:20 +0900 (KST)
In-reply-to: <201201041512.55126.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rtc-linux@googlegroups.com

Heiko St=FCbner wrote:

>=20
> Hi Kgene,
>=20
> Am Mittwoch, 4. Januar 2012, 12:51:41 schrieb Heiko St=FCbner:
> > Hi Sylwester,
> >
> > Am Mittwoch, 4. Januar 2012, 11:43:45 schrieb Sylwester Nawrocki:
> > > Hello,
> > >
> > > On 12/21/2011 10:16 AM, Heiko St=FCbner wrote:
> > > > Use the data field of of_device_id to hold the type for
> > > > s3c_cpu_type.
> > > >
> > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > > Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
> > > > ---
> > >
> > > This patch makes compilation with CONFIG_OF enabled fail with err=
ors
> > > and warnings:
> > >
> > > drivers/rtc/rtc-s3c.c: In function =91s3c_rtc_get_driver_data=92:
> > > drivers/rtc/rtc-s3c.c:454: warning: return makes integer from poi=
nter
> > > without a cast
> > > drivers/rtc/rtc-s3c.c: At top level:
> > > drivers/rtc/rtc-s3c.c:674: error: request for member =91data=92 i=
n
> something
> > > not a structure or union
> > > drivers/rtc/rtc-s3c.c:677: error: request for member =91data=92 i=
n
> something
> > > not a structure or union
> > > drivers/rtc/rtc-s3c.c:680: error: request for member =91data=92 i=
n
> something
> > > not a structure or union
> > > drivers/rtc/rtc-s3c.c:683: error: request for member =91data=92 i=
n
> something
> > > not a structure or union
> > > make[2]: *** [drivers/rtc/rtc-s3c.o] Error 1
> >
> > thanks for spotting this.
> >
> > @kgene: Should this go on top of the rtc series, or should I prepar=
e a
> v4
> > with these fixes included?
> never mind, I did both.
>=20
> In reply to this mail you will find:
> - a single patch on top of the 4 original patches, fixing the problem=
s
> sylwester reported
> - a v4 of the original series including the fixes to the problems, ba=
sed
> on
> the code that you have in your rtc-branch
>=20
> Please pick the apropriate variant to fix the problem :-)
>=20
OK, since it has been merged into arm-soc, I will send a single patch t=
o
arm-soc.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
