From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: drm/exynos: consider deferred probe case
Date: Tue, 10 Jun 2014 15:38:38 +0300
Message-ID: <20140610123837.GA7854@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:19959 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751816AbaFJMir (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 08:38:47 -0400
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com
Cc: linux-samsung-soc@vger.kernel.org

Hello Inki Dae,

The patch df5225bc9a87: "drm/exynos: consider deferred probe case"
from May 29, 2014, leads to the following static checker warning:

	drivers/gpu/drm/exynos/exynos_drm_fimd.c:996 fimd_probe()
	warn: 'ctx->display' isn't an ERR_PTR

drivers/gpu/drm/exynos/exynos_drm_fimd.c
   994  
   995          ctx->display = exynos_dpi_probe(dev);
   996          if (IS_ERR(ctx->display))
   997                  return PTR_ERR(ctx->display);
   998  

Smatch is complaining because my config has CONFIG_DRM_EXYNOS_DPI
disabled.

1) If CONFIG_DRM_EXYNOS_DPI isn't enabled, we still return "0".  That
will cause a Sparse warning.

2) Also there are still a number of checks for "if (ctx->display)".
Those things are weird to me, are those checks to see
CONFIG_DRM_EXYNOS_DPI is enabled or are they checking that
exynos_dpi_probe() succeeded?

regards,
dan carpenter
