From: Thibault Saunier <thibault.saunier@osg.samsung.com>
Subject: [PATCH v5 3/3] [media] s5p-mfc: Check and set 'v4l2_pix_format:field' field in try_fmt
Date: Tue, 21 Feb 2017 16:20:59 -0300
Message-ID: <20170221192059.29745-4-thibault.saunier@osg.samsung.com>
References: <20170221192059.29745-1-thibault.saunier@osg.samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170221192059.29745-1-thibault.saunier@osg.samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Andi Shyti <andi.shyti@samsung.com>, linux-media@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thibault Saunier <thibault.saunier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>, Jeongtae Park <jtp.park@samsung.com>, Kyungmin Park <kyungmin.park>
List-Id: linux-samsung-soc@vger.kernel.org

It is required by the standard that the field order is set by the
driver.

Signed-off-by: Thibault Saunier <thibault.saunier@osg.samsung.com>

---

Changes in v5:
- Just adapt the field and never error out.

Changes in v4: None
Changes in v3:
- Do not check values in the g_fmt functions as Andrzej explained in previous review

Changes in v2:
- Fix a silly build error that slipped in while rebasing the patches

 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
index 0976c3e0a5ce..44ed2afe0780 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
@@ -386,6 +386,9 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	struct s5p_mfc_fmt *fmt;
 
+	if (f->fmt.pix.field == V4L2_FIELD_ANY)
+		f->fmt.pix.field = V4L2_FIELD_NONE;
+
 	mfc_debug(2, "Type is %d\n", f->type);
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		fmt = find_format(f, MFC_FMT_DEC);
-- 
2.11.1
