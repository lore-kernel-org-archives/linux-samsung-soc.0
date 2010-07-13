From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: About SECTION_SIZE_BITS for Sparsemem
Date: Tue, 13 Jul 2010 10:38:51 +0100
Message-ID: <20100713093851.GE20590@n2100.arm.linux.org.uk>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com> <AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com> <001b01cb21aa$ef0e4d80$cd2ae880$%kim@samsung.com> <AANLkTinkujX3VbL0sXjjghovr8eX9Os0huw3OTBut2UP@mail.gmail.com> <20100713092522.6d9939ac.kamezawa.hiroyu@jp.fujitsu.com> <AANLkTimHNBUo30sp1azUcWQiDpADGyEW_N-dwU0nJy9u@mail.gmail.com> <20100713120315.c6c418f4.kamezawa.hiroyu@jp.fujitsu.com> <20100713092852.GC29885@csn.ul.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:41065 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752231Ab0GMJjc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jul 2010 05:39:32 -0400
Content-Disposition: inline
In-Reply-To: <20100713092852.GC29885@csn.ul.ie>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mel Gorman <mel@csn.ul.ie>
Cc: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Minchan Kim <minchan.kim@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Jul 13, 2010 at 10:28:52AM +0100, Mel Gorman wrote:
> I like this idea. It would allow memmap_valid_within to be thrown away
> altogether and it maintains the assumptions of the memory model and
> sounds "cheap".

It can't work.  We map kernel memory with 1MB sections, not pages.
