From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 1/5] pinctrl: samsung: Make samsung_pinctrl_get_soc_data use
 ERR_PTR()
Date: Tue, 23 Sep 2014 21:05:37 +0200
Message-ID: <1411499141-26551-2-git-send-email-tomasz.figa@gmail.com>
References: <1411499141-26551-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411499141-26551-1-git-send-email-tomasz.figa@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Currently the function returns a valid pointer on success and NULL on
error, so exact error code is lost. This patch changes return convention
of the function to use ERR_PTR() on error instead.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 4a47691c32b1..0504f0b75de8 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -988,7 +988,7 @@ static struct samsung_pin_ctrl *samsung_pinctrl_get_soc_data(
 	id = of_alias_get_id(node, "pinctrl");
 	if (id < 0) {
 		dev_err(&pdev->dev, "failed to get alias id\n");
-		return NULL;
+		return ERR_PTR(-ENOENT);
 	}
 	match = of_match_node(samsung_pinctrl_dt_match, node);
 	ctrl = (struct samsung_pin_ctrl *)match->data + id;
@@ -1040,9 +1040,9 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	ctrl = samsung_pinctrl_get_soc_data(drvdata, pdev);
-	if (!ctrl) {
+	if (IS_ERR(ctrl)) {
 		dev_err(&pdev->dev, "driver data not available\n");
-		return -EINVAL;
+		return PTR_ERR(ctrl);
 	}
 	drvdata->ctrl = ctrl;
 	drvdata->dev = dev;
-- 
2.1.0
