From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ARM: S3C64XX: Fix section mismatch from cpufreq init
Date: Wed, 16 Mar 2011 11:13:00 +0100
Message-ID: <20110316101259.GH13316@pengutronix.de>
References: <1299769093-14516-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <20110316083811.GG13316@pengutronix.de>
 <20110316094959.GB2688@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:48261 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752234Ab1CPKNG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Mar 2011 06:13:06 -0400
Content-Disposition: inline
In-Reply-To: <20110316094959.GB2688@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, patches@opensource.wolfsonmicro.com, Ben Dooks <ben-linux@fluff.org>

On Wed, Mar 16, 2011 at 09:49:59AM +0000, Mark Brown wrote:
> On Wed, Mar 16, 2011 at 09:38:11AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Thu, Mar 10, 2011 at 02:58:13PM +0000, Mark Brown wrote:
> > > we don't appear to have annotations which allow us to mark that i=
t'll
> > > never be called after system init, causing the linker consistency
>=20
> > Actually this is warning is a false positive.  There is a section
> > mismatch, but it is never a problem because the .init callback is o=
nly
> > called by cpufreq_register_driver. To get rid of the warning the ri=
ght
> > fix is to remove the .init callback from struct cpufreq_driver and
> > change the prototype of cpufreq_register_driver to
>=20
> That's what I said above, pretty much.  Ideally we'd have a way of
> annotating the call sites so that the linker infrastructure rather th=
an
> having to faff about splitting the structures like this.
You can mark the driver struct using __ref. But IMHO not saving a
reference to a function only used once is cleaner.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
