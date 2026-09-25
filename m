Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309A64FECF3
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Sep 2026 22:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790375404; cv=none; b=lPoYDOB0ianQeVlgvBu0Lw2QjEzPrWBQje4jQu2WpAW1EIgfiKLrNpu2+2oMZr0AXgIQ8icANox1QeiWUGJ3shMwQgZulxf9idTLqxE07G5OpNOeVrSICfeGinvnN96uS7QGAzOmvZk89su5kTxO/oW30icbzo2ly2LEkssTFyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790375404; c=relaxed/simple;
	bh=2TSFxxlj0HTqlt4SkRM3k7AnGgdDwXqiZZgXoQvcb6Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=i8+c1aYuD0x0op5NC5TmdOBtB27ER6xR4/sWpvzXv5Dw3JK3aBZlA0sEoyJSOhmFiM64Ibnfk7a9urO3VwoceCFnVeFQXltnXTPNQlW1krgEK0VztYvOdaP1tb8YHg/E7zsWX6fDaa0x4aHRhVb2g7q2MJXjVwMQhpOTtDFAJxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I/7Treso; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I/7Treso"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df375fb9b2so13495745ad.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Sep 2026 15:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790375401; x=1790980201; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8tFKY6Yob+QjVQytevnYCBsJhzC2E9g9VMgzANdexgc=;
        b=I/7Treso0v65MocyP/snyiK6+XcgXFgjy1ura8jmGsEnJRyAhLhS8K2FgXbmgSI7Hl
         xSEebX2DS4HezBVxQ5OGQFXTcWNsKpI20NCvLNAOHFgaER1b/UVWyiVKiFt6KEOmS/3h
         5y2puowtYzmoL/6JTSNoLL28GWyqXD53WxkVrpFdlvCY86tAhKO6f0U6y3yiwJIIQUHJ
         8h+qmfCcTff7hdN5mlFv4Y1HOvL34wq39kaBBR0oeUtxEbbrfknUWlfALUmvqs3bb5zM
         zNa+/hKZMuyXhUcu0a5FZQUAAx74thme7oT96Ctbq5jbPtrFpfXlsR3utcFCiKKDSdnx
         TAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790375401; x=1790980201;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8tFKY6Yob+QjVQytevnYCBsJhzC2E9g9VMgzANdexgc=;
        b=gTXhL5Qs80rm2VlYQ789GA6/00zGUS08Z9F7rjU16ekEPkCPbB+CZ1CHOCjbq3xe1+
         NpqgIJDwyeEDQ9/MrusOg1wOX3JC4qsOtD2Cu/NqB0ZAOrTwhApYIzQTHSYuFCiX8O+l
         jtESOFe0ya943X9ANNjMk4OTjIdhMXMOk9v1MvJ1rAz8AG0LbtM1+cC/Pmh0rh6EqYb4
         gecjs2t/6VABa5kynjLYYUnNDFh/qtw10OPItzXOPi/nLPofRNwXSKnMKr4wkr0GmAN4
         7vE//jndo0i0yQ+yYNh2EWxFBxeu4iph9bQ3GZ4SZ+drKCfnMjIFdDW0BJSEqs9krjby
         KXFw==
X-Forwarded-Encrypted: i=1; AKwUvBzNepUQ2jitIxGGVihscvca5o7VN7vO53omDK+41IadVz/5BE+2yA80YhBlM/FYCcHltr1B/LExssIG+eqOPJ+xNw==@vger.kernel.org
X-Gm-Message-State: AFuF++mNOPrJRJmgwj9wKFW+IPYmrG56d56K0HPR2QiGeYB2qDqvL5Ho
	TIy564J+MyD2B6tWAu+icywhNvXbOGDMmj4hIx7CykZRlwkrCQ4SM1ZXlsKI347NQ6uTa64K6n6
	8zZj5V34nqKatKIHdzA==
X-Received: from pfcs22.prod.google.com ([2002:a05:6a00:6fd6:b0:86b:aaf2:b133])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6f12:b0:3dd:a196:3091 with SMTP id adf61e73a8af0-3de0e953993mr6555452637.65.1790375401176;
 Fri, 25 Sep 2026 15:30:01 -0700 (PDT)
Date: Fri, 25 Sep 2026 22:30:00 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=0B74D21BCA57BD40083A73A0DB00FC8CD80B20A1
X-Developer-Signature: v=1; a=openpgp-sha256; l=22970; i=rdbabiera@google.com;
 h=from:subject; bh=2TSFxxlj0HTqlt4SkRM3k7AnGgdDwXqiZZgXoQvcb6Y=;
 b=owGbwMvMwCV2m+FPzw1uhYWMp9WSGLK2fX3OYLd5hWf5zoKU5Ah3wcqjfwW8os73nG0J7J+y1
 vqjq+7mjlIWBjEuBlkxRRbukkvSp8L3OnBYFS+AmcPKBDaEi1MAJrKghJHhhsqv8gtCun/dnzV0
 mt1+3TL/n/zXoD2ZhjsONn7dvrxwGcM/66UmH8wiM3pzN5jcPDw7lUv89JttP7bZG2xfevzAIt+ JjAA=
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925222959.3607769-2-rdbabiera@google.com>
Subject: [PATCH v8] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
From: RD Babiera <rdbabiera@google.com>
To: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de, neil.armstrong@linaro.org
Cc: badhri@google.com, nkapron@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rdbabiera@google.com
Content-Type: text/plain; charset="UTF-8"

Add USB3 PHY support for the Google Tensor G5 USB PHY driver.
This patch adds functionality for the usb3_tca register, usb3 clock,
and usb3 reset as defined in google,lga-usb-phy.yaml. Kconfig now lists
USB SuperSpeed support.

Refactor the probe sequence to initialize the USB2 and USB3 PHYs, and then
initialize clocks and resets for both PHYs afterwards.

Refactor set_vbus_valid to reduce duplicated code.

Implement USB3 phy_ops for phy_init, phy_exit, and phy_power_on.
combo_phy_state enum is added to track PHY bringup state across
PHY API calls. google_usb_set_orientation can reprogram the TCA when the
PHY is ready.

google_usb_set_orientation now calls pm_runtime_get_if_active to
guarantee register access. Setting orientation and pm_runtime management
are now handled within phy_mutex.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
Changes since v1:
* Removed mix of goto-based and scope-based cleanup from usb3 phy_init
* Removed unused usb3_core resource from probe
* Added combo_phy_state enum to interally track ComboPHY bringup state
  to allow google_usb_set_orientation() to change TCA orientation.
* Modify Kconfig documentation to reflect SuperSpeed support

Changes since v2:
* google_usb3_phy_init now sets USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N
  to false if phy_init fails elsewhere.
* google_usb3_phy_init errors are now handled via DEFINE_FREE structures.
  This affects set_pmgt_ref_clk_req_n, clk_bulk_prepare_enable, and
  reset_control_bulk_deassert.
* google_usb2_phy_init also handles undoing clk_bulk_prepare_enable via
  DEFINE_FREE structure.
* google_usb3_phy_power_on allows program_tca_locked in the
  COMBO_PHY_TCA_READY state. Waiting for PoR=>NC is only performed once.
* Note: there are checkpatch errors for the DEFINE_FREE macros resulting
  in "ERROR: trailing statements should be on next line". Other cases of
  DEFINE_FREE where the line limit would otherwise exceed 100 columns
  have the indentation done the same way.

Changes since v3:
* set_pmgt_ref_clk_req_n(false) in google_usb3_phy_exit() comes after
  reset assertion and clock disable to match phy_init() sequence.
* program_tca_locked in usb3 power_on() now requires a valid orientation
  to match google_usb_set_orientation requirements.

Changes since v4:
* google_usb_set_orientation sets gphy->orientation while holding
  phy_mutex.
* google_usb_set_orientation now holds a pm_runtime reference before
  checking for suspend, and calls put_autosuspend prior to normal
  exit.

Changes since v5:
* google_usb_set_orientation replaces pm_runtime_suspended check with
  pm_runtime_get_if_active call.

Changes since v6:
* google_usb_set_orientation uses pm_runtime_put() instead of
  pm_runtime_put_autosuspend().
* Added newline to all dev_* logs
* xa_ack sw poll changed to 100ms, and xa_timeout_val is programmed
  to match during usb3 phy init
* google_usb3_phy_power_on returns -EINVAL when PHY is idle and
  only performs PoR->NC wait in COMBO_PHY_INIT_DONE

Changes since v7:
* Explicitly include linux/iopoll.h and linux/pm_runtime.h.
* Bump GPHY_TCA_TIMEOUT_US to 110ms so the 100ms hardware xa_timeout
expires before the software poll.
* Add blank lines flagged by checkpatch --strict.
* Change pm_runtime_enable() to devm_pm_runtime_enable(), removing
pm_runtime_disable() from driver remove() and fixing missing disable
call from typec_switch_register() error path.
---
 drivers/phy/Kconfig          |   2 +-
 drivers/phy/phy-google-usb.c | 447 +++++++++++++++++++++++++++++++----
 2 files changed, 404 insertions(+), 45 deletions(-)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 19f3b7d12b7d..d2d401129af7 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -100,7 +100,7 @@ config PHY_GOOGLE_USB
 	  the G5 generation (Laguna). This driver provides the PHY interfaces
 	  to interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PHY,
 	  both of which are integrated with the DWC3 USB DRD controller.
-	  This driver currently supports USB high-speed.
+	  This driver currently supports USB high-speed and SuperSpeed.
 
 config USB_LGM_PHY
 	tristate "INTEL Lightning Mountain USB PHY Driver"
diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
index ab20bc20f19e..70d3a3833948 100644
--- a/drivers/phy/phy-google-usb.c
+++ b/drivers/phy/phy-google-usb.c
@@ -9,6 +9,7 @@
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -16,10 +17,12 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/usb/typec_mux.h>
 
+/* USB_CFG_CSR */
 #define USBCS_USB2PHY_CFG19_OFFSET 0x0
 #define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)
 
@@ -28,11 +31,44 @@
 #define USBCS_USB2PHY_CFG21_REF_FREQ_SEL GENMASK(15, 13)
 #define USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL BIT(19)
 
+/* USBDP_TOP */
 #define USBCS_PHY_CFG1_OFFSET 0x28
+#define USBCS_PHY_CFG1_PHY0_MPLLA_SSC_EN BIT(1)
+#define USBCS_PHY_CFG1_PHY0_SRAM_BYPASS_MODE GENMASK(11, 10)
+#define SRAM_BYPASS_MODE_BYPASS_FIRMWARE BIT(0)
+#define SRAM_BYPASS_MODE_BYPASS_CONTEXT BIT(1)
 #define USBCS_PHY_CFG1_SYS_VBUSVALID BIT(17)
 
+#define USBDP_TOP_CFG_REG_OFFSET 0x44
+#define USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N BIT(0)
+
+#define PHY_POWER_CONFIG_REG1_OFFSET 0x48
+#define PHY_POWER_CONFIG_REG1_PG_MODE_EN BIT(1)
+#define PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG GENMASK(31, 14)
+#define UPCS_PIPE_CONFIG_ISO_CPM BIT(5)
+#define UPCS_PIPE_CONFIG_PG_MODE_STATIC BIT(6)
+#define UPCS_PIPE_CONFIG_LANE_RESET_NO_PG_EXIT BIT(9)
+
+/* USB3_TCA */
+#define TCA_INTR_STS_OFFSET 0x8
+#define TCA_INTR_STS_XA_ACT_EVT BIT(0)
+#define TCA_TCPC_OFFSET 0x14
+#define TCA_TCPC_MUX_CONTROL GENMASK(2, 0)
+#define TCA_TCPC_MUX_CONTROL_USB_ONLY 0x1
+#define TCA_TCPC_CONNECTOR_ORIENTATION BIT(3)
+#define TCA_TCPC_VALID BIT(4)
+#define TCA_CTRLSYNCMODE_CFG1_OFFSET 0x24
+#define TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL GENMASK(19, 0)
+#define TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS 0x1e85
+#define TCA_PSTATE_0_OFFSET 0x50
+#define TCA_PSTATE_0_UPCS_LANE0_PHYSTATUS BIT(8)
+
+#define GPHY_TCA_DELAY_US 10
+#define GPHY_TCA_TIMEOUT_US 110000
+
 enum google_usb_phy_id {
 	GOOGLE_USB2_PHY,
+	GOOGLE_USB3_PHY,
 	GOOGLE_USB_PHY_NUM,
 };
 
@@ -46,53 +82,205 @@ struct google_usb_phy_instance {
 	struct reset_control_bulk_data *rsts;
 };
 
+struct google_usb_phy_config {
+	const char * const *clk_names;
+	unsigned int num_clks;
+	const char * const *rst_names;
+	unsigned int num_rsts;
+};
+
+static const char * const u2phy_clk_names[] = {
+	"usb2",
+	"usb2_apb",
+};
+
+static const char * const u3phy_clk_names[] = {
+	"usb3"
+};
+
+static const char * const u2phy_rst_names[] = {
+	"usb2",
+	"usb2_apb",
+};
+
+static const char * const u3phy_rst_names[] = {
+	"usb3"
+};
+
+static const struct google_usb_phy_config phy_configs[GOOGLE_USB_PHY_NUM] = {
+	[GOOGLE_USB2_PHY] = {
+		.clk_names = u2phy_clk_names,
+		.num_clks = ARRAY_SIZE(u2phy_clk_names),
+		.rst_names = u2phy_rst_names,
+		.num_rsts = ARRAY_SIZE(u2phy_rst_names),
+	},
+	[GOOGLE_USB3_PHY] = {
+		.clk_names = u3phy_clk_names,
+		.num_clks = ARRAY_SIZE(u3phy_clk_names),
+		.rst_names = u3phy_rst_names,
+		.num_rsts = ARRAY_SIZE(u3phy_rst_names),
+	},
+};
+
+static inline void google_usb_phy_clk_disable(struct google_usb_phy_instance *inst)
+{
+	clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
+}
+
+DEFINE_FREE(inst_clk_disable, struct google_usb_phy_instance *,
+	    if (_T) google_usb_phy_clk_disable(_T))
+
+static inline void google_usb_phy_rst_disable(struct google_usb_phy_instance *inst)
+{
+	reset_control_bulk_assert(inst->num_rsts, inst->rsts);
+}
+
+DEFINE_FREE(inst_rst_disable, struct google_usb_phy_instance *,
+	    if (_T) google_usb_phy_rst_disable(_T))
+
+/*
+ * combo_phy_state
+ *	COMBO_PHY_IDLE: The ComboPHY has been torn down and USB3 has not completed
+ *			bringup
+ *	COMBO_PHY_INIT_DONE: The ComboPHY bringup sequence is complete.
+ *	COMBO_PHY_TCA_READY: The PoR => NC transition is complete, and the TCA can be
+ *			     moved into USB.
+ */
+enum combo_phy_state {
+	COMBO_PHY_IDLE,
+	COMBO_PHY_INIT_DONE,
+	COMBO_PHY_TCA_READY,
+};
+
 struct google_usb_phy {
 	struct device *dev;
 	struct regmap *usb_cfg_regmap;
 	unsigned int usb2_cfg_offset;
 	void __iomem *usbdp_top_base;
+	void __iomem *usb3_tca_base;
 	struct google_usb_phy_instance *insts;
 	/*
 	 * Protect phy registers from concurrent access, specifically via
-	 * google_usb_set_orientation callback.
+	 * google_usb_set_orientation callback. phy_mutex also protects
+	 * concurrent access to phy_state.
 	 */
 	struct mutex phy_mutex;
 	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
+	enum combo_phy_state phy_state;
 };
 
 static void set_vbus_valid(struct google_usb_phy *gphy)
 {
 	u32 reg;
 
-	if (gphy->orientation == TYPEC_ORIENTATION_NONE) {
-		reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	if (gphy->orientation == TYPEC_ORIENTATION_NONE)
 		reg &= ~USBCS_PHY_CFG1_SYS_VBUSVALID;
-		writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
-	} else {
-		reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	else
 		reg |= USBCS_PHY_CFG1_SYS_VBUSVALID;
-		writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
-	}
+	writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+}
+
+static void set_sram_bypass(struct google_usb_phy *gphy, u32 bypass)
+{
+	u32 reg;
+
+	reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	reg &= ~USBCS_PHY_CFG1_PHY0_SRAM_BYPASS_MODE;
+	reg |= FIELD_PREP(USBCS_PHY_CFG1_PHY0_SRAM_BYPASS_MODE, bypass);
+	writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+}
+
+static void set_pmgt_ref_clk_req_n(struct google_usb_phy *gphy, bool resume)
+{
+	u32 reg;
+
+	reg = readl(gphy->usbdp_top_base + USBDP_TOP_CFG_REG_OFFSET);
+	if (resume)
+		reg |= USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N;
+	else
+		reg &= ~USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N;
+	writel(reg, gphy->usbdp_top_base + USBDP_TOP_CFG_REG_OFFSET);
+}
+
+static inline void disable_pmgt_ref_clk_req_n(struct google_usb_phy *gphy)
+{
+	set_pmgt_ref_clk_req_n(gphy, false);
+}
+
+DEFINE_FREE(pmgt_ref_clk_req_n, struct google_usb_phy *, if (_T) disable_pmgt_ref_clk_req_n(_T))
+
+static int wait_tca_xa_ack(struct google_usb_phy *gphy)
+{
+	int ret;
+	u32 reg;
+
+	ret = readl_poll_timeout(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET,
+				 reg, !!(reg & TCA_INTR_STS_XA_ACT_EVT),
+				 GPHY_TCA_DELAY_US, GPHY_TCA_TIMEOUT_US);
+	if (ret)
+		dev_err(gphy->dev, "tca xa_ack timeout, ret=%d\n", ret);
+
+	return ret;
+}
+
+static int program_tca_locked(struct google_usb_phy *gphy)
+	   __must_hold(&gphy->phy_mutex)
+{
+	int ret;
+	u32 reg;
+
+	reg = readl(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+	writel(reg, gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+
+	reg = readl(gphy->usb3_tca_base + TCA_TCPC_OFFSET);
+	reg &= ~TCA_TCPC_MUX_CONTROL;
+	reg |= FIELD_PREP(TCA_TCPC_MUX_CONTROL, TCA_TCPC_MUX_CONTROL_USB_ONLY);
+	if (gphy->orientation == TYPEC_ORIENTATION_REVERSE)
+		reg |= TCA_TCPC_CONNECTOR_ORIENTATION;
+	else
+		reg &= ~TCA_TCPC_CONNECTOR_ORIENTATION;
+	reg |= TCA_TCPC_VALID;
+	writel(reg, gphy->usb3_tca_base + TCA_TCPC_OFFSET);
+
+	ret = wait_tca_xa_ack(gphy);
+	dev_dbg(gphy->dev, "TCA switch %s, mux %lu, orientation %s\n",
+		ret ? "failed" : "success",
+		FIELD_GET(TCA_TCPC_MUX_CONTROL, reg),
+		FIELD_GET(TCA_TCPC_CONNECTOR_ORIENTATION, reg) ? "reverse" : "normal");
+
+	reg = readl(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+	writel(reg, gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+
+	return ret;
 }
 
 static int google_usb_set_orientation(struct typec_switch_dev *sw,
 				      enum typec_orientation orientation)
 {
 	struct google_usb_phy *gphy = typec_switch_get_drvdata(sw);
+	int ret = 0;
 
 	dev_dbg(gphy->dev, "set orientation %d\n", orientation);
 
-	gphy->orientation = orientation;
+	guard(mutex)(&gphy->phy_mutex);
 
-	if (pm_runtime_suspended(gphy->dev))
-		return 0;
+	gphy->orientation = orientation;
 
-	guard(mutex)(&gphy->phy_mutex);
+	if (IS_ENABLED(CONFIG_PM)) {
+		if (pm_runtime_get_if_active(gphy->dev) <= 0)
+			return 0;
+	}
 
 	set_vbus_valid(gphy);
 
-	return 0;
+	if (gphy->phy_state == COMBO_PHY_TCA_READY && orientation != TYPEC_ORIENTATION_NONE)
+		ret = program_tca_locked(gphy);
+
+	pm_runtime_put(gphy->dev);
+
+	return ret;
 }
 
 static int google_usb2_phy_init(struct phy *_phy)
@@ -122,17 +310,18 @@ static int google_usb2_phy_init(struct phy *_phy)
 	ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
 	if (ret)
 		return ret;
+	struct google_usb_phy_instance *clk_dev __free(inst_clk_disable) = inst;
 
 	ret = reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
-	if (ret) {
-		clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
+	if (ret)
 		return ret;
-	}
 
 	regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
 	reg |= USBCS_USB2PHY_CFG21_PHY_ENABLE;
 	regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
 
+	retain_and_null_ptr(clk_dev);
+
 	return 0;
 }
 
@@ -161,6 +350,128 @@ static const struct phy_ops google_usb2_phy_ops = {
 	.exit		= google_usb2_phy_exit,
 };
 
+static int google_usb3_phy_init(struct phy *_phy)
+{
+	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
+	struct google_usb_phy *gphy = inst->parent;
+	int ret = 0;
+	u32 reg;
+
+	dev_dbg(gphy->dev, "initializing usb3 phy\n");
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	if (gphy->phy_state != COMBO_PHY_IDLE) {
+		dev_warn(gphy->dev, "usb3 phy init called when combo phy state is not idle\n");
+		return 0;
+	}
+
+	reg = readl(gphy->usb3_tca_base + TCA_CTRLSYNCMODE_CFG1_OFFSET);
+	reg &= ~TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL;
+	reg |= FIELD_PREP(TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL,
+			  TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS);
+	writel(reg, gphy->usb3_tca_base + TCA_CTRLSYNCMODE_CFG1_OFFSET);
+
+	reg = readl(gphy->usbdp_top_base + PHY_POWER_CONFIG_REG1_OFFSET);
+	reg |= PHY_POWER_CONFIG_REG1_PG_MODE_EN;
+	reg &= ~PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG;
+	reg |= FIELD_PREP(PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG,
+			  (UPCS_PIPE_CONFIG_ISO_CPM |
+			   UPCS_PIPE_CONFIG_PG_MODE_STATIC |
+			   UPCS_PIPE_CONFIG_LANE_RESET_NO_PG_EXIT));
+	writel(reg, gphy->usbdp_top_base + PHY_POWER_CONFIG_REG1_OFFSET);
+
+	set_vbus_valid(gphy);
+
+	reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	reg |= USBCS_PHY_CFG1_PHY0_MPLLA_SSC_EN;
+	writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+
+	set_sram_bypass(gphy, SRAM_BYPASS_MODE_BYPASS_FIRMWARE |
+			SRAM_BYPASS_MODE_BYPASS_CONTEXT);
+	set_pmgt_ref_clk_req_n(gphy, true);
+	struct google_usb_phy *pmgt_ref_clk_req_dev __free(pmgt_ref_clk_req_n) = gphy;
+
+	ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
+	if (ret)
+		return ret;
+	struct google_usb_phy_instance *clk_dev __free(inst_clk_disable) = inst;
+
+	ret = reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
+	if (ret)
+		return ret;
+	struct google_usb_phy_instance *rst_dev __free(inst_rst_disable) = inst;
+
+	ret = readl_poll_timeout(gphy->usb3_tca_base + TCA_PSTATE_0_OFFSET,
+				 reg, !(reg & TCA_PSTATE_0_UPCS_LANE0_PHYSTATUS),
+				 GPHY_TCA_DELAY_US, GPHY_TCA_TIMEOUT_US);
+	if (ret) {
+		dev_err(gphy->dev, "wait for lane0 phystatus timed out\n");
+		return ret;
+	}
+
+	gphy->phy_state = COMBO_PHY_INIT_DONE;
+
+	retain_and_null_ptr(rst_dev);
+	retain_and_null_ptr(clk_dev);
+	retain_and_null_ptr(pmgt_ref_clk_req_dev);
+
+	return 0;
+}
+
+static int google_usb3_phy_exit(struct phy *_phy)
+{
+	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
+	struct google_usb_phy *gphy = inst->parent;
+
+	dev_dbg(gphy->dev, "exiting usb3 phy\n");
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	reset_control_bulk_assert(inst->num_rsts, inst->rsts);
+	clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
+	set_pmgt_ref_clk_req_n(gphy, false);
+
+	gphy->phy_state = COMBO_PHY_IDLE;
+
+	return 0;
+}
+
+static int google_usb3_phy_power_on(struct phy *_phy)
+{
+	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
+	struct google_usb_phy *gphy = inst->parent;
+	int ret;
+
+	dev_dbg(gphy->dev, "power on usb3 phy\n");
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	if (gphy->phy_state == COMBO_PHY_IDLE)
+		return -EINVAL;
+
+	if (gphy->phy_state == COMBO_PHY_INIT_DONE) {
+		/* Wait for PoR -> NC transitions*/
+		ret = wait_tca_xa_ack(gphy);
+		if (ret) {
+			dev_err(gphy->dev, "PoR->NC transition timeout\n");
+			return ret;
+		}
+		gphy->phy_state = COMBO_PHY_TCA_READY;
+	}
+
+	if (gphy->orientation != TYPEC_ORIENTATION_NONE)
+		return program_tca_locked(gphy);
+
+	return 0;
+}
+
+static const struct phy_ops google_usb3_phy_ops = {
+	.init		= google_usb3_phy_init,
+	.exit		= google_usb3_phy_exit,
+	.power_on	= google_usb3_phy_power_on,
+};
+
 static struct phy *google_usb_phy_xlate(struct device *dev,
 					const struct of_phandle_args *args)
 {
@@ -173,14 +484,61 @@ static struct phy *google_usb_phy_xlate(struct device *dev,
 	return gphy->insts[args->args[0]].phy;
 }
 
+static int google_usb_phy_parse_clocks(struct google_usb_phy *gphy)
+{
+	struct device *dev = gphy->dev;
+	int id, i, ret;
+
+	for (id = 0; id < GOOGLE_USB_PHY_NUM; id++) {
+		const struct google_usb_phy_config *cfg = &phy_configs[id];
+		struct google_usb_phy_instance *inst = &gphy->insts[id];
+
+		inst->num_clks = cfg->num_clks;
+		inst->clks = devm_kcalloc(dev, inst->num_clks, sizeof(*inst->clks), GFP_KERNEL);
+		if (!inst->clks)
+			return -ENOMEM;
+
+		for (i = 0; i < inst->num_clks; i++)
+			inst->clks[i].id = cfg->clk_names[i];
+
+		ret = devm_clk_bulk_get(dev, inst->num_clks, inst->clks);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to get phy%d clks\n", id);
+	}
+
+	return 0;
+}
+
+static int google_usb_phy_parse_resets(struct google_usb_phy *gphy)
+{
+	struct device *dev = gphy->dev;
+	int id, i, ret;
+
+	for (id = 0; id < GOOGLE_USB_PHY_NUM; id++) {
+		const struct google_usb_phy_config *cfg = &phy_configs[id];
+		struct google_usb_phy_instance *inst = &gphy->insts[id];
+
+		inst->num_rsts = cfg->num_rsts;
+		inst->rsts = devm_kcalloc(dev, inst->num_rsts, sizeof(*inst->rsts), GFP_KERNEL);
+		if (!inst->rsts)
+			return -ENOMEM;
+
+		for (i = 0; i < inst->num_rsts; i++)
+			inst->rsts[i].id = cfg->rst_names[i];
+		ret = devm_reset_control_bulk_get_exclusive(dev, inst->num_rsts, inst->rsts);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to get phy%d resets\n", id);
+	}
+
+	return 0;
+}
+
 static int google_usb_phy_probe(struct platform_device *pdev)
 {
 	struct typec_switch_desc sw_desc = { };
-	struct google_usb_phy_instance *inst;
 	struct phy_provider *phy_provider;
 	struct device *dev = &pdev->dev;
 	struct google_usb_phy *gphy;
-	struct phy *phy;
 	u32 args[1];
 	int ret;
 
@@ -212,46 +570,48 @@ static int google_usb_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(gphy->usbdp_top_base),
 				    "invalid usbdp top\n");
 
+	gphy->usb3_tca_base = devm_platform_ioremap_resource_byname(pdev,
+								    "usb3_tca");
+	if (IS_ERR(gphy->usb3_tca_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->usb3_tca_base),
+				    "invalid usb3 tca\n");
+
 	gphy->insts = devm_kcalloc(dev, GOOGLE_USB_PHY_NUM, sizeof(*gphy->insts), GFP_KERNEL);
 	if (!gphy->insts)
 		return -ENOMEM;
 
-	inst = &gphy->insts[GOOGLE_USB2_PHY];
-	inst->parent = gphy;
-	inst->index = GOOGLE_USB2_PHY;
-	phy = devm_phy_create(dev, NULL, &google_usb2_phy_ops);
-	if (IS_ERR(phy))
-		return dev_err_probe(dev, PTR_ERR(phy),
+	gphy->insts[GOOGLE_USB2_PHY].phy = devm_phy_create(dev, NULL, &google_usb2_phy_ops);
+	gphy->insts[GOOGLE_USB2_PHY].index = GOOGLE_USB2_PHY;
+	gphy->insts[GOOGLE_USB2_PHY].parent = gphy;
+	if (IS_ERR(gphy->insts[GOOGLE_USB2_PHY].phy))
+		return dev_err_probe(dev, PTR_ERR(gphy->insts[GOOGLE_USB2_PHY].phy),
 				     "failed to create usb2 phy instance\n");
-	inst->phy = phy;
-	phy_set_drvdata(phy, inst);
+	phy_set_drvdata(gphy->insts[GOOGLE_USB2_PHY].phy, &gphy->insts[GOOGLE_USB2_PHY]);
 
-	inst->num_clks = 2;
-	inst->clks = devm_kcalloc(dev, inst->num_clks, sizeof(*inst->clks), GFP_KERNEL);
-	if (!inst->clks)
-		return -ENOMEM;
-	inst->clks[0].id = "usb2";
-	inst->clks[1].id = "usb2_apb";
-	ret = devm_clk_bulk_get(dev, inst->num_clks, inst->clks);
+	gphy->insts[GOOGLE_USB3_PHY].phy = devm_phy_create(dev, NULL, &google_usb3_phy_ops);
+	gphy->insts[GOOGLE_USB3_PHY].index = GOOGLE_USB3_PHY;
+	gphy->insts[GOOGLE_USB3_PHY].parent = gphy;
+	if (IS_ERR(gphy->insts[GOOGLE_USB3_PHY].phy))
+		return dev_err_probe(dev, PTR_ERR(gphy->insts[GOOGLE_USB3_PHY].phy),
+				     "failed to create usb3 phy instance\n");
+	phy_set_drvdata(gphy->insts[GOOGLE_USB3_PHY].phy, &gphy->insts[GOOGLE_USB3_PHY]);
+
+	ret = google_usb_phy_parse_clocks(gphy);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to get u2 phy clks\n");
+		return ret;
 
-	inst->num_rsts = 2;
-	inst->rsts = devm_kcalloc(dev, inst->num_rsts, sizeof(*inst->rsts), GFP_KERNEL);
-	if (!inst->rsts)
-		return -ENOMEM;
-	inst->rsts[0].id = "usb2";
-	inst->rsts[1].id = "usb2_apb";
-	ret = devm_reset_control_bulk_get_exclusive(dev, inst->num_rsts, inst->rsts);
+	ret = google_usb_phy_parse_resets(gphy);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to get u2 phy resets\n");
+		return ret;
 
 	phy_provider = devm_of_phy_provider_register(dev, google_usb_phy_xlate);
 	if (IS_ERR(phy_provider))
 		return dev_err_probe(dev, PTR_ERR(phy_provider),
 				     "failed to register phy provider\n");
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	sw_desc.fwnode = dev_fwnode(dev);
 	sw_desc.drvdata = gphy;
@@ -271,7 +631,6 @@ static void google_usb_phy_remove(struct platform_device *pdev)
 	struct google_usb_phy *gphy = dev_get_drvdata(&pdev->dev);
 
 	typec_switch_unregister(gphy->sw);
-	pm_runtime_disable(&pdev->dev);
 }
 
 static const struct of_device_id google_usb_phy_of_match[] = {

base-commit: c7f2322431cb6d108b18fb4154606b49e2bc50f7
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

