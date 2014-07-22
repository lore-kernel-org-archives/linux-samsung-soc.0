From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/3] ARM: exynos: remove unused <mach/memory.h>
Date: Tue, 22 Jul 2014 09:51:38 +0200
Message-ID: <20140722075138.GB28538@pengutronix.de>
References: <1404295043-6661-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:45397 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750737AbaGVHvr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jul 2014 03:51:47 -0400
Content-Disposition: inline
In-Reply-To: <1404295043-6661-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, arm@kernel.org, Russell King <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, kernel@pengutronix.de

Hello,

who takes care of this series?

In fact they are all orthogonal to each other.

The first patch

	ARM: exynos: remove unused <mach/memory.h>

has been reviewed and tested by Tomasz Figa and Sachin Kamat. Can the
Samsung people pick it up? Or armsoc?

Patch 2 (v2!)

	ARM: remove remaining definitions of PLAT_PHYS_OFFSET from <mach/memor=
y.h>

touches several arch/arm/mach-*/include/mach/memory.h and
arch/arm/Kconfig. armsoc? Russell?

Patch 3 fixes a warning regarding nommu and touches the Kconfig entry
for Integrator and Renesas (non-multiplatform). armsoc?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
