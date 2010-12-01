From: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH 1/3] ARM: SAMSUNG: Convert s3c_irqext_wake() to new irq_ interrupt methods
Date: Wed, 1 Dec 2010 12:45:31 +0100
Message-ID: <20101201114531.GK15575@mail.wantstofly.org>
References: <1290698309-7691-1-git-send-email-broonie@opensource.wolfsonmicro.com> <20101201101902.GA22683@mail.wantstofly.org> <20101201110827.GB24176@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fw.wantstofly.org ([80.101.37.227]:36691 "EHLO
	mail.wantstofly.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751233Ab0LALpc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 06:45:32 -0500
Content-Disposition: inline
In-Reply-To: <20101201110827.GB24176@rakim.wolfsonmicro.main>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org

On Wed, Dec 01, 2010 at 11:08:27AM +0000, Mark Brown wrote:

> > It would seem that this patch breaks s3c:
> 
> > ./mach-s3c64xx/irq-eint.c:	.irq_set_wake	= s3c_irqext_wake,
> > ./plat-s3c24xx/irq.c:	.irq_set_wake	= s3c_irqext_wake
> 
> Could you please elaborate on what you mean by "s3c" and why you think
> it has been broken?

My mistake, sorry -- I thought you had missed the two uses of
s3c_irqext_wake in ./mach-s3c64xx/irq-eint.c and ./plat-s3c24xx/irq.c,
but your patch does actually fix those up as well.
