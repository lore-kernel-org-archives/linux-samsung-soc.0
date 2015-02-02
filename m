From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v5 5/7] mfd: cros_ec: Instantiate ChromeOS EC character device
Date: Mon,  2 Feb 2015 12:26:26 +0100
Message-ID: <1422876388-16540-6-git-send-email-javier.martinez@collabora.co.uk>
References: <1422876388-16540-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422876388-16540-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, Varka Bhadram <varkabhadram@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

The ChromeOS EC character device is an user-space interface to
allow applications to access the Embedded Controller.

Add a cell for this device so it's spawned from the mfd driver.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Acked-by: Lee Jones <lee.jones@linaro.org>
---

Changes since v4: None.

Changes since v3: None, added Acked-by tag from Lee Jones.

Changes since v2:
 - Rename the name to "cros-ec-ctl". Suggested by Lee Jones.

Changes since v1: None, new patch.
---
 drivers/mfd/cros_ec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
index c872e1b0eaf8..c4aecc6f8373 100644
--- a/drivers/mfd/cros_ec.c
+++ b/drivers/mfd/cros_ec.c
@@ -118,6 +118,10 @@ static const struct mfd_cell cros_devs[] = {
 		.id = 2,
 		.of_compatible = "google,cros-ec-i2c-tunnel",
 	},
+	{
+		.name = "cros-ec-ctl",
+		.id = 3,
+	},
 };
 
 int cros_ec_register(struct cros_ec_device *ec_dev)
-- 
2.1.3
