From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: About SECTION_SIZE_BITS for Sparsemem
Date: Tue, 13 Jul 2010 18:37:44 +0100
Message-ID: <20100713173744.GB30142@n2100.arm.linux.org.uk>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com> <AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com> <001b01cb21aa$ef0e4d80$cd2ae880$%kim@samsung.com> <AANLkTinkujX3VbL0sXjjghovr8eX9Os0huw3OTBut2UP@mail.gmail.com> <20100713092658.GB29885@csn.ul.ie> <20100713093815.GD20590@n2100.arm.linux.org.uk> <20100713095035.GE29885@csn.ul.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:53843 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754592Ab0GMRnA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jul 2010 13:43:00 -0400
Content-Disposition: inline
In-Reply-To: <20100713095035.GE29885@csn.ul.ie>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mel Gorman <mel@csn.ul.ie>
Cc: Minchan Kim <minchan.kim@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Jul 13, 2010 at 10:50:35AM +0100, Mel Gorman wrote:
> On Tue, Jul 13, 2010 at 10:38:15AM +0100, Russell King - ARM Linux wrote:
> > On Tue, Jul 13, 2010 at 10:26:58AM +0100, Mel Gorman wrote:
> > > There is also an assumption that a section is fully populated or empty.
> > 
> > That is absolutely absurd. 
> 
> Arguably, violating the memory model by punching unexpected holes in it
> is a also absurd.

Well, it's something we've done since 1.2.xx, and actually it's a new
requirement that's evolved into the code that these page structs need
to be populated.  So it's arguably a regression in the MM code which
hasn't been detected.

> > So, I have a platform which has 256MB at
> > 64MB intervals in 4 chunks. I can fit 512kB to any slot. 
> 
> I'm afraid I'm not quite getting your example.
> 
> If the granularity of the banks is 64MB and the alignment is 256MB, I
> don't see what hole you'd be punching anyway.

I didn't say the alignment is 256MB.  I was referring to the *size* of
memory.

> Not necessarily, just don't punch holes within section boundaries when using
> sparsemem.

Err, you've just changed your story.

Let's take an example setup which is perfectly valid.  512kB at 0x10000000.
512kB at 0x14000000. 32MB at 0x1c000000.

You're saying that MAX_PHYSMEM_BITS=29 SECTION_SIZE_BITS=26 is wrong.

So, what do you suggest would be the correct sparsemem settings for this?
MAX_PHYSMEM_BITS=29 SECTION_SIZE_BITS=19 maybe?
