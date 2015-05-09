From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v2 09/10] platform/chrome: cros_ec_lpc - Add support for Google Pixel 2
Date: Sat,  9 May 2015 12:10:40 +0200
Message-ID: <1431166241-15775-10-git-send-email-javier.martinez@collabora.co.uk>
References: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Since the verion of ACPI in Google BIOS does not enumarate the devices
in the LPC bus, the cros_ec_lpc driver resorts to DMI data to check if
a system is supported by the driver and autoload if built as a module.

Add information about the Google Pixel 2 to the DMI device table.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

Changes since v1: None, new patch
---
 drivers/platform/chrome/cros_ec_lpc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index ca7cdc6eef0b..f9a245465fd0 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -320,6 +320,13 @@ static struct dmi_system_id cros_ec_lpc_dmi_table[] __initdata = {
 		},
 	},
 	{
+		/* x86-samus, the Chromebook Pixel 2. */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Samus"),
+		},
+	},
+	{
 		/* x86-peppy, the Acer C720 Chromebook. */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-- 
2.1.4
