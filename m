From: Byungho An <bh74.an@samsung.com>
Subject: RE: [PATCH V5 2/8] net: sxgbe: add basic framework for Samsung 10Gb
 ethernet driver
Date: Tue, 18 Mar 2014 13:56:12 -0700
Message-ID: <003601cf42ec$80bd2bf0$823783d0$@samsung.com>
References: <002801cf42d6$a27317c0$e7594740$@samsung.com>
 <1395171314.2812.80.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35926 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932649AbaCRU4U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 16:56:20 -0400
In-reply-to: <1395171314.2812.80.camel@joe-AO722>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Joe Perches' <joe@perches.com>
Cc: netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, davem@davemloft.net, siva.kallam@samsung.com, ks.giri@samsung.com, ilho215.lee@samsung.com, vipul.pandya@samsung.com


Joe Perches <joe@perches.com> wrote : 
> On Tue, 2014-03-18 at 11:19 -0700, Byungho An wrote:
> > From: Siva Reddy <siva.kallam@samsung.com>
> >
> > This patch adds support for Samsung 10Gb ethernet driver(sxgbe).
> 
> More trivia, nothing that should stop this from being applied and updated
> later...
> 
> > diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_mdio.c
> > b/drivers/net/ethernet/samsung/sxgbe/sxgbe_mdio.c
> []
> > +static int sxgbe_mdio_busy_wait(void __iomem *ioaddr, unsigned int
> > +mii_data) {
> > +	unsigned long cur_time;
> > +	unsigned long fin_time = jiffies + 3 * HZ; /* 30 ms */
> 
> This is actually 3 seconds.
> If this should be 30ms, then use msecs_to_jiffies(30)
This is a typo, comment will be changed to "3 sec".

> 
> > +
> > +	do {
> > +		cur_time = jiffies;
> > +		if (readl(ioaddr + mii_data) & SXGBE_MII_BUSY)
> > +			cpu_relax();
> > +		else
> > +			return 0;
> > +	} while (!time_after_eq(cur_time, fin_time));
> > +
> > +	return -EBUSY;
> > +}
> 
> This may be clearer as
> 
> 	unsigned long fin_time = jiffies + msecs_to_jiffies(30);
> 
> 	while (!time_after(jiffies, fin_time))
> 		if (!(readl(ioaddr + mii_data) & SXGBE_MII_BUSY))
> 			return 0;
> 		cpu_relax();
> 	}
> 
> 	return -EBUSY;
OK.
