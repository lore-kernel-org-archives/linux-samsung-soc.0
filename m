From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/9] mm: Provide new get_vaddr_frames() helper
Date: Tue, 2 Jun 2015 15:29:12 -0700
Message-ID: <20150602152912.4851e6fd4213828ddf7eb5b2@linux-foundation.org>
References: <1431522495-4692-1-git-send-email-jack@suse.cz>
	<1431522495-4692-3-git-send-email-jack@suse.cz>
	<20150528162402.19a0a26a5b9eae36aa8050e5@linux-foundation.org>
	<20150602152300.GD17315@quack.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20150602152300.GD17315@quack.suse.cz>
Sender: owner-linux-mm@kvack.org
To: Jan Kara <jack@suse.cz>
Cc: linux-mm@kvack.org, linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, Pawel Osciak <pawel@osciak.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, mgorman@suse.de, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 2 Jun 2015 17:23:00 +0200 Jan Kara <jack@suse.cz> wrote:

> > That's a lump of new code which many kernels won't be needing.  Can we
> > put all this in a new .c file and select it within drivers/media
> > Kconfig?
>   So the attached patch should do what you had in mind. OK?

lgtm.

>  drivers/gpu/drm/exynos/Kconfig      |   1 +
>  drivers/media/platform/omap/Kconfig |   1 +
>  drivers/media/v4l2-core/Kconfig     |   1 +
>  mm/Kconfig                          |   3 +
>  mm/Makefile                         |   1 +
>  mm/frame-vec.c                      | 233 ++++++++++++++++++++++++++++++++++++

But frame_vector.c would be a more pleasing name.  For `struct frame_vector'.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
