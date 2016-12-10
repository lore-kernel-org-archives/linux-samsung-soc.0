From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFC 4/7] ARM: s3c64xx: Annotate external clock frequencies __ro_after_init
Date: Sat, 10 Dec 2016 15:47:35 +0200
Message-ID: <1481377658-22603-4-git-send-email-krzk@kernel.org>
References: <1481377658-22603-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481377658-22603-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Simtec Linux Team <linux@simtec.co.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The xtal_f and xusbxti_f static variables are modified only through
__init accessors (like s3c64xx_set_xtal_freq()).  Later these variables
are used only in read-only way so we can mark them __ro_after_init to
increase code safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Looks safe, but not tested.
---
 arch/arm/mach-s3c64xx/common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c64xx/common.c b/arch/arm/mach-s3c64xx/common.c
index 7c66ce1a6bb6..9843eb4dd04e 100644
--- a/arch/arm/mach-s3c64xx/common.c
+++ b/arch/arm/mach-s3c64xx/common.c
@@ -56,7 +56,8 @@
 #include "watchdog-reset.h"
 
 /* External clock frequency */
-static unsigned long xtal_f = 12000000, xusbxti_f = 48000000;
+static unsigned long xtal_f __ro_after_init = 12000000;
+static unsigned long xusbxti_f __ro_after_init = 48000000;
 
 void __init s3c64xx_set_xtal_freq(unsigned long freq)
 {
-- 
2.7.4
