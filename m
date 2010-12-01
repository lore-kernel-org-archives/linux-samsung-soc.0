From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/3] ARM: SAMSUNG: Convert s3c_irqext_wake() to new
 irq_ interrupt methods
Date: Wed, 1 Dec 2010 11:08:27 +0000
Message-ID: <20101201110827.GB24176@rakim.wolfsonmicro.main>
References: <1290698309-7691-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <20101201101902.GA22683@mail.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:47391 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751117Ab0LALI3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 06:08:29 -0500
Content-Disposition: inline
In-Reply-To: <20101201101902.GA22683@mail.wantstofly.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lennert Buytenhek <buytenh@wantstofly.org>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org

On Wed, Dec 01, 2010 at 11:19:02AM +0100, Lennert Buytenhek wrote:

> It would seem that this patch breaks s3c:

> ./mach-s3c64xx/irq-eint.c:	.irq_set_wake	= s3c_irqext_wake,
> ./plat-s3c24xx/irq.c:	.irq_set_wake	= s3c_irqext_wake

Could you please elaborate on what you mean by "s3c" and why you think
it has been broken?
