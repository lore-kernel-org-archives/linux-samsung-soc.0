From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V4 03-1/13] DMA: PL330: Support DMA_SLAVE_CONFIG command
Date: Thu, 21 Jul 2011 00:47:49 +0530
Message-ID: <CABb+yY2_XKyCr2mEzqd0bCYJk3U7+sg8Xz4b4ma2KB1BconYOw@mail.gmail.com>
References: <1311158773-30314-1-git-send-email-boojin.kim@samsung.com>
	<1311158773-30314-3-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:39500 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751868Ab1GTTRv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2011 15:17:51 -0400
Received: by ewy4 with SMTP id 4so747690ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2011 12:17:49 -0700 (PDT)
In-Reply-To: <1311158773-30314-3-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene.kim@samsung.com>

On Wed, Jul 20, 2011 at 4:16 PM, Boojin Kim <boojin.kim@samsung.com> wr=
ote:
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =C2=A0drivers/dma/pl330.c | =C2=A0 53 +++++++++++++++++++++++++++++++=
++++++-------------
> =C2=A01 files changed, 39 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 586ab39..880f010 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -256,25 +256,50 @@ static int pl330_alloc_chan_resources(struct dm=
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
> + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_peri *peri;
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
Please protect this section too using spin_lock.


> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (slave_config->=
direction =3D=3D DMA_TO_DEVICE) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (slave_config->dst_addr)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 peri->fifo_addr =3D slave_config->d=
st_addr;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (slave_config->dst_addr_width)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 peri->burst_sz =3D __ffs(slave_conf=
ig->dst_addr_width);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (slave_c=
onfig->direction =3D=3D DMA_FROM_DEVICE) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (slave_config->src_addr)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 peri->fifo_addr =3D slave_config->s=
rc_addr;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (slave_config->src_addr_width)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 peri->burst_sz =3D __ffs(slave_conf=
ig->src_addr_width);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
PL330 has fixed channels to peripherals.
So FIFO addresses(burst_sz too?) should already be set via platform dat=
a.
Client drivers shouldn't bother.

<will review remaining patches soon, gotta go now>
