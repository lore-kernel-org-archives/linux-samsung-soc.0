From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC PATCH] DMA: PL330: Update PL330 DMAC to support runtime PM
Date: Wed, 27 Jul 2011 09:53:48 +0100
Message-ID: <20110727085348.GB21584@n2100.arm.linux.org.uk>
References: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com>
	<1311744697-10264-2-git-send-email-boojin.kim@samsung.com>
	<4E2FACC3.2010109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <4E2FACC3.2010109@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Boojin Kim <boojin.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jul 27, 2011 at 03:14:27PM +0900, Chanwoo Choi wrote:
> +#ifdef CONFIG_PM_RUNTIME
> +	struct dma_pl330_chan *pch;
> +	struct dma_pl330_dmac *pdmac;
> +#endif
>  
>  	dma_cap_zero(mask);
>  	dma_cap_set(info->cap, mask);
>  
>  	chan = dma_request_channel(mask, pl330_filter, (void *)dma_ch);
>  
> +#ifdef CONFIG_PM_RUNTIME
> +	pch = container_of(chan, struct dma_pl330_chan, chan);
> +	pdmac = pch->dmac;
> +
> +	pm_runtime_get_sync(pdmac->pif.dev);
> +#endif

This is not the right way to do this.  The pm runtime stuff should be
internal to the PL330 driver.  Take a moment to think about this:

You need to wake it up just before a transfer starts.  You need to
put it back to sleep just after the last transfer has finished.
That gives you a hint where the calls need to be.

That can only be done from within the PL330 driver.
