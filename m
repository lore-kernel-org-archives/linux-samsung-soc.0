Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C89E1FC7C5
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 15:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023515; cv=none; b=dH1mj/L7O7vGFt7MXASfOfE7dK//jLeT3gEU9SUF6CyHORJ0kSlFGV3sLsSbCGFe4qWLY8z8PuhK3UG6ns8iBD4Q3T6E0AOlSeyaFp4Irk4neEidbj508O6Z/0XFDEU/mxmcnrTKt24E8GjPNaqYXNR+6MUDBGvQneKdWVRpqv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023515; c=relaxed/simple;
	bh=0A/EkduQWdAahGq43hrLsndr/J8Gpiy72o41hnq8yS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJfWmkKFwiJVaJHhglZpZaeMlIGOjao+Tgw5cSuelTpsxFVyWtYpQgkvWyRJocsjEcPvlnnkJCi5+EGydWNvw7SFRVqPeQqkDsjmfXRmKTvENrW65LvurK6jSuj1Gh+EFiWZoCEBtTzd66+8RqV4i5OtNqC7dVHX6RQpFJDZ0Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JzbCeriX; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JzbCeriX"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6394b4ff908so2011925a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 08:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023510; x=1760628310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/1/8oovwXsAv5LJCHXYAg1gF9tOSXyOhotyAm6lDms=;
        b=JzbCeriXQ4WU+Wnl7MRj/pT+e0xUruwBfEUSpI+DHtDCL2rd2rPA+U1o0RrRr2eb/i
         z9049y81jS0y1oel34WkbNnUwLdDiZziRHcQUgWwrW48YpxKxvY9kdNEJUnoKt3w8aYI
         HRzlNyjKg/cemMMBj/BNcqbFXuVYaB4LsibCrQcgLOdMLsRU2Hw09QSE8xNBjWuY5RfW
         r27Ggv/1tVCVgFrTIGtTfCJ40cX3afgR2KyWrGe+OKFjCCbFqrBRRjA1BLuzPvuVxOHO
         IPoXRjIug5gird4HqlEBoU8Oc1JhTJdeGm7jemWB48YfhTOIIKRzaSG3L7m03KMb/7do
         ll7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023510; x=1760628310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/1/8oovwXsAv5LJCHXYAg1gF9tOSXyOhotyAm6lDms=;
        b=Ys1rcABqTWOQl9GQpeTtQKsnfVR42y+NXbhVfIazlc6hlUovEZIGEMsYoMtqKXISzJ
         Vx3yFQ/Lfy8Yz1SHD9dEi9eNTbeO8PbQ1Hm0QFSje6uXG3TRIfVjz+Qf5SQOebfO+DTu
         qZbU5yHPPGRTGldc05OiatJKFnrFcVLe9Tsuh55sodbFdUm1dOi5e267W57knOGSecAu
         yZ0kUAmhEE50qTMvIBomKR1BhyzSx7P+tbEq9mD/bCG7QGBaDxB5rIQdaJ+PLtb+BOQe
         yZ3F+6uaSYJYeHQDxz7hdTAwMdj8Pu9u7OEtdoPq9QhvUDX24md4NIYlMz3b/x3/WhAi
         ilbg==
X-Forwarded-Encrypted: i=1; AJvYcCXgAaYHkTMNjwLQgpa7GF+1TdzQ7l7xlYKTrqrTSuweB6vIdneJedfHZJI+C5sBsm/Va8YVZkT6gyTK4PQ79VhIjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEXQK1H7fZQDP+g9tGPGi+UfujSHuoKeiT9CiqXb1F9VRF78vj
	ZsYTzbTGxeRYLbfGdPVGmFwEU3nA5mDldiyvVAMMOu7Njfcq4dIwDgr9j8mvBwZgwLY=
X-Gm-Gg: ASbGncsk1fyV0THju/mGB+XOXw1J5FUfv2rn91AWrHl5d+wzTY/XluCyJupXKDMwISS
	4tf3fEQGdibMo5fZGtiw9b2NlFvPOVTU1gVSpNp8lie9L708o8HyHnCX5UpcaXAxn/9n/b1C8qS
	acvlAP0K+N8xWWbFNmorkxuMLEpFP7gYW2sPh/HPbOZacsi7q644a2tIOTkk/zFtyfRXWDQzhc4
	nJzfqsHBdUCBcfvI/gPl5VE13q/en9NtdTKWy8UWxRnOzs6sVcP1RTws3RjEZI8SvYLy1xDMcWp
	M6pAg7HJWJew2VdNfiYxROskhznhMZWSEfWJw6vP5ytNq4+ldybRPOaPoW+IPuxyoBhb1S7UFiO
	/jdeRupJg9laX85MKlV7DvNEP30QiDZuTmwJVfoAlUi3bFy4OMKQ8B9Z7H1rqilPDhqxY9ai4o5
	9feNPBqEztOEOrt4oVzX5jR8HWeq5w7N2UvjrsRYXO
X-Google-Smtp-Source: AGHT+IGaGkcuokARZTfmmbCwfalPWL2pX6NDBn0pheQXnCrw092W78kTYfWHrm/WqInuH6GM9reI/w==
X-Received: by 2002:a17:906:c149:b0:b41:2209:d35d with SMTP id a640c23a62f3a-b50a9d701b3mr803859766b.1.1760023509699;
        Thu, 09 Oct 2025 08:25:09 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:10 +0100
Subject: [PATCH v2 08/10] pmdomain: samsung: selectively handle enforced
 sync_state
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-8-3f4a6db2af39@linaro.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
In-Reply-To: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
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
2.51.0.710.ga91ca5db03-goog

