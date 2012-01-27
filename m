From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] arm: Fix missing api-change from subsys_interface change
Date: Fri, 27 Jan 2012 17:15:01 +0900
Message-ID: <01b101ccdccb$c41b0a40$4c511ec0$%kim@samsung.com>
References: <201201121430.49448.heiko@sntech.de>
 <20120112160605.GA10831@suse.de>
 <033301ccd18f$64ac8c60$2e05a520$%kim@samsung.com>
 <201201270910.34247.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55779 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814Ab2A0IPF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jan 2012 03:15:05 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LYG000BY6X3B5C0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 17:15:03 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LYG007156X17800@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 17:15:03 +0900 (KST)
In-reply-to: <201201270910.34247.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: 'Greg KH' <gregkh@suse.de>, 'Kay Sievers' <kay.sievers@vrfy.org>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
>=20
> Am Freitag, 13. Januar 2012, 02:05:08 schrieb Kukjin Kim:
> > Greg KH wrote:
> > > On Thu, Jan 12, 2012 at 02:30:48PM +0100, Heiko St=FCbner wrote:
> > > > Commit 4a858cfc9a (arm: convert sysdev_class to a regular subsy=
stem)
> > > > converted the samsung sysdevs into subsys_interface instances.
> > > >
> > > > While the original add-function only had a (struct sys_device *=
)
> > > > parameter, the dev_add from subsys_interface needs
> > > >
> > > > 	(struct device *, struct subsys_interface *)
> > > >
> > > > leading to "initialized from incompatible pointer type" warning=
s.
> > > >
> > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > > ---
> > > > The patch applies cleanly against the current driver-core git,
> > > > hopefully it's the right tree.
> > >
> > > Thanks for fixing this up, sorry for getting it wrong.
> > >
> > > This should be done against the Samsung arm git tree, and go in t=
hrough
> > > that one.  The driver-core git tree is equal to Linus's tree of a=
 few
> > > days ago, there are no driver-core patches in it at the moment.
> > >
> > > Kukjin, can you take these?
> >
> > Sure, let me pick this up in my fixes.
>=20
> Hi Kgene,
>=20
> ping :-)
>=20
> I checked the hopefully correct branch v3.3-samsung-fixes and the pat=
ch is not
> in there.
>=20
Hi,

I already applied it in my local tree, v3.3-samsung-fixes-2 but not pus=
hed yet :)
Will be sent in this weekend.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
