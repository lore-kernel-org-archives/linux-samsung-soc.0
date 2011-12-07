From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: pl330: Fix a race condition
Date: Wed, 07 Dec 2011 16:52:44 +0900
Message-ID: <03f001ccb4b5$3441f5c0$9cc5e140$%kim@samsung.com>
References: <4E8C5425.80303@arm.com>
 <1317892206-3600-1-git-send-email-javi.merino@arm.com>
 <CAJuYYwTXf-XU0fdGT0+sggN-MEY3v7UHkfjNkM4+QUW464J9Ew@mail.gmail.com>
 <4EB7B79A.2020004@arm.com> <000c01ccada6$f83f5be0$e8be13a0$%kim@samsung.com>
 <4ED3B89E.7070903@arm.com> <000e01ccae48$d76a7ba0$863f72e0$%kim@samsung.com>
 <4ED4AB9A.3060807@arm.com>
 <CAJe_Zhem0yTOV4L-kJ91fQN++hFzCUgjOfxSnJR25PuYNTedVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28596 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752100Ab1LGHwr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Dec 2011 02:52:47 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVT000THPUIINR0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Dec 2011 16:52:46 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVT008OYPVW0ON0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 07 Dec 2011 16:52:46 +0900 (KST)
In-reply-to: <CAJe_Zhem0yTOV4L-kJ91fQN++hFzCUgjOfxSnJR25PuYNTedVQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jaswinder.singh@linaro.org>, 'Javi Merino' <javi.merino@arm.com>
Cc: 'Boojin Kim' <boojin.kim@samsung.com>, vinod.koul@intel.com, jassisinghbrar@gmail.com, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org

Jassi Brar wrote:
>=20
> On 29 November 2011 15:23, Javi Merino <javi.merino@arm.com> wrote:
> >>>>>> On Samsung's Exynos4 platform, while testing audio playback wi=
th
> >>> i2s
> >>>>>> interface, the above change causes the playback to freeze. The
> >>>>>> _thrd_active(thrd) call always returns '1' and hence _start(th=
rd)
> >>> is
> >>>>>> not getting called.
> >>>>>
> >>>>> If _thrd_active(thrd) returns '1', that means there is an activ=
e
> >>>>> transfer still running or, if it has finished, you haven't call=
ed
> >>>>> pl330_update() to acknowledge that. =A0pl330_update() calls _st=
art()
> >>> as
> >>>>> soon as it can.
> >>>>>
> >>>>> drivers/dma/pl330.c registers the irq handler in pl330_probe(),=
 so
> >>>>> when
> >>>>> the transaction finishes, pl330_update() should clear it and ca=
ll
> >>>>> _start(). =A0If there is any outstanding transaction, it should=
 start
> >>>>> straight away. If there isn't, it would mark the channel as fre=
e,
> >>> so
> >>>>> _thrd_active() should return '0'. =A0If _thrd_active() is still=
 '1',
> >>> then
> >>>>> something has gone wrong in the way.
> >>>>>
> >>>>> Does this shed some light?
> >>>>>
> >>>>
> >>>> Your patch makes the memcpy operation on dmatest.c and net DMA b=
e
> >>> frozen too
> >>>> as well as Samsung audio playback.
> >>>
> >>> Is the IRQ correctly registered in drivers/dma/pl330.c:pl330_prob=
e()?
> >>> Do you get interrupts when the transfer finish?
> >> Sure. IRQ works well.
> >
> > Ok, so can you check if pl330_update() is correctly marking the req=
uest
> > as free? =A0Do you know if there is another request in the queue wh=
en that
> > happens?
> >
> > Thomas, you said in a previous email that _thrd_active() always ret=
urned
> > '1'. =A0Was that after a request in req[0] finished?
> > =A0- If so, can you check that MARK_FREE was actually called for th=
at
> > =A0 =A0request in pl330_update()?
> > =A0- If it was after a request in req[1] finished and there was a
> > =A0 =A0request already waiting in req[0], can you debug why _start(=
)
> > =A0 =A0didn't activate it.
> >
> Javi, could you please check if you too get the memcpy failure with
> dmatest ?

(Please adding me in this thread)

Hi Javi,
How was going on the test? If any update, please let us know.

Vinod, I think, if the issue cannot be fixed soon, the patch should be
reverted until clear the issue. Because according to Boojin Kim's test,=
 it
does not affect only Samsung stuff.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
