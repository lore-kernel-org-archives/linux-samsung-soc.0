From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: samsung: Use IRQ safe spin lock calls
Date: Fri, 19 Feb 2016 11:59:03 +0100
Message-ID: <56C6F577.5050007@samsung.com>
References: <1455810433-10305-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:29475 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750734AbcBSLB6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Feb 2016 06:01:58 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2S004UBJZ7E920@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Feb 2016 11:01:55 +0000 (GMT)
In-reply-to: <1455810433-10305-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, patches@opensource.wolfsonmicro.com, lgirdwood@gmail.com

On 18/02/16 16:47, Charles Keepax wrote:
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

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
