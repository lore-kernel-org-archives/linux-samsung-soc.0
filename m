From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [alsa-devel] [PATCH 3/3] SoC: SAMSUNG: Add WM8580 PCM	Machine
	driver
Date: Thu, 07 Apr 2011 11:05:22 +0900
Message-ID: <041801cbf4c8$51ca7390$f55f5ab0$@com>
References: <1302136270-28776-1-git-send-email-sbkim73@samsung.com>
 <1302136270-28776-4-git-send-email-sbkim73@samsung.com>
 <20110407011704.GA21071@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45042 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932102Ab1DGCFy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Apr 2011 22:05:54 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LJ9004URF5R8T30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Apr 2011 11:05:51 +0900 (KST)
Received: from DOSBKIM7301 ([12.23.103.65])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LJ900E9NF5RRM@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Apr 2011 11:05:51 +0900 (KST)
In-reply-to: <20110407011704.GA21071@sirena.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, kgene.kim@samsung.com, jassisinghbrar@gmail.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk

Hi Mark,


On Thu, Apr 07, 2011 at 10:17:10AM +0900, Mark Brown wrote:

> > +config SND_SOC_SAMSUNG_SMDK_WM8580_PCM
> > +	tristate
> > +
> 
> What is the purpose of this variable?  Just the config for the machine
> should be enough.
Ok, I will remove it and use machine config.

> 
> > @@ -1,12 +1,12 @@
> > -# S3c24XX Platform Support
> > +# SAMSUNG Platform Support
> >  snd-soc-s3c24xx-objs := dma.o
> >  snd-soc-s3c24xx-i2s-objs := s3c24xx-i2s.o
> >  snd-soc-s3c2412-i2s-objs := s3c2412-i2s.o
> >  snd-soc-ac97-objs := ac97.o
> >  snd-soc-s3c-i2s-v2-objs := s3c-i2s-v2.o
> >  snd-soc-samsung-spdif-objs := spdif.o
> > -snd-soc-pcm-objs := pcm.o
> > -snd-soc-i2s-objs := i2s.o
> > +snd-soc-samsung-pcm-objs := pcm.o
> > +snd-soc-samsung-i2s-objs := i2s.o
> 
> These changes all look reasonable but they're unrelated to adding the
> machine driver and should be split out.
Ok, I will split out.

> 
> > diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
> > index 38aac7d..9c7e8b4 100644
> > --- a/sound/soc/samsung/pcm.c
> > +++ b/sound/soc/samsung/pcm.c
> > @@ -350,8 +350,8 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai
> *cpu_dai,
> >  	ctl = readl(regs + S3C_PCM_CTL);
> >
> >  	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> > -	case SND_SOC_DAIFMT_NB_NF:
> > -		/* Nothing to do, NB_NF by default */
> > +	case SND_SOC_DAIFMT_IB_NF:
> > +		/* Nothing to do, IB_NF by default */
> >  		break;
> 
> Similarly here, this is a bug fix so should be merged for 2.6.39.
I will submit another bug fix patch for this.

> 
> > +	smdk_snd_device = platform_device_alloc("soc-audio", -1);
> > +	if (!smdk_snd_device)
> > +		return -ENOMEM;
> 
> Please use snd_soc_register_card() for new machines rather than the
> soc-audio device.  Otherwise the actual driver itself looks good.
Ok I will apply it.

> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel


Thanks and Regards,
SB Kim
