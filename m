From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 3/3] S3C2443: add power domain for usb phy
Date: Tue, 24 Jan 2012 14:27:21 +0100
Message-ID: <201201241427.21939.heiko@sntech.de>
References: <201201082156.44142.heiko@sntech.de> <02ff01ccda98$4c424f40$e4c6edc0$%kim@samsung.com> <20120124130754.GR27414@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:56330 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754513Ab2AXN1f convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jan 2012 08:27:35 -0500
In-Reply-To: <20120124130754.GR27414@legolas.emea.dhcp.ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com, Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, 'Linux USB Mailing List' <linux-usb@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Am Dienstag, 24. Januar 2012, 14:07:56 schrieb Felipe Balbi:
> Hi,
>=20
> On Tue, Jan 24, 2012 at 10:01:33PM +0900, Kukjin Kim wrote:
> > Heiko St=FCbner wrote:
> > > Am Dienstag, 24. Januar 2012, 11:15:11 schrieb Felipe Balbi:
> > > > On Tue, Jan 24, 2012 at 11:13:00AM +0100, Heiko St=FCbner wrote=
:
> > > > > sorry for mail spam :-)
> > > > >=20
> > > > > Am Dienstag, 24. Januar 2012, 10:51:31 schrieb Felipe Balbi:
> > > > > > On Tue, Jan 24, 2012 at 10:50:14AM +0100, Heiko St=FCbner w=
rote:
> > > > > > > Hi Felipe,
> > > > > > >=20
> > > > > > > Am Dienstag, 24. Januar 2012, 10:38:32 schrieb Felipe Bal=
bi:
> > > > > > > > Hi,
> > > > > > > >=20
> > > > > > > > On Sun, Jan 08, 2012 at 09:59:02PM +0100, Heiko St=FCbn=
er wrote:
> > > > > > > > > The phy-power-handling is common to S3C2443/2416/2450=
, so
> > > > > > > > > introduce a s3c2443-pm-common.c to handle this for al=
l of
> > > > > > > > > them.
> > > > > > > > >=20
> > > > > > > > > This makes it possible to remove the raw write to the
> > > > > > > > > PWRCFG-register from the s3c-hsudc driver.
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > > > > > >=20
> > > > > > > > I believe this doesn't really depend on previous patche=
s (??)
> > > > > > > > In that
> > > > > > >=20
> > > > > > > > case, it can be carried with s3c's tree:
> > > > > > > it does depend on the previous patch [2/3], as the device=
 power
> > > > > > > domain is controlled through the runtime-pm subsystem who=
se
> > > > > > > calls were added in it.
> > > > > >=20
> > > > > > then I will need proper acks to carry this patch.
> > > > >=20
> > > > > another possibility would be to have patch 2 and 3 get in thr=
ough
> > > > > the samsung tree, as the majority of the change lies on this =
side
> > > > > (i.e. introducing a new file in plat-s3c24xx)
> > > >=20
> > > > yet another one, would be to defer patch 3/3 by one merge windo=
w ;-)
> > >=20
> > > also fine by me ;-)
> > >=20
> > > But let's see first what Kgene says.
> >=20
> > Hi all,
> >=20
> > Sorry for join lately on this.
> >=20
> > I think we need to implement more pm domain for s3c24xx as well
> > usbphy. So if Felipe is ok, I'd like to handle Heiko's 2nd and 3rd
> > patches in my tree. Of course, I need Felipe's ack before that.
> > BTW, frankly, I'm not sure we can finish supporting pm domain for a=
ll
> > of s3c24xx for v3.4 :)
>=20
> In that case, how about we take things slow ? I can carry pm-runtime
> patch (2/3) and by 3.5 or 3.6 you will only need to touch
> arch/arm/-related code.
>=20
> If you guarantee that it won't make it in 3.4, I'm ok carrying
> pm-runtime patch as it won't break anything anyway (I suppose).

Seems reasonable to me. The pm-runtime patch does not break anything - =
it=20
simply does nothing without either some runtime-pm functions or the pow=
er=20
domain work.

So I would second that we handle the power domain stuff after Kgene got=
 the=20
mach directories merged for 3.4, i.e. drop the patch (3/3) for now and =
I will=20
resubmit it when the time comes.


Heiko
