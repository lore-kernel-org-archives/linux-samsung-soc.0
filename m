Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010975;
	b=4DTBSZopUwU8pPBgQJBuD/h/ZULs8jnkCsXe+HHA6KyCZFjaIJVtBZzKKcO2uNYuTwN9
	 pPiy51bJn6cOmbX4cviA2+oGfP4ROuKXcHFrRvw7FztbQZ7kuho5QZfWlaDMdtPkNxesK
	 WogEv235eOVoYvFmrkXdHQuJG99d/2VBnfaoVW9jwWZ4bjN62v1A2mMCS2NyG9Q8kd6M8
	 WZNPwa1RQPliJ4vwo/6jzq0Cd106ipNLpCAZE5jYnALClyi+i5Gi6YuOV3628JgojTjS4
	 TX/8wa+Np9p4f6t1EjlSbbbd8pHrJylmIiVdlXnef0D05fT8638IGnrUzdVR/xq60Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010975;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=bbh5aMhAUVje8+nBQ5tUpjMoe2nc/UoJeEY/heeOEBw=;
	b=tg+Aff0GL6S4koPcbLy5PmmvmpHmc+XuolOA1tSjiobfUH4BLW1pnvuAudVPsRPlShSl
	 w5lTFub1QmWc8tTbDuvP05DPC0xHn0KrketphlzQcCYcMZrNGMFOvCuYCctWqPl3o6d3C
	 FnZkyz80lEd4SY0XgM59RVRKJmrJY7Vmd5JNOnydGRZhrAOE5JPyini7TL1SrG8XzoVXk
	 4zUWkV3bqzvmXSK8vp2cm44khk9RnVj1CTeZAGih9KMZMCQzlLhN0750bfrBbVDYnB6LM
	 OgSbb2CljgQUCcmr6ncyNDGRtS73mxef/LLX+SNBWo4p4TplAKrloDh7irr/8jBZ6FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="ZtiP/d+u";
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5700F606A32C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 10:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5700F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=ZtiP/d+u
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261026103612euoutp01c06f3627e6cb50b4b1b55e27e7c6063d~iDframk571492214922euoutp01Y
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 10:36:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261026103612euoutp01c06f3627e6cb50b4b1b55e27e7c6063d~iDframk571492214922euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793010972;
	bh=bbh5aMhAUVje8+nBQ5tUpjMoe2nc/UoJeEY/heeOEBw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ZtiP/d+uoRlBu6hftodzfdwoLv56a69Mo08IySFzWXRgm1l7MrbFm0tfPIdGmwogE
	 q0n+O1wC4yTW7DtNTWGD6px+r/kmUBW77S2dOJ2mWlsCeKTq6FZXApTahm8s1Z/eeW
	 x22lqRRdO+k47ROJz3KWSRuulOa1TWmxx5+kFgxM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261026103612eucas1p10fbe3777394cc604419299509c22a2e7~iDfq9csFi2421624216eucas1p1E;
	Mon, 26 Oct 2026 10:36:12 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261026103611eusmtip260e29b6c5b3c35baab5baa5891a625e1~iDfqoulzd3169731697eusmtip21;
	Mon, 26 Oct 2026 10:36:11 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, stable@vger.kernel.org
Subject: [PATCH] ARM: dts: samsung: exynos4210-universal_c210: fix BCM4330
 Bluetooth GPIOs
Date: Mon, 26 Oct 2026 11:36:05 +0100
Message-ID: <20261026103607.968295-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261026103612eucas1p10fbe3777394cc604419299509c22a2e7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261026103612eucas1p10fbe3777394cc604419299509c22a2e7
X-EPHeader: CA
X-CMS-RootMailID: 20261026103612eucas1p10fbe3777394cc604419299509c22a2e7
References: <CGME20261026103612eucas1p10fbe3777394cc604419299509c22a2e7@eucas1p1.samsung.com>

BT_REG_ON (BT_EN) line of the BCM4330 WLAN/BT combo chip is connected to
the XMMC1CMD pad (GPK1[1]), while the XMDMADDR_4 pad (GPE1[4]) is
connected to BT_RST (BT_nRST). The Bluetooth node however used GPE1[4]
as shutdown-gpios and left the real BT_REG_ON line undriven, so it was
kept low by the default SoC pull-down.

This worked only by accident: the internal regulators of the BCM4330 are
enabled when either WL_REG_ON or BT_REG_ON is high, so the Bluetooth core
was powered via WL_REG_ON driven by the SDIO WLAN power sequence, while
toggling GPE1[4] only released it from reset. Once 'cap-power-off-card'
was added to the SDIO node, the MMC core started to power off the WLAN
part (asserting WL_REG_ON low) whenever it was idle, what cut off the
Bluetooth power as well and resulted in HCI command timeouts.

Fix this by using GPK1[1] as shutdown-gpios and describing GPE1[4] as
active-low reset-gpios. While touching this, move the GPE1[4] pin
configuration to the pinctrl_0 node, as GPE1 bank belongs to that pin
controller, what fixes the following error:

  samsung-pinctrl 11000000.pinctrl: does not have pin group gpe1-4

Fixes: 8929d4a9d204 ("ARM: dts: exynos: Enable BlueTooth support for Universal C210 board")
Cc: stable@vger.kernel.org
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This patch was developed with LLM assistance and have been tested on the
real UniversalC210 board.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 .../boot/dts/samsung/exynos4210-universal_c210.dts  | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
index 744039068e8f..79c0c27d9377 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
@@ -537,7 +537,7 @@ &ohci {
 
 &pinctrl_1 {
 	bt_shutdown: bt-shutdown-pins {
-		samsung,pins = "gpe1-4";
+		samsung,pins = "gpk1-1";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
@@ -572,6 +572,12 @@ i2c_ddc_bus: i2c-ddc-bus-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
+
+	bt_reset: bt-reset-pins {
+		samsung,pins = "gpe1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
 };
 
 &pwm {
@@ -641,9 +647,10 @@ bluetooth {
 
 		max-speed = <3000000>;
 
-		pinctrl-0 = <&bt_shutdown &bt_device_wakeup &bt_host_wakeup>;
+		pinctrl-0 = <&bt_shutdown &bt_reset &bt_device_wakeup &bt_host_wakeup>;
 		pinctrl-names = "default";
-		shutdown-gpios = <&gpe1 4 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpk1 1 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpe1 4 GPIO_ACTIVE_LOW>;
 		device-wakeup-gpios = <&gpx3 1 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpx2 6 GPIO_ACTIVE_HIGH>;
 	};
-- 
2.43.0

