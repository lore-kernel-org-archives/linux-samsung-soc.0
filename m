From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: dts: fix split memory bank for SSDK5440
Date: Thu, 20 Dec 2012 23:41:46 +0000
Message-ID: <20121220234146.GF14363@n2100.arm.linux.org.uk>
References: <1356030217-5472-1-git-send-email-kgene.kim@samsung.com> <CAOesGMg03Yn=fDr1XqmbBUs=eZO0_8=iti1LUiJ6CX5n1Bm45g@mail.gmail.com> <1464138.NEt7mMkYJc@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:35206 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751555Ab2LTXlx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Dec 2012 18:41:53 -0500
Content-Disposition: inline
In-Reply-To: <1464138.NEt7mMkYJc@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org

On Thu, Dec 20, 2012 at 10:14:26PM +0100, Tomasz Figa wrote:
> Hi Olof,
> 
> On Thursday 20 of December 2012 11:56:59 Olof Johansson wrote:
> > Hi,
> > 
> > On Thu, Dec 20, 2012 at 11:03 AM, Kukjin Kim <kgene.kim@samsung.com> 
> wrote:
> > > The size of memory bank should be under 256MB, because current
> > > section size is 256MB on EXYNOS SoCs. This patch fixes it.
> > 
> > This makes no sense. You don't have to split up memory ranges, the
> > code should be made to handle it instead.
> 
> It's not Exynos code which causes the problem. Sparsemem initialization 
> relies on the fact that initial amount of structures to described memory 
> equals to maximum section size which is defined per arch (e.g. 
> ARCH_EXYNOS).
> 
> > What's the actual bug caused by this? The description is vague.
> 
> The kernel panics early on NULL pointer dereference in memory 
> initialization.

And of course the debugging information is included in the commit log so
that others can see what problem you're experiencing and make a decision
whether the proposed solution is the right one...
