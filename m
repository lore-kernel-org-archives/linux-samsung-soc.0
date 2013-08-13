From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 10/18] spi: s3c64xx: Do not require legacy
	DMA API in case of S3C64XX
Date: Tue, 13 Aug 2013 22:20:19 +0200
Message-ID: <1686992.nQEd3xdoHn@flatron>
References: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
 <20130813185547.GD6427@sirena.org.uk> <20130813201816.GG6427@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20130813201816.GG6427@sirena.org.uk>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <djbw@fb.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 13 of August 2013 21:18:16 Mark Brown wrote:
> On Tue, Aug 13, 2013 at 07:55:47PM +0100, Mark Brown wrote:
> > I'm still debugging what's going on here - the basic refcounting all
> > looks OK in the SPI driver, I can see it requesting and releasing with
> > the refcounts all going back to zero in the DMA driver as expected but
> > when we come back to the device later on dmaengine is deciding the
> > device is unavailable quite early on in the process.
> 
> The failure is happening because this check is failing:
> 
> 	/* devices with multiple channels need special handling as we need 
to
> 	 * ensure that all channels are either private or public.
> 	 */
> 	if (dev->chancnt > 1 && !dma_has_cap(DMA_PRIVATE, dev->cap_mask))
> 		list_for_each_entry(chan, &dev->channels, device_node) {
> 			/* some channels are already publicly allocated */
> 			if (chan->client_count) {
> 
> which is happening because dma1chan0 (which is on the same DMA
> controller as the SPI controller) and in fact every other DMA channel
> had references grabbed by the network stack dmaengine helpers which I'd
> enabled in config.  The fact that they do that is unhelpful, it renders
> the API mostly useless, but is nothing to do with this series.
> 
> Having tweaked the config everything appears to work so:
> 
> Tested-by: Mark Brown <broonie@linaro.org>
> 
> though the whole thing with the filter function is as I say a bit fun
> from a code review point of view.

I believe you just found another brokenness of current DMA channel 
matching.

Thanks for testing.

Best regards,
Tomasz
