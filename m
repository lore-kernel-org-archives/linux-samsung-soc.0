From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] drm/exynos: Fix suspend/resume support
Date: Wed, 4 Oct 2017 16:00:56 +0300
Message-ID: <20171004130056.gemn33lk5mrzfamt@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:42174 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751905AbdJDNBI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 09:01:08 -0400
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: m.szyprowski@samsung.com
Cc: linux-samsung-soc@vger.kernel.org

Hello Marek Szyprowski,

This is a semi-automatic email about new static checker warnings.

The patch 6e8edf8a7d8d: "drm/exynos: Fix suspend/resume support" from 
Sep 14, 2017, leads to the following Smatch complaint:

drivers/gpu/drm/exynos/exynos_drm_drv.c:173 exynos_drm_suspend()
	 warn: variable dereferenced before check 'drm_dev' (see line 171)

drivers/gpu/drm/exynos/exynos_drm_drv.c
   170		struct drm_device *drm_dev = dev_get_drvdata(dev);
   171		struct exynos_drm_private *private = drm_dev->dev_private;
                                                     ^^^^^^^^^^^^^^^^^^^^
The patch adds a new dereference,

   172	
   173		if (pm_runtime_suspended(dev) || !drm_dev)
                                                  ^^^^^^^
but the old code had a check for NULL.

   174			return 0;
   175	

There is a similar issue in exynos_drm_resume().

regards,
dan carpenter
