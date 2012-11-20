From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: S3C24XX: Fix potential NULL pointer dereference error
Date: Tue, 20 Nov 2012 10:28:25 +0530
Message-ID: <CAK9yfHyJ1r7KeNHfUAnNhZRBaV+_grjr=pP6r3a7yHoeWywt9A@mail.gmail.com>
References: <1352365291-32433-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:48646 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751428Ab2KTE60 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Nov 2012 23:58:26 -0500
Received: by mail-vc0-f174.google.com with SMTP id m18so1999160vcm.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Nov 2012 20:58:26 -0800 (PST)
In-Reply-To: <1352365291-32433-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

ping Kukjin.

On 8 November 2012 14:31, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> chan->end is tested for being NULL. However in the event that it is NULL, the
> subsequent assignment statement would lead to NULL pointer dereference.
> Thus dereferencing it only when it is not NULL.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> Based on Kukjin Kim's for-next branch. Compile tested.
> ---
>  arch/arm/plat-s3c24xx/dma.c |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/plat-s3c24xx/dma.c b/arch/arm/plat-s3c24xx/dma.c
> index db98e70..0abd1c4 100644
> --- a/arch/arm/plat-s3c24xx/dma.c
> +++ b/arch/arm/plat-s3c24xx/dma.c
> @@ -473,12 +473,13 @@ int s3c2410_dma_enqueue(enum dma_ch channel, void *id,
>                 pr_debug("dma%d: %s: buffer %p queued onto non-empty channel\n",
>                          chan->number, __func__, buf);
>
> -               if (chan->end == NULL)
> +               if (chan->end == NULL) {
>                         pr_debug("dma%d: %s: %p not empty, and chan->end==NULL?\n",
>                                  chan->number, __func__, chan);
> -
> -               chan->end->next = buf;
> -               chan->end = buf;
> +               } else {
> +                       chan->end->next = buf;
> +                       chan->end = buf;
> +               }
>         }
>
>         /* if necessary, update the next buffer field */
> --
> 1.7.4.1
>



-- 
With warm regards,
Sachin
