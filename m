From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 3/3] S3C2443: add power domain for usb phy
Date: Tue, 24 Jan 2012 11:09:48 +0100
Message-ID: <201201241109.48749.heiko@sntech.de>
References: <201201082156.44142.heiko@sntech.de> <201201241050.14405.heiko@sntech.de> <20120124095130.GA27414@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:60326 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751956Ab2AXKKA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jan 2012 05:10:00 -0500
In-Reply-To: <20120124095130.GA27414@legolas.emea.dhcp.ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com, Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Am Dienstag, 24. Januar 2012, 10:51:31 schrieb Felipe Balbi:
> On Tue, Jan 24, 2012 at 10:50:14AM +0100, Heiko St=FCbner wrote:
> > Hi Felipe,
> >=20
> > Am Dienstag, 24. Januar 2012, 10:38:32 schrieb Felipe Balbi:
> > > Hi,
> > >=20
> > > On Sun, Jan 08, 2012 at 09:59:02PM +0100, Heiko St=FCbner wrote:
> > > > The phy-power-handling is common to S3C2443/2416/2450, so intro=
duce a
> > > > s3c2443-pm-common.c to handle this for all of them.
> > > >=20
> > > > This makes it possible to remove the raw write to the PWRCFG-re=
gister
> > > > from the s3c-hsudc driver.
> > > >=20
> > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > >=20
> > > I believe this doesn't really depend on previous patches (??) In =
that
> >=20
> > > case, it can be carried with s3c's tree:
> > it does depend on the previous patch [2/3], as the device power dom=
ain is
> > controlled through the runtime-pm subsystem whose calls were added =
in it.
>=20
> then I will need proper acks to carry this patch.

ok, I will pester Kukjin Kim more about it to get the needed ack :-) .

If changes are requested to this third patch should I only resubmit thi=
s one=20
or all of them again - i.e. will you still keep the first two patches?

Heiko
