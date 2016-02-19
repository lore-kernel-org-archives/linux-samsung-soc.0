From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH] ASoC: samsung: Use IRQ safe spin lock calls
Date: Fri, 19 Feb 2016 10:19:59 +0530
Message-ID: <CANAwSgR1b6jL6RP4SyFGS8o8geaFu29bMZntXLCLj8-H7gzidw@mail.gmail.com>
References: <1455810433-10305-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:33722 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1424911AbcBSEuU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Feb 2016 23:50:20 -0500
Received: by mail-wm0-f46.google.com with SMTP id g62so53143024wme.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Feb 2016 20:50:20 -0800 (PST)
In-Reply-To: <1455810433-10305-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kim Sangbeom <sbkim73@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, alsa-devel@alsa-project.org, patches@opensource.wolfsonmicro.com

hi Charles,

On 18 February 2016 at 21:17, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:
> Lockdep warns of a potential lock inversion, i2s->lock is held numerous
> times whilst we are under the substream lock (snd_pcm_stream_lock). If
> we use the IRQ unsafe spin lock calls, you can also end up locking
> snd_pcm_stream_lock whilst under i2s->lock (if an IRQ happens whilst we
> are holding i2s->lock). This could result in deadlock.
>
> [   18.147001]        CPU0                    CPU1
> [   18.151509]        ----                    ----
> [   18.156022]   lock(&(&pri_dai->spinlock)->rlock);
> [   18.160701]                                local_irq_disable();
> [   18.166622]                                lock(&(&substream->self_group.lock)->rlock);
> [   18.174595]                                lock(&(&pri_dai->spinlock)->rlock);
> [   18.181806]   <Interrupt>
> [   18.184408]     lock(&(&substream->self_group.lock)->rlock);
> [   18.190045]
> [   18.190045]  *** DEADLOCK ***
>
> This patch changes to using the irq safe spinlock calls, to avoid this
> issue.
>
> Fixes: ce8bcdbb61d9 ("ASoC: samsung: i2s: Protect more registers with a spinlock")
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  sound/soc/samsung/i2s.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index 84d9e77..70a2559 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -481,10 +481,11 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
>         unsigned int cdcon_mask = 1 << i2s_regs->cdclkcon_off;
>         unsigned int rsrc_mask = 1 << i2s_regs->rclksrc_off;
>         u32 mod, mask, val = 0;
> +       unsigned long flags;
>
> -       spin_lock(i2s->lock);
> +       spin_lock_irqsave(i2s->lock, flags);
>         mod = readl(i2s->addr + I2SMOD);
> -       spin_unlock(i2s->lock);
> +       spin_unlock_irqrestore(i2s->lock, flags);
>
>         switch (clk_id) {
>         case SAMSUNG_I2S_OPCLK:
> @@ -575,11 +576,11 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
>                 return -EINVAL;
>         }
>
> -       spin_lock(i2s->lock);
> +       spin_lock_irqsave(i2s->lock, flags);
>         mod = readl(i2s->addr + I2SMOD);
>         mod = (mod & ~mask) | val;
>         writel(mod, i2s->addr + I2SMOD);
> -       spin_unlock(i2s->lock);
> +       spin_unlock_irqrestore(i2s->lock, flags);
>
>         return 0;
>  }
> @@ -590,6 +591,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
>         struct i2s_dai *i2s = to_info(dai);
>         int lrp_shift, sdf_shift, sdf_mask, lrp_rlow, mod_slave;
>         u32 mod, tmp = 0;
> +       unsigned long flags;
>
>         lrp_shift = i2s->variant_regs->lrp_off;
>         sdf_shift = i2s->variant_regs->sdf_off;
> @@ -649,7 +651,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
>                 return -EINVAL;
>         }
>
> -       spin_lock(i2s->lock);
> +       spin_lock_irqsave(i2s->lock, flags);
>         mod = readl(i2s->addr + I2SMOD);
>         /*
>          * Don't change the I2S mode if any controller is active on this
> @@ -657,7 +659,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
>          */
>         if (any_active(i2s) &&
>                 ((mod & (sdf_mask | lrp_rlow | mod_slave)) != tmp)) {
> -               spin_unlock(i2s->lock);
> +               spin_unlock_irqrestore(i2s->lock, flags);
>                 dev_err(&i2s->pdev->dev,
>                                 "%s:%d Other DAI busy\n", __func__, __LINE__);
>                 return -EAGAIN;
> @@ -666,7 +668,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
>         mod &= ~(sdf_mask | lrp_rlow | mod_slave);
>         mod |= tmp;
>         writel(mod, i2s->addr + I2SMOD);
> -       spin_unlock(i2s->lock);
> +       spin_unlock_irqrestore(i2s->lock, flags);
>
>         return 0;
>  }
> @@ -676,6 +678,7 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
>  {
>         struct i2s_dai *i2s = to_info(dai);
>         u32 mod, mask = 0, val = 0;
> +       unsigned long flags;
>
>         if (!is_secondary(i2s))
>                 mask |= (MOD_DC2_EN | MOD_DC1_EN);
> @@ -744,11 +747,11 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
>                 return -EINVAL;
>         }
>
> -       spin_lock(i2s->lock);
> +       spin_lock_irqsave(i2s->lock, flags);
>         mod = readl(i2s->addr + I2SMOD);
>         mod = (mod & ~mask) | val;
>         writel(mod, i2s->addr + I2SMOD);
> -       spin_unlock(i2s->lock);
> +       spin_unlock_irqrestore(i2s->lock, flags);
>
>         samsung_asoc_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);
>
> --
> 2.1.4
>

Thanks for fixing this bug.
Tested on Odroid U3.
Tested-by: Anand Moon <linux.amoon@gmail.com>

-Anand Moon
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
