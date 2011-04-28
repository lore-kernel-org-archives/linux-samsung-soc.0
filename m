From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [alsa-devel] [PATCH V2] ASoC: SAMSUNG: Add quirk to support
	Exynos4 PCM audio
Date: Thu, 28 Apr 2011 14:20:29 +0900
Message-ID: <011d01cc0564$0646bf30$12d43d90$@com>
References: <1303953789-18445-1-git-send-email-sbkim73@samsung.com>
 <BANLkTi=q6aBbe6AY1x3XYdLB_6Ao95_tHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39248 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753683Ab1D1FUq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Apr 2011 01:20:46 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LKC0004AK68AGN0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 28 Apr 2011 14:20:44 +0900 (KST)
Received: from DOSBKIM7301 ([12.23.103.65])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LKC005GBK6KKC@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 28 Apr 2011 14:20:44 +0900 (KST)
In-reply-to: <BANLkTi=q6aBbe6AY1x3XYdLB_6Ao95_tHQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: alsa-devel@alsa-project.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, lrg@slimlogic.co.uk


On Thu, Apr 28, 2011 2:01 PM, Jassi Brar <jassisinghbrar@gmail.com> wrote:
> Subject: Re: [alsa-devel] [PATCH V2] ASoC: SAMSUNG: Add quirk to support
> Exynos4 PCM audio
> 
> On Thu, Apr 28, 2011 at 6:53 AM, Sangbeom Kim <sbkim73@samsung.com> wrote:
> > Exynos4 pcm block is different from previous one.
> > Unlike previous one, Exynos4 doesn't have SCLK divider in the pcm block.
> > For this reason, This patch added quirk handling for Exynos4 pcm cpu
> driver.
> >
> > Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> > ---
> >  sound/soc/samsung/pcm.c |   46 +++++++++++++++++++++++++++++-----------
> ------
> >  1 files changed, 29 insertions(+), 17 deletions(-)
> >
> > diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
> > index 9c7e8b4..adfb251 100644
> > --- a/sound/soc/samsung/pcm.c
> > +++ b/sound/soc/samsung/pcm.c
> > @@ -10,7 +10,6 @@
> >  * it under the terms of the GNU General Public License version 2 as
> >  * published by the Free Software Foundation.
> >  */
> > -
> >  #include <linux/clk.h>
> >  #include <linux/io.h>
> >
> > @@ -128,6 +127,7 @@ struct s3c_pcm_info {
> >
> >        struct s3c_dma_params   *dma_playback;
> >        struct s3c_dma_params   *dma_capture;
> > +       u32     quirks;
> >  };
> >
> >  static struct s3c2410_dma_client s3c_pcm_dma_client_out = {
> > @@ -278,7 +278,7 @@ static int s3c_pcm_hw_params(struct
> snd_pcm_substream *substream,
> >        struct clk *clk;
> >        int sclk_div, sync_div;
> >        unsigned long flags;
> > -       u32 clkctl;
> > +       u32 clkctl = 0;
> >
> >        dev_dbg(pcm->dev, "Entered %s\n", __func__);
> >
> > @@ -299,25 +299,34 @@ static int s3c_pcm_hw_params(struct
> snd_pcm_substream *substream,
> >
> >        spin_lock_irqsave(&pcm->lock, flags);
> >
> > -       /* Get hold of the PCMSOURCE_CLK */
> > -       clkctl = readl(regs + S3C_PCM_CLKCTL);
> > -       if (clkctl & S3C_PCM_CLKCTL_SERCLKSEL_PCLK)
> > -               clk = pcm->pclk;
> > -       else
> > +       if (pcm->quirks == QUIRK_NO_DIV) {
> >                clk = pcm->cclk;
> > +               if (clk_get_rate(clk) != (pcm-
> >sclk_per_fs*params_rate(params))) {
> > +                       clk_set_rate(clk, pcm-
> >sclk_per_fs*params_rate(params));
> > +               }
> > +               sync_div = clk_get_rate(clk)/(params_rate(params))-1;
> > +       }
> > +       else {
> > +               /* Get hold of the PCMSOURCE_CLK */
> > +               clkctl = readl(regs + S3C_PCM_CLKCTL);
> > +               if (clkctl & S3C_PCM_CLKCTL_SERCLKSEL_PCLK)
> > +                       clk = pcm->pclk;
> > +               else
> > +                       clk = pcm->cclk;
> >
> > -       /* Set the SCLK divider */
> > -       sclk_div = clk_get_rate(clk) / pcm->sclk_per_fs /
> > -                                       params_rate(params) / 2 - 1;
> > +               /* Set the SCLK divider */
> > +               sclk_div = clk_get_rate(clk) / pcm->sclk_per_fs /
> > +                               params_rate(params) / 2 - 1;
> >
> > -       clkctl &= ~(S3C_PCM_CLKCTL_SCLKDIV_MASK
> > -                       << S3C_PCM_CLKCTL_SCLKDIV_SHIFT);
> > -       clkctl |= ((sclk_div & S3C_PCM_CLKCTL_SCLKDIV_MASK)
> > -                       << S3C_PCM_CLKCTL_SCLKDIV_SHIFT);
> > +               clkctl &= ~(S3C_PCM_CLKCTL_SCLKDIV_MASK
> > +                               << S3C_PCM_CLKCTL_SCLKDIV_SHIFT);
> > +               clkctl |= ((sclk_div & S3C_PCM_CLKCTL_SCLKDIV_MASK)
> > +                               << S3C_PCM_CLKCTL_SCLKDIV_SHIFT);
> >
> > -       /* Set the SYNC divider */
> > -       sync_div = pcm->sclk_per_fs - 1;
> > +               sync_div = pcm->sclk_per_fs - 1;
> > +       }
> >
> > +       /* Set the SYNC divider */
> >        clkctl &= ~(S3C_PCM_CLKCTL_SYNCDIV_MASK
> >                                << S3C_PCM_CLKCTL_SYNCDIV_SHIFT);
> >        clkctl |= ((sync_div & S3C_PCM_CLKCTL_SYNCDIV_MASK)
> > @@ -330,7 +339,6 @@ static int s3c_pcm_hw_params(struct
> snd_pcm_substream *substream,
> >        dev_dbg(pcm->dev, "PCMSOURCE_CLK-%lu SCLK=%ufs SCLK_DIV=%d
> SYNC_DIV=%d\n",
> >                                clk_get_rate(clk), pcm->sclk_per_fs,
> >                                sclk_div, sync_div);
> > -
> >        return 0;
> >  }
> >
> > @@ -494,6 +502,7 @@ static __devinit int s3c_pcm_dev_probe(struct
> platform_device *pdev)
> >        struct s3c_pcm_info *pcm;
> >        struct resource *mem_res, *dmatx_res, *dmarx_res;
> >        struct s3c_audio_pdata *pcm_pdata;
> > +       struct samsung_i2s *pcm_cfg;
> 
> Oh dear, perhaps you forgot to test before sending ?

I did test and PCM working is fine on SMDKV310 and SMDKV210.
But It was my mistake. samsung_i2s was used unintentionally.
I will resubmit it.
Thanks,

> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel
