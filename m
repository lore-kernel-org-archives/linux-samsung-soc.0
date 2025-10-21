Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0603B341ADD
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 15:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761060293; cv=none; b=UNQdHQU/HbmijG7vwZ1DnQzgtXNc4014Mmm3jhNVeAPuhukYFHGvzBKa7goYVmtkgXSXw/7g+qyEPxCcJyoBS+8fjA+gPrZoJ4B7yNTy1leGv5aq+Ueo6TH28g+H8MDnwOB1/epq+laKL3H0QikV9f5ef4zir5EQiTw10HYZlSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761060293; c=relaxed/simple;
	bh=0pTWYSKeF/umD/wXcGJB6RFTk+048J5zAPQ2CewtX1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Dx/rxKtPePhnkdimoy5Mhu12dPfsp+X8XwitJDg3qBl7EyjFyxvBWOkHg28CP1kL+b3luXcrqOEl1/Yr7h6TMzgKyozlDLh4c0m/nZyu5AkUP6/mt9WL5A2nB0Nz9bGHQC7mVpMdhp8I28FB7H9vXicUe7OqdQFWW94fKat5zUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Os6wH+lx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Os6wH+lx"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47117f92e32so38072455e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 08:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761060290; x=1761665090; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xLGRjFMRFj/0Wr7Pbd6Nha7Fn1G9Rd12lG5MFWvKdFA=;
        b=Os6wH+lxDLLTGdD1vINdZ6KzET0ZihNfs3S2VgORIOkx5PBlfYNwHyuxHloE9q3H/h
         HH6pFDK6hrdJ6XjFpQkt0cFT584GeBSzwHmsoGOQlvOfq+F/G64CgG/EVpox0TaBk/Q4
         Me6g9zoEkid5JaEcuBw7hKx+OQWfWop4aRSrsfxIQHk6gjo4kBOvJLBCY84B8b9TLrK6
         8V+MCx+UKfmYY++AD335smT59UlQdHQiKJ71r7+WKGu1cObjQEPRwgum3xpmH8Tjn2tc
         76bRrvlu3EkT5nyYIpLhCtjMsl3kbynNZJgTVpeeABy5E40kTwmI3IyQlXPHucGZITIS
         Gvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761060290; x=1761665090;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLGRjFMRFj/0Wr7Pbd6Nha7Fn1G9Rd12lG5MFWvKdFA=;
        b=BeaclASIlKLIgwpwDURFi5cAnDyCpDE5ovFKmDvFCXeW+TWmPwnMtNi1bmiFew2ztq
         yZb//+G/HpioYhRD1+R/rChso282zqCywIpLglB/ba5WZwEjxjx7mcpOgTubkI36mgTI
         sSmO/h/t7pfYWoCtYMrxO0QQ+BTxCR86ibzcGbNHkHSO/iDw38WxA28iTIAqkSewBJrf
         C7i1qsa6UFCEq66BxEqJY7THlV4PybQos5/pNdO8ZRGeJQWvfFlGW+QYni1GyiQL/cgY
         QDJPONl68ryve//Y8rdDHA8z7tn2spYgK7Sr2UsC+pKrOTWNEfazvM8W6tFR1422KgEs
         4zTA==
X-Forwarded-Encrypted: i=1; AJvYcCVFSbqSFr14dT9Ly2sl0F4RNT1CMZrA3IRDvUW+QR5e9i7KUN1yYN7KSu7qMWxQfbZagiPArBrulQU+X6MgQF21EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvYZutmc2iCNgCydCxP3T0maKauFm+gadTBsWjCg4nZH4O5OmD
	WCsepJvTNehjFBhcNWmg7c330+y+a8IyV3Hiv3PBrg+wMkLyd6G//9doP41xDEbGNq4=
X-Gm-Gg: ASbGncvP2iHgYIW/yXunzaypDYXSiJ+aZXcTczBHwnRYwy1sWIez0k4Gl1EdW1VuAZH
	ZxbjYf7YZHFYkqQOg+1iaclnQtB8TTnIt54wCixMDyWUA8LlSXxyAAmWybeNuP6a2qDvJ6NCNbA
	7jOQ65/84np0OLfHAi7lESpwcogpmo9ht/9+TzFVnluITtaCnGW5tw7XGnpNM0hQDiIzxEyhXBM
	ElcKgHhVSxdLKlou+ecj4cYGtOH361iyUkNtDvaN0EdBGThm5cQBnxsh8NfrA00yNjDrA/Lrr9J
	rlRmrc/sAlrfqzGTd1OLgW4d/WDNa/rOFsm4cu0voYRxgr5ht+mln20swcJifOwxleoDj/MkmKG
	rKnAHOPsWyKtGBs2QtpHIiCQkdON7VdPfqq76BIjP83WMqsX0tiI0w6tRIJGgwSmvhi0sCSHkcd
	YjzFciTFVHNwRZw9AofwKT/xDiThGXp2msI/5DF1vYOZQk5kL/Pz1ttXBFU4u7Dd0=
X-Google-Smtp-Source: AGHT+IGeQKcOKpzdCgFr8S2qcXAD3y1kKSzzFmSzcQgg2oWkU9A1Cyk+uTNL56azhWjBHMZtPZpvVw==
X-Received: by 2002:a05:600c:5287:b0:46e:6a6a:5cec with SMTP id 5b1f17b1804b1-47117876738mr151626285e9.2.1761060290113;
        Tue, 21 Oct 2025 08:24:50 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d90bsm201578635e9.2.2025.10.21.08.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 08:24:49 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 21 Oct 2025 15:24:47 +0000
Subject: [PATCH] firmware: exynos-acpm: add empty method to allow compile
 test
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-fix-acpm-clk-build-test-v1-1-236a3d6db7f5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAL+l92gC/x2MSQqAMAwAvyI5GzCVKvoV8VBr1OBKW0UQ/27xO
 DAzD3h2wh7q5AHHl3jZtwiUJmAns42M0kcGlSlNmSIc5EZjjxXtMmN3ytJjYB+QKtJDbgpd2hJ
 ifTiO6n9u2vf9ADpJznNpAAAA
X-Change-ID: 20251021-fix-acpm-clk-build-test-1915f3a657c7
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 kernel test robot <lkp@intel.com>, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761060289; l=1489;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=0pTWYSKeF/umD/wXcGJB6RFTk+048J5zAPQ2CewtX1k=;
 b=2+vXOE49ULPO9WgunsDjzAmwON+BhVkCg2nx7Ql3O90/K3s+zZo6VXA8+hD/KclCTMNDWouKt
 bmloW7AwrluD7l09YBYniO+0BEm/t4+HYgSRcZtg8bA2zLaKSNzvVVW
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Provide empty method for devm_acpm_get_by_node() if we aren't
building in the CONFIG_EXYNOS_ACPM_PROTOCOL. This allows to
test-build the CONFIG_EXYNOS_ACPM_CLK code.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510211905.RgfWkgss-lkp@intel.com/
Fixes: 40498a742053 ("clk: samsung: add Exynos ACPM clock driver")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 include/linux/firmware/samsung/exynos-acpm-protocol.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index b1e95435240fdb895a03f178d4fb3789411b1583..2091da965a5ad238b5e16c567a72fe88fafe6095 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -55,7 +55,16 @@ struct acpm_handle {
 
 struct device;
 
+#if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
 const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 						struct device_node *np);
+#else
+
+static inline const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
+							      struct device_node *np)
+{
+	return NULL;
+}
+#endif
 
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */

---
base-commit: ad97aba3e64f8e474ecbce0c4e08486023ce8ab2
change-id: 20251021-fix-acpm-clk-build-test-1915f3a657c7

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

