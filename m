From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH RESEND v2 5/7] mfd: cros_ec: Instantiate ChromeOS EC character device
Date: Fri,  2 Jan 2015 14:32:50 +0100
Message-ID: <1420205572-2640-6-git-send-email-javier.martinez@collabora.co.uk>
References: <1420205572-2640-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420205572-2640-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

The ChromeOS EC character device is an user-space interface to
allow applications to access the Embedded Controller.

Add a cell for this device so it's spawned from the mfd driver.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

Changes since v1: None, new patch.

 drivers/mfd/cros_ec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
index c872e1b..70f9ed5 100644
--- a/drivers/mfd/cros_ec.c
+++ b/drivers/mfd/cros_ec.c
@@ -118,6 +118,10 @@ static const struct mfd_cell cros_devs[] = {
 		.id = 2,
 		.of_compatible = "google,cros-ec-i2c-tunnel",
 	},
+	{
+		.name = "cros-ec-dev",
+		.id = 3,
+	},
 };
 
 int cros_ec_register(struct cros_ec_device *ec_dev)
-- 
2.1.3
