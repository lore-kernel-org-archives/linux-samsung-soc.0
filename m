From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v5 8/9] mfd: cros_ec: spi: Add a DT property to delay asserting the CS
Date: Wed,  3 Jun 2015 15:04:03 +0200
Message-ID: <1433336644-20532-9-git-send-email-javier.martinez@collabora.co.uk>
References: <1433336644-20532-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433336644-20532-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

From: Alexandru M Stan <amstan@chromium.org>

Some ECs need a little time for waking up before they can accept
SPI data at a high speed. Add a "google,cros-ec-spi-pre-delay"
property to the DT binding to configure this.

If this property isn't set, then no delay will be added. However,
if set it will cause a delay equal to the value passed to it to
be inserted at the beginning of a transaction.

Signed-off-by: Alexandru M Stan <amstan@chromium.org>
Reviewed-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Chris Zhong <zyw@rock-chips.com>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Lee Jones <lee.jones@linaro.org>
---

Changes since v4: None.

Changes since v3:
 - Split DT binding and driver change as suggested by Lee Jones.
 - Add tested-by tag from Heiko Stuebner
 - Add acked-by tag from Lee Jones.

Changes since v2: None

Changes since v1: None, new patch
---
 Documentation/devicetree/bindings/mfd/cros-ec.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Documentation/devicetree/bindings/mfd/cros-ec.txt
index dcf404d16067..e03a61c54954 100644
--- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
+++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
@@ -18,6 +18,10 @@ Required properties (SPI):
 - reg: SPI chip select
 
 Optional properties (SPI):
+- google,cros-ec-spi-pre-delay: Some implementations of the EC need a little
+  time to wake up from sleep before they can receive SPI transfers at a high
+  clock rate. This property specifies the delay, in usecs, between the
+  assertion of the CS to the start of the first clock pulse.
 - google,cros-ec-spi-msg-delay: Some implementations of the EC require some
   additional processing time in order to accept new transactions. If the delay
   between transactions is not long enough the EC may not be able to respond
-- 
2.1.4
