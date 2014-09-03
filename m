From: Mauro Carvalho Chehab <m.chehab@samsung.com>
Subject: [PATCH 40/46] [media] marvel-ccic: just return 0 instead of using a
 var
Date: Wed,  3 Sep 2014 17:33:12 -0300
Message-ID: <85652b7edb36b905a7765dab8c9b52453554aa9e.1409775488.git.m.chehab@samsung.com>
References: <cover.1409775488.git.m.chehab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1409775488.git.m.chehab@samsung.com>
In-Reply-To: <cover.1409775488.git.m.chehab@samsung.com>
References: <cover.1409775488.git.m.chehab@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-arm-kernel@lists.infradead.org, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Instead of allocating a var to store 0 and just return it,
change the code to return 0 directly.

Signed-off-by: Mauro Carvalho Chehab <m.chehab@samsung.com>

diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
index 93f9cf2ebcd6..9d8d885558e5 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
@@ -313,7 +313,6 @@ static int isp_video_release(struct file *file)
 	struct fimc_is_video *ivc = &isp->video_capture;
 	struct media_entity *entity = &ivc->ve.vdev.entity;
 	struct media_device *mdev = entity->parent;
-	int ret = 0;
 
 	mutex_lock(&isp->video_lock);
 
@@ -335,7 +334,7 @@ static int isp_video_release(struct file *file)
 	pm_runtime_put(&isp->pdev->dev);
 	mutex_unlock(&isp->video_lock);
 
-	return ret;
+	return 0;
 }
 
 static const struct v4l2_file_operations isp_video_fops = {
-- 
1.9.3
