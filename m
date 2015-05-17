From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 3/4] ARM: multi_v7_defconfig: Enable TMU for Exynos
Date: Sun, 17 May 2015 17:09:48 +0900
Message-ID: <1431850195-9558-7-git-send-email-k.kozlowski.k@gmail.com>
References: <1431850195-9558-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431850195-9558-1-git-send-email-k.kozlowski.k@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Enable support for Thermal Monitoring Unit present on Exynos SoCs. This
allows detection of overheat and handling this gracefully.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 6a6a292c5bf8..6ee2c24dfbc7 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -343,6 +343,7 @@ CONFIG_SENSORS_LM90=y
 CONFIG_SENSORS_LM95245=y
 CONFIG_THERMAL=y
 CONFIG_CPU_THERMAL=y
+CONFIG_EXYNOS_THERMAL=y
 CONFIG_RCAR_THERMAL=y
 CONFIG_ARMADA_THERMAL=y
 CONFIG_DAVINCI_WATCHDOG
-- 
2.1.4
