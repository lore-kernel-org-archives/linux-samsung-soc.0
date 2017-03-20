From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] MAINTAINERS: pinctrl: Add git tree to Samsung pinctrl entry
Date: Mon, 20 Mar 2017 18:48:51 +0200
Message-ID: <20170320164851.5999-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Add a Git tree on @kernel.org for maintaining the Samsung pinctrl
drivers.  The tree will be maintained in a shared model between current
Samsung pinctrl maintainers.  Pull requests will be going to Linus
Walleij.

Also add the patchwork for linux-samsung-soc mailing list which will be
used for handling the patches.

Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

As of now, only I have the access to this git tree. Tomasz is welcomed
to join anytime. We are also waiting for Sywlester to get account on
kernel.org.

For the Patchwork, I use it also for Exynos/Samsung ARM architecture
maintenance.  I will add appropriate permissions to Sylwester so we can
share it.
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e922e0b9f0d5..83f53534c47a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9979,6 +9979,8 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
 S:	Maintained
 F:	drivers/pinctrl/samsung/
 F:	include/dt-bindings/pinctrl/samsung.h
-- 
2.9.3
