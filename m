From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V4 03/14] DMA: PL330: Support DMA_SLAVE_CONFIG command
Date: Tue, 26 Jul 2011 14:12:57 +0100
Message-ID: <20110726131257.GA1655@n2100.arm.linux.org.uk>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com> <1311557312-26107-4-git-send-email-boojin.kim@samsung.com> <1311589617.27357.3.camel@vkoul-mobl4> <002401cc4ac9$97737570$c65a6050$%kim@samsung.com> <1311601700.8206.7.camel@vkoul-mobl4> <003c01cc4b94$82e39e20$88aada60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:45615 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751242Ab1GZNN3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jul 2011 09:13:29 -0400
Content-Disposition: inline
In-Reply-To: <003c01cc4b94$82e39e20$88aada60$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: 'Vinod Koul' <vkoul@infradead.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, vinod.koul@intel.com, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Grant Likely' <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Dan Williams' <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

On Tue, Jul 26, 2011 at 10:04:10PM +0900, Boojin Kim wrote:
> Vinod Koul Wrote:
> > I meant you should use proper fields for passing info, which in this
> > case would be dst_maxburst for specifying destination burst sizes
> I think the naming seems to make confusion.
> 'Peri->burst_sz' on this code means the width of fifo in bytes of the peri. 
> It's same with the meaning 'xxx_addr_width'. So, I think it's proper usage.
> 'peri->burst_sz' is passed to PL330 HW. PL330 HW wants to get the power of 2 
> based the fifo width for it.
> For example, If fifo width is 8 bytes, PL330 HW should get '3' for it.
> And I will modify code to consider xxx_maxburst.

IMHO from your description above, peri->burst_sz is misnamed.  Please
add a comment at this location to say something like:

	/* peri->burst_sz is the peripheral fifo width */

to explain this.

Thanks.
