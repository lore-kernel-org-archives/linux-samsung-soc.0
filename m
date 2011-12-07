From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 3/3] ARM: S3C64XX: Implement basic power domain support
Date: Wed, 7 Dec 2011 22:44:02 +0100
Message-ID: <201112072244.02299.rjw@sisk.pl>
References: <1322765339-29879-1-git-send-email-broonie@opensource.wolfsonmicro.com> <4ED930B3.3020200@gmail.com> <20111202210706.GB15268@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:48104 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932154Ab1LGVlE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Dec 2011 16:41:04 -0500
In-Reply-To: <20111202210706.GB15268@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Sylwester Nawrocki <snjw23@gmail.com>, Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Friday, December 02, 2011, Mark Brown wrote:
> On Fri, Dec 02, 2011 at 09:10:27PM +0100, Sylwester Nawrocki wrote:
> 
> > > +	/* Not all domains provide power status readback */
> > > +	if (pd->pwr_stat) {
> > > +		while (retry--)
> > > +			if (__raw_readl(S3C64XX_BLK_PWR_STAT) & pd->pwr_stat)
> > > +				break;
> 
> > How about adding cpu_relax() in this busy wait loop ?
> 
> May as well, yes - I didn't actually measure how long it tends to take
> to do the spin but it's not going to hurt.

Are you going to post an updated patch?

Rafael
