From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH V4 04/14] DMA: PL330: Add DMA_CYCLIC capability
Date: Tue, 26 Jul 2011 21:28:01 +0900
Message-ID: <003a01cc4b8f$763ce2d0$62b6a870$%kim@samsung.com>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
	<1311557312-26107-5-git-send-email-boojin.kim@samsung.com>
	<CABb+yY1x=E4pO8Uyrz9+cs-B-NuhqzXzQwcxKCkrm0mthp0FWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <CABb+yY1x=E4pO8Uyrz9+cs-B-NuhqzXzQwcxKCkrm0mthp0FWA@mail.gmail.com>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Vinod Koul' <vinod.koul@intel.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Grant Likely' <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, 'Dan Williams' <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Jassi Brar Wrote:
> Sent: Monday, July 25, 2011 8:24 PM
> To: Boojin Kim
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; Vinod Koul; Dan Williams; Kukjin Kim; Grant
> Likely; Mark Brown
> Subject: Re: [PATCH V4 04/14] DMA: PL330: Add DMA_CYCLIC capability
>
> On Mon, Jul 25, 2011 at 6:58 AM, Boojin Kim <boojin.kim@samsung.com>
> wrote:
> > This patch adds DMA_CYCLIC capability that is used for audio driver.
> > DMA driver with DMA_CYCLIC capability reuses the dma requests that
> > were submitted through tx_submit().
> >
> > Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> > ---
> >  drivers/dma/pl330.c |  111
> +++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 files changed, 111 insertions(+), 0 deletions(-)
> >
> > diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> > index 880f010..121c75a 100644
> > --- a/drivers/dma/pl330.c
> > +++ b/drivers/dma/pl330.c
> > @@ -69,6 +69,11 @@ struct dma_pl330_chan {
> >         * NULL if the channel is available to be acquired.
> >         */
> >        void *pl330_chid;
> > +
> > +       /* taks for cyclic capability */
> > +       struct tasklet_struct *cyclic_task;
> > +
> > +       bool cyclic;
> >  };
> We already have a tasklet_struct member here.
> This 'cyclic' flag can indicate if we are doing cyclic or serial
> transfers. So, this cyclic_task seems unnecessary.
I will change cyclic operation base on your comment.
Cyclic_task will be removed.

>
> > +static void pl330_tasklet_cyclic(unsigned long data)
> > +{
> > +       struct dma_pl330_chan *pch = (struct dma_pl330_chan *)data;
> > +       struct dma_pl330_desc *desc, *_dt;
> > +       unsigned long flags;
> > +       LIST_HEAD(list);
> > +
> > +       spin_lock_irqsave(&pch->lock, flags);
> > +
> > +       /* Pick up ripe tomatoes */
> > +       list_for_each_entry_safe(desc, _dt, &pch->work_list, node)
> > +               if (desc->status == DONE) {
> > +                       dma_async_tx_callback callback;
> > +
> > +                       list_move_tail(&desc->node, &pch->work_list);
> > +                       pch->completed = desc->txd.cookie;
> > +
> > +                       desc->status = PREP;
> > +
> > +                       /* Try to submit a req imm.
> > +                       next to the last completed cookie */
> > +                       fill_queue(pch);
> > +
> > +                       /* Make sure the PL330 Channel thread is active
> */
> > +                       pl330_chan_ctrl(pch->pl330_chid,
> PL330_OP_START);
> > +
> > +                       callback = desc->txd.callback;
> > +                       if (callback)
> > +                               callback(desc->txd.callback_param);
> > +
> > +               }
> > +
> > +       spin_unlock_irqrestore(&pch->lock, flags);
> > +}
> Please merge this with pl330_tasklet and use 'cyclic' flag to
> differentiate.
>
> > @@ -227,6 +267,9 @@ static void dma_pl330_rqcb(void *token, enum
> pl330_op_err err)
> >
> >        spin_unlock_irqrestore(&pch->lock, flags);
> >
> > +       if (pch->cyclic_task)
> > +               tasklet_schedule(pch->cyclic_task);
> > +       else
> >        tasklet_schedule(&pch->task);
> A tab here please, and check for 'cyclic' flag.
>
>
> > @@ -316,6 +359,15 @@ static void pl330_free_chan_resources(struct
> dma_chan *chan)
> >        pl330_release_channel(pch->pl330_chid);
> >        pch->pl330_chid = NULL;
> >
> > +       if (pch->cyclic) {
> > +               pch->cyclic = false;
> > +               list_splice_tail_init(&pch->work_list, &pch->dmac-
> >desc_pool);
> > +               if (pch->cyclic_task) {
> > +                       tasklet_kill(pch->cyclic_task);
> > +                       pch->cyclic_task = NULL;
> > +               }
> > +       }
> > +
> >        spin_unlock_irqrestore(&pch->lock, flags);
> >  }
> To be explicit, please initialize 'cyclic' flag to false in
> pl330_alloc_chan_resources
I will address your comment.
