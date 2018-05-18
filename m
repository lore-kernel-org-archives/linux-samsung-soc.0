From: Vinod <vkoul@kernel.org>
Subject: Re: Revert "dmaengine: pl330: add DMA_PAUSE feature"
Date: Fri, 18 May 2018 12:51:12 +0530
Message-ID: <20180518072112.GG2932@vkoul-mobl>
References: <eb17d6a7-a188-3ef4-2641-5fd588b16431@samsung.com>
 <CAJz5Opfd9zeEAShFtUNhW4yLfVykef=2QdWWzq88Dtddn4eymQ@mail.gmail.com>
 <06f54061-c537-b399-e493-ec2cdf4def5d@samsung.com>
 <20180515062144.GC13271@vkoul-mobl>
 <CAJz5Open++Dj=a4ty-JbnZBFoqbMQKU6qYumJKSRMRLp_3erSw@mail.gmail.com>
 <20180517041946.GQ13271@vkoul-mobl>
 <CAJz5Opfep+TL0k_3kG7uQc_nU-BdFy1wsD1jo1agwtSvw0JibQ@mail.gmail.com>
 <CGME20180518040358epcas2p353b0096d33116ca78a03b16d24569813@epcas2p3.samsung.com>
 <20180518040349.GB2932@vkoul-mobl>
 <7f0b7404-ee12-977f-02a4-a463d1873aee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7f0b7404-ee12-977f-02a4-a463d1873aee@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Frank Mori Hess <fmh6jj@gmail.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, r.baldyga@hackerion.com, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 18-05-18, 08:28, Marek Szyprowski wrote:
> Hi Vinod,
> 
> Okay, I see that in theory, there are some tricky bits in implementing DMA
> support in UART drivers. On the other hand there are already drivers 
> with seems
> to be working fine. This discussion is about revert of the feature 
> present in
> pl330 driver, which is required by other in-kernel driver without proper 
> fix to
> them.
> 
> Can we drop it for now and discuss what and how should be implemented to 
> make
> everyone happy, without any regressions?

Sure am dropping the revert, we can always bring it back if it is required

-- 
~Vinod
