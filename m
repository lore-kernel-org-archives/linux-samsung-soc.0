Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78F8307AF0
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Mar 2026 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847693; cv=none; b=SUODYUY33QnzaJlyEt55vLxBRb1GfQj+D9aR1GxvoNQlFU5Svnxw9Ef1i54tWBSoaBXb1DxqDcYf4Wvnhozv2JbQiUn2H5Zw+D4zYJOgfGxkvMASubxCi2WYAi3UHEKMxAT6vcQqvNZ/vSdS8ukl6uC5/vqd44U4Y66PzIkGrII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847693; c=relaxed/simple;
	bh=dXXJ0JFFiPJa5gsAbYfOBbLVCxicEcA6VOArO5t8sE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rfe3qiQyPlMAEsb0la33dG6jwlBnLEi5Gbw7kWNDpyskHfyIvyCRt2DVRM8hFgNDVVp8sK3BToMnU05Gd0JLLgyoukOOdMJvnH/cmucfjJVfqVoRU4/dhOXx5CK+14us8kUVOBBQHPUqrh0NWBQUNF+3haTJXT2ePLCaJGX+MiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WD6ya1xL; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WD6ya1xL"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b97e6e48b24so293054466b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847684; x=1774452484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/+6mBPKyRHzZfHv/9qeLvEgXfBPcpvJNmyt49iF8ds=;
        b=WD6ya1xLD383pZlucf2L3neA7ONlx121PyGIFiqvDepTDXNXhmUb5/148GM+vkace5
         9CA0GldKmkbjRPpFhGxtIflp4fRcfR+5yzialryEnX1+Hfo/XIZU/idUOZlLnDxXd4xk
         gbhFak9+eaShDwOuC3XyvoiBHzhGonhBSQeJXvVt4H0joE0O9lZUWTer0xcA+iFtGPu6
         zLcicoSHIqgOODPefEcQEOb5xcQ/jB5qOYZGCurQxo3zYVAbMXufLbIpAvpkDBLocjA7
         7SzOxB4EK65Y4YqqjjjxpNqRKD8R7f7zFUbd9z3WlY0UTva0qhCNpcT3ncMxo2WkZoOi
         IfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847684; x=1774452484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/+6mBPKyRHzZfHv/9qeLvEgXfBPcpvJNmyt49iF8ds=;
        b=hcobi/qveXPmIigTfDW6bgC+skV1HPtfhR7JlP4/iy5kypGsOv9z4bqoIcSz9uZPav
         jLdr04rF+t/XBon1XiPAXodHOBQGUbfNFztH8sTx7m4KrKbhuaTKAbhgzRbwfF9AoqlN
         SeeGpWII1FOhiJgSE2SaPhvKUhq7Idz4HuTQ+ZCs4DVFooVI2ydqRvlrD9eP/uWZVXF2
         CQYJyQM0+XfRSR67evcMy2AZ3sej9xttIcAjMYGePBI4ynQ3EVZe6+ZZYFAwbYbWXuz/
         zSV2Os0s9aOZMtbdDB2q3pRHYRlOrBGyJsNsmEXVcDQEUp4le/MNceweI8eFBLsrvLOX
         Tevw==
X-Forwarded-Encrypted: i=1; AJvYcCUk2nxDRT8P++sRssMX+h7+xxwfe/OlbpB2abRvmTg9vC6E5PwGFCYWtBtP+kOgb2deDYay2BUACmAEH4xcWUS2HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzogIEx4Pr+5E402lFTd89NKlwO/DWd+drdIvwOQUwXbVPnzkmj
	nXp8cpjxu2Ii9bmM4H9YEdnuBSESFEEWuDtvxUtH+3jwRoBc3kTfCU+sBxhBdenUJGs=
X-Gm-Gg: ATEYQzy3ff6Fq5jhRpHX4O2fuYUDppv0QW66vagKQELHmsukniTNGnDm9lV6TkT/uOA
	lxvh13RqxCiSUC0EEWSXXr15gXQcBUHy69ZKHRycECY/xM1y8JouOcBrfSsJs45hdZeCL2lrgUg
	YHegMr6U00OHeHc5ZXHKl+qZ9+bb6f/QzPpD/qxRDYyP4nXqEfqCJTxc6lB9kaEo4oFpHo4Geew
	+cW0uG/UVyJw/fluigZCGETxtAeGt1VfkQ4THCYa42NWsZEvbe/b7v8yapypwRiol4FdlmAxbG8
	Ebhg/VPQO1svspXWkLzFVAxC+/RwtpcZR4Lu8eLrp+Qz8a0t2lRyf8Lv5y64zxQ3wDuREl7gW5W
	g0RDTW9MomvB/jHwIlPHz0QHMd0z4wDsJgzxHnSrB/L8MQuplbZbiheY0m71ZhNHRipRMFqacTa
	sebNH77me0hXpJWxO7o2zzWq/4wXazfnUmB4NfkGkDSMFdvJQMHex19iJwpkflTYJUu52fnbd7E
	TZpIxMPgewU2F0=
X-Received: by 2002:a17:906:2092:b0:b96:f0a0:c791 with SMTP id a640c23a62f3a-b97f479705cmr157898466b.9.1773847684124;
        Wed, 18 Mar 2026 08:28:04 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:28:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 18 Mar 2026 15:27:53 +0000
Subject: [PATCH v8 08/10] pmdomain: samsung: use dev_err() instead of
 pr_err()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-gs101-pd-v8-8-241523460b10@linaro.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
In-Reply-To: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3

dev_err() gives us more consistent error messages, which include the
device. Switch to using dev_err().

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index f8c0d11e9b33..6b0a0f395509 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -30,6 +30,7 @@ struct exynos_pm_domain_config {
  */
 struct exynos_pm_domain {
 	struct regmap *regmap;
+	struct device *dev;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
 	u32 configuration_reg;
@@ -47,8 +48,9 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pwr = power_on ? pd->local_pwr_cfg : 0;
 	err = regmap_write(pd->regmap, pd->configuration_reg, pwr);
 	if (err) {
-		pr_err("Regmap write for power domain %s %sable failed: %d\n",
-		       domain->name, power_on ? "en" : "dis", err);
+		dev_err(pd->dev,
+			"Regmap write for power domain %s %sable failed: %d\n",
+			domain->name, power_on ? "en" : "dis", err);
 		return err;
 	}
 
@@ -71,8 +73,8 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 		/* Only return timeout if no other error also occurred. */
 		err = -ETIMEDOUT;
 	if (err)
-		pr_err("Power domain %s %sable failed: %d\n", domain->name,
-		       power_on ? "en" : "dis", err);
+		dev_err(pd->dev, "Power domain %s %sable failed: %d\n",
+			domain->name, power_on ? "en" : "dis", err);
 
 	return err;
 }
@@ -140,6 +142,8 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (!pd)
 		return -ENOMEM;
 
+	pd->dev = dev;
+
 	pd->pd.name = exynos_get_domain_name(dev, np);
 	if (!pd->pd.name)
 		return -ENOMEM;

-- 
2.53.0.851.ga537e3e6e9-goog

