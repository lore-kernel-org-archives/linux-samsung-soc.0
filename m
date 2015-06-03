From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v5 6/9] mfd: cros_ec: Add DT property to define ChromeOS EC name
Date: Wed,  3 Jun 2015 15:04:01 +0200
Message-ID: <1433336644-20532-7-git-send-email-javier.martinez@collabora.co.uk>
References: <1433336644-20532-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:42487 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760129AbbFCNFZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 09:05:25 -0400
In-Reply-To: <1433336644-20532-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

From: Gwendal Grignou <gwendal@chromium.org>

Chromebooks can have more than one Embedded Controller with
different functinality. For example there may be a EC that
handles Power Delivery (PD) or another one that is a Sensor
Hub (SH). So there should be a way to specify the function
so that is reflected in the character device name and the
sysfs entries.

Add a "google,cros-ec-name" DT property to the ChromeOS EC
binding document to change the EC name based on its function.

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
Reviewed-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

Changes since v4: None, new patch
---
 Documentation/devicetree/bindings/mfd/cros-ec.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Documentation/devicetree/bindings/mfd/cros-ec.txt
index 8009c3d87f33..dcf404d16067 100644
--- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
+++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
@@ -30,6 +30,11 @@ Required properties (LPC):
 - compatible: "google,cros-ec-lpc"
 - reg: List of (IO address, size) pairs defining the interface uses
 
+Optional properties (All):
+- google,cros-ec-name: name of the EC. Can be based on its function: for
+  instance, for Sensor Hub, 'cros_sh', for Power Delivery MCU 'cros_pd'.
+  If is not present, a default name will be set (i.e: 'cros_ec').
+
 
 Example for I2C:
 
-- 
2.1.4
