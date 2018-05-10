From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: Revert "dmaengine: pl330: add DMA_PAUSE feature"
Date: Thu, 10 May 2018 10:31:53 +0200
Message-ID: <eb17d6a7-a188-3ef4-2641-5fd588b16431@samsung.com>
References: <CGME20180508090407eucas1p13713284c2d3f5aa5c66f8d136be683c1@eucas1p1.samsung.com>
        <2484918.HKVQc3yJkt@bear> <53b13d76-16a1-0e0a-09e1-c917e5d49326@samsung.com>
        <CAJz5OpcGX_3u5POExdhnBbRu-T-m7KodGAvk50BOfZWKeH--kg@mail.gmail.com>
        <182f50b9-55b6-c9ce-07fb-718a1d22e9c8@samsung.com>
        <CAJz5Opfqbj6waPrJ3gQsM50=StH_HHvsYySj7sqgeQcKtAVrHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJz5Opfqbj6waPrJ3gQsM50=StH_HHvsYySj7sqgeQcKtAVrHQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Mori Hess <fmh6jj@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, r.baldyga@hackerion.com, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Frank,

On 2018-05-09 19:48, Frank Mori Hess wrote:
> On Wed, May 9, 2018 at 9:19 AM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> I understand that pl330 doesn't support real PAUSE, but as it has been
>> implemented since 2015 the limited support is perfectly possible - just
>> to let serial driver to read the amount of data transferred.
>>
>> Please note that DMA engine documentation clearly states that the best
>> residue granularity the driver might expect is BURST granularity. There
>> is no way to get the information about the data which still sits in the
>> DMA engine fifo when transfer is paused/terminated. This means that
>> the serial driver should set maxburst = 1 if it is interested in
>> getting exact number of bytes received/sent. With maxburst = 1 there
>> is no such thing as data loose in the DMA engine fifo.
> That is not my understanding of the dmaengine pause requirements, but
> of course Vinod can speak authoritatively on this.

Basing on the comments in dma_residue_granularity enum documentation (see
include/linux/dmaengine.h) there is no better granularity of residue
reporting than BURST units. If driver needs byte accuracy, then it should
use MAXBURST=1 and DMA_SLAVE_BUSWIDTH_1_BYTE configuration.

> I also don't agree
> that data loss cannot happen for single transfers.  It only becomes
> less likely since there are fewer bytes in the dma controller fifo and
> they stay there for a shorter period of time.  But even so, there is
> nothing stopping the DMAKILL from killing the transfer thread after it
> does a single byte load but before it does the associated single byte
> store, as they are performed by separate instructions.  As far as your
> serial port goes, the byte has been read by the host, even though it
> never made it to memory, so it is gone forever.  The dma-330 does have
> a load lock which prevents some operations from interrupting a
> load/store combination, but in my observations DMAKILL does not
> respect the load lock.

For the last 3 years no one observed any issue with the current design
(single transfers with DMA_SLAVE_BUSWIDTH_1_BYTE). By removing this
feature we will loose ability to use DMA in the serial drivers, what is
mainly useful for low-power bluetooth operation (serial console is really
negligible case).

I agree that PL330 driver should not advertise PAUSE support, because
HW doesn't have such ability, but for now this is the only way to get
the number of bytes transferred after terminating a transfer. One would
need to change DMA engine framework API to fix this.

>> 3. Samsung driver doesn't check if DMA engine supports PAUSE feature and
>>      proper residue reporting granularity, so your revert simply breaks its
>>      operation.
> Oh, I was wrongly assuming you were talking about an 8250 based serial driver.

Nope, Samsung SoCs have a custom UART ip block.

>> I've checked other device drivers, which use pl330 DMA on Samsung SoCs and
>> besides serial, none of them configure maxburst > 1. When I forced such
>> configuration, none worked fine. I'm a bit confused what does it mean.
>> Either none of the Samsung SoC integrated peripherals support real burst
>> DMA transfers, or the PL330 in Samsung SoCs are somehow limited or
>> dysfunctional. There is already a quirk in pl330 for broken FLUSHP, but I
>> have no idea how to diagnose if this is the case or the problem is in the
>> SoC peripherals. I can live with maxburst set to 1 in those drivers as the
>> proper fix.
> When the DMA-330 is instructed to do a peripheral burst transfer, it
> ignores single transfer requests from the peripheral.  When it is
> instructed to do a single transfer, it will do a single transfer in
> response to either a burst request or a single request.  So unless the
> peripheral actually supports burst requests, the transfer will just
> wait forever for a burst request which never comes.

Okay, so if I get broken transfers when I forced BURST mode, then I can
assume that peripherals doesn't really support it.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
