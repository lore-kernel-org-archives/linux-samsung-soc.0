From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: drm/exynos: merge exynos_drm_buf.c to exynos_drm_gem.c
Date: Wed, 19 Aug 2015 11:35:46 +0300
Message-ID: <20150819083546.GA5271@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:24277 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751847AbbHSIf4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Aug 2015 04:35:56 -0400
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jy0922.shim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org

Hello Joonyoung Shim,

The patch 2a8cb4894540: "drm/exynos: merge exynos_drm_buf.c to
exynos_drm_gem.c" from Aug 16, 2015, leads to the following static
checker warning:

	drivers/gpu/drm/exynos/exynos_drm_gem.c:610 exynos_drm_gem_prime_import_sg_table()
	error: 'exynos_gem_obj' dereferencing possible ERR_PTR()

drivers/gpu/drm/exynos/exynos_drm_gem.c
   562  struct drm_gem_object *
   563  exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
   564                                       struct dma_buf_attachment *attach,
   565                                       struct sg_table *sgt)
   566  {
   567          struct exynos_drm_gem_obj *exynos_gem_obj;
   568          int npages;
   569          int ret;
   570  
   571          exynos_gem_obj = exynos_drm_gem_init(dev, attach->dmabuf->size);
   572          if (IS_ERR(exynos_gem_obj)) {
   573                  ret = PTR_ERR(exynos_gem_obj);

exynos_gem_obj is an ERR_PTR.

   574                  goto err;
   575          }
   576  
   577          exynos_gem_obj->dma_addr = sg_dma_address(sgt->sgl);

   603  
   604          return &exynos_gem_obj->base;
   605  
   606  err_free_large:
   607          drm_free_large(exynos_gem_obj->pages);
   608  err:
   609          drm_gem_object_release(&exynos_gem_obj->base);
   610          kfree(exynos_gem_obj);

So both the drm_gem_object_release() and kfree() will crash.  Do we
really need both?  I feel like there should be a single free function
which undoes the exynos_drm_gem_init() function.  Also the
exynos_drm_gem_init() has no documentation about how it is supposed to
be freed.

   611          return ERR_PTR(ret);
   612  }

regards,
dan carpenter
