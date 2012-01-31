From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] ARM: smp: allow get the core count from L2 control on A15
Date: Tue, 31 Jan 2012 14:32:47 +0000
Message-ID: <20120131143247.GB31004@mudshark.cambridge.arm.com>
References: <04be01cce011$6b3b3550$41b19ff0$%kim@samsung.com>
 <20120131141313.GA31004@mudshark.cambridge.arm.com>
 <4F27F8E8.1030703@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:50098 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754628Ab2AaOdZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 09:33:25 -0500
Content-Disposition: inline
In-Reply-To: <4F27F8E8.1030703@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "rmk+kernel@arm.linux.org.uk" <rmk+kernel@arm.linux.org.uk>

On Tue, Jan 31, 2012 at 02:21:28PM +0000, Kukjin Kim wrote:
> On 01/31/12 23:13, Will Deacon wrote:
> >
> > This doesn't belong in smp.c but, more importantly, this doesn't work for
> > multi-cluster configurations at all. Since all A15 implementations will be
> > on new platforms, the code will be device-tree only and so we should use
> 
> Why not? As I know, current arm kernel ARMv7 arch can support A15 
> without device-tree. And you know, the core number should be counted by 
> L2 control register. no?

I'll answer these in order:

1.) The code doesn't belong in smp.c because it's specific to the A15
2.) The architecture code may well support A15, but since there are no
    platforms in mainline that support A15 yet, then all new platforms will
    need to be DT-based. That means we can rely on the DT to provide this
    information.
3.) The L2 control register only tells you how many cores are hanging off
    that particular L2. This will be wrong for multi-cluster systems since
    it will only identify a subset of the cores.

> > I believe Lorenzo posted some patches which you could look at.
> >
> OK, Would be better.

Yes, I think it's the only way to solve this problem without adding an
architected method for enumerating the CPU topology.

Will
