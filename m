From: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Subject: Re: About SECTION_SIZE_BITS for Sparsemem
Date: Tue, 13 Jul 2010 12:03:15 +0900
Message-ID: <20100713120315.c6c418f4.kamezawa.hiroyu@jp.fujitsu.com>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com>
	<AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com>
	<001b01cb21aa$ef0e4d80$cd2ae880$%kim@samsung.com>
	<AANLkTinkujX3VbL0sXjjghovr8eX9Os0huw3OTBut2UP@mail.gmail.com>
	<20100713092522.6d9939ac.kamezawa.hiroyu@jp.fujitsu.com>
	<AANLkTimHNBUo30sp1azUcWQiDpADGyEW_N-dwU0nJy9u@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fgwmail7.fujitsu.co.jp ([192.51.44.37]:47642 "EHLO
	fgwmail7.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752126Ab0GMDH5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jul 2010 23:07:57 -0400
Received: from m5.gw.fujitsu.co.jp ([10.0.50.75])
	by fgwmail7.fujitsu.co.jp (Fujitsu Gateway) with ESMTP id o6D37tqN016284
	for <linux-samsung-soc@vger.kernel.org> (envelope-from kamezawa.hiroyu@jp.fujitsu.com);
	Tue, 13 Jul 2010 12:07:55 +0900
Received: from smail (m5 [127.0.0.1])
	by outgoing.m5.gw.fujitsu.co.jp (Postfix) with ESMTP id 19A5B45DE5A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jul 2010 12:07:55 +0900 (JST)
Received: from s5.gw.fujitsu.co.jp (s5.gw.fujitsu.co.jp [10.0.50.95])
	by m5.gw.fujitsu.co.jp (Postfix) with ESMTP id EA55F45DE53
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jul 2010 12:07:54 +0900 (JST)
Received: from s5.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s5.gw.fujitsu.co.jp (Postfix) with ESMTP id C86361DB805D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jul 2010 12:07:54 +0900 (JST)
Received: from m106.s.css.fujitsu.com (m106.s.css.fujitsu.com [10.249.87.106])
	by s5.gw.fujitsu.co.jp (Postfix) with ESMTP id 80BA31DB8040
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jul 2010 12:07:54 +0900 (JST)
In-Reply-To: <AANLkTimHNBUo30sp1azUcWQiDpADGyEW_N-dwU0nJy9u@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Minchan Kim <minchan.kim@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Mel Gorman <mel@csn.ul.ie>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, ben-linux@fluff.org

On Tue, 13 Jul 2010 11:05:26 +0900
Minchan Kim <minchan.kim@gmail.com> wrote:

> On Tue, Jul 13, 2010 at 9:25 AM, KAMEZAWA Hiroyuki
> <kamezawa.hiroyu@jp.fujitsu.com> wrote:

> > For example, prepare a page filled with (1 << PG_reserved).
> > and replace it with unnecessary memmap rather than freeing a page for memmap.
> 
> Hmm. I don't got your point.
> The problem is that we access struct page by pfn number not address.
> 
> You mean let's remain memmap on hole with changing PageReseved instead of free?
> 
Like a ZERO_PAGE, preparing RESERVED_PAGE, 
which is filled with (1 << PG_reserved) as

  0x00000400,0x00000400,0x00000400,0x00000400
  .....

And map this pages to every hole. Then, you only waste a page to fill all holes
because "struct page" is aligned to 4bytes.


> I think it's not a good idea to add new flag. If
> Kame. Could you review my RFC patch which makes pfn_valid check more
> tightly on sparsemem?
Sure.

Thanks,
-Kame
