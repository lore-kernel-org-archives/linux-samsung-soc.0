From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH v8 04/16] DMA: PL330: Remove the start operation for
 handling DMA_TERMINATE_ALL command
Date: Thu, 08 Sep 2011 09:59:05 +0900
Message-ID: <000101cc6dc2$81f54680$85dfd380$%kim@samsung.com>
References: <1314924284-25554-1-git-send-email-boojin.kim@samsung.com>
 <1314924284-25554-5-git-send-email-boojin.kim@samsung.com>
 <CABb+yY1QN9CzT=CGJ1n-pk8_QyeEK1Sx=HT2n8SMB9O-XrsXDg@mail.gmail.com>
 <20110906122718.GP6619@n2100.arm.linux.org.uk>
 <CAJe_ZhfaYmgPFhU-KJ3Oj6jdPN0i584yzziSzQzd_6uNSXodHQ@mail.gmail.com>
 <000c01cc6d2e$fa01d8d0$ee058a70$%kim@samsung.com>
 <CAJe_ZhefAqspzm8nKKVdKkhorYVLJnLwdmmfUtq41gGczMRPnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26552 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753699Ab1IHA7I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Sep 2011 20:59:08 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LR600FKFIQIW4B0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Sep 2011 09:59:06 +0900 (KST)
Received: from DOBOOJINKIM03 ([12.23.120.72])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LR60005TIQH84B0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 08 Sep 2011 09:59:05 +0900 (KST)
In-reply-to: <CAJe_ZhefAqspzm8nKKVdKkhorYVLJnLwdmmfUtq41gGczMRPnw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jaswinder.singh@linaro.org>, 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Vinod Koul' <vinod.koul@intel.com>, 'Linus Walleij' <linus.walleij@linaro.org>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Grant Likely' <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, 'Dan Williams' <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

Jassi Brar wrote:
> Subject: Re: [PATCH v8 04/16] DMA: PL330: Remove the start operation
> for handling DMA_TERMINATE_ALL command
>
> On 7 September 2011 12:53, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Jassi Brar wrote:
> >>
> >> On 6 September 2011 17:57, Russell King - ARM Linux
> >> <linux@arm.linux.org.uk> wrote:
> >> > On Tue, Sep 06, 2011 at 05:52:19PM +0530, Jassi Brar wrote:
> >> >> On Fri, Sep 2, 2011 at 6:14 AM, Boojin Kim
> <boojin.kim@samsung.com> wrote:
> >> >> > Origianl code carries out the start operation after flush
> operation.
> >> >> > But start operation is not required for DMA_TERMINATE_ALL
> command.
> >> >> > So, This patch removes the unnecessary start operation and
> only carries out
> >> >> > the flush oeration for handling DMA_TERMINATE_ALL command.
> >> >>
> >> >> Not exactly. The 'start' is impotent when called from this path
> because there
> >> >> is nothing left queued after the call to 'flush'.
> >> >> pl330_tasklet() is called because that is a common function tha=
t
> does the
> >> >> house-keeping acc to what's presently in 'work' and 'done' list=
s.
> >> >>
> >> >> Though as a side-effect, your patch does avoid doing callbacks
> on submitted
> >> >> xfers during DMA_TERMINATE_ALL - which may or may not be the
> right thing
> >> >> to do.
> >> >
> >> > It is defined that DMA_TERMINATE_ALL does not call the callbacks=
:
> >> >
> >> > 1. int dmaengine_terminate_all(struct dma_chan *chan)
> >> >
> >> > =A0 This causes all activity for the DMA channel to be stopped, =
and
> may
> >> > =A0 discard data in the DMA FIFO which hasn't been fully transfe=
rred.
> >> > =A0 No callback functions will be called for any incomplete
> transfers.
> >> >
> >> Ok, thanks for the info.
> >>
> >> Boojin Kim, please re-write the changelog to state only preventing
> >> callbacks during DMA_TERMINATE_ALL as the reason.
> >
> > As above, we don't need callback as well start operation in
> DMA_TERMIANTE_ALL command and her patch just removed them for
> DMA_TERMINATE_ALL here. So current git message seems to have proper
> behavior of patch.
> >
> Nopes.
>
> No modification to current code is needed if only the following is to
> be the reason.
> {
> Origianl code carries out the start operation after flush operation.
> But start operation is not required for DMA_TERMINATE_ALL command.
> So, This patch removes the unnecessary start operation and only
> carries out
> the flush oeration for handling DMA_TERMINATE_ALL command.
> }
>
> The patch, however, has unintended good effect of "preventing
> callbacks
> from DMA_TERMINATE_ALL".
> The only valid reason, and which is no way implied by the changelog.
According to dmaengine document, dmaengine_terminate_all() is used to p=
ause
or stop the channel. So, dmaengine_terminate_all() doesn=92t need to ha=
ve the
start operation and callback calling.
This patch is originally aimed at removing unnecessary operations inclu=
ding
the start operation and callback call for dmaengine_terminate_all(). An=
d I
think my message pretty expresses the purpose of this patch.

Thanks,
Boojin kim
