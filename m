Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104DC3191A2
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Sep 2025 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757093848; cv=none; b=LPVFZH2l+K/px6iTMYtjgtZ5TnFz+cqO5ZoUy2JoJEMuyq+5BAqHRDIv0IKl1QadTu3AYPuMswazQ2zskzqifuiRB8JZ5xMuk8I6MwqIcT8mwYeJjktzAspIyBXWWbdaNwZ7eCF3Zd71JMFGuUy0kwr3YMXwGY0CBNFCKMT+XDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757093848; c=relaxed/simple;
	bh=sxDSb9W3kWYfcQEyJvHl2qhUaQ77eVWABPTDD93pB1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q42yRyEE7D/kPwo0B6Mhihqld+tWkLMzbNMj1OVRYVHFKXUQD4deL+hh9Z6bxhFFBeE3arLAN6XcMszil06qnsiP/YvFduB45OH8XnOx0AkUtqiYWvty14yXqcCWCl7+HsFfwFR5f1ch6cWpSZBaU5x3kvfOUgoUehtyiESkjCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g2hNHXg0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g2hNHXg0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45dd505ae02so1892475e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Sep 2025 10:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757093845; x=1757698645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C41s7GNcy2VIbBs1R6Ajjd4rnWCbztAyNNt/x23sqEo=;
        b=g2hNHXg07y95Gl233ww5L7TKS5GIH5nzMEo/wYFrjUnjmjl8KEavXItFF8mzZkY58e
         sTdMF7SkkUxlaSFMT+MYU1k9w8yqIp8uR9HOzLSXZFhMQvprlMJT9IrZeij5FR+yL6we
         FrsQ7nAIKYH5bdgIqJvNXzAnspAsE4xyx+pGrq6E700mWbZG/akix3zA7jzdNAz5qQh2
         yzS4j12qH1yvqFjwGg/r6mP0F8J++zJ23kSVyapAO28Mts83QlTidgw038slIurUCUq3
         iqEqHfNOcaqoilCpswCJYanL/h5I7nMWW+KEZa73mtPoVGcCNznMKLV3L8XuTIGckoTu
         Qggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757093845; x=1757698645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C41s7GNcy2VIbBs1R6Ajjd4rnWCbztAyNNt/x23sqEo=;
        b=u10HATp1451RUEhW6IE/TkWXoBg6OkKK5hywkBfOMKHQX7tAvjrzszLRWQpvE/ZJYr
         Q2eClwKtTvNJF1xgSdoCjhLP2G4X68XsdxwuFpZqjj1X9cugbR+/hSmE62xW4yr5J5y0
         36HjnwFzIQHMeXGO106jIM4X6wDMM7elsAMoa3iZ+uIddi7PHGYJTvY1u9XIMlZ6+Cre
         petW/cqGLKrELXUePZKSNQaO7ajJeql7hic7s9AlurYnzUC9cu4xgvAPQ7EjgpExjHaI
         BmwWRTG5pK3h8NpxY3ECre3cGqsEua1s/ySm+I9xwd70mYemLV977Hp8imXlQ72gxbIW
         mtLg==
X-Forwarded-Encrypted: i=1; AJvYcCWnGRno7cxyLwSdMtiXMZdIqS5h/QEjkBWlzAf2pj+hL/EV0HERa2ZS++UHM6PgySLeyTN7X7hZ49WLUjXkmEnINg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoYH4ry2cRCwsOCZJenBf1pr9Y6M2dJHt6FJ5wyReqExyen+iM
	mxTuXRMdeTDQyS1K1PCb3v32EMIuzGvBwDi8DTOu8nw3s8sOkDov+cbe32gIu1gshhE=
X-Gm-Gg: ASbGncubrrfrEOaJ0Rx14u9TaDk0Bgj248cZKcGV7c7ObsDgPT4xNBbku5xTg6H2wmm
	mM2eS9VuNxrFokA5j4ifE1X2asOviXsW5mDsHC3lSbiEdIDP1OFuSMGBApEFMimwL0iArVhEbL4
	5a/NtehRP9OkX/FJTfezS+cLcsbSGT07LYSc+trl1M5I1oiHnZ05n/RToSkAl5nxz1yGHllrUc2
	3gJK5F4s+Fu5bwrNv+HTExpTiVPTci6Z1y1hvpQ8AU1zVlHXL+3E2l92GTJzTfYB8Z3DDfxYP7p
	ecp3jmQtjeY9jHwQ/+WU5Rf/8EtboT507qpJ3Tk8Nlbb/Mh9OMpeB2QcfVeUMATUuEgfs4MUYP2
	S2UFiaZJ1vREyxINSlXGXpHzPK27KYf0S/A==
X-Google-Smtp-Source: AGHT+IHWRNSLIatugRetZO/CpGssuICFcXAn6/N40TrEXg7gQCmSjCxc3dvc4P8G5NAWJ3452VJhbg==
X-Received: by 2002:a05:6000:420f:b0:3cd:cb0f:7203 with SMTP id ffacd0b85a97d-3d0f6b3570dmr11699998f8f.0.1757093845275;
        Fri, 05 Sep 2025 10:37:25 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e5100eba33sm1095297f8f.9.2025.09.05.10.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 10:37:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soc: samsung: exynos-pmu: Annotate online/offline functions with __must_hold
Date: Fri,  5 Sep 2025 19:37:18 +0200
Message-ID: <20250905173717.34240-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=sxDSb9W3kWYfcQEyJvHl2qhUaQ77eVWABPTDD93pB1s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoux/NK0EZx7r4MPOk/47bnRwvwh/FBnKiD2F8A
 tqVeTkkzyqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLsfzQAKCRDBN2bmhouD
 158oD/4/V0LUlQQzGC6pFK5dIFV2iahT3jc7md3wP14CXs0BRPS3E/Ci3c06QriLlSw0aW5V2Bq
 YbzBSDkafkoyeXChCgWMTCKM1tKv2QJwf3UV47IHgQSiJho2gHtltA5u1aF3c9EOSuG7FXpGliM
 H782ohJA94ci6ED7Eg9TchGhD+xSi4rfruajT7YDIAf5mnXZFmXQU2hELBdtsNBEH1tYj/ZYmDm
 9KyBiDqB9f7LhQcHrLVctPt0r9IkA80izurnKizv8FHPg8XdW98LpTRmJPRbZ9Iedp2PU7NSpOf
 GWkSOXQM42UqCkwu+4isjBxqTlM6YKCKN1Be5x1Tnl//xe1X4cxhIaTZ4K8Vv8Rb/3wMRqg+7QP
 p8TBVDV+jKbVDmw3C/Gjbuvy70t/cjFV1AD3uvI0/00LHyoOyb8rC6Q9d3OhawP+CBVMxNxH5nP
 koHQTnWHdTj7V8WNH9VAzbww9bMGa9eHiGmK8a96yWURFpBNK31GEGmxPTk2xPYt0yKwgrzyPkf
 LRopyr5oK8H3SOSWiEgixeBGfv+vSPnFAbe0bJYw+1jzOMTPAWsgPYa8tfTdSDlLN1ESt9jrL0g
 mMxomTmcEAHNgZW2R7yiz9KboK5EhxQ7GFfrYYYIv7rWOLrlYknILYGyw7JNo/yKAvB3U1UK8T0 W90WS/kBIbrQl1Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Annotate functions writing to PMU registers to online and offline CPUs
as __must_hold() the necessary spinlock for code correctness.  These are
static functions so possibility of mistakes is low here, but
__must_hold() serves as self-documenting code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 22c50ca2aa79..105293970d48 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -364,6 +364,7 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
  * disabled and cpupm_lock held.
  */
 static int __gs101_cpu_pmu_online(unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
 {
 	unsigned int cpuhint = smp_processor_id();
 	u32 reg, mask;
@@ -424,6 +425,7 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
 
 /* Common function shared by both CPU hot plug and CPUIdle */
 static int __gs101_cpu_pmu_offline(unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
 {
 	unsigned int cpuhint = smp_processor_id();
 	u32 reg, mask;
-- 
2.48.1

