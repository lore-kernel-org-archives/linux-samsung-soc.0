From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH 12/22] media: s3c-camif: add missing description at s3c_camif_find_format()
Date: Wed, 29 Nov 2017 14:08:30 -0500
Message-ID: <2ec72455321f17abb27438af36db2185ffc13540.1511982439.git.mchehab@s-opensource.com>
References: <73497577f67fbb917e40ab4328104ff310a7c356.1511982439.git.mchehab@s-opensource.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <73497577f67fbb917e40ab4328104ff310a7c356.1511982439.git.mchehab@s-opensource.com>
In-Reply-To: <73497577f67fbb917e40ab4328104ff310a7c356.1511982439.git.mchehab@s-opensource.com>
References: <73497577f67fbb917e40ab4328104ff310a7c356.1511982439.git.mchehab@s-opensource.com>
Sender: linux-media-owner@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Fix this warning:
	drivers/media/platform/s3c-camif/camif-core.c:112: warning: No description found for parameter 'vp'

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 drivers/media/platform/s3c-camif/camif-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index c4ab63986c8f..79bc0ef6bb41 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -103,6 +103,7 @@ static const struct camif_fmt camif_formats[] = {
 
 /**
  * s3c_camif_find_format() - lookup camif color format by fourcc or an index
+ * @vp: video path (DMA) description (codec/preview)
  * @pixelformat: fourcc to match, ignored if null
  * @index: index to the camif_formats array, ignored if negative
  */
-- 
2.14.3
