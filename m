From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/3] ARM: SAMSUNG: Convert s3c_irqext_wake() to new
 irq_ interrupt methods
Date: Wed, 1 Dec 2010 11:33:17 +0000
Message-ID: <20101201113317.GH24176@rakim.wolfsonmicro.main>
References: <1290698309-7691-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <002f01cb914a$de3e3fa0$9ababee0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:42412 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751260Ab0LALdT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 06:33:19 -0500
Content-Disposition: inline
In-Reply-To: <002f01cb914a$de3e3fa0$9ababee0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

On Wed, Dec 01, 2010 at 08:28:22PM +0900, Kukjin Kim wrote:

> And...as you know, need to convert s3c_irq_wake() to new irq_ interrupt
> method also.
> Ok...I will do it or will check Lennert Buytenhek's patch for it :-)

Yup, there's a lot of other IRQ stuff in the various Samsung platforms
that can be converted - as you can see I was working through the various
interrupts one at a time.  Lennart's patch covers everything but only
does the mechanical side of things.
