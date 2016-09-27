From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RFC v3] drm/exynos: g2d: fix runtime PM
Date: Tue, 27 Sep 2016 07:59:25 +0200
Message-ID: <cb7e5d49-e0e7-aaff-3045-0c90f35af846@samsung.com>
References: <CGME20160924190241epcas5p46ec40455f202e285918f1f6609a467f0@epcas5p4.samsung.com>
 <1474743486-3881-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <b534f79f-4660-74d5-1831-2339fc753e0d@samsung.com>
 <57E92D65.4000306@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41392 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751499AbcI0F7d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Sep 2016 01:59:33 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OE500LPRFB5WD30@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Sep 2016 06:59:29 +0100 (BST)
In-reply-to: <57E92D65.4000306@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com

Hi Tobias,

On 2016-09-26 16:15, Tobias Jakobi wrote:
> Marek Szyprowski wrote:
>> On 2016-09-24 20:58, Tobias Jakobi wrote:
>>> The commit b05984e21a7e000bf5074ace00d7a574944b2c16 broke
>>> operation of the G2D. After this commit the following
>>> happens.
>>> - exynos_g2d_exec_ioctl() prepares a runqueue node and
>>>     calls g2d_exec_runqueue()
>>> - g2d_exec_runqueue() calls g2d_dma_start() which gets
>>>     runtime PM sync
>>> - runtime PM calls g2d_runtime_resume()
>>> - g2d_runtime_resume() calls g2d_exec_runqueue()
>>>
>>> Luckily for us this doesn't really loop, but creates a
>>> mutex lockup, which the kernel even predicts.
>>>
>>> Anyway, we fix this by reintroducing dedicated sleep
>>> operations again, and only letting runtime PM control
>>> the gate clock.
>>>
>>> This is not enough to fix the issue though.
>>> - We switch runtime PM to autosuspend. Currently clocks get
>>>     disabled, and then re-enabled again in the runqueue worker
>>>     when a node is completed and the next is started.
>>>     With the upcoming introduction of IOMMU runtime PM this
>>>     situations gets worse, since now also the IOMMU goes
>>>     through a disable/enable cycle before the next node is
>>>     started.
>>> - We consolidate all runtime PM management to the runqueue
>>>     worker.
>>> - We introduce g2d_wait_finish() which waits until the currently
>>>     processed runqueue node is finished.
>>>     If this takes too long, the engine is forcibly reset. This
>>>     is necessary to properly close the driver in case the engine
>>>     should hang with read/write access to some area of memory.
>>>     In this situation we can't properly unmap GEM/userptr
>>>     objects, since this might create a pagefault.
>>> - Sleep suspend issues a suspend of the runqueue and then calls
>>>     g2d_wait_finish(), which returns the engine in the idle state.
>>>     The current runqueue node gets completed, all other queued
>>>     nodes stay in the queue. There is no hardware state that
>>>     needs to be retained.
>>> - Sleep resume just pokes the runqueue worker, which, should
>>>     something be in queue, continues its work, or just exits.
>> IMHO there is too much done in one patch. It would be much easier to
>> understand it if the changes are split into 2 parts: restoring dedicated
>> speep callbacks and their integration with runqueue worker and addition
>> of autosuspend-based runtime pm.
> so you mean first revert your patch, and then put more changes on top of
> it in a separate patch? I'm not sure into which 'functional units' I
> should break this one down.
>
> I can of course create a separate patch for autosuspend, that that would
> only replace a put_sync() with mark_last_busy() + put_autosuspend(),
> wouldn't it?
>
>
> My current idea of functional units:
> 1) revert Marek's patch
> 2) move runpm management to g2d_runqueue_worker()
> 3) introduce g2d_wait_finish() and use it sleep call
> 4) also use it in g2d_close() and g2d_remove()
> 5) put autosuspend on top
>
> Would this make sense?

Yes, definitely this approach makes much more sense in my opinion. I'm sorry
for my broken initial patch and the additional work you had to do.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
