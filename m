From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] drm/exynos: potential use after free in exynos_drm_open()
Date: Tue, 21 Jan 2014 09:57:48 +0300
Message-ID: <20140121065748.GC31535@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

If exynos_drm_subdrv_open() fails then we re-use "file_priv".

Fixes: 96f5421523df ('drm/exynos: use a new anon file for exynos gem mmaper')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 9d096a0c5f8d..3c845292845a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -174,6 +174,7 @@ static int exynos_drm_open(struct drm_device *dev, struct drm_file *file)
 	if (ret) {
 		kfree(file_priv);
 		file->driver_priv = NULL;
+		return ret;
 	}
 
 	anon_filp = anon_inode_getfile("exynos_gem", &exynos_drm_gem_fops,
@@ -186,7 +187,7 @@ static int exynos_drm_open(struct drm_device *dev, struct drm_file *file)
 	anon_filp->f_mode = FMODE_READ | FMODE_WRITE;
 	file_priv->anon_filp = anon_filp;
 
-	return ret;
+	return 0;
 }
 
 static void exynos_drm_preclose(struct drm_device *dev,
