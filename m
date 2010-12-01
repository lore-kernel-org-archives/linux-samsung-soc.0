From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/3] ARM: S3C64XX: Use chip_data to store the shift for
 EINTs
Date: Wed, 1 Dec 2010 11:55:35 +0000
Message-ID: <20101201115535.GK24176@rakim.wolfsonmicro.main>
References: <1290698309-7691-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1290698309-7691-3-git-send-email-broonie@opensource.wolfsonmicro.com>
 <003101cb914d$1caf7040$560e50c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:43715 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751520Ab0LALzh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 06:55:37 -0500
Content-Disposition: inline
In-Reply-To: <003101cb914d$1caf7040$560e50c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

On Wed, Dec 01, 2010 at 08:44:25PM +0900, Kukjin Kim wrote:
> Mark Brown wrote:

> > This makes all the functions that use the shift slightly smaller, one
> > instruction in most cases but more for ack() and maskack().

> Uhm...I'm not sure to use chip_data for the eint_irq_to_bit() is best to us.

Could you elaborate on your concern here?  I can't think of anything
else we might want to include in the data, and avoiding the shifts
and/or dereferences seems useful for anyone doing interrupt heavy work.
