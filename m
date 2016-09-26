From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [RFC v3] drm/exynos: g2d: fix runtime PM
Date: Mon, 26 Sep 2016 16:15:01 +0200
Message-ID: <57E92D65.4000306@math.uni-bielefeld.de>
References: <CGME20160924190241epcas5p46ec40455f202e285918f1f6609a467f0@epcas5p4.samsung.com>
 <1474743486-3881-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <b534f79f-4660-74d5-1831-2339fc753e0d@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:38944 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965676AbcIZOPF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Sep 2016 10:15:05 -0400
In-Reply-To: <b534f79f-4660-74d5-1831-2339fc753e0d@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com

Hello Marek,

Marek Szyprowski wrote:
> Dear Tobias,
> 
> On 2016-09-24 20:58, Tobias Jakobi wrote:
>> The commit b05984e21a7e000bf5074ace00d7a574944b2c16 broke
>> operation of the G2D. After this commit the following
>> happens.
>> - exynos_g2d_exec_ioctl() prepares a runqueue node and
>>    calls g2d_exec_runqueue()
>> - g2d_exec_runqueue() calls g2d_dma_start() which gets
>>    runtime PM sync
>> - runtime PM calls g2d_runtime_resume()
>> - g2d_runtime_resume() calls g2d_exec_runqueue()
>>
>> Luckily for us this doesn't really loop, but creates a
>> mutex lockup, which the kernel even predicts.
>>
>> Anyway, we fix this by reintroducing dedicated sleep
>> operations again, and only letting runtime PM control
>> the gate clock.
>>
>> This is not enough to fix the issue though.
>> - We switch runtime PM to autosuspend. Currently clocks get
>>    disabled, and then re-enabled again in the runqueue worker
>>    when a node is completed and the next is started.
>>    With the upcoming introduction of IOMMU runtime PM this
>>    situations gets worse, since now also the IOMMU goes
>>    through a disable/enable cycle before the next node is
>>    started.
>> - We consolidate all runtime PM management to the runqueue
>>    worker.
>> - We introduce g2d_wait_finish() which waits until the currently
>>    processed runqueue node is finished.
>>    If this takes too long, the engine is forcibly reset. This
>>    is necessary to properly close the driver in case the engine
>>    should hang with read/write access to some area of memory.
>>    In this situation we can't properly unmap GEM/userptr
>>    objects, since this might create a pagefault.
>> - Sleep suspend issues a suspend of the runqueue and then calls
>>    g2d_wait_finish(), which returns the engine in the idle state.
>>    The current runqueue node gets completed, all other queued
>>    nodes stay in the queue. There is no hardware state that
>>    needs to be retained.
>> - Sleep resume just pokes the runqueue worker, which, should
>>    something be in queue, continues its work, or just exits.
> 
> IMHO there is too much done in one patch. It would be much easier to
> understand it if the changes are split into 2 parts: restoring dedicated
> speep callbacks and their integration with runqueue worker and addition
> of autosuspend-based runtime pm.
so you mean first revert your patch, and then put more changes on top of
it in a separate patch? I'm not sure into which 'functional units' I
should break this one down.

I can of course create a separate patch for autosuspend, that that would
only replace a put_sync() with mark_last_busy() + put_autosuspend(),
wouldn't it?


My current idea of functional units:
1) revert Marek's patch
2) move runpm management to g2d_runqueue_worker()
3) introduce g2d_wait_finish() and use it sleep call
4) also use it in g2d_close() and g2d_remove()
5) put autosuspend on top

Would this make sense?



With best wishes,
Tobias


>> Changes in v2:
>> - disable autosuspend mode again in g2d_remove()
>> - only get sync in g2d_runqueue_worker() if there is node
>>    in the queue left
>>
>> Changes in v3:
>> - actually delete node in g2d_remove_runqueue_nodes()
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> 
> [...]
> 
> Best regards
