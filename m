From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RFC v4 3/7] extcon: Add raw VBUS and ID cable states
Date: Wed, 08 Jun 2016 15:48:02 +0200
Message-ID: <1465393686-16644-4-git-send-email-k.kozlowski@samsung.com>
References: <1465393686-16644-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1465393686-16644-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, balbi@ti.com, kishon@ti.com, Peter Chen <peter.chen@freescale.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, rogerq@ti.com
List-Id: linux-samsung-soc@vger.kernel.org

The USB controller driver might want to receive the changes for VBUS and
ID pins so it could properly handle USB OTG. Add new cable states for
that purpose.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Previous discussion:
http://lkml.kernel.org/g/<1427980385-21285-3-git-send-email-r.baldyga@samsung.com>
---
 drivers/extcon/extcon.c | 3 +++
 include/linux/extcon.h  | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon.c b/drivers/extcon/extcon.c
index 21a123cadf78..aa02d94e8a78 100644
--- a/drivers/extcon/extcon.c
+++ b/drivers/extcon/extcon.c
@@ -74,6 +74,9 @@ static const char *extcon_name[] =  {
 	[EXTCON_JIG]			= "JIG",
 	[EXTCON_MECHANICAL]		= "MECHANICAL",
 
+	[EXTCON_USB_ID]			= "USB-ID",
+	[EXTCON_USB_VBUS]		= "USB-VBUS",
+
 	NULL,
 };
 
diff --git a/include/linux/extcon.h b/include/linux/extcon.h
index 7abf674c388c..126ae41b84fd 100644
--- a/include/linux/extcon.h
+++ b/include/linux/extcon.h
@@ -66,7 +66,13 @@
 #define EXTCON_JIG		61
 #define EXTCON_MECHANICAL	62
 
-#define EXTCON_NUM		63
+/* Raw status, useful for USB controllers */
+#define EXTCON_USB_ID		63
+#define EXTCON_USB_VBUS		64
+
+#define EXTCON_NUM		65
+
+
 
 struct extcon_cable;
 
-- 
1.9.1
