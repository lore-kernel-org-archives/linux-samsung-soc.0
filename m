From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/3] ASoC: samsung: pass filter function as
	pointer
Date: Tue, 17 Nov 2015 11:25:44 +0100
Message-ID: <22364793.tICMzOOh4L@wuerfel>
References: <5466463.9HBcuLFGQf@wuerfel> <8896684.3di3I3vzeA@wuerfel>
 <564A78A6.9010501@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <564A78A6.9010501@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vinod.koul@intel.com>, Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 17 November 2015 09:45:26 Krzysztof Kozlowski wrote:
> On 14.11.2015 02:24, Arnd Bergmann wrote:
> > diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> > index 0945b5de39e7..5a4133b6e6a6 100644
> > --- a/sound/soc/samsung/i2s.c
> > +++ b/sound/soc/samsung/i2s.c
> > @@ -1244,7 +1244,8 @@ static int samsung_i2s_probe(struct platform_device *pdev)
> >  		if (ret != 0)
> >  			return ret;
> >  
> > -		return samsung_asoc_dma_platform_register(&pdev->dev);
> > +		return samsung_asoc_dma_platform_register(&pdev->dev,
> > +						  i2s_pdata->dma_filter);
> >  	}
> 
> Here (and maybe in other places?) - NULL pointer exception. The pdata is
> NULL on all newer platforms (e.g. all Exynos).
> 
> BTW, later there is even check for NULL pdata which is pointed also by
> Smatch.

Thanks for spotting this! I'll fix it up.

	Arnd
