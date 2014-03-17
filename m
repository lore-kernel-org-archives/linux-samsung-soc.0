From: Byungho An <bh74.an@samsung.com>
Subject: RE: [PATCH V2 RE-SEND 1/7] net: sxgbe: add basic framework for Samsung
 10Gb ethernet driver
Date: Sun, 16 Mar 2014 20:53:25 -0700
Message-ID: <005601cf4194$752c0c60$5f842520$@samsung.com>
References: <007a01cf3e89$3bbdf460$b339dd20$%an@samsung.com>
 <20140314004454.GA10982@electric-eye.fr.zoreil.com>
 <000e01cf40ac$08c19290$1a44b7b0$@samsung.com>
 <20140316231101.GA23765@electric-eye.fr.zoreil.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18856 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932317AbaCQDxi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Mar 2014 23:53:38 -0400
In-reply-to: <20140316231101.GA23765@electric-eye.fr.zoreil.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Francois Romieu' <romieu@fr.zoreil.com>
Cc: netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, davem@davemloft.net, ilho215.lee@samsung.com, siva.kallam@samsung.com, vipul.pandya@samsung.com, ks.giri@samsung.com, 'Joe Perches' <joe@perches.com>

Francois Romieu <romieu@fr.zoreil.com> :
> [...]
> > > > +struct sxgbe_core_ops {
> > > > +	/* MAC core initialization */
> > > > +	void (*core_init)(void __iomem *ioaddr);
> [...]
> > > > +	/* adjust SXGBE speed */
> > > > +	void (*set_speed)(void __iomem *ioaddr, unsigned char
speed); };
> > >
> > > This indirection level is never used.
> > Those are used, can you give more detail?
> 
> They are used but they always point to the same set of methods.
> Those methods could thus be directly called.
Yes, those methods can be called directly.
But I think it is acceptable for manageability and extension for future.

> 
> [...]
> > > > +/* SXGBE private data structures */ struct sxgbe_tx_queue {
> > > > +	u8 queue_no;
> > > > +	unsigned int irq_no;
> > > > +	struct sxgbe_priv_data *priv_ptr;
> > > > +	struct sxgbe_tx_norm_desc *dma_tx;
> > >
> > > You may lay things a bit differently.
> > can you give more detail?
> 
> Bigger fields first, u8 at the end. It will save padding in the struct.
OK.

> 
> --
> Ueimor
> --
> To unsubscribe from this list: send the line "unsubscribe netdev" in the
body
> of a message to majordomo@vger.kernel.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html
