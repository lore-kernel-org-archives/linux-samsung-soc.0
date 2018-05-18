From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: Revert "dmaengine: pl330: add DMA_PAUSE feature"
Date: Fri, 18 May 2018 08:28:14 +0200
Message-ID: <7f0b7404-ee12-977f-02a4-a463d1873aee@samsung.com>
References: <CAJz5OpcGX_3u5POExdhnBbRu-T-m7KodGAvk50BOfZWKeH--kg@mail.gmail.com>
        <182f50b9-55b6-c9ce-07fb-718a1d22e9c8@samsung.com>
        <CAJz5Opfqbj6waPrJ3gQsM50=StH_HHvsYySj7sqgeQcKtAVrHQ@mail.gmail.com>
        <eb17d6a7-a188-3ef4-2641-5fd588b16431@samsung.com>
        <CAJz5Opfd9zeEAShFtUNhW4yLfVykef=2QdWWzq88Dtddn4eymQ@mail.gmail.com>
        <06f54061-c537-b399-e493-ec2cdf4def5d@samsung.com>
        <20180515062144.GC13271@vkoul-mobl>
        <CAJz5Open++Dj=a4ty-JbnZBFoqbMQKU6qYumJKSRMRLp_3erSw@mail.gmail.com>
        <20180517041946.GQ13271@vkoul-mobl>
        <CAJz5Opfep+TL0k_3kG7uQc_nU-BdFy1wsD1jo1agwtSvw0JibQ@mail.gmail.com>
        <CGME20180518040358epcas2p353b0096d33116ca78a03b16d24569813@epcas2p3.samsung.com>
        <20180518040349.GB2932@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180518040349.GB2932@vkoul-mobl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod <vkoul@kernel.org>, Frank Mori Hess <fmh6jj@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, r.baldyga@hackerion.com, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Vinod,

On 2018-05-18 06:03, Vinod wrote:
> On 17-05-18, 12:20, Frank Mori Hess wrote:
>> Sorry to keep coming back to this, but I'm experiencing a bit of
>> incredulity that you are saying what you seem to be saying.  You seem
>> to be saying dmaengine provides no way to permanently stop a transfer
>> safely other than transferring the full number of bytes initially
>> requested.  So the proper resolution is the 8250 serial driver needs
>> to remove rx dma support, because they are just trying to do something
>> that is not supported.

...

>> I see two ways of interpreting what you are saying. First, from the
>> point of view of the user of the dmaengine api.  From this point of
>> view it is impossible for data loss to occur during pause or reading
>> the residue, so saying they cause no data loss during
>> pause/residue/terminate is meaningless.  This is because the user
>> can't confirm any data loss until after they have read the residue and
>> the transfer is terminated, since optimistically the data may still be
>> available if only the user would resume and allow the transfer to
>> continue.
>>
>> Second there is the interpretation I want to believe.  This is "no
>> data loss on pause" means that after the pause, no data has been
>> discarded by the dma controller hardware, in fact all the data it has
>> read before being paused has been fully transferred to its
>> destination.  Reading the residue while paused gives you an accurate,
>> up-to-date state of the paused transfer.  Then finally, although in
>> general dma terminate causes data loss, it does not in this case since
>> we terminated while we were paused and read the up-to-date residue.
>> This is the interpretation implicit in the 8250 serial driver.
> You are simply mixing things up! On Pause we don't expect data loss, as user can
> resume the transfer. This means as you rightly guessed, the DMA HW should not drop
> any data, nor should SW.
>
> Now if you want to read residue at this point it is perfectly valid. But if you
> decide to terminate the channel (yes it is terminate_all API), we abort and don't
> have context to report back!
>
> As Lars rightly pointed out, residue calculation are very tricky, DMA fifo may
> have data, some data may be in device FIFO, so residue is always from DMA point
> of view and may differ from device view (more or less depending upon direction)
>
> Now if you require to add more features for your usecase, please do feel free to
> send a patch. The framework can always be improved, we haven't solved world
> hunger yet!

Okay, I see that in theory, there are some tricky bits in implementing DMA
support in UART drivers. On the other hand there are already drivers 
with seems
to be working fine. This discussion is about revert of the feature 
present in
pl330 driver, which is required by other in-kernel driver without proper 
fix to
them.

Can we drop it for now and discuss what and how should be implemented to 
make
everyone happy, without any regressions?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
