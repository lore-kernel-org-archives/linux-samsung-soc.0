From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: drm/exynos: merge exynos_drm_buf.c to exynos_drm_gem.c
Date: Wed, 19 Aug 2015 18:25:29 +0900
Message-ID: <55D44B89.8000407@samsung.com>
References: <20150819083546.GA5271@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58855 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751243AbbHSJZb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Aug 2015 05:25:31 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NTB008Q4OUH6T00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Aug 2015 18:25:29 +0900 (KST)
In-reply-to: <20150819083546.GA5271@mwanda>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi,

On 08/19/2015 05:35 PM, Dan Carpenter wrote:
> Hello Joonyoung Shim,
> 
> The patch 2a8cb4894540: "drm/exynos: merge exynos_drm_buf.c to
> exynos_drm_gem.c" from Aug 16, 2015, leads to the following static
> checker warning:
> 
> 	drivers/gpu/drm/exynos/exynos_drm_gem.c:610 exynos_drm_gem_prime_import_sg_table()
> 	error: 'exynos_gem_obj' dereferencing possible ERR_PTR()
> 

Thanks for reporting.

> drivers/gpu/drm/exynos/exynos_drm_gem.c
>    562  struct drm_gem_object *
>    563  exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>    564                                       struct dma_buf_attachment *attach,
>    565                                       struct sg_table *sgt)
>    566  {
>    567          struct exynos_drm_gem_obj *exynos_gem_obj;
>    568          int npages;
>    569          int ret;
>    570  
>    571          exynos_gem_obj = exynos_drm_gem_init(dev, attach->dmabuf->size);
>    572          if (IS_ERR(exynos_gem_obj)) {
>    573                  ret = PTR_ERR(exynos_gem_obj);
> 
> exynos_gem_obj is an ERR_PTR.
> 
>    574                  goto err;

My fault, just should return exynos_gem_obj.

>    575          }
>    576  
>    577          exynos_gem_obj->dma_addr = sg_dma_address(sgt->sgl);
> 
>    603  
>    604          return &exynos_gem_obj->base;
>    605  
>    606  err_free_large:
>    607          drm_free_large(exynos_gem_obj->pages);
>    608  err:
>    609          drm_gem_object_release(&exynos_gem_obj->base);
>    610          kfree(exynos_gem_obj);
> 
> So both the drm_gem_object_release() and kfree() will crash.  Do we
> really need both?  I feel like there should be a single free function
> which undoes the exynos_drm_gem_init() function.  Also the
> exynos_drm_gem_init() has no documentation about how it is supposed to
> be freed.

drm_gem_object_release() and kfree() are functions that undo                                                          
exynos_drm_gem_init(). I think there does not have to be a single free                                                
function certainly.
