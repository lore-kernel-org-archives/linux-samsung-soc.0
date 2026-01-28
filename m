Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996EA313E24
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 16:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616663; cv=none; b=kE/Bcd1gqkdat7CA8cE2Y7wyTOFQqiXctDPfgV1j3mBCnXLXjvb2iUWXr/8FHYSpiFyqk3wYeX3CPSmtT+awrq/xn5r5vAzwGmfxzxSjkwcnGqptVOcm74nbT/3zlwRGP7iRf9reKRuqSnmgh0wQzlm5SYRyctX4Rvajq20HikE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616663; c=relaxed/simple;
	bh=7uwE3SELXGLKzf5NF/JJUetLs0EPpYebrCJSp0Xb+8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZFS3ld82DPRQpfXSoTfJUu29qlQXaJ/H0zKeu6JCK95p6ivqPwi5Wk+OLq7pLeYeB70wvDOxHnMF/G/UEqHrf7Y0C8qvW5T3FnnFPguHDvXJB166Pgv892kIaXDUAdSwwCA0Ru+58XglwEp4YtTLPItDf8/lTi2BDK1J3CPnHTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NhKz5PJd; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NhKz5PJd"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65808d08423so58878a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 08:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616657; x=1770221457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebxIe09ZJP2AO9RkSAId8NpKhFo/Pn2AHgb75qkbgKA=;
        b=NhKz5PJdbQ9dT0RtSek4l50aFl9txrXWHGMi7Q+pHmTwxofOUGV1/wpP+79VmYwDfe
         C6SvIxPUlihJwuypAOAWMjBe95annT7CZJYD70chcnzzVNT9zOBiaxmkfRX8RX/gx2ql
         BE8GHpvKJfoTDrtAbmVlEyfqrCTu7J2J+lbW9QzgO7dRd944Hu/Lj2tDxKvJYI21tRgO
         phNJ/ObcCe4L2rWIKMNqrRsHVfLvifBFNqAU3lS/tBT0+KVd2SO5WPw0gJ2rOOnDBHdd
         4svNkEjBwpKPFKD57GVzcVuv9PYpDYmQQJuYjVpuO9kAWF6tIEDWFc87Tg64nfuA+p5/
         5FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616657; x=1770221457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ebxIe09ZJP2AO9RkSAId8NpKhFo/Pn2AHgb75qkbgKA=;
        b=G1sHx5U+HIL97bTPBio72S6dCnW1abJinXefTvEKj7ktJ870x+jRf+kd8WLOQ3RqZh
         1a9lm/WE1I0CnyDcyKW3zI0nYeCvk00C+COdu6trvPqLcbmDpDaEkmvI0r2nH9MA8buo
         f5Hljf0gHDmiAjaIR8Lu/XdBnGJkaZPdSRz3mXUmZosJHyLE+ssaIV8pkZiuUg6VfcYY
         kg7ukjX9Zitn86dkye2GtWihnbRMgNxvktp0RuEUN1khmZu7NF4QS/PU79OIU6t6GhL9
         oUtpnzCg8AgMmqUvEjN+lU52XsMDRasJFOKqQ3WmT561H1lDahP4xS+EleTHSfa4HjS+
         yCqA==
X-Forwarded-Encrypted: i=1; AJvYcCWJn/y4DLHwW6A7RAEoQJzODMaD+gY4Gtj7nxco4XvIXLldlvbTPr0KPbSVuDnYLw0SEuXIuGM0FOS9eF9kHTa0PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5BFpKzt6zSgi39Bebz7pVVbM5JFomQUi6dlBejaEms+EHJrHy
	OBqlsEQmi0psdZglVV9wcewBqrOIxUjJgw0l12Za/hVs9ud88bZz/JYaeZjqjBcdY9g=
X-Gm-Gg: AZuq6aLwfPfcCp95HXMB5RP35b2hVOLzZ+a85YZohXKzlMUuftBwZt+czz3c1j99CFj
	pJ+qDH4MESGDupl4UiSRlR65frjJLWDO71HBkTeTPOSM3sRMZlMrKQV/fuXWbPuYdF8wS8IW5cN
	q/0bEAmdaDM5bhx6BH2NxPb68r+ar5H6+XTejheWvceYyJ8bqA0k+xllgcUe6WfpcPKrhLoq4dH
	zPrvHBRdT5njHgymtzum5bulkNU+ihFtJfka9lopVpwydMb+5dvcOmHQ4uG88cgI9DN4jqcK7rG
	sTQvI+1cnlHGif2k5Tpn3vOFoURcDJAVx45i/Ii9uZSnRferTH87nXZEsNPEYVjpaX+GDoQ6pjx
	IkLzAk1cfFWw+EyEq8Y9i8etaiycd0vT9Oq3pnKtMSjqlV9XZnkCIsl+XEgjeCFyzgpnkt7cwQW
	BPGMmgeEN6AaN+OQRfPMNIApBRX8qkNS6HGZZHm2E1fEAz3nnIPRq2gQpuj6wuSHyFkbgbjH4/D
	JeFbA==
X-Received: by 2002:a17:907:1b24:b0:b87:3c4a:e68f with SMTP id a640c23a62f3a-b8dab434f1emr359018266b.36.1769616657368;
        Wed, 28 Jan 2026 08:10:57 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:57 +0000
Subject: [PATCH v4 08/10] pmdomain: samsung: use dev_err() instead of
 pr_err()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-8-cbe7bd5a4060@linaro.org>
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
In-Reply-To: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
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
X-Mailer: b4 0.14.2

dev_err() gives us more consistent error messages, which include the
device. Switch to using dev_err().

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 2214d9f32d5967b60e84f68f4e99a725d66a39eb..41a232b3cdaf0f4be413b25d9373b99c6a3db602 100644
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
2.52.0.457.g6b5491de43-goog

