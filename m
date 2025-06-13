Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CB52749DE
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 07:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798649; cv=none; b=pQlcltAmPwq9n2Rq3pGkH07tRlry2UnTu2KjEr6np8Zh3oaf1DWoLKNSfwfyxTp7RfNYX8E6L18CeHwW2QIsCBHQfBHyp9Q1y4YvVJPD9GFYJ4RZHGRXkT82KVqZFVP1uTCZLpsDogQ7c9bPZcTjABp0zZpU00Sl2SyOgsr3tl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798649; c=relaxed/simple;
	bh=N4GERqyQ/aNKE+GzLO4ic7j19Nwcfw85zZpbg8+PhVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=tnbGpit6qc1wZlBQV1FApRLpmVhqP669U+dnVBRnat3aknILp0MkuI3xRsSS1UvuAlgKwRYF2cUu2ZEniJlFBQUVKrkIiVNzbX0M024H1WbrJDeVOInvOG+IoreI3f4wz0kXSTfVrGM9Y/z+XqouNl+6HH8jTjwmz+RCXkB8tw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=q5ILMTZp; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="q5ILMTZp"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250613071046epoutp04e91f841bc988efc2d98b5baf54f58f27~IiJkJsU_-2479524795epoutp04Z
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 07:10:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250613071046epoutp04e91f841bc988efc2d98b5baf54f58f27~IiJkJsU_-2479524795epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749798646;
	bh=VU8b+a8NwP5OQonTw+RBhdH3p1NZdWU0JUi2fp5FNUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q5ILMTZpJjkz960s1lklFZP9KQyNIVMbk70OAN9AXbwE4TPm9NrlJQOteszUyxMd6
	 XiGVjOvtawHiaOJlCTQemTf3ohFpdIigTbIieWmueonIImS0VWq8xDujWz9ol50YHe
	 /i3DU/jKzPAWhU1kCHf1ZLTuxHJJqxsat+lEvL/o=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250613071045epcas5p1300958402e850a91c480897b2fe11169~IiJjlNCvU1532515325epcas5p1f;
	Fri, 13 Jun 2025 07:10:45 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.179]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bJVsv2sBYz6B9m4; Fri, 13 Jun
	2025 07:10:43 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250613055102epcas5p44f66699e2e1f3896948b71819ffea181~IhD9hlF572100621006epcas5p4W;
	Fri, 13 Jun 2025 05:51:02 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055059epsmtip1f1cb0bbb220bb2b1f0e38b66ecf73e45~IhD6uGDHA0439404394epsmtip11;
	Fri, 13 Jun 2025 05:50:59 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v3 8/9] phy: exyons5-usbdrd: support SS combo phy for
 ExynosAutov920
Date: Fri, 13 Jun 2025 11:26:12 +0530
Message-Id: <20250613055613.866909-9-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613055613.866909-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250613055102epcas5p44f66699e2e1f3896948b71819ffea181
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055102epcas5p44f66699e2e1f3896948b71819ffea181
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055102epcas5p44f66699e2e1f3896948b71819ffea181@epcas5p4.samsung.com>

This SoC has a DWC3 compatible link controller and single USB 3.1 DRD
combo phy that supports both UTMI+ (HS) and PIPE3 (SS) and three USB2.0
DRD HS phy controllers those only support the UTMI+ (HS) interface.

Combo phy is combination of two phys. Among these phys, one supports
USB3.1 SSP+(10Gbps) protocol and is backwards compatible to the
USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is required to support
USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.

Add required change in phy driver to support combo SS phy for this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 310 ++++++++++++++++++++++-
 1 file changed, 306 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index ac7bc1d1afd2..97a4f67b0958 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -273,6 +273,36 @@
 #define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
 #define HSPPLLTUNE_FSEL				GENMASK(18, 16)
 
+/* ExynosAutov920 phy usb31drd port reg */
+#define EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL	0x000
+#define PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN	BIT(5)
+#define PHY_RST_CTRL_PIPE_LANE0_RESET_N		BIT(4)
+#define PHY_RST_CTRL_PHY_RESET_OVRD_EN		BIT(1)
+#define PHY_RST_CTRL_PHY_RESET			BIT(0)
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0	0x0004
+#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR		GENMASK(31, 16)
+#define PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK		BIT(8)
+#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK		BIT(4)
+#define PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL		BIT(0)
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1	0x0008
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2	0x000c
+#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN		BIT(0)
+#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA		GENMASK(31, 16)
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0	0x100
+#define PHY_CONFIG0_PHY0_PMA_PWR_STABLE		BIT(14)
+#define PHY_CONFIG0_PHY0_PCS_PWR_STABLE		BIT(13)
+#define PHY_CONFIG0_PHY0_ANA_PWR_EN		BIT(1)
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7	0x11c
+#define PHY_CONFIG7_PHY_TEST_POWERDOWN		BIT(24)
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4	0x110
+#define PHY_CONFIG4_PIPE_RX0_SRIS_MODE_EN	BIT(2)
+
 /* Exynos9 - GS101 */
 #define EXYNOS850_DRD_SECPMACTL			0x48
 #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL		GENMASK(13, 12)
@@ -2048,6 +2078,237 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static void
+exynosautov920_usb31drd_cr_clk(struct exynos5_usbdrd_phy *phy_drd, bool high)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg = 0;
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	if (high)
+		reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
+	else
+		reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
+
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	usleep_range(1, 2);
+}
+
+static void
+exynosautov920_usb31drd_port_phy_ready(struct exynos5_usbdrd_phy *phy_drd)
+{
+	struct device *dev = phy_drd->dev;
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	static const unsigned int timeout_us = 20000;
+	static const unsigned int sleep_us = 40;
+	u32 reg = 0;
+	int err;
+
+	/* Clear cr_para_con */
+	reg &= ~(PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
+			PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR);
+	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1);
+	writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
+
+	exynosautov920_usb31drd_cr_clk(phy_drd, true);
+	exynosautov920_usb31drd_cr_clk(phy_drd, false);
+
+	/*
+	 * The maximum time from phy reset de-assertion to de-assertion of
+	 * tx/rx_ack can be as high as 5ms in fast simulation mode.
+	 * Time to phy ready is < 20ms
+	 */
+	err = readl_poll_timeout(reg_phy +
+				EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0,
+			reg, !(reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK),
+			sleep_us, timeout_us);
+	if (err)
+		dev_err(dev, "timed out waiting for rx/tx_ack: %#.8x\n", reg);
+
+	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+}
+
+static void
+exynosautov920_usb31drd_cr_write(struct exynos5_usbdrd_phy *phy_drd,
+				 u16 addr, u16 data)
+{
+	struct device *dev = phy_drd->dev;
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 cnt = 0;
+	u32 reg = 0;
+
+	/* Pre Clocking */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+
+	/*
+	 * tx clks must be available prior to assertion of tx req.
+	 * tx pstate p2 to p0 transition directly is not permitted.
+	 * tx clk ready must be asserted synchronously on tx clk prior
+	 * to internal transmit clk alignment sequence in the phy
+	 * when entering from p2 to p1 to p0.
+	 */
+	do {
+		exynosautov920_usb31drd_cr_clk(phy_drd, true);
+		exynosautov920_usb31drd_cr_clk(phy_drd, false);
+		cnt++;
+	} while (cnt < 15);
+
+	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+
+	/*
+	 * tx data path is active when tx lane is in p0 state
+	 * and tx data en asserted. enable cr_para_wr_en.
+	 */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
+	reg &= ~PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA;
+	reg |= FIELD_PREP(PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA, data) |
+		PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
+
+	/* write addr */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR;
+	reg |= FIELD_PREP(PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR, addr) |
+		PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
+		PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+
+	/* check cr_para_ack*/
+	cnt = 0;
+	do {
+		/*
+		 * data symbols are captured by phy on rising edge of the
+		 * tx_clk when tx data enabled.
+		 * completion of the write cycle is acknowledged by assertion
+		 * of the cr_para_ack.
+		 */
+		exynosautov920_usb31drd_cr_clk(phy_drd, true);
+		reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+		if ((reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK))
+			break;
+
+		exynosautov920_usb31drd_cr_clk(phy_drd, false);
+
+		/*
+		 * wait for minimum of 10 cr_para_clk cycles after phy reset
+		 * is negated, before accessing control regs to allow for
+		 * internal resets.
+		 */
+		cnt++;
+	} while (cnt < 10);
+
+	if (cnt == 10)
+		dev_dbg(dev, "CR write failed to 0x%04x\n", addr);
+	else
+		exynosautov920_usb31drd_cr_clk(phy_drd, false);
+}
+
+static void
+exynosautov920_usb31drd_phy_reset(struct exynos5_usbdrd_phy *phy_drd, int val)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+	reg &= ~PHY_RST_CTRL_PHY_RESET_OVRD_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+	if (val)
+		reg |= PHY_RST_CTRL_PHY_RESET;
+	else
+		reg &= ~PHY_RST_CTRL_PHY_RESET;
+
+	reg |= PHY_RST_CTRL_PHY_RESET_OVRD_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+}
+
+static void
+exynosautov920_usb31drd_lane0_reset(struct exynos5_usbdrd_phy *phy_drd, int val)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+	reg |= PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+	if (val)
+		reg &= ~PHY_RST_CTRL_PIPE_LANE0_RESET_N;
+	else
+		reg |= PHY_RST_CTRL_PIPE_LANE0_RESET_N;
+
+	reg &= ~PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+}
+
+static void
+exynosautov920_usb31drd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	/*
+	 * Phy and Pipe Lane reset assert.
+	 * assert reset (phy_reset = 1).
+	 * The lane-ack outputs are asserted during reset (tx_ack = rx_ack = 1)
+	 */
+	exynosautov920_usb31drd_phy_reset(phy_drd, 1);
+	exynosautov920_usb31drd_lane0_reset(phy_drd, 1);
+
+	/*
+	 * ANA Power En, PCS & PMA PWR Stable Set
+	 * ramp-up power suppiles
+	 */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0);
+	reg |= PHY_CONFIG0_PHY0_ANA_PWR_EN | PHY_CONFIG0_PHY0_PCS_PWR_STABLE |
+		PHY_CONFIG0_PHY0_PMA_PWR_STABLE;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0);
+
+	usleep_range(10, 15);
+
+	/*
+	 * phy is not functional in test_powerdown mode, test_powerdown to be
+	 * de-asserted for normal operation
+	 */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
+	reg &= ~PHY_CONFIG7_PHY_TEST_POWERDOWN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
+
+	/*
+	 * phy reset signal be asserted for minimum 10us after power
+	 * supplies are ramped-up
+	 */
+	usleep_range(10, 15);
+
+	/*
+	 * Phy and Pipe Lane reset assert de-assert
+	 */
+	exynosautov920_usb31drd_phy_reset(phy_drd, 0);
+	exynosautov920_usb31drd_lane0_reset(phy_drd, 0);
+
+	/* Pipe_rx0_sris_mode_en  = 1 */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4);
+	reg |= PHY_CONFIG4_PIPE_RX0_SRIS_MODE_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4);
+
+	/*
+	 * wait for lane ack outputs to de-assert (tx_ack = rx_ack = 0)
+	 * Exit from the reset state is indicated by de-assertion of *_ack
+	 */
+	exynosautov920_usb31drd_port_phy_ready(phy_drd);
+
+	/* override values for level settings */
+	exynosautov920_usb31drd_cr_write(phy_drd, 0x22, 0x00F5);
+}
+
 static void
 exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 {
@@ -2142,12 +2403,15 @@ exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	/* after POR low and delay 75us, PHYCLOCK is guaranteed. */
 	usleep_range(75, 80);
 
-	/* force pipe3 signal for link */
+	/* Disable forcing pipe interface */
 	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
-	reg |= LINKCTRL_FORCE_PIPE_EN;
-	reg &= ~LINKCTRL_FORCE_PHYSTATUS;
-	reg |= LINKCTRL_FORCE_RXELECIDLE;
+	reg &= ~LINKCTRL_FORCE_PIPE_EN;
 	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
+
+	/* Pclk to pipe_clk */
+	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
+	reg |= EXYNOS2200_CLKRST_LINK_PCLK_SEL;
+	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
 }
 
 static void
@@ -2183,6 +2447,22 @@ static int exynosautov920_usbdrd_phy_init(struct phy *phy)
 	return exynos850_usbdrd_phy_init(phy);
 }
 
+static void
+exynosautov920_usb31drd_ssphy_disable(struct exynos5_usbdrd_phy *phy_drd)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	/* 1. Assert reset (phy_reset = 1) */
+	exynosautov920_usb31drd_lane0_reset(phy_drd, 1);
+	exynosautov920_usb31drd_phy_reset(phy_drd, 1);
+
+	/* phy test power down */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
+	reg |= PHY_CONFIG7_PHY_TEST_POWERDOWN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
+}
+
 static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
 {
 	struct phy_usb_instance *inst = phy_get_drvdata(phy);
@@ -2195,18 +2475,37 @@ static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
 
 	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
 		exynosautov920_usbdrd_hsphy_disable(phy_drd);
+	else if (inst->phy_cfg->id == EXYNOS5_DRDPHY_PIPE3)
+		exynosautov920_usb31drd_ssphy_disable(phy_drd);
 
 	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
 
 	return 0;
 }
 
+static const struct
+exynos5_usbdrd_phy_config usb31drd_phy_cfg_exynosautov920[] = {
+	{
+		.id		= EXYNOS5_DRDPHY_PIPE3,
+		.phy_init	= exynosautov920_usb31drd_pipe3_init,
+	},
+};
+
 static const struct phy_ops exynosautov920_usb31drd_phy_ops = {
 	.init		= exynosautov920_usbdrd_phy_init,
 	.exit		= exynosautov920_usbdrd_phy_exit,
 	.owner		= THIS_MODULE,
 };
 
+static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_ssphy = {
+	.phy_cfg		= usb31drd_phy_cfg_exynosautov920,
+	.phy_ops		= &exynosautov920_usb31drd_phy_ops,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+};
+
 static const struct
 exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
 	{
@@ -2455,6 +2754,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov920-usbdrd-phy",
 		.data = &exynosautov920_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynosautov920-usb31drd-ssphy",
+		.data = &exynosautov920_usb31drd_ssphy
 	},
 	{ },
 };
-- 
2.34.1

