From: Vinod Koul <vinod.koul@linux.intel.com>
Subject: Re: [PATCH v7 02/15] DMA: PL330: Update PL330 DMA API driver
Date: Mon, 29 Aug 2011 19:55:51 +0530
Message-ID: <1314627951.1606.151.camel@vkoul-udesk3>
References: <1314238425-6480-1-git-send-email-boojin.kim@samsung.com>
	 <1314238425-6480-3-git-send-email-boojin.kim@samsung.com>
	 <1314626141.1606.139.camel@vkoul-udesk3>
	 <1314627754.1606.145.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:61824 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753604Ab1H2O1D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Aug 2011 10:27:03 -0400
In-Reply-To: <1314627754.1606.145.camel@vkoul-udesk3>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

On Mon, 2011-08-29 at 19:52 +0530, Vinod Koul wrote:
> On Mon, 2011-08-29 at 19:25 +0530, Vinod Koul wrote:
> > On Thu, 2011-08-25 at 11:13 +0900, Boojin Kim wrote:
> > > This patch updates following 3 items.
> > > @@ -69,6 +70,10 @@ struct dma_pl330_chan {
> > >  	 * NULL if the channel is available to be acquired.
> > >  	 */
> > >  	void *pl330_chid;
> > > +
> > > +	/* For D-to-M and M-to-D channels */
> > > +	int burst_sz; /* the peripheral fifo width */
> > > +	dma_addr_t fifo_addr;
> > >  };
> > Why should you store peripheral address and burst size in channel
> > structure. You should take these from the API and dma_slave_structure
> Ignore my comment for burst size, but is valid for peripheral address
Never mind this one as well, I need some more coffee...


-- 
~Vinod
