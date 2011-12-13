From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Add stub runtime power management
Date: Tue, 13 Dec 2011 16:06:53 +0100
Message-ID: <20111213160653.67926bd8@endymion.delvare>
References: <1323093966-9045-1-git-send-email-broonie@opensource.wolfsonmicro.com>
	<1323093966-9045-2-git-send-email-broonie@opensource.wolfsonmicro.com>
	<201112131553.49270.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:26505 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942Ab1LMPHO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Dec 2011 10:07:14 -0500
In-Reply-To: <201112131553.49270.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?B?U3T8Ym5lcg==?= <heiko@sntech.de>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, patches@opensource.wolfsonmicro.com

On Tue, 13 Dec 2011 15:53:48 +0100, Heiko St=FCbner wrote:
> Am Montag, 5. Dezember 2011, 15:06:06 schrieb Mark Brown:
> > Add stub runtime_pm calls which go through the flow of enabling and
> > disabling but don't actually do anything with the device itself as
> > there's nothing useful we can do. This provides the core PM framewo=
rk
> > with information about when the device is idle, enabling chip wide
> > power savings.
> >=20
> > Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
>=20
> Kgene, Jean, Ben: could we move this forward please?

The i2c-s3c2410 driver is in Ben's garden, not mine.

--=20
Jean Delvare
