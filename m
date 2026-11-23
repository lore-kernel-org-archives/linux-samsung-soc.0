Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425831;
	b=2Upc82smTpTcrJsdQ4LVFSU65HBKcQtyMNafQSq3qW89MLQZv4pyZdPJ0mp1MEoAEU/7
	 u+mhgPmK7vLLjrdmfKi8Ynems1E38AKUPdooPIftUkh1C5/L1iEIcS2pgH40Ugae9rX3l
	 LrPSuR85mB3hIacoF2ZdoBObMjL5tSHLR9Ue1mAmh2jTUq0r8QoQ8Do54MsWGe9O5VSkq
	 a/nslbSe22lmMEIM9obecGxuU05ZWAl+71n5e0XZ03jwJVHd5Dw0HScNP3jIckMBGc1x1
	 QSNGb0NWxvoq2FDfj/wEr4sMjH0aN+AjsdEf4kXXQs7a1bEOhBmgGJeLoectv9WEqxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ec1tqy+OijvQ1oTn+CcDpDl1Xq4ijIg/8Ri8zyKyFyU=;
	b=AaNdQ1aASQOyXg5y93IQ2HWcjxcP8HyTbIi3MCs1KE3oKBF+2dKbqVFe4fPyMdl9GbEi
	 uUgwwx7rEuFc12UjNAs1MdeSut0A50p1P/kUftksGrZrHAEn3S6ieOiiQYOPfk00LQ812
	 yDmrlEXvg2D9GLzgCGyLu3Ko0H3WqBYQVdKdne9D5+/aU6abLw34c7s7f/Jdlfz/hKYKA
	 k2rMD4LqJzK80pxgecdsVSQVa8sdpVUSG9Qm/s43HSLSoNivtHHLs/cjs/G8pat6b3/GO
	 WB5bDfw3l62IRgAIw9iOzUeFs0un1fIH60lMES3hNU49E0RD4+QFM/OYNVSlBN3XaZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OjFINcrT;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EC1606A681
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 09:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1EC1606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OjFINcrT
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so2306679f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 01:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425829; x=1796030629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ec1tqy+OijvQ1oTn+CcDpDl1Xq4ijIg/8Ri8zyKyFyU=;
        b=OjFINcrTP4JNncSN1SDqWhmGgXS7ins35F7MtwsmBhHHMpzBzA8KPKnHCtp6XxNRlo
         tZkqGVkzHTFnme1+yI0OD0RRPy+7ZjCZkZuEXjXeZIyISSE+HezF88Udh2W7ahx9EYv2
         6JxT7k4KXIJK9JVCqhMW/GoFFCtVDMobRQuppXPJ/PjaPViN7B602RS+ph/O4u0vMMnG
         BQPrMT8OQxpniSgNviH4Dpx/M1EbcURUF4c/oa0KDeFpx5ziQSSZftSOJO5levK6QY/S
         BEb13XCK38tYVvEFrkAnyXzxsM9KP4bjP0wtGrd7vPWX6KbB3XrFr2QxL4b403aD3vSF
         o1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425829; x=1796030629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ec1tqy+OijvQ1oTn+CcDpDl1Xq4ijIg/8Ri8zyKyFyU=;
        b=Mf63X8feDQC4nDgNXBTxtrMsSzo/sEUw+Tbrb835X7HZynxmz+Y/LFXCRStz137xLd
         9maE0sUiqmk8SXPBCP7/knEf4HNlVwVV0Pu4vU87dXzBK/XA+m4aeEJePyoFnWCewTDc
         usOqA2Yv7IZCJtRRSkeXNuQWu9SbTk0D2pr602jE65VXNBP3j1vOWqiA9DxwqY7tU1g+
         QVFAKpHmnWwZud/9tpvqIDL+JcxVkQ0bDe+EXvfqRIjlLLDl4EVH/9t5a94zCWHLm/b1
         SehXVx4CISYM7k1XTH3Z16B6aLFf1IwhX568Kp0KoyVb6WI6ytcjl+5Z45n7oX1/8qIB
         sSww==
X-Forwarded-Encrypted: i=1; AL+hErFZXJ83agiTjT0rfQbotk61KWXp5ccOWw1UJVz2/F299AJ/JGE2+v1h+ao2sUHpsAjTYl3gk/8KwYzuIpyN29GzwQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/konNOAZ51YcsFBNzAAXrX8jb4B3QKAQ/0FILIFKGrqDXKYe3H
	zWgRgvBRlULVoLnFasWcsfZXNIU8MDv64O5mQy7VOYaFfasUSzof3CC8
X-Gm-Gg: AZFdTZeH/6SqwfG7Z7KlX6snxGF2nIiYq9eoSD1soiJh39AAWCHGKlWmO+o7HrBReWz
	xFB4HF/cY48cuxcNrhbI3oiHPY2nRr1UIO5setNDjw1kt7Oaq/tjiNcKb0GJeG4Ucb1quHn2UMb
	noqRozC1fiAFEQPiD+vv+AUAYs2MpPUlk2pCP9PkKZRP5UyVf4cGQKL7cdfqHo2Wn0t8KWZ3vFZ
	PJEFRZuhDYELCgMm3W5B0Y2x5yMrgHDdBJCGcEYZT0VGmqnErmriULTucFSPK2+RXN5y6NpLjvr
	KPc0bA5VxhDuWdo9b6mcDWWAzOSZdWoaGQ0eQo5qtBMG7P5Hxuts6ztdfGgEjj01qquiuj84BFE
	BJ+uZ2mRV/dxX20PaNlNTQt8nZ3P3Q66djT+5Kpv42WY1aBPn4MZx9pKlr9d3rtcdxmUOEjvz0L
	BOmG6+bHNwUesyr+9YEgQHErS1gVntgRAq0fktU8vIAmQOsGMk/r9NbgCgT8qDpqjKResHoZpYt
	z1HRWixuljQdTRp1uKHlwW+VhJk53IFeBPPk7KccPSWaaWwEKhZuVSr182w7j6/4iUQFFbk8Hwb
	LaL7GXJa7U/gwUqJ8IeKDEqpPxzk+3JWvgImVUXX2FRiwF7WZe0pr0UtV7A2Un/puglEpyp0QWM
	aR2ETtQR5nvSM4ticW5x/4SYxbN5l9WKE7A==
X-Received: by 2002:a05:6000:184b:b0:4a7:1fca:e548 with SMTP id ffacd0b85a97d-4abb7d46559mr21264569f8f.39.1795425829165;
        Mon, 23 Nov 2026 01:23:49 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:48 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Umer Uddin <umer.uddin@mentallysanemainliners.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 3/5] phy: exynos5-usbdrd: support Exynos7885 USB PHY
Date: Mon, 23 Nov 2026 10:22:40 +0100
Message-ID: <20261123092244.1792040-4-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
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

The Exynos7885 SoC has an Exynos USB PHY that theoretically supports
USB3 SuperSpeed, but all known devices using it only have USB2 and the
vendor driver has USB3 function stubbed out, so we'll only support USB2.

Apart from this mysterius USB3 capability, it's the closest to Exynos850
out of those supported. Unlike other SoCs though, this one doesn't set
the reference clock by default, so we have to set it manually.
For this, create a set_ref_clk_rate property in drvdata that can be set
to a predefined value to set the clockrate to.

Co-developed-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Use unsigned long for set_ref_clk_rate
 - (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
   error.
 - Add Umer Uddin's Co-developed-by: tag for his improvement.

 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 26 +++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 087d552eb511..77bba791212d 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -483,6 +483,7 @@ struct exynos5_usbdrd_phy_drvdata {
 	int n_clks;
 	const char * const *core_clk_names;
 	int n_core_clks;
+	unsigned long set_ref_clk_rate;
 	const char * const *regulator_names;
 	int n_regulators;
 	u32 pmu_offset_usbdrd0_phy;
@@ -1847,6 +1848,15 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 			return dev_err_probe(phy_drd->dev, -ENODEV,
 					     "failed to find phy reference clock\n");
 
+		/* Some SoCs (e.g. Exynos7885) leave the reference clock unset */
+		if (phy_drd->drv_data->set_ref_clk_rate) {
+			ret = clk_set_rate(ref_clk,
+					   phy_drd->drv_data->set_ref_clk_rate);
+			if (ret)
+				return dev_err_probe(phy_drd->dev, ret,
+						     "failed to set ref clock rate\n");
+		}
+
 		ref_rate = clk_get_rate(ref_clk);
 		ret = exynos5_rate_to_clk(ref_rate, &phy_drd->extrefclk);
 		if (ret)
@@ -2095,6 +2105,19 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static const struct exynos5_usbdrd_phy_drvdata exynos7885_usbdrd_phy = {
+	.phy_cfg                = phy_cfg_exynos850,
+	.phy_ops                = &exynos850_usbdrd_phy_ops,
+	.pmu_offset_usbdrd0_phy = EXYNOS7885_PHY_CTRL_USB20,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
+	.set_ref_clk_rate       = 50 * MHZ,
+};
+
 static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
@@ -2929,6 +2952,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos7870-usbdrd-phy",
 		.data = &exynos7870_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynos7885-usbdrd-phy",
+		.data = &exynos7885_usbdrd_phy
 	}, {
 		.compatible = "samsung,exynos850-usbdrd-phy",
 		.data = &exynos850_usbdrd_phy
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index db8a7ca81080..73d9c509dae6 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -665,6 +665,9 @@
 /* For Exynos990 */
 #define EXYNOS990_PHY_CTRL_USB20				(0x72C)
 
+/* For Exynos7885 */
+#define EXYNOS7885_PHY_CTRL_USB20				(0x674)
+
 /* For Exynos7870 */
 #define EXYNOS7870_MIPI_PHY_CONTROL0				(0x070c)
 #define EXYNOS7870_MIPI_PHY_CONTROL1				(0x0714)
-- 
2.56.1

