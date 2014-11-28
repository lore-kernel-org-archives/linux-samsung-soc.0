From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH RFT 1/2] drivers: bus: check cci device tree node status
Date: Fri, 28 Nov 2014 20:20:08 +0530
Message-ID: <1417186209-5256-1-git-send-email-a.kesavan@samsung.com>
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
To: linux-arm-kernel@lists.infradead.org, khilman@kernel.org, nicolas.pitre@linaro.org, lorenzo.pieralisi@arm.com, punit.agrawal@arm.com, will.deacon@arm.com, mark.rutland@arm.com
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, b.zolnierkie@samsung.com, dianders@chromium.org, kgene@kernel.org, olof@lixom.net, kgene.kim@samsung.com, kesavan.abhilash@gmail.com, javier.martinez@collabora.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

The arm-cci driver completes the probe sequence even if the cci node is
marked as disabled. Add a check in the driver to honour the cci status
in the device tree.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 drivers/bus/arm-cci.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 860da40..0ce5e2d 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -1312,6 +1312,9 @@ static int cci_probe(void)
 	if (!np)
 		return -ENODEV;
 
+	if (!of_device_is_available(np))
+		return -ENODEV;
+
 	cci_config = of_match_node(arm_cci_matches, np)->data;
 	if (!cci_config)
 		return -ENODEV;
-- 
1.7.9.5
