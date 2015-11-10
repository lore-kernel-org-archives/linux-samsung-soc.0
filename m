From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] dmaengine: pl330: Fix race in residue reporting
Date: Tue, 10 Nov 2015 10:44:39 +0900
Message-ID: <56414C07.3080108@samsung.com>
References: <1446808295-23149-1-git-send-email-sjoerd.simons@collabora.co.uk>
 <563DF151.2010307@samsung.com> <1447074736.22840.35.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:38393 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751275AbbKJBor (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Nov 2015 20:44:47 -0500
In-reply-to: <1447074736.22840.35.camel@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Vinod Koul <vinod.koul@intel.com>
Cc: k.kozlowski.k@gmail.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org, linux-arm-kernel@vger.kernel.org

On 09.11.2015 22:12, Sjoerd Simons wrote:
> On Sat, 2015-11-07 at 21:40 +0900, Krzysztof Kozlowski wrote:
>> W dniu 06.11.2015 o 20:11, Sjoerd Simons pisze:
>>> When a transfer completes there is a small window between the
>>> descriptor
>>> being unset as the current active one in the thread and it being
>>> marked
>>> as done. This causes the residue to be incorrectly set when
>>> pl330_tx_status is run in that window. Practically this caused
>>> issue for me with audio playback as the residue goes up during a
>>> transfer (as the in-progress transfer is no longer accounted for),
>>> which makes the higher levels think the audio ringbuffer wrapped
>>> around
>>> and thus did a sudden big jump forward.
>>>
>>> To resolve this, add a field protected by the dma engine lock to
>>> indicate the transfer is done but the status hasn't been updated
>>> yet.
>>>
>>> Also fix the locking in pl330_tx_status, as the function inspects
>>> the
>>> threads req_running field and queries the dma engine for the
>>> current
>>> state of the running transfer the dma engine lock needs to be held
>>> to
>>> ensure the active descriptor doesn't change underneath it.
>>>
>>> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
>>>
>>> ---
>>>
>>>  drivers/dma/pl330.c | 10 +++++++++-
>>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
>>> index 17ee758..6c8243b 100644
>>> --- a/drivers/dma/pl330.c
>>> +++ b/drivers/dma/pl330.c
>>> @@ -503,6 +503,8 @@ struct dma_pl330_desc {
>>>  	struct pl330_reqcfg rqcfg;
>>>  
>>>  	enum desc_status status;
>>> +	/* Transfer completed, but not yet moved to DONE state */
>>> +	bool xferred;
>>>  
>>>  	int bytes_requested;
>>>  	bool last;
>>> @@ -1463,6 +1465,9 @@ static void dma_pl330_rqcb(struct
>>> dma_pl330_desc *desc, enum pl330_op_err err)
>>>  	spin_lock_irqsave(&pch->lock, flags);
>>>  
>>>  	desc->status = DONE;
>>> +	spin_lock(&pch->thread->dmac->lock);
>>> +	desc->xferred = false;
>>> +	spin_unlock(&pch->thread->dmac->lock);
>>>  
>>>  	spin_unlock_irqrestore(&pch->lock, flags);
>>>  
>>> @@ -1595,6 +1600,7 @@ static int pl330_update(struct pl330_dmac
>>> *pl330)
>>>  
>>>  			/* Detach the req */
>>>  			descdone = thrd->req[active].desc;
>>> +			descdone->xferred = true;
>>>  			thrd->req[active].desc = NULL;
>>
>> Looking at the code indeed the small window could happen. How can I
>> reproduce it? Can you describe your system?
> 
> I'm using a Rock 2 square (RK3288 based) board, running Debian Jessie
> and simply playing back audio using vlc & pulseaudio.
> 
> For some reason when using vlc, pulseaudio is polling the hw pointer
> position very very often and seems to hit this tiny window a few times
> a minute depending a bit on system load. This causes some audiable
> issues and eventually underflowing (as vlc fills the pulseaudio buffer
> at a constant rate, but due to this, pulse pushes the data faster then
> the actual playback rate every so often).

Thanks for description, I don't use pulseaudio on my testing setup but
I'll try to reproduce it anyway.

> 
>> As for the change itself, how about adding a new value to
>> desc_status?
>> Now you are actually introducing a semi-status field.
> 
> The reason i picked this way this was was due to the current locking
> scheme. The locking order is channel, then controller (when locking
> both). While processing the events (and update the active descriptor),
> the controller is locked so the status can't be directly updated (as
> that's protected by the channel lock). And we can't grab the channel
> lock without dopping the controller one first :).
> 
> Keeping one status field might well be possible, but would require at
> least reworking the locking here.

Right, the locking requires new field... If going this way could you
describe this rationale and information about locking a comment? I mean
the answer you gave above - the locking requires such field and that the
field is protected actually by controller lock, not by channel.

On the other hand, I am looking and the code and looking and I wonder:
do you really need to protect writing to the "xferred" field? In
pl330_update() you are setting it to true while getting the list of done
descriptors.
The descriptors done are then removed from the thread.

In that path then you are setting it to false in dma_pl330_rqcb() for
these done descriptors - this should not be executed concurrently with
above.

The dma_pl330_rqcb() is also called from abort and fail paths but these
are use controller's lock (e.g. pl330_dotask()).

Just thinking out loud... maybe I am missing something here.

Best regards,
Krzysztof



> 
> 
>> Best regards,
>> Krzysztof
>>
>>>  
>>>  			thrd->req_running = -1;
>>> @@ -2250,13 +2256,14 @@ pl330_tx_status(struct dma_chan *chan,
>>> dma_cookie_t cookie,
>>>  		goto out;
>>>  
>>>  	spin_lock_irqsave(&pch->lock, flags);
>>> +	spin_lock(&pch->thread->dmac->lock);
>>>  
>>>  	if (pch->thread->req_running != -1)
>>>  		running = pch->thread->req[pch->thread-
>>>> req_running].desc;
>>>  
>>>  	/* Check in pending list */
>>>  	list_for_each_entry(desc, &pch->work_list, node) {
>>> -		if (desc->status == DONE)
>>> +		if (desc->xferred || desc->status == DONE)
>>>  			transferred = desc->bytes_requested;
>>>  		else if (running && desc == running)
>>>  			transferred =
>>> @@ -2281,6 +2288,7 @@ pl330_tx_status(struct dma_chan *chan,
>>> dma_cookie_t cookie,
>>>  		if (desc->last)
>>>  			residual = 0;
>>>  	}
>>> +	spin_unlock(&pch->thread->dmac->lock);
>>>  	spin_unlock_irqrestore(&pch->lock, flags);
>>>  
>>>  out:
>>>
>>
> 
