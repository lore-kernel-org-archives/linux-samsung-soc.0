From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] ARM: smp: allow get the core count from L2 control on A15
Date: Tue, 31 Jan 2012 15:20:11 +0000
Message-ID: <20120131152011.GC10299@e102568-lin.cambridge.arm.com>
References: <04be01cce011$6b3b3550$41b19ff0$%kim@samsung.com>
 <20120131141313.GA31004@mudshark.cambridge.arm.com>
 <4F27F8E8.1030703@samsung.com>
 <20120131143247.GB31004@mudshark.cambridge.arm.com>
 <4F27FD69.7060207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:34620 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753594Ab2AaPVB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 10:21:01 -0500
In-Reply-To: <4F27FD69.7060207@samsung.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Will Deacon <Will.Deacon@arm.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rmk+kernel@arm.linux.org.uk" <rmk+kernel@arm.linux.org.uk>

On Tue, Jan 31, 2012 at 02:40:41PM +0000, Kukjin Kim wrote:
> On 01/31/12 23:32, Will Deacon wrote:
> > On Tue, Jan 31, 2012 at 02:21:28PM +0000, Kukjin Kim wrote:
> >> On 01/31/12 23:13, Will Deacon wrote:
> >>>
> >>> This doesn't belong in smp.c but, more importantly, this doesn't work for
> >>> multi-cluster configurations at all. Since all A15 implementations will be
> >>> on new platforms, the code will be device-tree only and so we should use
> >>
> >> Why not? As I know, current arm kernel ARMv7 arch can support A15
> >> without device-tree. And you know, the core number should be counted by
> >> L2 control register. no?
> >
> > I'll answer these in order:
> 
> Hmm, let
> >
> > 1.) The code doesn't belong in smp.c because it's specific to the A15
> 
> Yes, agree. So I just commented in my patch, I'm not sure where it 
> should be added at.

I do not think it should be added at all. And if you add it at least add
it to your BSP code (not in smp.c), because it works for a single cluster A15 
configuration, it does not for other A15 based systems. 
I think Will's comment was pretty clear about this.

> > 2.) The architecture code may well support A15, but since there are no
> >      platforms in mainline that support A15 yet, then all new platforms will
> >      need to be DT-based. That means we can rely on the DT to provide this
> >      information.
> 
> Well, I will submit EXYNOS5 which has two A15 cores today and I don't 
> know why it should be supported only with DT, EXYNOS5 DT supporting will 
> be submitted though.
> 

See above.

> > 3.) The L2 control register only tells you how many cores are hanging off
> >      that particular L2. This will be wrong for multi-cluster systems since
> >      it will only identify a subset of the cores.
> 
> OK, let me check it.

Check it and you will notice that it does not work for multi-cluster SMP
systems.

> >
> >>> I believe Lorenzo posted some patches which you could look at.
> >>>
> >> OK, Would be better.
> >
> > Yes, I think it's the only way to solve this problem without adding an
> > architected method for enumerating the CPU topology.
> >
> I'm not sure it is the only way...

We are not stating that it is the only way to do it. We are saying it is the
only way to do it in a generic way without relying on a per platform hook (if 
it exists).
If it does not and we rely on this patch, we end up booting only one cluster out
of the possible ones, which is awesome.

I am against adding this code for the aforementioned reasons.

Lorenzo
