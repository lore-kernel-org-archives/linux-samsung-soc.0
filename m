From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/3] ARM: S3C64XX: Implement basic power domain support
Date: Fri, 2 Dec 2011 21:07:06 +0000
Message-ID: <20111202210706.GB15268@opensource.wolfsonmicro.com>
References: <1322765339-29879-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1322765339-29879-3-git-send-email-broonie@opensource.wolfsonmicro.com>
 <4ED930B3.3020200@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:56672 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755077Ab1LBVHK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Dec 2011 16:07:10 -0500
Content-Disposition: inline
In-Reply-To: <4ED930B3.3020200@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <snjw23@gmail.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Dec 02, 2011 at 09:10:27PM +0100, Sylwester Nawrocki wrote:

> > +	/* Not all domains provide power status readback */
> > +	if (pd->pwr_stat) {
> > +		while (retry--)
> > +			if (__raw_readl(S3C64XX_BLK_PWR_STAT) & pd->pwr_stat)
> > +				break;

> How about adding cpu_relax() in this busy wait loop ?

May as well, yes - I didn't actually measure how long it tends to take
to do the spin but it's not going to hurt.
