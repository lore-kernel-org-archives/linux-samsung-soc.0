From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/9] mm: Provide new get_vaddr_frames() helper
Date: Fri, 17 Jul 2015 13:26:51 -0700
Message-ID: <20150717132651.18aee9571f267200b9ad15f4@linux-foundation.org>
References: <1436799351-21975-1-git-send-email-jack@suse.com>
	<1436799351-21975-3-git-send-email-jack@suse.com>
	<55A8D7AC.3060709@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <55A8D7AC.3060709@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Jan Kara <jack@suse.com>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-samsung-soc@vger.kernel.org, linux-mm@kvack.org, Jan Kara <jack@suse.cz>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 17 Jul 2015 12:23:40 +0200 Hans Verkuil <hverkuil@xs4all.nl> wrote:

> On 07/13/2015 04:55 PM, Jan Kara wrote:
> > From: Jan Kara <jack@suse.cz>
> > 
> > Provide new function get_vaddr_frames().  This function maps virtual
> > addresses from given start and fills given array with page frame numbers of
> > the corresponding pages. If given start belongs to a normal vma, the function
> > grabs reference to each of the pages to pin them in memory. If start
> > belongs to VM_IO | VM_PFNMAP vma, we don't touch page structures. Caller
> > must make sure pfns aren't reused for anything else while he is using
> > them.
> > 
> > This function is created for various drivers to simplify handling of
> > their buffers.
> > 
> > Acked-by: Mel Gorman <mgorman@suse.de>
> > Acked-by: Vlastimil Babka <vbabka@suse.cz>
> > Signed-off-by: Jan Kara <jack@suse.cz>
> 
> I'd like to see an Acked-by from Andrew or mm-maintainers before I merge this.

I think I already acked this but it got lost.

Acked-by: Andrew Morton <akpm@linux-foundation.org>
