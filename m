From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] S3C2443: add power domain for usb phy
Date: Tue, 24 Jan 2012 22:01:33 +0900
Message-ID: <02ff01ccda98$4c424f40$e4c6edc0$%kim@samsung.com>
References: <201201082156.44142.heiko@sntech.de>
 <201201241113.00387.heiko@sntech.de>
 <20120124101510.GH27414@legolas.emea.dhcp.ti.com>
 <201201241131.01437.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16037 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756479Ab2AXNBh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jan 2012 08:01:37 -0500
In-reply-to: <201201241131.01437.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, balbi@ti.com
Cc: 'Ben Dooks' <ben-linux@fluff.org>, 'Linux USB Mailing List' <linux-usb@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Heiko St=FCbner wrote:
>=20
> Am Dienstag, 24. Januar 2012, 11:15:11 schrieb Felipe Balbi:
> > On Tue, Jan 24, 2012 at 11:13:00AM +0100, Heiko St=FCbner wrote:
> > > sorry for mail spam :-)
> > >
> > > Am Dienstag, 24. Januar 2012, 10:51:31 schrieb Felipe Balbi:
> > > > On Tue, Jan 24, 2012 at 10:50:14AM +0100, Heiko St=FCbner wrote=
:
> > > > > Hi Felipe,
> > > > >
> > > > > Am Dienstag, 24. Januar 2012, 10:38:32 schrieb Felipe Balbi:
> > > > > > Hi,
> > > > > >
> > > > > > On Sun, Jan 08, 2012 at 09:59:02PM +0100, Heiko St=FCbner w=
rote:
> > > > > > > The phy-power-handling is common to S3C2443/2416/2450, so
> > > > > > > introduce a s3c2443-pm-common.c to handle this for all of=
 them.
> > > > > > >
> > > > > > > This makes it possible to remove the raw write to the
> > > > > > > PWRCFG-register from the s3c-hsudc driver.
> > > > > > >
> > > > > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > > > >
> > > > > > I believe this doesn't really depend on previous patches (?=
?) In
> > > > > > that
> > > > >
> > > > > > case, it can be carried with s3c's tree:
> > > > > it does depend on the previous patch [2/3], as the device pow=
er
> > > > > domain is controlled through the runtime-pm subsystem whose c=
alls
> > > > > were added in it.
> > > >
> > > > then I will need proper acks to carry this patch.
> > >
> > > another possibility would be to have patch 2 and 3 get in through=
 the
> > > samsung tree, as the majority of the change lies on this side (i.=
e.
> > > introducing a new file in plat-s3c24xx)
> >
> > yet another one, would be to defer patch 3/3 by one merge window ;-=
)
>=20
> also fine by me ;-)
>=20
> But let's see first what Kgene says.

Hi all,

Sorry for join lately on this.

I think we need to implement more pm domain for s3c24xx as well usbphy.=
 So if Felipe is ok, I'd like to handle Heiko's 2nd and 3rd
patches in my tree. Of course, I need Felipe's ack before that.
BTW, frankly, I'm not sure we can finish supporting pm domain for all o=
f s3c24xx for v3.4 :)

And, Heiko, I don't know why its name is -pm-common.c, how about just -=
pm.c like others? Yes, when all of s3c24xx can be supported
on that, just s3c24xx-pm.c would be better. But right now, s3c2443-pm.c=
 is ok or we need to think about that again. Because as I
said, I'm doing merge s3c24xx directories and it's almost done.
And the form of subject would be 'ARM: S3C24XX: ...', actually there we=
re discussions about that.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
