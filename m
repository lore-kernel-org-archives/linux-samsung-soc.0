From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: S3C64XX: Fix section mismatch from cpufreq init
Date: Wed, 16 Mar 2011 09:49:59 +0000
Message-ID: <20110316094959.GB2688@opensource.wolfsonmicro.com>
References: <1299769093-14516-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <20110316083811.GG13316@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:52523 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752409Ab1CPJtn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Mar 2011 05:49:43 -0400
Content-Disposition: inline
In-Reply-To: <20110316083811.GG13316@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org

On Wed, Mar 16, 2011 at 09:38:11AM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Mar 10, 2011 at 02:58:13PM +0000, Mark Brown wrote:
> > we don't appear to have annotations which allow us to mark that it'=
ll
> > never be called after system init, causing the linker consistency

> Actually this is warning is a false positive.  There is a section
> mismatch, but it is never a problem because the .init callback is onl=
y
> called by cpufreq_register_driver. To get rid of the warning the righ=
t
> fix is to remove the .init callback from struct cpufreq_driver and
> change the prototype of cpufreq_register_driver to

That's what I said above, pretty much.  Ideally we'd have a way of
annotating the call sites so that the linker infrastructure rather than
having to faff about splitting the structures like this.
