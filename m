From: Javi Merino <javi.merino@arm.com>
Subject: Re: [PATCH v2] ARM: pl330: Fix a race condition
Date: Fri, 09 Dec 2011 11:58:40 +0000
Message-ID: <4EE1F7F0.70107@arm.com>
References: <4E8C5425.80303@arm.com> <1317892206-3600-1-git-send-email-javi.merino@arm.com> <CAJuYYwTXf-XU0fdGT0+sggN-MEY3v7UHkfjNkM4+QUW464J9Ew@mail.gmail.com> <4EB7B79A.2020004@arm.com> <000c01ccada6$f83f5be0$e8be13a0$%kim@samsung.com> <4ED3B89E.7070903@arm.com> <000e01ccae48$d76a7ba0$863f72e0$%kim@samsung.com> <4ED4AB9A.3060807@arm.com> <CAJe_Zhem0yTOV4L-kJ91fQN++hFzCUgjOfxSnJR25PuYNTedVQ@mail.gmail.com> <03f001ccb4b5$3441f5c0$9cc5e140$%kim@samsung.com> <4EDF3989.3060108@arm.com> <4EDFD278.9090101@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:47570 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751441Ab1LIL6y convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Dec 2011 06:58:54 -0500
In-Reply-To: <4EDFD278.9090101@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Jassi Brar' <jaswinder.singh@linaro.org>, 'Boojin Kim' <boojin.kim@samsung.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Thomas Abraham' <thomas.abraham@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 07/12/11 20:54, Javi Merino wrote:
> On 07/12/11 10:01, Javi Merino wrote:
>> On 07/12/11 07:52, Kukjin Kim wrote:
>>> Jassi Brar wrote:
>>>> On 29 November 2011 15:23, Javi Merino <javi.merino@arm.com> wrote:
>>>>>>>>>> On Samsung's Exynos4 platform, while testing audio playback with
>>>>>>> i2s
>>>>>>>>>> interface, the above change causes the playback to freeze. The
>>>>>>>>>> _thrd_active(thrd) call always returns '1' and hence _start(thrd)
>>>>>>> is
>>>>>>>>>> not getting called.
>>>>>>>>>
>>>>>>>> Your patch makes the memcpy operation on dmatest.c and net DMA be
>>>>>>> frozen too
>>>>>>>> as well as Samsung audio playback.
>>>>>>>
>>>> Javi, could you please check if you too get the memcpy failure with
>>>> dmatest ?
>>>
> Ok, I think I've just reproduced it in my end with the kernel's dmatest
> module.  After the first transaction it looks like the dma test wasn't
> able to issue any more transactions.  I'll have a look at it tomorrow
> and try to answer my own questions ;)

The problem is that pl330_submit_req() always puts the request in buffer 0 if
both buffers are free.

If you submit a transaction, it finishes and there's nothing else to run,
pl330_update() calls _start() but there is nothing to send.  This is all
right.  Then, if another transaction is submitted, pl330_submit_req() will
put it in buffer 0 again.  This time, the PC of the DMA is in the last
instruction of buffer 0 (the DMAEND of the *previous* transaction that
finished long ago) so _thrd_active() thinks that this buffer is active,
which makes pl330_chan_ctrl() not start the transaction and hence, the DMA
freezes.

I believe something like the following should fix it:

--- a/arch/arm/common/pl330.c
+++ b/arch/arm/common/pl330.c
@@ -1301,7 +1301,7 @@ int pl330_submit_req(void *ch_id, struct pl330_req *r)
 		goto xfer_exit;
 	}
 
-	idx = IS_FREE(&thrd->req[0]) ? 0 : 1;
+	idx = IS_FREE(&thrd->req[1 - thrd->lstenq]) ? 1 - thrd->lstenq : thrd->lstenq;
 
 	xs.ccr = ccr;
 	xs.r = r;


I have only tested this with a single-channel single-thread dma test.
I'll send a proper patch to the list once I've done more testing.

Cheers,
Javi
