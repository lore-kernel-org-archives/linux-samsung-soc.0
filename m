Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE454FC33D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 20:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628910; cv=none; b=OU+cCGUDz5U8tB0xfSZsAc68Jtkp1/7aXEvT8J24u6/5E5mPidEslgiMezSWg9orMiw5+UmPNFOLEYFNeoMiIVSz7JlXx9Qson5tyWPUNITDU+Yl6QdZlsGvPU92yWX0YbB1DK0yhU+GtnBDxoxMaliLGw437vc4BymhQgopGCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628910; c=relaxed/simple;
	bh=wR8JJ2pL5QeRqlJm3/ZAagrZ56dstDg3U9pOmu4dPTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sOacWqs0DGjwVr9301DIsFzSKkPJnLdqiLBWpJd0CtxI5YjxouEpPUmKG/MWZijDW8RWcZ3QajJlTxFe3DK/aNwjyLorGAh8p3v0c8tcLO9t+7Qe3H9safoI4K4HaxVSadgyxAAHOYEgyZUJ2+Rv9P77Ka/L71NxWi/lgZN7C60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yPNj8Ep5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yPNj8Ep5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso26088585e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 13:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790628906; x=1791233706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4XMMwg0nXpx6NtPrekOPsMuFobBMMqkvCqEzIOlP2s=;
        b=yPNj8Ep5tFFOCx8rv6P8kPqc0jLtrlU3OBNKMOGJFL5vJyvAV2z8zTuQlggnjE6+dE
         91SeNOss9P/f1lqeKlXGh+2ozsD99VHq0ivCxFzWXA9fl7ijCT69+UT0sFdSQ7ZkzZ93
         N7lIzILVtRUvSYZ8uZcKlvQyiTAvfQlOXXYePUBmF6G+eliKp6HPqXH+C/VVTnTGxgDR
         XVL9jBKB9ezaO/93W3+dsG31IOXLJTDXlI1Q0btfimQ3MYIVDcLONeFVOTE41ru7nqMl
         rId+ynHEZb/nGgO0+vnNnJ4IENS10jVglxcg9S7rHab/M2vaxUPBagU1F0qWDtsLmHLd
         oQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790628906; x=1791233706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4XMMwg0nXpx6NtPrekOPsMuFobBMMqkvCqEzIOlP2s=;
        b=QHUDItyDeyg8Ew1cjCYtmrPPz43+Q4nssv0/BD+llmW+CicyaffpHgXj0BcMNRUqi8
         96s09WblvguOYZANIi1mvHdPDN/oi9J1ECuBUuX64BINyC5HDWuo6N6Lp09wfBQ/V1kD
         iexmDb1LfA9bMtPli+Vptsq/4vhvufnMq43W2V5OJL7h6aYgCVhLd+7ONs+6eAyJZnIi
         n6IJy26WdZBR6JkSgHlzALabpyjfCp7w9FFSW9qzc1BxRijxjHKOq2bOblFPGC1yyKvy
         Z5enAxT0R3Q9Iz1l6oxD6bSw/lML59lYd4J2iAERk8nEG4fUXMk00Gwe33e6PqpeQyRe
         VeXg==
X-Forwarded-Encrypted: i=1; AKwUvBznlL/TUC2/dlTJflGKvjI5Y9t9SEOsDoOaPKuXvlJcPna4C5I24JkgQZmlqeQHj6vaIDFZj/7fkuMLDa3BQ71G6A==@vger.kernel.org
X-Gm-Message-State: AFuF++lIedSbWrDOiM8DrSZU/VIT6OTvM6Rg7WKvV4twSLV7zH0ft1Fb
	eme1NZKYVfYpVF8hdVx46zGieYuYgnYkVmHvYjEuIotQ6jitbe1x5vAMCsDZducMOLk=
X-Gm-Gg: AYBFou1SrE2C17kS1IBT/PF9gZrgxL5T2BGsX3cKupa9BUIbQ2t/jGz9V58FMP4mBfS
	fj0cFDZR0RgecuvxUFpuXr4hOhyW+Pu4imUa8D5Tr/t64JEqT0x6RunQs31fULYMJX5sFFWNsXo
	BuI0x5zeAGxpCM+0Z0PoeLhGnDCvQDn2k931H0oYYO+gQQoMclS6MjJnQY/KSPZWZaCQNyEQvP9
	F1hC6uMbxCGxhx7azw3WQcOJIlWz7tAcjLuF+/UPvRf8uITHnVaMaleyX5wcKMblR4ATleIB98+
	kFFThRfcg6HTt4BjaRtNRX2iix67SSDisWx686wUSzf1IBntOXvg1NTiliSs/VKviRxWmh+IBP/
	8DnVZIu74n4suWMPDUuqNCDTCubSgtgarv2/iJmpTHbuRSxqAoHj+yU8n4alI2RSS1+osNGoQen
	gJzITeVJXC4iEFipoFwG8QUF2ghI0wa1i6QtCCjwmTKwqqBjJWKyawdIpDjStQGwyqgjasgewzI
	P2d8dEUOKkEyJmU/4HxEzbKf15ZRM/4awXgs0m730lcYKn/DyLQGRcuXCu16A==
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a0023f8d93mr97168395e9.2.1790628906389;
        Mon, 28 Sep 2026 13:55:06 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec703sm18042045e9.6.2026.09.28.13.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:55:05 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 28 Sep 2026 21:55:03 +0100
Subject: [PATCH v2 2/2] firmware: samsung: acpm: add Exynos850 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-exynos850-acpm-firmware-support-v2-2-717acef9469a@linaro.org>
References: <20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org>
In-Reply-To: <20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

The Exynos850 SoC contains an APM co-processor. Communication
with this hardware block is established using the ACPM protocol,
which handles IPC messages for clocks, power, thermal management,
and PMIC control.

Add the "samsung,exynos850-acpm-ipc" compatible string along with
its associated match data. This includes the specific initialisation
data base offset (which differs from the GS101 offset) and the
"exynos850-acpm-clk" device name required to properly instantiate
the clock provider.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 942a2e9f02f5..5a16665e941b 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -39,6 +39,7 @@
 #define ACPM_POLL_TIMEOUT_US		(100 * USEC_PER_MSEC)
 #define ACPM_TX_TIMEOUT_US		500000
 
+#define ACPM_EXYNOS850_INITDATA_BASE	0x7000
 #define ACPM_GS101_INITDATA_BASE	0xa000
 
 /**
@@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
 
+static const struct acpm_match_data acpm_exynos850 = {
+	.initdata_base = ACPM_EXYNOS850_INITDATA_BASE,
+	.acpm_clk_dev_name = "exynos850-acpm-clk",
+};
+
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
 	.acpm_clk_dev_name = "gs101-acpm-clk",
@@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] = {
 		.compatible = "google,gs101-acpm-ipc",
 		.data = &acpm_gs101,
 	},
+	{
+		.compatible = "samsung,exynos850-acpm-ipc",
+		.data = &acpm_exynos850,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, acpm_match);

-- 
2.51.0

