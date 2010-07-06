From: James Simmons <jsimmons@infradead.org>
Subject: Re: [PATCH v3 01/12] s3c-fb: Fix various null references on framebuffer
 memory alloc failure
Date: Tue, 6 Jul 2010 17:16:02 +0100 (BST)
Message-ID: <alpine.LFD.2.00.1007061714570.3285@casper.infradead.org>
References: <1277712538-23188-1-git-send-email-p.osciak@samsung.com> <1277712538-23188-2-git-send-email-p.osciak@samsung.com> <4C2DB6A2.2040005@simtec.co.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:39107 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751088Ab0GFQQG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Jul 2010 12:16:06 -0400
In-Reply-To: <4C2DB6A2.2040005@simtec.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@simtec.co.uk>
Cc: Pawel Osciak <p.osciak@samsung.com>, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com


> On 28/06/10 09:08, Pawel Osciak wrote:
> > The following problems were found in the above situation:
> > 
> > sfb->windows[win] was being assigned at the end of s3c_fb_probe_win only.
> > This resulted in passing a NULL to s3c_fb_release_win if probe_win returned
> > early and a memory leak.
> > 
> > dma_free_writecombine does not allow its third argument to be NULL.
> > 
> > fb_dealloc_cmap does not verify whether its argument is not NULL.
> > 
> > Signed-off-by: Pawel Osciak <p.osciak@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  drivers/video/s3c-fb.c |    8 +++++---
> >  1 files changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
> > index b00c064..d998324 100644
> > --- a/drivers/video/s3c-fb.c
> > +++ b/drivers/video/s3c-fb.c
> > @@ -804,7 +804,8 @@ static void s3c_fb_free_memory(struct s3c_fb *sfb, struct s3c_fb_win *win)
> >  {
> >  	struct fb_info *fbi = win->fbinfo;
> >  
> > -	dma_free_writecombine(sfb->dev, PAGE_ALIGN(fbi->fix.smem_len),
> > +	if (fbi->screen_base)
> > +		dma_free_writecombine(sfb->dev, PAGE_ALIGN(fbi->fix.smem_len),
> >  			      fbi->screen_base, fbi->fix.smem_start);
> >  }
> >  
> > @@ -819,7 +820,8 @@ static void s3c_fb_release_win(struct s3c_fb *sfb, struct s3c_fb_win *win)
> >  {
> >  	if (win->fbinfo) {
> >  		unregister_framebuffer(win->fbinfo);
> > -		fb_dealloc_cmap(&win->fbinfo->cmap);
> > +		if (&win->fbinfo->cmap)
> > +			fb_dealloc_cmap(&win->fbinfo->cmap);
> 
> did you really mean &win->fbinfo->cmap? surely that will end up
> always evaluating to true?

Ouch. If you fail to allocate a color map at boot time no fbdev apps will 
work. Including fbcon.
 
> >  		s3c_fb_free_memory(sfb, win);
> >  		framebuffer_release(win->fbinfo);
> >  	}
> > @@ -865,6 +867,7 @@ static int __devinit s3c_fb_probe_win(struct s3c_fb *sfb, unsigned int win_no,
> >  	WARN_ON(windata->win_mode.yres == 0);
> >  
> >  	win = fbinfo->par;
> > +	*res = win;
> >  	var = &fbinfo->var;
> >  	win->variant = *variant;
> >  	win->fbinfo = fbinfo;
> > @@ -939,7 +942,6 @@ static int __devinit s3c_fb_probe_win(struct s3c_fb *sfb, unsigned int win_no,
> >  		return ret;
> >  	}
> >  
> > -	*res = win;
> >  	dev_info(sfb->dev, "window %d: fb %s\n", win_no, fbinfo->fix.id);
> >  
> >  	return 0;
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fbdev" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
