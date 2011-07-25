From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V4 04/14] DMA: PL330: Add DMA_CYCLIC capability
Date: Mon, 25 Jul 2011 16:54:28 +0530
Message-ID: <CABb+yY1x=E4pO8Uyrz9+cs-B-NuhqzXzQwcxKCkrm0mthp0FWA@mail.gmail.com>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
	<1311557312-26107-5-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f52.google.com ([209.85.161.52]:35029 "EHLO
	mail-fx0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673Ab1GYLYa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 07:24:30 -0400
Received: by fxd18 with SMTP id 18so8937126fxd.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Jul 2011 04:24:28 -0700 (PDT)
In-Reply-To: <1311557312-26107-5-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Mon, Jul 25, 2011 at 6:58 AM, Boojin Kim <boojin.kim@samsung.com> wr=
ote:
> This patch adds DMA_CYCLIC capability that is used for audio driver.
> DMA driver with DMA_CYCLIC capability reuses the dma requests that
> were submitted through tx_submit().
>
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> ---
> =C2=A0drivers/dma/pl330.c | =C2=A0111 +++++++++++++++++++++++++++++++=
++++++++++++++++++++
> =C2=A01 files changed, 111 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 880f010..121c75a 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -69,6 +69,11 @@ struct dma_pl330_chan {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * NULL if the channel is available to be =
acquired.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0void *pl330_chid;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* taks for cyclic capability */
> + =C2=A0 =C2=A0 =C2=A0 struct tasklet_struct *cyclic_task;
> +
> + =C2=A0 =C2=A0 =C2=A0 bool cyclic;
> =C2=A0};
We already have a tasklet_struct member here.
This 'cyclic' flag can indicate if we are doing cyclic or serial
transfers. So, this cyclic_task seems unnecessary.

> +static void pl330_tasklet_cyclic(unsigned long data)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_chan *pch =3D (struct dma_pl3=
30_chan *)data;
> + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_desc *desc, *_dt;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long flags;
> + =C2=A0 =C2=A0 =C2=A0 LIST_HEAD(list);
> +
> + =C2=A0 =C2=A0 =C2=A0 spin_lock_irqsave(&pch->lock, flags);
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Pick up ripe tomatoes */
> + =C2=A0 =C2=A0 =C2=A0 list_for_each_entry_safe(desc, _dt, &pch->work=
_list, node)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (desc->status =3D=
=3D DONE) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dma_async_tx_callback callback;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 list_move_tail(&desc->node, &pch->work_list);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pch->completed =3D desc->txd.cookie;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 desc->status =3D PREP;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 /* Try to submit a req imm.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 next to the last completed cookie */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 fill_queue(pch);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 /* Make sure the PL330 Channel thread is active */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pl330_chan_ctrl(pch->pl330_chid, PL330_OP_START);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 callback =3D desc->txd.callback;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (callback)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callback(desc->txd.callback_param);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 spin_unlock_irqrestore(&pch->lock, flags);
> +}
Please merge this with pl330_tasklet and use 'cyclic' flag to different=
iate.

> @@ -227,6 +267,9 @@ static void dma_pl330_rqcb(void *token, enum pl33=
0_op_err err)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&pch->lock, flags);
>
> + =C2=A0 =C2=A0 =C2=A0 if (pch->cyclic_task)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tasklet_schedule(p=
ch->cyclic_task);
> + =C2=A0 =C2=A0 =C2=A0 else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0tasklet_schedule(&pch->task);
A tab here please, and check for 'cyclic' flag.


> @@ -316,6 +359,15 @@ static void pl330_free_chan_resources(struct dma=
_chan *chan)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pl330_release_channel(pch->pl330_chid);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pch->pl330_chid =3D NULL;
>
> + =C2=A0 =C2=A0 =C2=A0 if (pch->cyclic) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pch->cyclic =3D fa=
lse;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list_splice_tail_i=
nit(&pch->work_list, &pch->dmac->desc_pool);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pch->cyclic_ta=
sk) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tasklet_kill(pch->cyclic_task);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pch->cyclic_task =3D NULL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&pch->lock, flags);
> =C2=A0}
To be explicit, please initialize 'cyclic' flag to false in
pl330_alloc_chan_resources
