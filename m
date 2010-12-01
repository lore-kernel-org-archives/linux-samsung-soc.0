From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/3] ARM: SAMSUNG: Convert s3c_irqext_wake() to new
	irq_ interrupt methods
Date: Wed, 1 Dec 2010 11:47:56 +0000
Message-ID: <20101201114755.GC5688@sirena.org.uk>
References: <1290698309-7691-1-git-send-email-broonie@opensource.wolfsonmicro.com> <20101201101902.GA22683@mail.wantstofly.org> <20101201110827.GB24176@rakim.wolfsonmicro.main> <20101201114531.GK15575@mail.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:48010 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751408Ab0LALsD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 06:48:03 -0500
Content-Disposition: inline
In-Reply-To: <20101201114531.GK15575@mail.wantstofly.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lennert Buytenhek <buytenh@wantstofly.org>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org

On Wed, Dec 01, 2010 at 12:45:31PM +0100, Lennert Buytenhek wrote:

> My mistake, sorry -- I thought you had missed the two uses of
> s3c_irqext_wake in ./mach-s3c64xx/irq-eint.c and ./plat-s3c24xx/irq.c,
> but your patch does actually fix those up as well.

No problem, no wonder I couldn't figure out what you were talking about!
