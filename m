From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3] regulator: max8997: limit the number of dvs registers
 programmed in non-dvs mode
Date: Fri, 23 Nov 2012 13:33:14 +0530
Message-ID: <1353657795-1725-3-git-send-email-thomas.abraham@linaro.org>
References: <1353657795-1725-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1353657795-1725-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

In case the gpio based volatage selection mode is not used for either of
buck 1/2/5, then only the BUCKxDVS1 register need to be programmed. So
determine whether dvs mode is used and limit the loop count appropriately.

Cc: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/regulator/max8997.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/max8997.c b/drivers/regulator/max8997.c
index 8901371..231fcdb 100644
--- a/drivers/regulator/max8997.c
+++ b/drivers/regulator/max8997.c
@@ -941,7 +941,7 @@ static int max8997_pmic_probe(struct platform_device *pdev)
 	struct regulator_dev **rdev;
 	struct max8997_data *max8997;
 	struct i2c_client *i2c;
-	int i, ret, size;
+	int i, ret, size, nr_dvs;
 	u8 max_buck1 = 0, max_buck2 = 0, max_buck5 = 0;
 
 	if (!pdata) {
@@ -973,7 +973,10 @@ static int max8997_pmic_probe(struct platform_device *pdev)
 	memcpy(max8997->buck125_gpios, pdata->buck125_gpios, sizeof(int) * 3);
 	max8997->ignore_gpiodvs_side_effect = pdata->ignore_gpiodvs_side_effect;
 
-	for (i = 0; i < 8; i++) {
+	nr_dvs = (pdata->buck1_gpiodvs || pdata->buck2_gpiodvs ||
+			pdata->buck5_gpiodvs) ? 8 : 1;
+
+	for (i = 0; i < nr_dvs; i++) {
 		max8997->buck1_vol[i] = ret =
 			max8997_get_voltage_proper_val(
 					&buck1245_voltage_map_desc,
@@ -1020,7 +1023,7 @@ static int max8997_pmic_probe(struct platform_device *pdev)
 	}
 
 	/* Initialize all the DVS related BUCK registers */
-	for (i = 0; i < 8; i++) {
+	for (i = 0; i < nr_dvs; i++) {
 		max8997_update_reg(i2c, MAX8997_REG_BUCK1DVS1 + i,
 				max8997->buck1_vol[i],
 				0x3f);
-- 
1.6.6.rc2
