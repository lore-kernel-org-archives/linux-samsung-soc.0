From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [RFC PATCH] DMA: PL330: Update PL330 DMAC to support runtime PM
Date: Wed, 27 Jul 2011 13:01:20 +0530
Message-ID: <CABb+yY1wnOaSRwv1ZV=5o4v1wCWq_2FZadus5kP=bwb4-8C2Sw@mail.gmail.com>
References: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com>
	<1311744697-10264-2-git-send-email-boojin.kim@samsung.com>
	<4E2FACC3.2010109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f52.google.com ([209.85.161.52]:50818 "EHLO
	mail-fx0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750790Ab1G0HbW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 03:31:22 -0400
Received: by fxd18 with SMTP id 18so6041fxd.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2011 00:31:20 -0700 (PDT)
In-Reply-To: <4E2FACC3.2010109@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Boojin Kim <boojin.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Wed, Jul 27, 2011 at 11:44 AM, Chanwoo Choi <cw00.choi@samsung.com> =
wrote:
> This patch update runtime PM for PL330 DMAC to reduce power consumpti=
on.
>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> The following patch support runtime PM for PL330 DMAC, but the clock
> of PL330 is always on. If the clock of PL330 is always on, additional=
 power
> (10mA) is consumed.

Yes, we need to do this, but please do it in drivers/dma/pl330.c so tha=
t
every platform benefits.

> diff --git a/include/linux/amba/pl330.h b/include/linux/amba/pl330.h
> index 17b0ada..d9a63fd 100644
> --- a/include/linux/amba/pl330.h
> +++ b/include/linux/amba/pl330.h
> @@ -12,6 +12,9 @@
> =C2=A0#ifndef =C2=A0 =C2=A0 =C2=A0 =C2=A0__AMBA_PL330_H_
> =C2=A0#define =C2=A0 =C2=A0 =C2=A0 =C2=A0__AMBA_PL330_H_
>
> +#include <linux/dmaengine.h>
> +#include <linux/interrupt.h>
> +
> =C2=A0#include <asm/hardware/pl330.h>
>
> =C2=A0struct dma_pl330_peri {
> @@ -42,4 +45,55 @@ struct dma_pl330_platdata {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned mcbuf_sz;
> =C2=A0};
>
> +struct dma_pl330_chan {
> + =C2=A0 =C2=A0 =C2=A0 /* Schedule desc completion */
> + =C2=A0 =C2=A0 =C2=A0 struct tasklet_struct task;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* DMA-Engine Channel */
> + =C2=A0 =C2=A0 =C2=A0 struct dma_chan chan;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Last completed cookie */
> + =C2=A0 =C2=A0 =C2=A0 dma_cookie_t completed;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* List of to be xfered descriptors */
> + =C2=A0 =C2=A0 =C2=A0 struct list_head work_list;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Pointer to the DMAC that manages this chann=
el,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* NULL if the channel is available to be=
 acquired.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* As the parent, this DMAC also provides=
 descriptors
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* to the channel.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_dmac *dmac;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* To protect channel manipulation */
> + =C2=A0 =C2=A0 =C2=A0 spinlock_t lock;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Token of a hardware channel thread of PL330=
 DMAC
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* NULL if the channel is available to be=
 acquired.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> + =C2=A0 =C2=A0 =C2=A0 void *pl330_chid;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* taks for cyclic capability */
> + =C2=A0 =C2=A0 =C2=A0 struct tasklet_struct *cyclic_task;
> +
> + =C2=A0 =C2=A0 =C2=A0 bool cyclic;
> +};
> +
> +struct dma_pl330_dmac {
> + =C2=A0 =C2=A0 =C2=A0 struct pl330_info pif;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* DMA-Engine Device */
> + =C2=A0 =C2=A0 =C2=A0 struct dma_device ddma;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Pool of descriptors available for the DMAC'=
s channels */
> + =C2=A0 =C2=A0 =C2=A0 struct list_head desc_pool;
> + =C2=A0 =C2=A0 =C2=A0 /* To protect desc_pool manipulation */
> + =C2=A0 =C2=A0 =C2=A0 spinlock_t pool_lock;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Peripheral channels connected to this DMAC =
*/
> + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_chan peripherals[0]; /* keep =
at end */
> +
> + =C2=A0 =C2=A0 =C2=A0 struct clk *clk;
> +};
> +
> =C2=A0#endif /* __AMBA_PL330_H_ */

struct dma_pl330_dmac and struct dma_pl330_chan are internal to the
pl330 dmac driver. Nobody from outside should ever need them.

Thanks,
Jassi
