From: Liam Girdwood <lrg@slimlogic.co.uk>
Subject: Re: [alsa-devel] [PATCH] ASoC: SAMSUNG: Fix the inverted clocks
 handling for pcm driver
Date: Mon, 11 Apr 2011 20:53:50 +0100
Message-ID: <1302551630.3449.58.camel@odin>
References: <1302314038-11398-1-git-send-email-sbkim73@samsung.com>
	 <BANLkTinbH6AUKvSxu4xa4U=UEZd4zvT-Qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:41959 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755675Ab1DKTx4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2011 15:53:56 -0400
Received: by wwa36 with SMTP id 36so7073357wwa.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Apr 2011 12:53:55 -0700 (PDT)
In-Reply-To: <BANLkTinbH6AUKvSxu4xa4U=UEZd4zvT-Qg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Sat, 2011-04-09 at 10:15 +0530, Jassi Brar wrote:
> On Sat, Apr 9, 2011 at 7:23 AM, Sangbeom Kim <sbkim73@samsung.com> wrote:
> > Fix the inverted clocks handling for pcm cpu driver.
> > By using SND_SOC_DAIFMT_NB_NF, Audio noise can be generated on SMDK.
> >
> > Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> > ---
> >  sound/soc/samsung/pcm.c |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
> > index 38aac7d..9c7e8b4 100644
> > --- a/sound/soc/samsung/pcm.c
> > +++ b/sound/soc/samsung/pcm.c
> > @@ -350,8 +350,8 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cpu_dai,
> >        ctl = readl(regs + S3C_PCM_CTL);
> >
> >        switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> > -       case SND_SOC_DAIFMT_NB_NF:
> > -               /* Nothing to do, NB_NF by default */
> > +       case SND_SOC_DAIFMT_IB_NF:
> > +               /* Nothing to do, IB_NF by default */
> 
> Assuming you already compared screenshot
> of a scope and what's mentioned in the manual for IB_NF  ...
> 
> Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

Acked-by: Liam Girdwood <lrg@ti.com>
