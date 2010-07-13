From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: About SECTION_SIZE_BITS for Sparsemem
Date: Tue, 13 Jul 2010 10:38:15 +0100
Message-ID: <20100713093815.GD20590@n2100.arm.linux.org.uk>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com> <AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com> <001b01cb21aa$ef0e4d80$cd2ae880$%kim@samsung.com> <AANLkTinkujX3VbL0sXjjghovr8eX9Os0huw3OTBut2UP@mail.gmail.com> <20100713092658.GB29885@csn.ul.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:41059 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752231Ab0GMJjB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jul 2010 05:39:01 -0400
Content-Disposition: inline
In-Reply-To: <20100713092658.GB29885@csn.ul.ie>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mel Gorman <mel@csn.ul.ie>
Cc: Minchan Kim <minchan.kim@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Jul 13, 2010 at 10:26:58AM +0100, Mel Gorman wrote:
> There is also an assumption that a section is fully populated or empty.

That is absolutely absurd.  So, I have a platform which has 256MB at
64MB intervals in 4 chunks.  I can fit 512kB to any slot.  It starts
at 0x10000000.  Do I really need 1024 sparsemem sections to cater for
this?
