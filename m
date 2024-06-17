Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE10161904
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 16:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718642716; cv=none; b=lu4K1DD23btntFcH40JnUMdwdvGcmkPN8boPvzKTLaoMLtzAURzCNuE/x85q6kMjhIQbCjaR+uA1luuMGJCg2DBSoB/pUy4pXYbI/8P4do8aK79Rd0ihyNqozKWB9soVsJyHidV8BVnTDvtNO75s4gZGl6Yto1y+aYUCvBiUm68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718642716; c=relaxed/simple;
	bh=N6XZFI/sQDTPBOoCeIod5mutBdsHCWns1i2fnE8Jrwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pLiUb0eUVksmeReWgHEhtkKuD5SfDKH4gy67+GlgIMBFsWOvnY9vUDD/UoHOlm7vl5QR1Le1FxFOXk641dmXapbkrB/8hSizpPn0q9snjLdHspjGuUbV5FwZ8AHOfqsFRXUD/AS87MOQCtVmo+2j3sTLKs9q4DUc0FexW/WkaPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zlRWvGzF; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zlRWvGzF"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a6269885572so958027566b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 09:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718642712; x=1719247512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThsTojdQQ8zSHFhNOOxiXRSOPUFKMTWzQLxLd3s8TBU=;
        b=zlRWvGzFChzB2CneiQEZxpCvEfWbVgFblBgdayzp7c/0T03EcQGAAdbOrxZtiSVB1z
         DUnjaQ/O+omeC/ayVj9wrdVjDloriawoeK68GNnQHPU1smNzf4iQD0c65w7+EUNqEo53
         NeRuH+W0S3L8cN2gnfsFMRx+jhZb+M6A+/tDBNSQXRX3U20fKUTK8MBQcM4TYFlGLMsT
         HpbmtxSaWjUgmlrxynUztzglDmciewNtu4YvTtVvy5acapYeJZlBF3+9cKnMo4C3sCVl
         JLH5DUfz3RwcbSawP6lho9jUeeL9E0pCqeLgaOWQFdixFA5C6vbBII4uaZEe/9be8ERu
         2MqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718642712; x=1719247512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThsTojdQQ8zSHFhNOOxiXRSOPUFKMTWzQLxLd3s8TBU=;
        b=uQT7ADKNEbv4Cc7w0dM9O8jwGOejkaUFs1oBJPGCTmxQEUY9SDxxcNXCxzr99+LlfI
         /pqtidOUreS896RfwvRdkZ1Li8m91BoYHDksoKwztPZJExWFPoqZbyYSfyOiaRiP4J04
         jGTyP/DHl+opz7800maR9OMirvhtPdsMZ14kWEwZkEM/Vd4uokCBnJ1pmOiXDUsY34go
         zMlrYmMUzKHFXYhnPziZsW2e2Y9QRWlu34c3WQZBb64rvtqo2uAja3kg9gdynqRCMsD0
         mmdy3XUO2KiP8rYz3ARbq42/wjgnpUsO33KCD2cU2MSvgjIdbAUfkK17GKUw7CrngOti
         qSAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5+7tO6ITssXWb7QxFZITAZ6JPAAhYqUubgW6Etjs2knFuHjyNgBw3Gn5Qc7EbebqS5jw4A01e9yrcRLfFOso7A1DkBsgifyyCbW6Z4OnwiT0=
X-Gm-Message-State: AOJu0Yx8qrsw7/W/PWfE5MdsgBenyj+ccyGwKTG+J9lxRIteoeaWNZF0
	WImHnaW2AWE+VLBj5Oxpr3JCEH+5QxcCqbudo/EvkIJEpxbNpctaLp/7wnyOLTE=
X-Google-Smtp-Source: AGHT+IFcJWeLyEHV3yWQ18wnmpR54ia9kKxwzabyy2RmlFFm5mvL5H8jtPPWb261kiLvundn45hNyg==
X-Received: by 2002:a17:907:c249:b0:a6f:603a:d9e9 with SMTP id a640c23a62f3a-a6f94e29a83mr13525366b.10.1718642711493;
        Mon, 17 Jun 2024 09:45:11 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f4170bsm527139966b.157.2024.06.17.09.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 09:45:11 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 17 Jun 2024 17:44:43 +0100
Subject: [PATCH v3 2/6] phy: exynos5-usbdrd: support isolating HS and SS
 ports independently
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-usb-phy-gs101-v3-2-b66de9ae7424@linaro.org>
References: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org>
In-Reply-To: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Some versions of this IP have been integrated using separate PMU power
control registers for the HS and SS parts. One example is the Google
Tensor gs101 SoC.

Such SoCs can now set pmu_offset_usbdrd0_phy_ss in their
exynos5_usbdrd_phy_drvdata for the SS phy to the appropriate value.

The existing 'usbdrdphy' alias can not be used in this case because
that is meant for determining the correct PMU offset if multiple
distinct PHYs exist in the system (as opposed to one PHY with multiple
isolators).

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3: use drv_data instead of phy_drd->drv_data for shorter lines
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 15be966b50ae..b7e2526f4c06 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -186,6 +186,7 @@ struct exynos5_usbdrd_phy_drvdata {
 	const struct exynos5_usbdrd_phy_config *phy_cfg;
 	const struct phy_ops *phy_ops;
 	u32 pmu_offset_usbdrd0_phy;
+	u32 pmu_offset_usbdrd0_phy_ss;
 	u32 pmu_offset_usbdrd1_phy;
 	bool has_common_clk_gate;
 };
@@ -1065,16 +1066,6 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 	if (channel < 0)
 		dev_dbg(dev, "Not a multi-controller usbdrd phy\n");
 
-	switch (channel) {
-	case 1:
-		pmu_offset = phy_drd->drv_data->pmu_offset_usbdrd1_phy;
-		break;
-	case 0:
-	default:
-		pmu_offset = phy_drd->drv_data->pmu_offset_usbdrd0_phy;
-		break;
-	}
-
 	/* Get Vbus regulators */
 	phy_drd->vbus = devm_regulator_get(dev, "vbus");
 	if (IS_ERR(phy_drd->vbus)) {
@@ -1109,6 +1100,18 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 		phy_drd->phys[i].phy = phy;
 		phy_drd->phys[i].index = i;
 		phy_drd->phys[i].reg_pmu = reg_pmu;
+		switch (channel) {
+		case 1:
+			pmu_offset = drv_data->pmu_offset_usbdrd1_phy;
+			break;
+		case 0:
+		default:
+			pmu_offset = drv_data->pmu_offset_usbdrd0_phy;
+			if (i == EXYNOS5_DRDPHY_PIPE3 && drv_data
+						->pmu_offset_usbdrd0_phy_ss)
+				pmu_offset = drv_data->pmu_offset_usbdrd0_phy_ss;
+			break;
+		}
 		phy_drd->phys[i].pmu_offset = pmu_offset;
 		phy_drd->phys[i].phy_cfg = &drv_data->phy_cfg[i];
 		phy_set_drvdata(phy, &phy_drd->phys[i]);

-- 
2.45.2.627.g7a2c4fd464-goog

