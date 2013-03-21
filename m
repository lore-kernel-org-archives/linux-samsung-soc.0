From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/2] i2c: s3c2410: move mach/regs-iic.h into i2c-s3c2410 device driver
Date: Thu, 21 Mar 2013 11:51:24 +0100
Message-ID: <201303211151.24997.heiko@sntech.de>
References: <201302080057.00664.heiko@sntech.de> <20130321095758.GB19297@the-dreams.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:56165 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753358Ab3CUKvd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Mar 2013 06:51:33 -0400
In-Reply-To: <20130321095758.GB19297@the-dreams.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <w.sang@pengutronix.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org

Hi Wolfram,

Am Donnerstag, 21. M=E4rz 2013, 10:57:58 schrieb Wolfram Sang:
> On Fri, Feb 08, 2013 at 12:57:00AM +0100, Heiko St=FCbner wrote:
> > The register definitions are only used in the driver itself.
> > This also removes the last dependency on plat/ includes from the
> > i2c driver.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>=20
> What tree is this against? I can't apply it on top of v3.8 or 3.9-rc3=
=2E

I'm not sure anymore ... probably some linux-next. I'll redo them on to=
p of=20
your (i2c) for-next branch.


Heiko
