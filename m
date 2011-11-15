From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Extend Samsung patterns to cover SPI
 and ASoC drivers
Date: Tue, 15 Nov 2011 11:16:04 +0000
Message-ID: <20111115111603.GC3077@opensource.wolfsonmicro.com>
References: <1320923776-26626-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1320923776-26626-2-git-send-email-broonie@opensource.wolfsonmicro.com>
 <005701cca376$f6abbba0$e40332e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:33237 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754959Ab1KOLQH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Nov 2011 06:16:07 -0500
Content-Disposition: inline
In-Reply-To: <005701cca376$f6abbba0$e40332e0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, grant.likely@secretlab.ca

On Tue, Nov 15, 2011 at 06:14:22PM +0900, Kukjin Kim wrote:
> Mark Brown wrote:

> > +F:	drivers/spi/spi-s3c*
> > +F:	sound/soc/samsung/*

> Hmm, I'm ok on this but needs Grant's opinion :)

> (Cc'ed Grant Likely)

Note that you can have multiple entries for a single file, people are
supposed to use a bit of thought when working out who to mail - if you
use something like get_maintainers it'll return all matching entries.
