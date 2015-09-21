From: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio.lopez@collabora.co.uk>
Subject: [PATCH v3 2/4] Documentation: bindings: mfd: cros ec: document vbc EC property
Date: Mon, 21 Sep 2015 10:38:21 -0300
Message-ID: <1442842703-5309-3-git-send-email-emilio.lopez@collabora.co.uk>
References: <1442842703-5309-1-git-send-email-emilio.lopez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442842703-5309-1-git-send-email-emilio.lopez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, olof@lixom.net, kgene@kernel.org, k.kozlowski@samsung.com, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio.lopez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Some EC implementations include a small nvram space used to store
verified boot context data. This boolean property lets us indicate
whether this space is available or not on a specific EC implementation.

Signed-off-by: Emilio L=C3=B3pez <emilio.lopez@collabora.co.uk>
---

Patch is new in v3, split from 3/4

 Documentation/devicetree/bindings/mfd/cros-ec.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Docume=
ntation/devicetree/bindings/mfd/cros-ec.txt
index 1777916..136e0c2 100644
--- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
+++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
@@ -34,6 +34,10 @@ Required properties (LPC):
 - compatible: "google,cros-ec-lpc"
 - reg: List of (IO address, size) pairs defining the interface uses
=20
+Optional properties (all):
+- google,has-vbc-nvram: Some implementations of the EC include a small
+  nvram space used to store verified boot context data. This boolean f=
lag
+  is used to specify whether this nvram is present or not.
=20
 Example for I2C:
=20
--=20
2.1.4
