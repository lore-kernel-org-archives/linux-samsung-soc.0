From: Wen Yang <wen.yang99@zte.com.cn>
Subject: [PATCH v2 3/4] media: s5p-cec: fix possible object reference leak
Date: Wed, 13 Feb 2019 07:47:59 +0800
Message-ID: <1550015279-42723-1-git-send-email-wen.yang99@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: m.szyprowski@samsung.com
Cc: mchehab@kernel.org, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn, wang.yi59@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>, "Hans Verkuil (hansverk)" <hansverk@cisco.com>, Hans Verkuil <hans.verkuil@cisco.com>, Wen Yang <yellowriver2010@hotmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

The call to of_parse_phandle() returns a node pointer with refcount
incremented thus it must be explicitly decremented here after the last
usage.
The of_find_device_by_node() takes a reference to the underlying device
structure, we also should release that reference.
This patch fixes those two issues.

Hans Verkuil says:
The cec driver should never take a reference of the hdmi device.
It never accesses the HDMI device, it only needs the HDMI device pointer as
a key in the notifier list.
The real problem is that several CEC drivers take a reference of the HDMI
device and never release it. So those drivers need to be fixed.

Fixes: a93d429b51fb ("[media] s5p-cec: add cec-notifier support, move out of staging")
Suggested-by: Hans Verkuil (hansverk) <hansverk@cisco.com>
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Hans Verkuil (hansverk) <hansverk@cisco.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Wen Yang <yellowriver2010@hotmail.com>
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
---
v2->v1: 
- move of_node_put() to just after the 'hdmi_dev = of_find_device_by_node(np)'.
- put_device() can be done before the cec = devm_kzalloc line.

 drivers/media/platform/s5p-cec/s5p_cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/s5p-cec/s5p_cec.c b/drivers/media/platform/s5p-cec/s5p_cec.c
index 8837e26..1f5c355 100644
--- a/drivers/media/platform/s5p-cec/s5p_cec.c
+++ b/drivers/media/platform/s5p-cec/s5p_cec.c
@@ -192,9 +192,11 @@ static int s5p_cec_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	hdmi_dev = of_find_device_by_node(np);
+	of_node_put(np);
 	if (hdmi_dev == NULL)
 		return -EPROBE_DEFER;
 
+	put_device(&hdmi_dev->dev);
 	cec = devm_kzalloc(&pdev->dev, sizeof(*cec), GFP_KERNEL);
 	if (!cec)
 		return -ENOMEM;
-- 
2.9.5
