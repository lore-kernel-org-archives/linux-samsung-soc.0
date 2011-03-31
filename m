From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: [PATCH 04/12] mm: alloc_contig_freed_pages() added
Date: Thu, 31 Mar 2011 23:09:42 +0200
Message-ID: <op.vs77qfx03l0zgt@mnazarewicz-glaptop>
References: <1301577368-16095-1-git-send-email-m.szyprowski@samsung.com>
 <1301577368-16095-5-git-send-email-m.szyprowski@samsung.com>
 <1301587083.31087.1032.camel@nimitz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1301587083.31087.1032.camel@nimitz>
Sender: owner-linux-mm@kvack.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Dave Hansen <dave@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, linux-mm@kvack.org, Kyungmin Park <kyungmin.park@samsung.com>, Andrew
 Morton <akpm@linux-foundation.org>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Ankita Garg <ankita@in.ibm.com>, Daniel
 Walker <dwalker@codeaurora.org>, Johan MOSSBERG <johan.xx.mossberg@stericsson.com>, Mel Gorman <mel@csn.ul.ie>, Pawel
 Osciak <pawel@osciak.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 31 Mar 2011 17:58:03 +0200, Dave Hansen <dave@linux.vnet.ibm.com>  
wrote:

> On Thu, 2011-03-31 at 15:16 +0200, Marek Szyprowski wrote:
>>
>> +unsigned long alloc_contig_freed_pages(unsigned long start, unsigned  
>> long end,
>> +                                      gfp_t flag)
>> +{
>> +       unsigned long pfn = start, count;
>> +       struct page *page;
>> +       struct zone *zone;
>> +       int order;
>> +
>> +       VM_BUG_ON(!pfn_valid(start));
>
> This seems kinda mean.  Could we return an error?  I understand that
> this is largely going to be an early-boot thing, but surely trying to
> punt on crappy input beats a full-on BUG().

Actually, I would have to check but I think that the usage of this function
(in this patchset) is that the caller expects the function to succeed.  It  
is
quite a low-level function so before running it a lot of preparation is  
needed
and the caller must make sure that several conditions are met.  I don't  
really
see advantage of returning a value rather then BUG()ing.

Also, CMA does not call this function at boot time.

-- 
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=./ `o
..o | Computer Science,  Michal "mina86" Nazarewicz    (o o)
ooo +-----<email/xmpp: mnazarewicz@google.com>-----ooO--(_)--Ooo--

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
