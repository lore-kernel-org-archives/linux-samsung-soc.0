From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 02/18] clk: samsung: exynos3250: Move platform driver and
 of_device_id to init section
Date: Wed, 11 May 2016 14:01:58 +0200
Message-ID: <1462968134-6085-2-git-send-email-k.kozlowski@samsung.com>
References: <1462968134-6085-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1462968134-6085-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The platform_driver and of_device_id structs can be moved to init
section because they are referenced only from subsys_initcall-level
function.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos3250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index 16575ee874cb..e26b04fea33b 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -1079,12 +1079,12 @@ static int __init exynos3250_cmu_isp_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id exynos3250_cmu_isp_of_match[] = {
+static const struct of_device_id exynos3250_cmu_isp_of_match[] __initconst = {
 	{ .compatible = "samsung,exynos3250-cmu-isp", },
 	{ /* sentinel */ }
 };
 
-static struct platform_driver exynos3250_cmu_isp_driver = {
+static struct platform_driver exynos3250_cmu_isp_driver __initdata = {
 	.driver = {
 		.name = "exynos3250-cmu-isp",
 		.of_match_table = exynos3250_cmu_isp_of_match,
-- 
1.9.1
