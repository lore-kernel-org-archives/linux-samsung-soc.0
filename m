From: Chanho Park <parkch98@gmail.com>
Subject: [PATCHv2] pinctrl: samsung: add pin_dbg_show callback for debugfs
Date: Tue, 27 Mar 2018 22:58:01 +0900
Message-ID: <20180327135801.9556-1-parkch98@gmail.com>
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
To: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chanho Park <parkch98@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds a samsung_pin_dbg_show function to implement the
pin_dbg_show callback function which can be used to show pin
confuration values. Basically, it can show pin setting values by
accessing the "pins" node like below:

$ cat pins
pin 0 (gpy7-0)  CON(0x0) DAT(0x1) PUD(0x1) DRV(0x0) CON_PDN(0x0) PUD_PDN(0x0)

Signed-off-by: Chanho Park <parkch98@gmail.com>
---
Changes from v1:
- use samsung_pinconf_get instead of samsung_pinconf_rw
- use "static const char * const" type declaration of reg_names
- skip condition change

 drivers/pinctrl/samsung/pinctrl-samsung.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 336e88d7bdb9..618945a0fd38 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -279,6 +279,32 @@ static int samsung_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+#ifdef CONFIG_DEBUG_FS
+/* Forward declaration which can be used by samsung_pin_dbg_show */
+static int samsung_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
+					unsigned long *config);
+static const char * const reg_names[] = {"CON", "DAT", "PUD", "DRV", "CON_PDN",
+					 "PUD_PDN"};
+
+static void samsung_pin_dbg_show(struct pinctrl_dev *pctldev,
+				struct seq_file *s, unsigned int pin)
+{
+	enum pincfg_type cfg_type;
+	unsigned long config;
+	int ret;
+
+	for (cfg_type = 0; cfg_type < PINCFG_TYPE_NUM; cfg_type++) {
+		config = PINCFG_PACK(cfg_type, 0);
+		ret = samsung_pinconf_get(pctldev, pin, &config);
+		if (ret < 0)
+			continue;
+
+		seq_printf(s, " %s(0x%lx)", reg_names[cfg_type],
+			   PINCFG_UNPACK_VALUE(config));
+	}
+}
+#endif
+
 /* list of pinctrl callbacks for the pinctrl core */
 static const struct pinctrl_ops samsung_pctrl_ops = {
 	.get_groups_count	= samsung_get_group_count,
@@ -286,6 +312,9 @@ static const struct pinctrl_ops samsung_pctrl_ops = {
 	.get_group_pins		= samsung_get_group_pins,
 	.dt_node_to_map		= samsung_dt_node_to_map,
 	.dt_free_map		= samsung_dt_free_map,
+#ifdef CONFIG_DEBUG_FS
+	.pin_dbg_show		= samsung_pin_dbg_show,
+#endif
 };
 
 /* check if the selector is a valid pin function selector */
-- 
2.14.1
