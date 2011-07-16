From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH V2 03/12] DMA: PL330: Add DMA capabilities
Date: Sat, 16 Jul 2011 10:11:11 +0900
Message-ID: <001401cc4355$409c2d80$c1d48880$%kim@samsung.com>
References: <1310546857-6304-1-git-send-email-kgene.kim@samsung.com>
 <1310546857-6304-4-git-send-email-kgene.kim@samsung.com>
 <CAPTzV17kaSCP8bnQQKSwL_-97r3dQVBY5L-r+u4Sv9TXH2nwew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64492 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752702Ab1GPBLO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2011 21:11:14 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOE002PBJAO5OF0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 10:11:12 +0900 (KST)
Received: from DOBOOJINKIM03 (12-23-120-72.csky.net [12.23.120.72])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOE0069AJAOV7@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 10:11:12 +0900 (KST)
In-reply-to: <CAPTzV17kaSCP8bnQQKSwL_-97r3dQVBY5L-r+u4Sv9TXH2nwew@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanho Park' <parkch98@gmail.com>, 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Liam Girdwood' <lrg@ti.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Linus Walleij' <linus.walleij@linaro.org>



Chanho Park wrote:

> 2011/7/13 Kukjin Kim <kgene.kim@samsung.com>:
> > From: Boojin Kim <boojin.kim@samsung.com>
> >
> > This patch adds DMA_CYCLIC capability that is used for audio driver
> > and SLAVE_CONFIG capability for transmit between device and memory.
> >
> > Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> > Cc: Vinod Koul <vinod.koul@intel.com>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0drivers/dma/pl330.c | =A0187
> +++++++++++++++++++++++++++++++++++++++++++++++----
> > =A01 files changed, 173 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> > index 9bdda7b..2162ac5 100644
> > --- a/drivers/dma/pl330.c
> > +++ b/drivers/dma/pl330.c
> > @@ -69,6 +69,9 @@ struct dma_pl330_chan {
> > =A0 =A0 =A0 =A0 * NULL if the channel is available to be acquired.
> > =A0 =A0 =A0 =A0 */
> > =A0 =A0 =A0 =A0void *pl330_chid;
> > +
> > + =A0 =A0 =A0 /* taks for cyclic capability */
> > + =A0 =A0 =A0 struct tasklet_struct *cyclic_task;
> > =A0};
> >
> > =A0struct dma_pl330_dmac {
> > @@ -105,6 +108,7 @@ struct dma_pl330_desc {
> >
> > =A0 =A0 =A0 =A0/* The channel which currently holds this desc */
> > =A0 =A0 =A0 =A0struct dma_pl330_chan *pchan;
> > + =A0 =A0 =A0 bool cyclic;
> > =A0};
> >
> > =A0static inline struct dma_pl330_chan *
> > @@ -184,6 +188,60 @@ static inline void fill_queue(struct dma_pl330=
_chan
> *pch)
> > =A0 =A0 =A0 =A0}
> > =A0}
> >
> > +static void pl330_tasklet_cyclic(unsigned long data)
> > +{
> > + =A0 =A0 =A0 struct dma_pl330_chan *pch =3D (struct dma_pl330_chan=
 *)data;
> > + =A0 =A0 =A0 struct dma_pl330_desc *desc, *_dt;
> > + =A0 =A0 =A0 unsigned long flags;
> > + =A0 =A0 =A0 LIST_HEAD(list);
> > +
> > + =A0 =A0 =A0 spin_lock_irqsave(&pch->lock, flags);
> > +
> > + =A0 =A0 =A0 /* Pick up ripe tomatoes */
> > + =A0 =A0 =A0 list_for_each_entry_safe(desc, _dt, &pch->work_list, =
node)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((desc->status =3D=3D DONE) && des=
c->cyclic) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_async_tx_callback=
 callback;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_move_tail(&desc-=
>node, &pch->work_list);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pch->completed =3D de=
sc->txd.cookie;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 desc->status =3D PREP=
;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Try to submit a re=
q imm.
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 next to the last comp=
leted cookie */
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fill_queue(pch);
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Make sure the PL33=
0 Channel thread is active
*/
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330_chan_ctrl(pch->=
pl330_chid,
PL330_OP_START);
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 callback =3D desc->tx=
d.callback;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (callback)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 callb=
ack(desc->txd.callback_param);
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 spin_unlock_irqrestore(&pch->lock, flags);
> > +}
> > +
> > +static void pl330_cyclic_free(struct dma_pl330_chan *pch)
> > +{
> > + =A0 =A0 =A0 struct dma_pl330_dmac *pdmac =3D pch->dmac;
> > + =A0 =A0 =A0 struct dma_pl330_desc *desc, *_dt;
> > + =A0 =A0 =A0 unsigned long flags;
> > + =A0 =A0 =A0 LIST_HEAD(list);
> > +
> > + =A0 =A0 =A0 spin_lock_irqsave(&pdmac->pool_lock, flags);
> > +
> > + =A0 =A0 =A0 list_for_each_entry_safe(desc, _dt, &pch->work_list, =
node)
> > + =A0 =A0 =A0 if (desc->cyclic)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_move_tail(&desc->node, &list);
>=20
> nitpick: indentation will be required after for_each
>=20

I will address your comment.

> > +
> > + =A0 =A0 =A0 list_splice_tail_init(&list, &pdmac->desc_pool);
> > +
> > + =A0 =A0 =A0 spin_unlock_irqrestore(&pdmac->pool_lock, flags);
> > + =A0 =A0 =A0 pch->cyclic_task =3D NULL;
> > +}
> > +
> > =A0static void pl330_tasklet(unsigned long data)
> > =A0{
> > =A0 =A0 =A0 =A0struct dma_pl330_chan *pch =3D (struct dma_pl330_cha=
n *)data;
> > @@ -227,6 +285,9 @@ static void dma_pl330_rqcb(void *token, enum
> pl330_op_err err)
> >
> > =A0 =A0 =A0 =A0spin_unlock_irqrestore(&pch->lock, flags);
> >
> > + =A0 =A0 =A0 if (pch->cyclic_task)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tasklet_schedule(pch->cyclic_task);
> > + =A0 =A0 =A0 else
> > =A0 =A0 =A0 =A0tasklet_schedule(&pch->task);
> > =A0}
> >
> > @@ -256,25 +317,58 @@ static int pl330_alloc_chan_resources(struct
> dma_chan *chan)
> > =A0static int pl330_control(struct dma_chan *chan, enum dma_ctrl_cm=
d cmd,
> unsigned long arg)
> > =A0{
> > =A0 =A0 =A0 =A0struct dma_pl330_chan *pch =3D to_pchan(chan);
> > - =A0 =A0 =A0 struct dma_pl330_desc *desc;
> > + =A0 =A0 =A0 struct dma_pl330_desc *desc, *_dt;
> > =A0 =A0 =A0 =A0unsigned long flags;
> > + =A0 =A0 =A0 struct dma_pl330_dmac *pdmac =3D pch->dmac;
> > + =A0 =A0 =A0 struct dma_slave_config *slave_config;
> > + =A0 =A0 =A0 struct dma_pl330_peri *peri;
> > + =A0 =A0 =A0 int i;
> > + =A0 =A0 =A0 LIST_HEAD(list);
> >
> > - =A0 =A0 =A0 /* Only supports DMA_TERMINATE_ALL */
> > - =A0 =A0 =A0 if (cmd !=3D DMA_TERMINATE_ALL)
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENXIO;
> > -
> > - =A0 =A0 =A0 spin_lock_irqsave(&pch->lock, flags);
> > -
> > - =A0 =A0 =A0 /* FLUSH the PL330 Channel thread */
> > - =A0 =A0 =A0 pl330_chan_ctrl(pch->pl330_chid, PL330_OP_FLUSH);
> > + =A0 =A0 =A0 switch (cmd) {
> > + =A0 =A0 =A0 case DMA_TERMINATE_ALL:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&pch->lock, flags);
> >
> > - =A0 =A0 =A0 /* Mark all desc done */
> > - =A0 =A0 =A0 list_for_each_entry(desc, &pch->work_list, node)
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 desc->status =3D DONE;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* FLUSH the PL330 Channel thread */
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330_chan_ctrl(pch->pl330_chid, PL33=
0_OP_FLUSH);
> >
> > - =A0 =A0 =A0 spin_unlock_irqrestore(&pch->lock, flags);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Mark all desc done */
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_for_each_entry_safe(desc, _dt, &=
pch->work_list ,
node)
> {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 desc->status =3D DONE=
;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pch->completed =3D de=
sc->txd.cookie;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_move_tail(&desc-=
>node, &list);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> >
> > - =A0 =A0 =A0 pl330_tasklet((unsigned long) pch);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_splice_tail_init(&list, &pdmac->=
desc_pool);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&pch->lock, fl=
ags);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> > + =A0 =A0 =A0 case DMA_SLAVE_CONFIG:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 slave_config =3D (struct dma_slave_co=
nfig *)arg;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 peri =3D pch->chan.private;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (slave_config->direction =3D=3D DM=
A_TO_DEVICE) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (slave_config->dst=
_addr)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 peri-=
>fifo_addr =3D
slave_config->dst_addr;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (slave_config->dst=
_addr_width) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D=
 0;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 while=
 (slave_config->dst_addr_width !=3D
(1 <<
> i))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 i++;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 peri-=
>burst_sz =3D i;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else if (slave_config->direction =3D=
=3D DMA_FROM_DEVICE) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (slave_config->src=
_addr)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 peri-=
>fifo_addr =3D
slave_config->src_addr;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (slave_config->src=
_addr_width) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D=
 0;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 while=
 (slave_config->src_addr_width !=3D
(1 <<
> i))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 i++;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 peri-=
>burst_sz =3D i;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> > + =A0 =A0 =A0 default:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENXIO;
>=20
> To print error message in the default case will be better.
>=20

I will address your comment.

> > + =A0 =A0 =A0 }
> >
> > =A0 =A0 =A0 =A0return 0;
> > =A0}
> > @@ -291,6 +385,9 @@ static void pl330_free_chan_resources(struct
> dma_chan *chan)
> > =A0 =A0 =A0 =A0pl330_release_channel(pch->pl330_chid);
> > =A0 =A0 =A0 =A0pch->pl330_chid =3D NULL;
> >
> > + =A0 =A0 =A0 if (pch->cyclic_task)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330_cyclic_free(pch);
> > +
> > =A0 =A0 =A0 =A0spin_unlock_irqrestore(&pch->lock, flags);
> > =A0}
> >
> > @@ -522,6 +619,66 @@ static inline int get_burst_len(struct
> dma_pl330_desc *desc, size_t len)
> > =A0 =A0 =A0 =A0return burst_len;
> > =A0}
> >
> > +static struct dma_async_tx_descriptor *pl330_prep_dma_cyclic(
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct dma_chan *chan, dma_addr_t dma=
_addr, size_t len,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t period_len, enum dma_data_dire=
ction direction)
> > +{
> > + =A0 =A0 =A0 struct dma_pl330_desc *desc;
> > + =A0 =A0 =A0 struct dma_pl330_chan *pch =3D to_pchan(chan);
> > + =A0 =A0 =A0 struct dma_pl330_peri *peri =3D chan->private;
> > + =A0 =A0 =A0 dma_addr_t dst;
> > + =A0 =A0 =A0 dma_addr_t src;
> > +
> > + =A0 =A0 =A0 pch =3D to_pchan(chan);
> > + =A0 =A0 =A0 if (!pch) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(pch->dmac->pif.dev, "%s:%d Un=
able to fetch
desc\n",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, __LINE__);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> > + =A0 =A0 =A0 }
>=20
> 'pch' is already acquired when defined. It's duplicated.
> dev_err has a incorrect parameter because pch is NULL.
> Accessing pch->dmac will be failed.

I will address your comment.

>=20
> > +
> > + =A0 =A0 =A0 desc =3D pl330_get_desc(pch);
> > + =A0 =A0 =A0 if (!desc) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(pch->dmac->pif.dev, "%s:%d Un=
able to fetch
desc\n",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, __LINE__);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 switch (direction) {
> > + =A0 =A0 =A0 case DMA_TO_DEVICE:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 desc->rqcfg.src_inc =3D 1;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 desc->rqcfg.dst_inc =3D 0;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 src =3D dma_addr;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dst =3D peri->fifo_addr;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> > + =A0 =A0 =A0 case DMA_FROM_DEVICE:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 desc->rqcfg.src_inc =3D 0;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 desc->rqcfg.dst_inc =3D 1;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 src =3D peri->fifo_addr;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dst =3D dma_addr;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> > + =A0 =A0 =A0 default:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(pch->dmac->pif.dev, "%s:%d In=
valid dma
> direction\n",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, __LINE__);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 desc->rqcfg.brst_size =3D peri->burst_sz;
> > + =A0 =A0 =A0 desc->rqcfg.brst_len =3D 1;
> > +
> > + =A0 =A0 =A0 if (!pch->cyclic_task) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pch->cyclic_task =3D
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kmalloc(sizeof(struct=
 tasklet_struct),
GFP_KERNEL);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tasklet_init(pch->cyclic_task,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330_tasklet_cyclic,=
 (unsigned int)pch);
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 desc->cyclic =3D true;
> > +
> > + =A0 =A0 =A0 fill_px(&desc->px, dst, src, period_len);
> > +
> > + =A0 =A0 =A0 return &desc->txd;
> > +}
> > +
> > =A0static struct dma_async_tx_descriptor *
> > =A0pl330_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dst,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dma_addr_t src, size_t len, unsigned=
 long flags)
> > @@ -756,6 +913,7 @@ pl330_probe(struct amba_device *adev, const str=
uct
> amba_id *id)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case MEMTODEV:
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case DEVTOMEM:
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dma_=
cap_set(DMA_SLAVE, pd->cap_mask);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_c=
ap_set(DMA_CYCLIC, pd->cap_mask);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0brea=
k;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0default:
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_=
err(&adev->dev, "DEVTODEV Not
> Supported\n");
> > @@ -781,6 +939,7 @@ pl330_probe(struct amba_device *adev, const str=
uct
> amba_id *id)
> > =A0 =A0 =A0 =A0pd->device_alloc_chan_resources =3D pl330_alloc_chan=
_resources;
> > =A0 =A0 =A0 =A0pd->device_free_chan_resources =3D pl330_free_chan_r=
esources;
> > =A0 =A0 =A0 =A0pd->device_prep_dma_memcpy =3D pl330_prep_dma_memcpy=
;
> > + =A0 =A0 =A0 pd->device_prep_dma_cyclic =3D pl330_prep_dma_cyclic;
> > =A0 =A0 =A0 =A0pd->device_tx_status =3D pl330_tx_status;
> > =A0 =A0 =A0 =A0pd->device_prep_slave_sg =3D pl330_prep_slave_sg;
> > =A0 =A0 =A0 =A0pd->device_control =3D pl330_control;
> > --
> > 1.7.1
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-sam=
sung-
> soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
> >
>=20
>=20
>=20
> --
> Best Regards,
> Chanho Park
