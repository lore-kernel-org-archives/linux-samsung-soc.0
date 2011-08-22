From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v6 03/15] DMA: PL330: Support DMA_SLAVE_CONFIG command
Date: Mon, 22 Aug 2011 15:44:01 +0530
Message-ID: <CABb+yY0T70-LFmf2hso1nJbeJop+0GNwLNcYAHuBJguScWreLw@mail.gmail.com>
References: <1313744097-27289-1-git-send-email-boojin.kim@samsung.com>
	<1313744097-27289-4-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:36085 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756765Ab1HVKOD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 06:14:03 -0400
Received: by mail-bw0-f46.google.com with SMTP id 11so3541556bke.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Aug 2011 03:14:01 -0700 (PDT)
In-Reply-To: <1313744097-27289-4-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <dan.j.williams@intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>

On Fri, Aug 19, 2011 at 2:24 PM, Boojin Kim <boojin.kim@samsung.com> wr=
ote:
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Vinod Koul <vinod.koul@intel.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =C2=A0drivers/dma/pl330.c | =C2=A0 56 +++++++++++++++++++++++++++++++=
+++++++------------
> =C2=A01 files changed, 42 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index d5829c7..59943ec 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -73,6 +73,7 @@ struct dma_pl330_chan {
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* For D-to-M and M-to-D channels */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int burst_sz; /* the peripheral fifo width=
 */
> + =C2=A0 =C2=A0 =C2=A0 int burst_len; /* the number of burst */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t fifo_addr;
> =C2=A0};
>
> @@ -261,25 +262,52 @@ static int pl330_alloc_chan_resources(struct dm=
a_chan *chan)
> =C2=A0static int pl330_control(struct dma_chan *chan, enum dma_ctrl_c=
md cmd, unsigned long arg)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_pl330_chan *pch =3D to_pchan(ch=
an);
> - =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_desc *desc;
> + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_desc *desc, *_dt;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;
> + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_dmac *pdmac =3D pch->dmac;
> + =C2=A0 =C2=A0 =C2=A0 struct dma_slave_config *slave_config;
> + =C2=A0 =C2=A0 =C2=A0 LIST_HEAD(list);
>
> - =C2=A0 =C2=A0 =C2=A0 /* Only supports DMA_TERMINATE_ALL */
> - =C2=A0 =C2=A0 =C2=A0 if (cmd !=3D DMA_TERMINATE_ALL)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;
> -
> - =C2=A0 =C2=A0 =C2=A0 spin_lock_irqsave(&pch->lock, flags);
> -
> - =C2=A0 =C2=A0 =C2=A0 /* FLUSH the PL330 Channel thread */
> - =C2=A0 =C2=A0 =C2=A0 pl330_chan_ctrl(pch->pl330_chid, PL330_OP_FLUS=
H);
> + =C2=A0 =C2=A0 =C2=A0 switch (cmd) {
> + =C2=A0 =C2=A0 =C2=A0 case DMA_TERMINATE_ALL:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock_irqsave(=
&pch->lock, flags);
>
> - =C2=A0 =C2=A0 =C2=A0 /* Mark all desc done */
> - =C2=A0 =C2=A0 =C2=A0 list_for_each_entry(desc, &pch->work_list, nod=
e)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc->status =3D D=
ONE;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FLUSH the PL330=
 Channel thread */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pl330_chan_ctrl(pc=
h->pl330_chid, PL330_OP_FLUSH);
>
> - =C2=A0 =C2=A0 =C2=A0 spin_unlock_irqrestore(&pch->lock, flags);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Mark all desc d=
one */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list_for_each_entr=
y_safe(desc, _dt, &pch->work_list , node) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 desc->status =3D DONE;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pch->completed =3D desc->txd.cookie;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 list_move_tail(&desc->node, &list);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>
> - =C2=A0 =C2=A0 =C2=A0 pl330_tasklet((unsigned long) pch);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list_splice_tail_i=
nit(&list, &pdmac->desc_pool);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock_irqres=
tore(&pch->lock, flags);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 case DMA_SLAVE_CONFIG:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 slave_config =3D (=
struct dma_slave_config *)arg;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (slave_config->=
direction =3D=3D DMA_TO_DEVICE) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (slave_config->dst_addr)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pch->fifo_addr =3D slave_config->ds=
t_addr;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (slave_config->dst_addr_width)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pch->burst_sz =3D __ffs(slave_confi=
g->dst_addr_width);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (slave_config->dst_maxburst)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pch->burst_len =3D slave_config->ds=
t_maxburst;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (slave_c=
onfig->direction =3D=3D DMA_FROM_DEVICE) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (slave_config->src_addr)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pch->fifo_addr =3D slave_config->sr=
c_addr;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (slave_config->src_addr_width)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pch->burst_sz =3D __ffs(slave_confi=
g->src_addr_width);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (slave_config->src_maxburst)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pch->burst_len =3D slave_config->sr=
c_maxburst;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 default:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(pch->dmac-=
>pif.dev, "Not supported command.\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;
> + =C2=A0 =C2=A0 =C2=A0 }

Apart from the alleged purpose "Support DMA_SLAVE_CONFIG command"
this patch also modifies the behavior of DMA_TERMINATE_ALL.
If the change is intended, please split it into two patches and
explain the reason.
Otherwise, restore the behavior.
