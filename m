From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] arm: Fix missing api-change from subsys_interface change
Date: Fri, 27 Jan 2012 09:10:33 +0100
Message-ID: <201201270910.34247.heiko@sntech.de>
References: <201201121430.49448.heiko@sntech.de> <20120112160605.GA10831@suse.de> <033301ccd18f$64ac8c60$2e05a520$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:46209 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751257Ab2A0IK4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jan 2012 03:10:56 -0500
In-Reply-To: <033301ccd18f$64ac8c60$2e05a520$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Greg KH' <gregkh@suse.de>, 'Kay Sievers' <kay.sievers@vrfy.org>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Freitag, 13. Januar 2012, 02:05:08 schrieb Kukjin Kim:
> Greg KH wrote:
> > On Thu, Jan 12, 2012 at 02:30:48PM +0100, Heiko St=FCbner wrote:
> > > Commit 4a858cfc9a (arm: convert sysdev_class to a regular subsyst=
em)
> > > converted the samsung sysdevs into subsys_interface instances.
> > >=20
> > > While the original add-function only had a (struct sys_device *)
> > > parameter, the dev_add from subsys_interface needs
> > >=20
> > > 	(struct device *, struct subsys_interface *)
> > >=20
> > > leading to "initialized from incompatible pointer type" warnings.
> > >=20
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > ---
> > > The patch applies cleanly against the current driver-core git,
> > > hopefully it's the right tree.
> >=20
> > Thanks for fixing this up, sorry for getting it wrong.
> >=20
> > This should be done against the Samsung arm git tree, and go in thr=
ough
> > that one.  The driver-core git tree is equal to Linus's tree of a f=
ew
> > days ago, there are no driver-core patches in it at the moment.
> >=20
> > Kukjin, can you take these?
>=20
> Sure, let me pick this up in my fixes.

Hi Kgene,

ping :-)

I checked the hopefully correct branch v3.3-samsung-fixes and the patch=
 is not=20
in there.

Heiko
