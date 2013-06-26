From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/2] ASoC: samsung-ac97: Convert to devm_ioremap_resource()
Date: Wed, 26 Jun 2013 12:10:15 +0200
Message-ID: <2023345.DFmjYSGTDl@amdc1227>
References: <1372239463-14603-1-git-send-email-broonie@linaro.org>
 <1372239463-14603-2-git-send-email-broonie@linaro.org>
 <000901ce7254$05e3fd50$11abf7f0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:49438 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750843Ab3FZKKT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Jun 2013 06:10:19 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOZ00K3PW8F1620@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Jun 2013 11:10:17 +0100 (BST)
In-reply-to: <000901ce7254$05e3fd50$11abf7f0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Mark Brown' <broonie@linaro.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Sangbeom Kim' <sbkim73@samsung.com>, 'Liam Girdwood' <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Thierry Reding <thierry.reding@avionic-design.de>, Sachin Kamat <sachin.kamat@linaro.org>

On Wednesday 26 of June 2013 19:00:44 Jingoo Han wrote:
> On Wednesday, June 26, 2013 6:38 PM, Mark Brown wrote:
> > Signed-off-by: Mark Brown <broonie@linaro.org>
> > ---
> > 
> >  sound/soc/samsung/ac97.c | 22 +++-------------------
> >  1 file changed, 3 insertions(+), 19 deletions(-)
> > 
> > diff --git a/sound/soc/samsung/ac97.c b/sound/soc/samsung/ac97.c
> > index 1c85999..3e6a1d2 100644
> > --- a/sound/soc/samsung/ac97.c
> > +++ b/sound/soc/samsung/ac97.c
> > @@ -417,8 +417,8 @@ static int s3c_ac97_probe(struct platform_device
> > *pdev)> 
> >  		return -ENXIO;
> >  	
> >  	}
> > 
> > -	if (!request_mem_region(mem_res->start,
> > -				resource_size(mem_res), "ac97")) {
> > +	s3c_ac97.regs = devm_ioremap_resource(&pdev->dev, mem_res);
> > +	if (!s3c_ac97.regs) {
> > 
> >  		dev_err(&pdev->dev, "Unable to request register region\n");
> >  		return -EBUSY;
> 
> CC'ed Thierry Reding, Sachin Kamat,
> 
> According to the comment of devm_ioremap_resource(), (lib/devres.c)
> 
>  * Returns a pointer to the remapped memory or an ERR_PTR() encoded error
> code * on failure. Usage example:
>  *
>  *      res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  *      base = devm_ioremap_resource(&pdev->dev, res);
>  *      if (IS_ERR(base))
>  *              return PTR_ERR(base);
>  */
> 
> Thus, the following would be better.
> 
> +	s3c_ac97.regs = devm_ioremap_resource(&pdev->dev, mem_res);
> +	if (IS_ERR(s3c_ac97.regs))
> + 		return PTR_ERR(s3c_ac97.regs);

Right.

I was caught on doing exactly the same and I think this was caused by 
moving from devm_request_and_ioremap() which used to return NULL on failure 
to devm_ioremap_resource() which returns ERR_PTR. 

By the way, Mark, does this driver work for you? I have tried it on both 
mini6410 and smdk6410 (configured to use the onboard AC97 codec), with both 
old and new DMA drivers and I couldn't get it to play a single sound.

Best regards,
Tomasz

> 
> Best regards,
> Jingoo Han
> 
> >  	}
> > 
> > @@ -433,13 +433,6 @@ static int s3c_ac97_probe(struct platform_device
> > *pdev)> 
> >  	init_completion(&s3c_ac97.done);
> >  	mutex_init(&s3c_ac97.lock);
> > 
> > -	s3c_ac97.regs = ioremap(mem_res->start, resource_size(mem_res));
> > -	if (s3c_ac97.regs == NULL) {
> > -		dev_err(&pdev->dev, "Unable to ioremap register region\n");
> > -		ret = -ENXIO;
> > -		goto err1;
> > -	}
> > -
> > 
> >  	s3c_ac97.ac97_clk = devm_clk_get(&pdev->dev, "ac97");
> >  	if (IS_ERR(s3c_ac97.ac97_clk)) {
> >  	
> >  		dev_err(&pdev->dev, "ac97 failed to get ac97_clock\n");
> > 
> > @@ -481,16 +474,13 @@ err4:
> >  err3:
> >  	clk_disable_unprepare(s3c_ac97.ac97_clk);
> >  
> >  err2:
> > -	iounmap(s3c_ac97.regs);
> > -err1:
> > -	release_mem_region(mem_res->start, resource_size(mem_res));
> > 
> >  	return ret;
> >  
> >  }
> >  
> >  static int s3c_ac97_remove(struct platform_device *pdev)
> >  {
> > 
> > -	struct resource *mem_res, *irq_res;
> > +	struct resource *irq_res;
> > 
> >  	asoc_dma_platform_unregister(&pdev->dev);
> >  	snd_soc_unregister_component(&pdev->dev);
> > 
> > @@ -501,12 +491,6 @@ static int s3c_ac97_remove(struct platform_device
> > *pdev)> 
> >  	clk_disable_unprepare(s3c_ac97.ac97_clk);
> > 
> > -	iounmap(s3c_ac97.regs);
> > -
> > -	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	if (mem_res)
> > -		release_mem_region(mem_res->start, resource_size(mem_res));
> > -
> > 
> >  	return 0;
> >  
> >  }
> > 
> > --
> > 1.8.3.1
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-samsung-soc" in the body of a message to
> > majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
