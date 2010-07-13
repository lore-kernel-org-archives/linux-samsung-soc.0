From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: About SECTION_SIZE_BITS for Sparsemem
Date: Tue, 13 Jul 2010 19:31:17 +0100
Message-ID: <20100713183117.GA31162@n2100.arm.linux.org.uk>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com> <AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com> <001b01cb21aa$ef0e4d80$cd2ae880$%kim@samsung.com> <AANLkTinkujX3VbL0sXjjghovr8eX9Os0huw3OTBut2UP@mail.gmail.com> <20100713092522.6d9939ac.kamezawa.hiroyu@jp.fujitsu.com> <20100713105324.07f2f97b.kamezawa.hiroyu@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:42415 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754032Ab0GMScB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jul 2010 14:32:01 -0400
Content-Disposition: inline
In-Reply-To: <20100713105324.07f2f97b.kamezawa.hiroyu@jp.fujitsu.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Cc: Minchan Kim <minchan.kim@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Mel Gorman <mel@csn.ul.ie>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Jul 13, 2010 at 10:53:24AM +0900, KAMEZAWA Hiroyuki wrote:
> yet another _very easy_ solution is, define pfn_valid() as following.

We have a perfectly good and efficient pfn_valid() implementation which'll
work no matter what memory model is chosen - we don't need to invent other
solutions.  But as sparsemem always provides its own pfn_valid() and is
not overridable...

Maybe the answer _is_ to make it overridable.
