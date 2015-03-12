From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 2/8] mfd: cros_ec: Sanity check in and out sizes
Date: Thu, 12 Mar 2015 18:02:42 +0100
Message-ID: <1426179768-27482-3-git-send-email-javier.martinez@collabora.co.uk>
References: <1426179768-27482-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426179768-27482-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

The cros_ec_cmd_xfer() function is used to communicate with the EC
and callers set the sizes of data in the input and output buffers.

But these sizes need to be checked to ensure that don't exceed the
fixed maximum length of the input and output buffers.

Reported-by : Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/mfd/cros_ec.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
index c4aecc6f8373..07c53c27c82a 100644
--- a/drivers/mfd/cros_ec.c
+++ b/drivers/mfd/cros_ec.c
@@ -70,6 +70,20 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
 {
 	int ret;
 
+	if (msg->insize > ARRAY_SIZE(msg->indata)) {
+		dev_err(ec_dev->dev,
+			"response of size %u is too big (max: %u)\n",
+			msg->insize, ARRAY_SIZE(msg->indata));
+		return -EMSGSIZE;
+	}
+
+	if (msg->outsize > ARRAY_SIZE(msg->outdata)) {
+		dev_err(ec_dev->dev,
+			"request of size %u is too big (max: %u)\n",
+			msg->outsize, ARRAY_SIZE(msg->outdata));
+		return -EMSGSIZE;
+	}
+
 	mutex_lock(&ec_dev->lock);
 	ret = ec_dev->cmd_xfer(ec_dev, msg);
 	if (msg->result == EC_RES_IN_PROGRESS) {
-- 
2.1.4
