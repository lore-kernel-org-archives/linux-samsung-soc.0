From: Mel Gorman <mel@csn.ul.ie>
Subject: Re: About SECTION_SIZE_BITS for Sparsemem
Date: Tue, 13 Jul 2010 10:50:35 +0100
Message-ID: <20100713095035.GE29885@csn.ul.ie>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com>
	<AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com>
	<001b01cb21aa$ef0e4d80$cd2ae880$%kim@samsung.com>
	<AANLkTinkujX3VbL0sXjjghovr8eX9Os0huw3OTBut2UP@mail.gmail.com>
	<20100713092658.GB29885@csn.ul.ie>
	<20100713093815.GD20590@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20100713093815.GD20590@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Kukjin Kim <kgene.kim@samsung.com>, Minchan Kim <minchan.kim@gmail.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jul 13, 2010 at 10:38:15AM +0100, Russell King - ARM Linux wrote:
> On Tue, Jul 13, 2010 at 10:26:58AM +0100, Mel Gorman wrote:
> > There is also an assumption that a section is fully populated or empty.
> 
> That is absolutely absurd. 

Arguably, violating the memory model by punching unexpected holes in it
is a also absurd.

> So, I have a platform which has 256MB at
> 64MB intervals in 4 chunks. I can fit 512kB to any slot. 

I'm afraid I'm not quite getting your example.

If the granularity of the banks is 64MB and the alignment is 256MB, I
don't see what hole you'd be punching anyway.

> It starts
> at 0x10000000.  Do I really need 1024 sparsemem sections to cater for
> this?
> 

Not necessarily, just don't punch holes within section boundaries when using
sparsemem. If mapping in a PageReserved page is not an option due to complexity
(it's possible by remapping pages in kernel space which x86 used to do for
discontig) then the size of mem_section as suggested by Minchan Kim would be
another option. This would increase the overhead of sparsemem in terms of space
and performance. - at worst by an amount matching the memory freed by memmap.

-- 
Mel Gorman
Part-time Phd Student                          Linux Technology Center
University of Limerick                         IBM Dublin Software Lab
