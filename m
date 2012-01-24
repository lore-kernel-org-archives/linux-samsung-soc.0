From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 3/3] S3C2443: add power domain for usb phy
Date: Tue, 24 Jan 2012 11:31:01 +0100
Message-ID: <201201241131.01437.heiko@sntech.de>
References: <201201082156.44142.heiko@sntech.de> <201201241113.00387.heiko@sntech.de> <20120124101510.GH27414@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:53727 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754007Ab2AXKbP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jan 2012 05:31:15 -0500
In-Reply-To: <20120124101510.GH27414@legolas.emea.dhcp.ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com, Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Am Dienstag, 24. Januar 2012, 11:15:11 schrieb Felipe Balbi:
> On Tue, Jan 24, 2012 at 11:13:00AM +0100, Heiko St=FCbner wrote:
> > sorry for mail spam :-)
> >=20
> > Am Dienstag, 24. Januar 2012, 10:51:31 schrieb Felipe Balbi:
> > > On Tue, Jan 24, 2012 at 10:50:14AM +0100, Heiko St=FCbner wrote:
> > > > Hi Felipe,
> > > >=20
> > > > Am Dienstag, 24. Januar 2012, 10:38:32 schrieb Felipe Balbi:
> > > > > Hi,
> > > > >=20
> > > > > On Sun, Jan 08, 2012 at 09:59:02PM +0100, Heiko St=FCbner wro=
te:
> > > > > > The phy-power-handling is common to S3C2443/2416/2450, so
> > > > > > introduce a s3c2443-pm-common.c to handle this for all of t=
hem.
> > > > > >=20
> > > > > > This makes it possible to remove the raw write to the
> > > > > > PWRCFG-register from the s3c-hsudc driver.
> > > > > >=20
> > > > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > > >=20
> > > > > I believe this doesn't really depend on previous patches (??)=
 In
> > > > > that
> > > >=20
> > > > > case, it can be carried with s3c's tree:
> > > > it does depend on the previous patch [2/3], as the device power
> > > > domain is controlled through the runtime-pm subsystem whose cal=
ls
> > > > were added in it.
> > >=20
> > > then I will need proper acks to carry this patch.
> >=20
> > another possibility would be to have patch 2 and 3 get in through t=
he
> > samsung tree, as the majority of the change lies on this side (i.e.
> > introducing a new file in plat-s3c24xx)
>=20
> yet another one, would be to defer patch 3/3 by one merge window ;-)

also fine by me ;-)

But let's see first what Kgene says.
