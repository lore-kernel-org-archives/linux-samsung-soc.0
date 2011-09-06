From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v8 04/16] DMA: PL330: Remove the start operation for
	handling DMA_TERMINATE_ALL command
Date: Tue, 6 Sep 2011 13:27:18 +0100
Message-ID: <20110906122718.GP6619@n2100.arm.linux.org.uk>
References: <1314924284-25554-1-git-send-email-boojin.kim@samsung.com> <1314924284-25554-5-git-send-email-boojin.kim@samsung.com> <CABb+yY1QN9CzT=CGJ1n-pk8_QyeEK1Sx=HT2n8SMB9O-XrsXDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:41766 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754174Ab1IFMaI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Sep 2011 08:30:08 -0400
Content-Disposition: inline
In-Reply-To: <CABb+yY1QN9CzT=CGJ1n-pk8_QyeEK1Sx=HT2n8SMB9O-XrsXDg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Boojin Kim <boojin.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <dan.j.williams@intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>

On Tue, Sep 06, 2011 at 05:52:19PM +0530, Jassi Brar wrote:
> On Fri, Sep 2, 2011 at 6:14 AM, Boojin Kim <boojin.kim@samsung.com> wrote:
> > Origianl code carries out the start operation after flush operation.
> > But start operation is not required for DMA_TERMINATE_ALL command.
> > So, This patch removes the unnecessary start operation and only carries out
> > the flush oeration for handling DMA_TERMINATE_ALL command.
> 
> Not exactly. The 'start' is impotent when called from this path because there
> is nothing left queued after the call to 'flush'.
> pl330_tasklet() is called because that is a common function that does the
> house-keeping acc to what's presently in 'work' and 'done' lists.
> 
> Though as a side-effect, your patch does avoid doing callbacks on submitted
> xfers during DMA_TERMINATE_ALL - which may or may not be the right thing
> to do.

It is defined that DMA_TERMINATE_ALL does not call the callbacks:

1. int dmaengine_terminate_all(struct dma_chan *chan)

   This causes all activity for the DMA channel to be stopped, and may
   discard data in the DMA FIFO which hasn't been fully transferred.
   No callback functions will be called for any incomplete transfers.
