From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH] dmaengine: pl330: Set residue in tx_status callback
Date: Sat, 6 Dec 2014 12:31:01 +0530
Message-ID: <CAJe_ZhfDsfehCXHB6pCuQ6672kXBYFxh687cZT1qaSCOyLy76g@mail.gmail.com>
References: <1416995095-13763-1-git-send-email-padma.v@samsung.com>
	<CAAgF-BfpU72KTJjVd8jWStD8yJ5sSmXOiQm77xQunO2QhC9ExQ@mail.gmail.com>
	<547DF61D.3010909@metafoo.de>
	<CAAgF-BfPyaOhhrA5L8vm2WDnhBYDexJFkGxqL1GsL2TMB8z=Rw@mail.gmail.com>
	<CAJe_Zhd2-vBgAoJsBt7JCOYDuTZrBCScSZ1HaNO3gNTZ-P6A9A@mail.gmail.com>
	<20141205151843.GV11285@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f47.google.com ([209.85.192.47]:53731 "EHLO
	mail-qg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751940AbaLFHBC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 6 Dec 2014 02:01:02 -0500
Received: by mail-qg0-f47.google.com with SMTP id z60so1498821qgd.20
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Dec 2014 23:01:01 -0800 (PST)
In-Reply-To: <20141205151843.GV11285@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Padma Venkat <padma.kvr@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Padmavathi Venna <padma.v@samsung.com>, "Koul, Vinod" <vinod.koul@intel.com>, Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org, Dylan Reid <dgreid@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 5 December 2014 at 20:48, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Wed, Dec 03, 2014 at 01:21:37PM +0530, Jassi Brar wrote:
>> because the reasoning above seems incorrect considering the following
>> documentation...
>>
>> Documentation/crypto/async-tx-api.txt says
>                        ^^^^^^^^^^^^
>
> async-tx-api is not the DMA slave API.
>
>>   " .... Once a driver-specific threshold is met the driver
>> automatically issues pending operations.  An application can force this
>> event by calling async_tx_issue_pending_all(). ...."
>                    ^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> DMA slave users do not call this function.  This documentation is not
> relevant for DMA slave.
>
The APIs (device_issue_pending, tx_submit etc) are same for Slave and Async.
async_tx_issue_pending_all() for Async and dma_async_issue_pending()
for Slave both boil down to device_issue_pending()

>> include/linux/dmaengine.h says
>>   dma_async_tx_descriptor.tx_submit(): set the prepared descriptor(s)
>> to be executed by the engine
>
> It doesn't say when.
>
:) OK

>> so theoretically a driver, not starting transfer until
>> issue_pending(), is "broken".
>
> It isn't.  DMA slave engine implementations have been needing the
> issue_pending() call since their dawn, so it's something that they've
> always needed.
>
>> At best the patch@04abf5daf7d makes the driver slightly more
>> complicated and the reason behind confusion such as in this thread.
>
> That may be, and yes, it _might_ be worth discussing whether this should
> be relaxed or not, but that should be done as a proposal, not trying to
> hide it as a bug fix.  It isn't.
>
It does, though, create an "awkward situation" when a channel is
active while new requests are submitted - why would the channel want
to stop after current transfer and await fresh issue_pending()? It's
not that the request can be modified after submission.

And it isn't that tx_submit() is meant for 'sleepable' preparation for
the transfer and we need another call to be issued from atomic
context. From what I see most drivers don't need to sleep in
tx_submit(). In fact, from a quick look most clients seem to suffer
from the ritual i.e, there's nothing between tx_submit() and
issue_pending() calls. And when there is indeed some code, it seems
that can be moved just before tx_submit().

Last and apparently the least of all, we can never enforce the same
behavior of the api on Async dma and have uniform behavior over the
api.

So, if all tx_submit() does is put the request in controller driver's
internal queue and the client can't touch the request after
tx_submit(), why not merge the tx_submit() and issue_pending()?

Thanks.
