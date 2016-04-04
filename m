From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/2] ARM: multi_v7_defconfig: Switch max77693 to module
Date: Mon, 04 Apr 2016 16:54:19 +0900
Message-ID: <1459756459-22061-2-git-send-email-k.kozlowski@samsung.com>
References: <1459756459-22061-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1459756459-22061-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kevin Hilman <khilman@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

The driver can be built as a module, so use this possibility.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

This patch depends on previous one "mfd: max77693: Allow building as a
module". Please pick-up everything or provide a tag for me (so I could
pick up this one to samsung-soc tree).
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 4eb10f5ea493..d92f6bfbba0e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -453,7 +453,7 @@ CONFIG_MFD_CROS_EC_SPI=m
 CONFIG_MFD_DA9063=m
 CONFIG_MFD_MAX14577=y
 CONFIG_MFD_MAX77686=y
-CONFIG_MFD_MAX77693=y
+CONFIG_MFD_MAX77693=m
 CONFIG_MFD_MAX8907=y
 CONFIG_MFD_MAX8997=y
 CONFIG_MFD_RK808=y
-- 
2.5.0
