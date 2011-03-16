From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: S3C64XX: Fix section mismatch from cpufreq init
Date: Wed, 16 Mar 2011 10:53:47 +0000
Message-ID: <20110316105346.GA14125@opensource.wolfsonmicro.com>
References: <1299769093-14516-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <20110316083811.GG13316@pengutronix.de>
 <20110316094959.GB2688@opensource.wolfsonmicro.com>
 <20110316101259.GH13316@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:37371 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751825Ab1CPKxt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Mar 2011 06:53:49 -0400
Content-Disposition: inline
In-Reply-To: <20110316101259.GH13316@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, patches@opensource.wolfsonmicro.com, Ben Dooks <ben-linux@fluff.org>

On Wed, Mar 16, 2011 at 11:13:00AM +0100, Uwe Kleine-K=F6nig wrote:
> On Wed, Mar 16, 2011 at 09:49:59AM +0000, Mark Brown wrote:

> > That's what I said above, pretty much.  Ideally we'd have a way of
> > annotating the call sites so that the linker infrastructure rather =
than
> > having to faff about splitting the structures like this.

> You can mark the driver struct using __ref. But IMHO not saving a
> reference to a function only used once is cleaner.

It's pretty annoying to have to define two structs for the affected
drivers (it's not like cpufreq is the only affected subsystem here) -
there's good reasons why we use things like __devexit_p() rather than
split structs for common cases like this.
