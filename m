From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] arm: Fix missing api-change from subsys_interface change
Date: Fri, 13 Jan 2012 10:05:08 +0900
Message-ID: <033301ccd18f$64ac8c60$2e05a520$%kim@samsung.com>
References: <201201121430.49448.heiko@sntech.de>
 <20120112160605.GA10831@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12417 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756308Ab2AMBFM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jan 2012 20:05:12 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LXP007GQPNRLXF0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jan 2012 10:05:10 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LXP00KCUPOKBVF0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 13 Jan 2012 10:05:10 +0900 (KST)
In-reply-to: <20120112160605.GA10831@suse.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Greg KH' <gregkh@suse.de>, =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: 'Kay Sievers' <kay.sievers@vrfy.org>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Greg KH wrote:
>=20
> On Thu, Jan 12, 2012 at 02:30:48PM +0100, Heiko St=FCbner wrote:
> > Commit 4a858cfc9a (arm: convert sysdev_class to a regular subsystem=
)
> > converted the samsung sysdevs into subsys_interface instances.
> >
> > While the original add-function only had a (struct sys_device *)
> > parameter, the dev_add from subsys_interface needs
> > 	(struct device *, struct subsys_interface *)
> > leading to "initialized from incompatible pointer type" warnings.
> >
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> > The patch applies cleanly against the current driver-core git,
> > hopefully it's the right tree.
>=20
> Thanks for fixing this up, sorry for getting it wrong.
>=20
> This should be done against the Samsung arm git tree, and go in throu=
gh
> that one.  The driver-core git tree is equal to Linus's tree of a few
> days ago, there are no driver-core patches in it at the moment.
>=20
> Kukjin, can you take these?
>=20
Sure, let me pick this up in my fixes.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
