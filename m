From: Vinod Koul <vinod.koul@linaro.org>
Subject: Re: Revert "dmaengine: pl330: add DMA_PAUSE feature"
Date: Mon, 21 May 2018 14:46:26 +0530
Message-ID: <20180521091626.GB14654@vkoul-mobl>
References: <CAJz5Opfqbj6waPrJ3gQsM50=StH_HHvsYySj7sqgeQcKtAVrHQ@mail.gmail.com>
 <eb17d6a7-a188-3ef4-2641-5fd588b16431@samsung.com>
 <CAJz5Opfd9zeEAShFtUNhW4yLfVykef=2QdWWzq88Dtddn4eymQ@mail.gmail.com>
 <06f54061-c537-b399-e493-ec2cdf4def5d@samsung.com>
 <20180515062144.GC13271@vkoul-mobl>
 <CAJz5Open++Dj=a4ty-JbnZBFoqbMQKU6qYumJKSRMRLp_3erSw@mail.gmail.com>
 <20180517041946.GQ13271@vkoul-mobl>
 <CAJz5Opfep+TL0k_3kG7uQc_nU-BdFy1wsD1jo1agwtSvw0JibQ@mail.gmail.com>
 <20180518040349.GB2932@vkoul-mobl>
 <CAJz5OpfSanwNS7Z=3FapR97XZzjWF_J23HqVouxVnPn2HwkKLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJz5OpfSanwNS7Z=3FapR97XZzjWF_J23HqVouxVnPn2HwkKLw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Mori Hess <fmh6jj@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, r.baldyga@hackerion.com, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 18-05-18, 14:56, Frank Mori Hess wrote:
> On Fri, May 18, 2018 at 12:03 AM, Vinod <vkoul@kernel.org> wrote:
> >
> > You are simply mixing things up!
> 
> It certainly feels like I'm mixed up.  If I have to resolve this, I'd
> like to be a little less mixed up before I submit more patches which
> are going to inevitably result in subtly broken code suddenly becoming
> prominently and unignorably broken code.  Unfortunately I get the
> impression I'm exhausting your patience to answer my questions, and
> I've failed to fully communicate what the question is.
> 
> 
> > On Pause we don't expect data loss, as user can
> > resume the transfer. This means as you rightly guessed, the DMA HW should not drop
> > any data, nor should SW.
> >
> > Now if you want to read residue at this point it is perfectly valid. But if you
> > decide to terminate the channel (yes it is terminate_all API), we abort and don't
> > have context to report back!
> 
> I understand the residue can't be read after terminate, that's why
> reading the residue is step 2 in pause/residue/terminate.  My question
> was whether the entire sequence pause/residue/terminate taken as a
> whole can or cannot lose data.  Saying that individual steps can or
> can't lose data is not enough, context is required.  The key point is
> whether pause flushes in-flight data to its destination or not.  If it
> does, and our residue is accurate, the terminate cannot cause data
> loss.  If pause doesn't flush, an additional step of flush_sync as
> Lars suggested is required.  So pause/flush_sync/residue/terminate
> would be the safe sequence that cannot lose data.

I wouldn't use cannot, shouldn't would be better here as it depends on HW and
where all data has been buffered and if it can be flushed or not.

Have you checked if pl330 supports such flushing?

> > As Lars rightly pointed out, residue calculation are very tricky, DMA fifo may
> > have data, some data may be in device FIFO, so residue is always from DMA point
> > of view and may differ from device view (more or less depending upon direction)
> >
> > Now if you require to add more features for your usecase, please do feel free to
> > send a patch. The framework can always be improved, we haven't solved world
> > hunger yet!
> 
> World hunger?  I don't see how asking questions about a dma engine's
> data integrity guarantees is either unreasonable or out of scope.

No they are not out of scope, and dmaengine APIs support requested usages.  Have
we solved all cases, hell no. Can we add more to support different scenarios,
absolutely!

-- 
~Vinod
