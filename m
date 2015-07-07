From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] [RFC PATCH] dmaengine: pl330: residual - do not reset on
 last descriptor.
Date: Tue, 7 Jul 2015 20:53:50 +0900
Message-ID: <CAJKOXPcGbzhOJLrS9FJqOou0tcEt69X3aYsUQO0VzrpteeX-ZA@mail.gmail.com>
References: <1436267131-19556-1-git-send-email-prahal@yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:36165 "EHLO
	mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756532AbbGGLxv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jul 2015 07:53:51 -0400
In-Reply-To: <1436267131-19556-1-git-send-email-prahal@yahoo.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alban Browaeys <alban.browaeys@gmail.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Vinod Koul <vinod.koul@intel.com>, gabriel@unseen.is, linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org, sylvester.nawrocki@gmail.com, Robert Baldyga <r.baldyga@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Alban Browaeys <prahal@yahoo.com>

2015-07-07 20:05 GMT+09:00 Alban Browaeys <alban.browaeys@gmail.com>:
> Removed the residual rest to zero on last descriptor.
>
> Also set residue granularity to BURST instead of SEGMENT.
> This last item needs more investigation before I could give a rationale
> for it.
>
> Signed-off-by: Alban Browaeys <prahal@yahoo.com>
> Reported-by: gabriel@unseen.is
> Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Fixes: aee4d1fac887 ("dmaengine: pl330: improve pl330_tx_status()
> function")
>

Hi,

I am not quite sure what bug you are trying to fix here. It isn't
described in commit message. Also I don't get why the residue=0 is
being removed. This will break the residue calculation...

Some time ago I posted a patch fixing sound issues on Odroid XU3.
Today Vinod applied it:
https://git.kernel.org/cgit/linux/kernel/git/vkoul/slave-dma.git/commit/?h=fixes&id=5dd90e5b91e0f5c925b12b132c7cd27538870256

I don't know if this is the same issue... can you describe exactly
what you are trying to fix, why and how?

Best regards,
Krzysztof

> ---
>
> My older local version of the residue :
> https://github.com/prahal/linux/blob/odroid-3.19/drivers/dma/pl330.c#L2230
>
> I took a second look at both and noticed that in the upstream version,
> I was not able to make sense of the "if desc->last then reset residual
> to zero" in the loop. Early tests gives a proper sound ouput with it
> removed.
>
> More tests are welcome, and it could be the flag change is wrong.
>
> There is also a bad interaction with pulseaudio when the buffer size is
> small : https://bugs.freedesktop.org/show_bug.cgi?id=84878. This
> might affect testing.
> ---
>  drivers/dma/pl330.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index f513f77..0851f41 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -2275,8 +2275,6 @@ pl330_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
>                         }
>                         break;
>                 }
> -               if (desc->last)
> -                       residual = 0;
>         }
>         spin_unlock_irqrestore(&pch->lock, flags);
>
> @@ -2890,7 +2888,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>         pd->src_addr_widths = PL330_DMA_BUSWIDTHS;
>         pd->dst_addr_widths = PL330_DMA_BUSWIDTHS;
>         pd->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
> -       pd->residue_granularity = DMA_RESIDUE_GRANULARITY_SEGMENT;
> +       pd->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
>
>         ret = dma_async_device_register(pd);
>         if (ret) {
> --
> 2.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
