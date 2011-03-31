From: Dave Hansen <dave@linux.vnet.ibm.com>
Subject: Re: [PATCH 05/12] mm: alloc_contig_range() added
Date: Thu, 31 Mar 2011 09:02:41 -0700
Message-ID: <1301587361.31087.1040.camel@nimitz>
References: <1301577368-16095-1-git-send-email-m.szyprowski@samsung.com>
	 <1301577368-16095-6-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1301577368-16095-6-git-send-email-m.szyprowski@samsung.com>
Sender: owner-linux-mm@kvack.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, linux-mm@kvack.org, Michal Nazarewicz <mina86@mina86.com>, Kyungmin Park <kyungmin.park@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Ankita Garg <ankita@in.ibm.com>, Daniel Walker <dwalker@codeaurora.org>, Johan MOSSBERG <johan.xx.mossberg@stericsson.com>, Mel Gorman <mel@csn.ul.ie>, Pawel Osciak <pawel@osciak.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 2011-03-31 at 15:16 +0200, Marek Szyprowski wrote:
> +       ret = 0;
> +       while (!PageBuddy(pfn_to_page(start & (~0UL << ret))))
> +               if (WARN_ON(++ret >= MAX_ORDER))
> +                       return -EINVAL; 

Holy cow, that's dense.  Is there really no more straightforward way to
do that?

In any case, please pull the ++ret bit out of the WARN_ON().  Some
people like to do:

#define WARN_ON(...) do{}while(0)

to save space on some systems.  

-- Dave

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
