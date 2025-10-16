Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB91369967
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 15:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760630336; cv=none; b=TDmxhYvT8ckUzAU+1DAS4zW68itQxjvMruFu0uSlagMUkZRaUOMKQZVe/Lk8BtcSiruGyStzOP72bjGw3OmIasi9ilS1h3JELkmAt6x1x6xGmajBvFx1LQgLFRXnF8fNa+UuwZrUSTn4NJg+p1T+X6WctYYa2BV9z9xxvzpAXOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760630336; c=relaxed/simple;
	bh=F1mHgJl9qBKql1N5d+dvVsb1yWt8kLOH6HBPs2Lyipw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pCcTzEOFRPVHRcdPf/2oxjDrYWBgB+5ZNTVYF1aojEBz91vOLtNKRLIu8/2tt8yGH7Gc92nJzTMxXjAeM82LE6TPTGXHr1QM5rPSG4f9bMOxH2+/CZSx2Kb9A51EMIUTCa/f9lSvRBw0hBxHdCrBNTiTdqAu+FteNfbKxojCCBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wSU8W/mN; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wSU8W/mN"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so113729566b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 08:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630331; x=1761235131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SO9hd5b+FbsgvfRJA9bEqFwoXMIxby3A9uFM+TJl7N8=;
        b=wSU8W/mNab0Jn0GfQjEvqnmNuKDiQZj9ZZ159Lv/fQxiBy5VrxVqpsOHrwdBbxCmjr
         n2QIFLwYmzWvPGAXLOlRV4myHYXml1fP/lZgLlpXIZvZvfAiinxIO239b3CFwR13wz+m
         myq/inKjYuBXVSSwD4EKCWUWXGw/ojFHHICbCDJrlbdMVmRe42pBPUAOJ6PlsvV3GSI2
         aGcH/8072M0xfB/7G2b/VooLUZoiKdK5lARM9MTiUB2RfINPaVASu64njFYBzRGDLXWR
         cySvxVuSr9MtLfkUOe3W/xEwDMekwrNsgVKXX7a+7fkOPS/XfOB8nNUjANcZEKVCXGW7
         Sz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630331; x=1761235131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SO9hd5b+FbsgvfRJA9bEqFwoXMIxby3A9uFM+TJl7N8=;
        b=PILbF2nJz1CF52lObhV0P28RYRpsz4NMHQw7F+EhEdDVQm1FqtNkBAnUSOv1HKfBDP
         MMJI2VHzhGMbQmUBm6xje3ypNjXi56EIcP0VL28uFAdmfLWoZ8/v4DdJxuqrTAbzfViK
         /wup1VtNjjzRiYJdg0TM4Ddu+scuhiu3v6wFxf41PoTohvAOmheXWjJzqynzOw+P220a
         f1RY2EvHv+CX74zN7pjEpgx5w897mxW9isHaPQg57vV5GtChwgXzc/z+tBObiXmXTdtU
         oex/+wXiUi4u3zCsu4Y/giMc8hHWi4W4n1Q6yvnZBBC+E1g5xzCocn94gXHXYiA2/TTz
         mP+w==
X-Forwarded-Encrypted: i=1; AJvYcCVdUIiX9GqlsnXrXN3eB03gJfRg5ja6tJr3w7KGtTcv8nf5dqnXe324s+Zywt/tURZZtmD30v6/rKYYuNouOYjm8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBbXTwUmpjsqNGm9qn8EPUff18eiGId9wUsyb52aku90/SC4Re
	fwqhJMYTLC29zxz5Q+JWu0V7A5GFg6L/2SNudhIyQJ7oDjQfzXBdwzQG1Ch2rL5/ai4=
X-Gm-Gg: ASbGncsmYV78clb6gCazLkP4SysKMMu0GFl3U5AtYeeUBx+l5h4Dm1StiNrydAuhsnK
	iMd9vPp8SQrr0imHieKbQf7JAPaB7mW5GO6W4oBBiXgc1UBNUPKsn/Rl3xdpVYZHvTMPfJlh5B/
	Rg2tV4ovShRvWbBvE6mf7I+OfLSjduyH8VDH8MjnVGZGB779U5mLTalo97T/H4Yw/++zXLzI6+0
	pbUBIzEsFoUgy/HbzLOQsT89MjAgQw9Wh+S85Wl7c9W6mTd4lIQPSEynJDlRzccw8St8txoRZ9H
	UsehK+zMS2soZhzxYFN8TgdrAh2oxRk607Xzar6KBmX1krRQiH55/h4ecGIuYNMAlzKomvU33aE
	72SuHf2CMklaX/bEvkODumMR8JZUazlAAIdDuOvEES/xfeiTZTfrDZsKPD5EMTSX7WNINNFTL+4
	DLtrEyo7PsByv5+0A1dtscY4edMNUBsHs3j2AEhLEpOME8zmNod0Z5MywkBdBxmwZ25yLeGjw=
X-Google-Smtp-Source: AGHT+IGGU0OBvZX4eAhyBVw2Khouiv3ywhe0gW6+PNakLUoYmT3fXoe3XDWiMcszKrB34lkr9GEbsA==
X-Received: by 2002:a17:907:971e:b0:b3f:e1e9:22c7 with SMTP id a640c23a62f3a-b64769cd22fmr44681066b.65.1760630330714;
        Thu, 16 Oct 2025 08:58:50 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:41 +0100
Subject: [PATCH v3 08/10] pmdomain: samsung: selectively handle enforced
 sync_state
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-8-7b30797396e7@linaro.org>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Unconditionally calling of_genpd_sync_state() causes issues on
platforms with child domains as the parent domain will be turned off
before the child domain was even registered during boot.

This in particular is an issue for the upcoming Google gs101 support -
all operations on child domains registered after the parent domain
misbehave.

Add a flag to the probe data to be able to sync_state conditionally
only, and enable that flag on the two platforms currently supported by
this driver.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* use bool for need_early_sync_state (Krzysztof)
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 638d286b57f716140b2401092415644a6805870e..15a1582aa92103a07335eb681600d9415369fefd 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -20,6 +20,7 @@
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
 	u32 local_pwr_cfg;
+	bool need_early_sync_state;
 };
 
 /*
@@ -69,10 +70,12 @@ static int exynos_pd_power_off(struct generic_pm_domain *domain)
 
 static const struct exynos_pm_domain_config exynos4210_cfg = {
 	.local_pwr_cfg		= 0x7,
+	.need_early_sync_state	= true,
 };
 
 static const struct exynos_pm_domain_config exynos5433_cfg = {
 	.local_pwr_cfg		= 0xf,
+	.need_early_sync_state	= true,
 };
 
 static const struct of_device_id exynos_pm_domain_of_match[] = {
@@ -179,7 +182,7 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	 * reset during boot. As a temporary hack to manage this, let's enforce
 	 * a sync_state.
 	 */
-	if (!ret)
+	if (pm_domain_cfg->need_early_sync_state && !ret)
 		of_genpd_sync_state(np);
 
 	pm_runtime_enable(dev);

-- 
2.51.0.788.g6d19910ace-goog

