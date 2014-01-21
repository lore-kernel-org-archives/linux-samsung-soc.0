From: walter harms <wharms@bfs.de>
Subject: Re: [patch] drm/exynos: potential use after free in exynos_drm_open()
Date: Tue, 21 Jan 2014 13:37:07 +0100
Message-ID: <52DE69F3.9070307@bfs.de>
References: <20140121065748.GC31535@elgon.mountain>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20140121065748.GC31535@elgon.mountain>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene.kim@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org



Am 21.01.2014 07:57, schrieb Dan Carpenter:
> If exynos_drm_subdrv_open() fails then we re-use "file_priv".
> 
> Fixes: 96f5421523df ('drm/exynos: use a new anon file for exynos gem mmaper')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 9d096a0c5f8d..3c845292845a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -174,6 +174,7 @@ static int exynos_drm_open(struct drm_device *dev, struct drm_file *file)
>  	if (ret) {
>  		kfree(file_priv);
>  		file->driver_priv = NULL;
> +		return ret;
>  	}

using
	kfree(	file->driver_priv );
	file->driver_priv = NULL;

would be less confusing to read, and give checkers a better chance to spot mistakes.
(btw: file_priv could be removed from this function completely).

just my 2 cents,
re,
 wh

>  
>  	anon_filp = anon_inode_getfile("exynos_gem", &exynos_drm_gem_fops,
> @@ -186,7 +187,7 @@ static int exynos_drm_open(struct drm_device *dev, struct drm_file *file)
>  	anon_filp->f_mode = FMODE_READ | FMODE_WRITE;
>  	file_priv->anon_filp = anon_filp;
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static void exynos_drm_preclose(struct drm_device *dev,
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
