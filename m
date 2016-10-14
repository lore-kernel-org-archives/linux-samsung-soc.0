From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH 23/57] [media] exynos4-is: don't break long lines
Date: Fri, 14 Oct 2016 17:20:11 -0300
Message-ID: <b46229c0703d42350a23b7fa661bd3a762d27930.1476475771.git.mchehab@s-opensource.com>
References: <cover.1476475770.git.mchehab@s-opensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1476475770.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1476475770.git.mchehab@s-opensource.com>
References: <cover.1476475770.git.mchehab@s-opensource.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Due to the 80-cols checkpatch warnings, several strings
were broken into multiple lines. This is not considered
a good practice anymore, as it makes harder to grep for
strings at the source code. So, join those continuation
lines.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 drivers/media/platform/exynos4-is/media-dev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 1a1154a9dfa4..e3a8709138fa 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -938,8 +938,7 @@ static int fimc_md_create_links(struct fimc_md *fmd)
 
 			csis = fmd->csis[pdata->mux_id].sd;
 			if (WARN(csis == NULL,
-				 "MIPI-CSI interface specified "
-				 "but s5p-csis module is not loaded!\n"))
+				 "MIPI-CSI interface specified but s5p-csis module is not loaded!\n"))
 				return -EINVAL;
 
 			pad = sensor->entity.num_pads - 1;
-- 
2.7.4
