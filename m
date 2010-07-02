From: Ben Dooks <ben@simtec.co.uk>
Subject: Re: [PATCH v3 01/12] s3c-fb: Fix various null references on
	framebuffer memory alloc failure
Date: Fri, 02 Jul 2010 10:51:30 +0100
Message-ID: <4C2DB6A2.2040005@simtec.co.uk>
References: <1277712538-23188-1-git-send-email-p.osciak@samsung.com>
	<1277712538-23188-2-git-send-email-p.osciak@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1277712538-23188-2-git-send-email-p.osciak@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pawel Osciak <p.osciak@samsung.com>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 28/06/10 09:08, Pawel Osciak wrote:
> The following problems were found in the above situation:
> 
> sfb->windows[win] was being assigned at the end of s3c_fb_probe_win only.
> This resulted in passing a NULL to s3c_fb_release_win if probe_win returned
> early and a memory leak.
> 
> dma_free_writecombine does not allow its third argument to be NULL.
> 
> fb_dealloc_cmap does not verify whether its argument is not NULL.
> 
> Signed-off-by: Pawel Osciak <p.osciak@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/video/s3c-fb.c |    8 +++++---
>  1 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
> index b00c064..d998324 100644
> --- a/drivers/video/s3c-fb.c
> +++ b/drivers/video/s3c-fb.c
> @@ -804,7 +804,8 @@ static void s3c_fb_free_memory(struct s3c_fb *sfb, struct s3c_fb_win *win)
>  {
>  	struct fb_info *fbi = win->fbinfo;
>  
> -	dma_free_writecombine(sfb->dev, PAGE_ALIGN(fbi->fix.smem_len),
> +	if (fbi->screen_base)
> +		dma_free_writecombine(sfb->dev, PAGE_ALIGN(fbi->fix.smem_len),
>  			      fbi->screen_base, fbi->fix.smem_start);
>  }
>  
> @@ -819,7 +820,8 @@ static void s3c_fb_release_win(struct s3c_fb *sfb, struct s3c_fb_win *win)
>  {
>  	if (win->fbinfo) {
>  		unregister_framebuffer(win->fbinfo);
> -		fb_dealloc_cmap(&win->fbinfo->cmap);
> +		if (&win->fbinfo->cmap)
> +			fb_dealloc_cmap(&win->fbinfo->cmap);

did you really mean &win->fbinfo->cmap? surely that will end up
always evaluating to true?

>  		s3c_fb_free_memory(sfb, win);
>  		framebuffer_release(win->fbinfo);
>  	}
> @@ -865,6 +867,7 @@ static int __devinit s3c_fb_probe_win(struct s3c_fb *sfb, unsigned int win_no,
>  	WARN_ON(windata->win_mode.yres == 0);
>  
>  	win = fbinfo->par;
> +	*res = win;
>  	var = &fbinfo->var;
>  	win->variant = *variant;
>  	win->fbinfo = fbinfo;
> @@ -939,7 +942,6 @@ static int __devinit s3c_fb_probe_win(struct s3c_fb *sfb, unsigned int win_no,
>  		return ret;
>  	}
>  
> -	*res = win;
>  	dev_info(sfb->dev, "window %d: fb %s\n", win_no, fbinfo->fix.id);
>  
>  	return 0;
