From: Frank Mori Hess <fmh6jj@gmail.com>
Subject: Re: Revert "dmaengine: pl330: add DMA_PAUSE feature"
Date: Fri, 18 May 2018 15:01:41 -0400
Message-ID: <CAJz5OpcnK22PqaRNERL79kQ6y8ffmpkUSTbcq8HLaexNZfwxdQ@mail.gmail.com>
References: <2484918.HKVQc3yJkt@bear> <53b13d76-16a1-0e0a-09e1-c917e5d49326@samsung.com>
 <CAJz5OpcGX_3u5POExdhnBbRu-T-m7KodGAvk50BOfZWKeH--kg@mail.gmail.com>
 <182f50b9-55b6-c9ce-07fb-718a1d22e9c8@samsung.com> <CAJz5Opfqbj6waPrJ3gQsM50=StH_HHvsYySj7sqgeQcKtAVrHQ@mail.gmail.com>
 <eb17d6a7-a188-3ef4-2641-5fd588b16431@samsung.com> <CAJz5Opfd9zeEAShFtUNhW4yLfVykef=2QdWWzq88Dtddn4eymQ@mail.gmail.com>
 <06f54061-c537-b399-e493-ec2cdf4def5d@samsung.com> <20180515062144.GC13271@vkoul-mobl>
 <CAJz5Open++Dj=a4ty-JbnZBFoqbMQKU6qYumJKSRMRLp_3erSw@mail.gmail.com>
 <20180517041946.GQ13271@vkoul-mobl> <CAJz5Opfep+TL0k_3kG7uQc_nU-BdFy1wsD1jo1agwtSvw0JibQ@mail.gmail.com>
 <b232b906-9359-bea1-447f-2c1341cc19d5@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b232b906-9359-bea1-447f-2c1341cc19d5@metafoo.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Vinod Koul <vinod.koul@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, r.baldyga@hackerion.com, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, May 17, 2018 at 1:22 PM, Lars-Peter Clausen <lars@metafoo.de> wrote:
> On 05/17/2018 06:20 PM, Frank Mori Hess wrote:
> The problem is not so much on the software side but even more so on the
> hardware side. Not all hardware even supports aborting a transfer with no
> data loss because there is no precise measurement of how much data has been
> transferred. The residue that is reported is always the lower bound, this
> much has been transferred but it might actually have been more.

I'd just like to point out, if the pl330 driver actually did report a
upper bound on the residue (lower bound on bytes transferred) that
would also blow up Marek's samsung serial driver use case.  Instead of
being in a situation where data loss might occur rarely due to a race
condition, they would be in a situation where data loss occurs every
time they stop a transfer.  Not that such a residue reporting would be
incorrect though, the pl330 driver doesn't even advertise burst level
granularity with its residue reporting.
