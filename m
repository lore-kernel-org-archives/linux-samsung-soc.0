From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: Revert "dmaengine: pl330: add DMA_PAUSE feature"
Date: Wed, 9 May 2018 15:19:24 +0200
Message-ID: <182f50b9-55b6-c9ce-07fb-718a1d22e9c8@samsung.com>
References: <CGME20180508090407eucas1p13713284c2d3f5aa5c66f8d136be683c1@eucas1p1.samsung.com>
        <2484918.HKVQc3yJkt@bear> <53b13d76-16a1-0e0a-09e1-c917e5d49326@samsung.com>
        <CAJz5OpcGX_3u5POExdhnBbRu-T-m7KodGAvk50BOfZWKeH--kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJz5OpcGX_3u5POExdhnBbRu-T-m7KodGAvk50BOfZWKeH--kg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Mori Hess <fmh6jj@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, r.baldyga@hackerion.com, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Frank,

On 2018-05-08 16:36, Frank Mori Hess wrote:
> On Tue, May 8, 2018 at 5:04 AM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> Hi Frank and Vinod,
>>
>> On 2018-04-28 23:50, Frank Mori Hess wrote:
>>> This reverts commit 88987d2c7534a0269f567fb101e6d71a08f0f01d.
>>>
>>> The pl330.c pause implementation violates the dmaengine requirement
>>> for no data loss, since it relies on the DMAKILL
>>> instruction.  However, DMAKILL discards in-flight data from the
>>> dma controller's fifo.  This is documented in the dma-330 manual
>>> and I have observed it with hardware doing device-to-memory burst
>>> transfers.  The discarded data may or may not show up in the
>>> residue count, depending on timing (resulting in data corruption
>>> effectively).
>>>
>>> Signed-off-by: Frank Mori Hess <fmh6jj@gmail.com>
>> This revert completely breaks serial driver operation on almost all Exynos
>> SoCs, because serial driver relies on having PAUSE feature and proper
>> residue reporting from dma engine. Please drop it if possible.
>>
> It will cause the serial driver to not use the pl330.c driver for dma,
> the serial driver will fall back on using the cpu.  This is
> unfortunate, but the dma hardware simply does not support pause.

I understand that pl330 doesn't support real PAUSE, but as it has been
implemented since 2015 the limited support is perfectly possible - just
to let serial driver to read the amount of data transferred.

Please note that DMA engine documentation clearly states that the best
residue granularity the driver might expect is BURST granularity. There
is no way to get the information about the data which still sits in the
DMA engine fifo when transfer is paused/terminated. This means that
the serial driver should set maxburst = 1 if it is interested in
getting exact number of bytes received/sent. With maxburst = 1 there
is no such thing as data loose in the DMA engine fifo.

This also means that there is no valid reason to revert the Robert's
commit. This is how this API works, so please don't break things which
worked for years.

I did some further research and indeed there are some other issues with
both pl330 driver and Samsung SoC serial driver:
1. pl330 incorrectly reported that it supports SEGMENT residue granularity
    instead of BURST granularity, but Samsung serial driver didn't check
    it.
2. Samsung driver incorrectly set src_maxburst to 16, what might result
    in lost data if dma engine does real burst transfers
3. Samsung driver doesn't check if DMA engine supports PAUSE feature and
    proper residue reporting granularity, so your revert simply breaks its
    operation.

Please note that till now everything worked fine a bit by luck, because
the pl330 driver didn't implement peripheral burst transfers and ignored
(incorrectly) configured maxburst.

I've checked other device drivers, which use pl330 DMA on Samsung SoCs and
besides serial, none of them configure maxburst > 1. When I forced such
configuration, none worked fine. I'm a bit confused what does it mean.
Either none of the Samsung SoC integrated peripherals support real burst
DMA transfers, or the PL330 in Samsung SoCs are somehow limited or
dysfunctional. There is already a quirk in pl330 for broken FLUSHP, but I
have no idea how to diagnose if this is the case or the problem is in the
SoC peripherals. I can live with maxburst set to 1 in those drivers as the
proper fix.

> The
> "nice" stop instruction DMAEND is not allowed to be inserted using the
> debug instruction register.  The only possibility for implementing
> pause would be to make the dma transfer do a DMAWFE (wait for event)
> before every transfer.  Then you would need to devote another dma
> thread to doing nothing but DMASEV (send event) to keep the transfer
> going.  The pause could then DMAKILL the event-generating thread
> rather than the transfer thread.  I don't know exactly what the
> performance impact would be, but it couldn't be good.

I agree that it doesn't make sense to implement real PAUSE with such high
cost.

> The serial driver could be modified to still use dma for TX, since it
> only needs pause for RX.  Also, if your serial hardware can report
> exactly how many bytes it has sitting in its rx fifo, the serial
> driver could be modified to use pause-less dma for RX.  This is
> actually what I did for the custom serial hardware I'm using with a
> dma-330, although our serial hardware has a very large rx fifo which
> makes this scheme worthwhile.

When the serial driver fifo size is 16 bytes, it doesn't really make any
sense to use DMA with such limited approach. The maxburst = 1 and proper
residue reporting is the only sane solution in such case.

On the other hand, if you have large fifo in serial driver then it still
MIGHT be faster to read all the fifo content with CPU instead of setting
up DMA engine/pl330 structures... One need to benchmark it on the real
hardware to decide.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
