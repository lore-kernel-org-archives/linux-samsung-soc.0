From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH v2 2/4] ASoC: Drop
 SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag
Date: Tue, 25 Oct 2016 18:28:20 +0200
Message-ID: <a5e0592d-3034-1ec2-31fd-6c1ceb8d1052@metafoo.de>
References: <1477408121-24716-1-git-send-email-s.nawrocki@samsung.com>
 <1477408121-24716-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www381.your-server.de ([78.46.137.84]:42570 "EHLO
        www381.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936309AbcJYQ22 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Oct 2016 12:28:28 -0400
In-Reply-To: <1477408121-24716-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, broonie@kernel.org
Cc: krzk@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org

On 10/25/2016 05:08 PM, Sylwester Nawrocki wrote:
> Since commit 194c7dea00c68c1b1f8ff26304fa937a006f66dd
> "ASoC: dmaengine: add custom DMA config to snd_dmaengine_pcm_config"
> custom DMA channels can be also specified in chan_names[] field of
> struct snd_dmaengine_pcm_config.  This patch removes chan_name field
> of struct snd_dmaengine_dai_dma_data as it is now unused.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Acked-by: Lars-Peter Clausen <lars@metafoo.de>

Thanks.
