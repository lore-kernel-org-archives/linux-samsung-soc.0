From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: S3C24XX: Fix potential NULL pointer dereference
 error
Date: Wed, 21 Nov 2012 22:01:13 +0900
Message-ID: <0e9201cdc7e8$48dcc360$da964a20$%kim@samsung.com>
References: <1352365291-32433-1-git-send-email-sachin.kamat@linaro.org>
 <CAK9yfHyJ1r7KeNHfUAnNhZRBaV+_grjr=pP6r3a7yHoeWywt9A@mail.gmail.com>
 <CAK9yfHyA+kOzzX+sqBMqJ-Gmj=Vwj36kg1WbTU06cnXJO3uN2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:61680 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752720Ab2KUNBO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Nov 2012 08:01:14 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDU00K8P9HZT990@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Nov 2012 22:01:13 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDU00LJI9I135B0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Nov 2012 22:01:13 +0900 (KST)
In-reply-to: <CAK9yfHyA+kOzzX+sqBMqJ-Gmj=Vwj36kg1WbTU06cnXJO3uN2Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org

Sachin Kamat wrote:

> > On 8 November 2012 14:31, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> >> chan->end is tested for being NULL. However in the event that it is
> NULL, the
> >> subsequent assignment statement would lead to NULL pointer dereference.
> >> Thus dereferencing it only when it is not NULL.
> >>

Logically, looks OK to me, I'm not sure this patch is right because if
(chan->end) is NULL, we do nothing for chan though...

I think, we need to sort out the dma_enqueue() later.

Will apply, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


> >> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> >> ---
> >> Based on Kukjin Kim's for-next branch. Compile tested.
> >> ---
> >>  arch/arm/plat-s3c24xx/dma.c |    9 +++++----
> >>  1 files changed, 5 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/arm/plat-s3c24xx/dma.c b/arch/arm/plat-s3c24xx/dma.c
> >> index db98e70..0abd1c4 100644
> >> --- a/arch/arm/plat-s3c24xx/dma.c
> >> +++ b/arch/arm/plat-s3c24xx/dma.c
> >> @@ -473,12 +473,13 @@ int s3c2410_dma_enqueue(enum dma_ch channel, void
> *id,
> >>                 pr_debug("dma%d: %s: buffer %p queued onto non-empty
> channel\n",
> >>                          chan->number, __func__, buf);
> >>
> >> -               if (chan->end == NULL)
> >> +               if (chan->end == NULL) {
> >>                         pr_debug("dma%d: %s: %p not empty, and chan-
> >end==NULL?\n",
> >>                                  chan->number, __func__, chan);
> >> -
> >> -               chan->end->next = buf;
> >> -               chan->end = buf;
> >> +               } else {
> >> +                       chan->end->next = buf;
> >> +                       chan->end = buf;
> >> +               }
> >>         }
> >>
> >>         /* if necessary, update the next buffer field */
> >> --
> >> 1.7.4.1
