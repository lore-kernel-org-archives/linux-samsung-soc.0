From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 2/2] MAINTAINERS: add an entry for the Maxim MAX77802 PMIC drivers
Date: Fri, 17 Jul 2015 10:17:58 +0200
Message-ID: <1437121078-26409-3-git-send-email-javier@osg.samsung.com>
References: <1437121078-26409-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437121078-26409-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

I added support for the max77802 drivers and have been maintaining them.
So add an entry for these drivers to make tools like get_maintainer.pl
to work and make people submitting patches add me to the CC list.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d802d19a4ecc..5d964568f207 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6570,6 +6570,14 @@ S:	Supported
 F:	drivers/power/max14577_charger.c
 F:	drivers/power/max77693_charger.c
 
+MAXIM MAX77802 MULTIFUNCTION PMIC DEVICE DRIVERS
+M:	Javier Martinez Canillas <javier@osg.samsung.com>
+L:	linux-kernel@vger.kernel.org
+S:	Supported
+F:	drivers/*/*max77802.c
+F:	Documentation/devicetree/bindings/*/*max77802.txt
+F:	include/dt-bindings/*/*max77802.h
+
 MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BOARDS
 M:	Chanwoo Choi <cw00.choi@samsung.com>
 M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
-- 
2.4.3
