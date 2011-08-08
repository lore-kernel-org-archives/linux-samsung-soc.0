From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 12/15] spi/s3c64xx: Add support DMA engine API
Date: Mon, 8 Aug 2011 20:26:44 +0200
Message-ID: <201108082026.45456.heiko@sntech.de>
References: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com> <201108081955.39626.heiko@sntech.de> <CABb+yY08vGuvp4uVm3nd0FvFoXa04jmDOaQYcu324q7326a5Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:53297 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750877Ab1HHS0x convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Aug 2011 14:26:53 -0400
In-Reply-To: <CABb+yY08vGuvp4uVm3nd0FvFoXa04jmDOaQYcu324q7326a5Lw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Boojin Kim <boojin.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>

Am Montag 08 August 2011, 20:16:58 schrieben Sie:
> On Mon, Aug 8, 2011 at 11:25 PM, Heiko St=C3=BCbner <heiko@sntech.de>=
 wrote:
> > Am Montag 08 August 2011, 19:47:58 schrieb Jassi Brar:
> >> Btw, this spi driver is for S3C64xx(with pl080) and S5P(with pl330=
)
> >> series, both of which
> >> have DMAENGINE drivers. May be it could be directly switched to us=
ing
> >> those, rather than
> >> via Samsung's wrapper driver.
> >> Or am I overlooking something ?
> >=20
> > yep, at least the S3C2416/2450 HSSPI which should use this driver.
>=20
> Seems you keep some patches private ;)  the spi driver isn't enabled
> for 2416 in mainline.
It's not so private [1], but isn't working yet :-). I'm still new to th=
e whole=20
kernel development stuff and seem to be the only one working on this de=
vice=20
family.

I know from comparing s3c2416 and s3c64xx manuals that the hsspi part i=
s the=20
same but still have some learning to do to get it to work and also need=
=20
drivers for the other side of the spi connection.

The Asus eeeReader DR-900 uses a wlan chip supported by libertas. So ha=
ving a=20
"verified" driver on the other side might help me in getting the spi dr=
iver to=20
work.


Heiko


[1] https://gitorious.org/oyo-hack every e-book reader with Sipix displ=
ay=20
seems to be made from the same model line.
