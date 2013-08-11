From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 17/18] spi: s3c64xx: Always select
	S3C64XX_PL080 when ARCH_S3C64XX is enabled
Date: Mon, 12 Aug 2013 01:03:19 +0200
Message-ID: <2033369.1oHkX7kdGa@flatron>
References: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
 <1376243970-6489-18-git-send-email-tomasz.figa@gmail.com>
 <20130811191140.GI6427@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20130811191140.GI6427@sirena.org.uk>
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

Hi Mark,

On Sunday 11 of August 2013 20:11:40 Mark Brown wrote:
> On Sun, Aug 11, 2013 at 07:59:29PM +0200, Tomasz Figa wrote:
> > @@ -366,7 +366,7 @@ config SPI_S3C24XX_FIQ
> > 
> >  config SPI_S3C64XX
> >  
> >  	tristate "Samsung S3C64XX series type SPI"
> >  	depends on (ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5P64X0 ||
> >  	ARCH_EXYNOS)> 
> > -	select S3C64XX_DMA if ARCH_S3C64XX && !S3C64XX_PL080
> > +	select S3C64XX_PL080 if ARCH_S3C64XX
> > 
> >  	help
> >  	
> >  	  SPI driver for Samsung S3C64XX and newer SoCs.
> 
> Do we need the select here (or should we have other selects for the
> Exynos SoCs)?

The driver would build fine without this symbol selected, but since it 
relies on availability of DMA, it doesn't make too much sense to build it 
this way. This kind of selects makes kernel configuration more user 
friendly IMHO.

Possibly adding appropriate selects (PL330) for s5p* and exynos could make 
sense.

Best regards,
Tomasz
