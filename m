From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/3] ARM: exynos: remove unused <mach/memory.h>
Date: Wed, 23 Jul 2014 21:58:31 +0200
Message-ID: <20140723195831.GF7636@pengutronix.de>
References: <1404295043-6661-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20140722075138.GB28538@pengutronix.de>
 <CAOesGMgA0fc0_8JOOE01y=UKv-eAZuWiAkAKHG5iam0Zkhp9TA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:42919 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932873AbaGWT6o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jul 2014 15:58:44 -0400
Content-Disposition: inline
In-Reply-To: <CAOesGMgA0fc0_8JOOE01y=UKv-eAZuWiAkAKHG5iam0Zkhp9TA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "arm@kernel.org" <arm@kernel.org>, Russell King <linux@arm.linux.org.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Sascha Hauer <kernel@pengutronix.de>

Hello,

On Tue, Jul 22, 2014 at 09:14:33AM -0700, Olof Johansson wrote:
> > Patch 2 (v2!)
> >
> >         ARM: remove remaining definitions of PLAT_PHYS_OFFSET from =
<mach/memory.h>
> >
> > touches several arch/arm/mach-*/include/mach/memory.h and
> > arch/arm/Kconfig. armsoc? Russell?
>=20
> This can go through either, but Russell has already reviewed it once
> so send it to his patch tracker.
>=20
> > Patch 3 fixes a warning regarding nommu and touches the Kconfig ent=
ry
> > for Integrator and Renesas (non-multiplatform). armsoc?
>=20
> Don't know without seeing the patch. What's the patch subject so I ca=
n find it?
I talked to Olof on irc. I sent patches 2 and 3 to the patch tracker as

	http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=3D8112/=
1

and

	http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=3D8113/=
1

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
