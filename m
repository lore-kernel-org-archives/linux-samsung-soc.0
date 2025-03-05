Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8023E25E828
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Mar 2025 21:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211060; cv=none; b=JeQ1fBQzicpLL5w7FCUOL7TyKWv7jmSfzM1gWtE9hU87v8Ub8nx2z+9Dy9Fzryxz6srDqyuJ5le6PnUliXeHCrDxdie7/Ad+Fgk8D3HNC0XDQE76Z1LUaEp+rgnxFV1gwtmtzO4QwULPGn2qkKSpSiJtXvsceb0gp7CXjuSQtL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211060; c=relaxed/simple;
	bh=goqEBEfGLkYI7CK/Up0YmDXR6yArgVZhMirUQAcStHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=An1ATMR7LJJJdD21qW3aqIl37fQTLOSHYFKexKaElxVl9Y0xyDU98xCSuzNY5qcBnTGCNsqpM3ZY2h8JLIv/Lc3fBoM77T3y89c0wgok6tkbhDgLYLlT3ozWPznNufkVqKiJ2WvolYbxlvfcgrwt96XK4gRqy5QxEIiRQywzUOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e4Qamn0x; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e4Qamn0x"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43935d1321aso8948665e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2025 13:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211057; x=1741815857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weIz0p5jrCdaKeONdMwrGg3d94qwCCT6MyDjUrDLWLg=;
        b=e4Qamn0x/+gnjqScQolKmOX+L8jDfXksL67uiviBHcscsqhO7/awB+XwJLyDbt7Ouv
         ylMN8aCAS1OeKAp8++smKJLie8ACWHdISWg5WhvzAnufBYGqa/75uDiDkd1oNbaFv8O/
         Yvny28bsmuo4tF1PoEhHYQKhJDd7c5jy4t4Lel5ejSnQpUFyZAkPJy+CqVIyUq53BGFz
         br2Pa/3ERevGgpsk2kp0QM/5Vvt3glX5YEykAYOP22ywk9/apfDufqyTA1q5bz43PJ0T
         4zfr/AS93CgFAwUyrvGj89H+HQn8HEXc6GYPex+2lEDf8sipVrtRKP1Fmr6W+CRPKdtM
         jCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211057; x=1741815857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weIz0p5jrCdaKeONdMwrGg3d94qwCCT6MyDjUrDLWLg=;
        b=jrcyWn0p53XgijSFcW8+QciIezehHcQBZ2ZBsuGsZ4jKk8isMVIfXgCN4YmUdGNqvb
         jNb5iC4Ct10wtBizphH1Ud3oYevl02senDfGmnFqoQ55HbKQMJ7+5hMyBg78/CNLPsbK
         MxWeICZIhVo8pZ3p83tdxd1pBDMLKQ4QVCMyuFpvgpEHXILXT6r8NlqG2CG0LEbjKGY1
         djneIOEnMTZjkxY/Rmmrcw9M8oNlNJ5hLFTJ351O2ZKyxgYxioEmwnjApQNNMoxU26om
         ekJ1i90p2STIpxJYelIFZrSPvdUh2B6v7PC4Rdm9V+XvXmbcg89Ewws5+HTXiMcv92i7
         vsmw==
X-Gm-Message-State: AOJu0YzWFVouNi2vuyfjhGldTaO48XrOsRVtV1Td0pIxrPYG6kZ9jubu
	J6fohy9o4zujdxH/GJ3gm1OUAM+jmgm6uEEfdMagKOaFuChpBBSH7+zQzrLAVas=
X-Gm-Gg: ASbGncsj6I+Y9+zZafYibGWPPd8o6mFkZ5LxAeWO2ykLR5CiTSoNOI0qtNRKiyDd/Qq
	EmjPUI1Q5nyDJmPj2v6zewowoBM3LTIHZOs+JUre/E6wJKPo3/dXM5rgJhkcebFCai9W9twU/lD
	pGaGG0cje0jfHN6KWVISjxyrQGVAQB2k8pvt4mwD5bA0tGrAm7ZBlIJfo9IB64vuCOJXLVht1iO
	A7Fo8teOmEPN5r/lYs5G8+NKi/JVwPMf2unbCuesQo+ZgbPL1a6wKqCuvgXgLJmo5R8wWCFslsX
	gxRBLGSYR54SkvsLJNRAcO+Hxbwe5bAOyqV4es3dbqK/3igdUo9lSA29sv64
X-Google-Smtp-Source: AGHT+IHzTHEi4RbcepK9Yi88OMMJOyQSc2Vs3UcMYys5tDiO75wg191jKhku583H3Fo6aA44hjeQvA==
X-Received: by 2002:a5d:59a4:0:b0:390:d8ec:1779 with SMTP id ffacd0b85a97d-3911f7bedf1mr1720900f8f.12.1741211056782;
        Wed, 05 Mar 2025 13:44:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:40 +0100
Subject: [PATCH RFC/RFT 05/12] clk: samsung: exynos7885: Use
 platform_driver_probe() to avoid __refdata
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-5-a4e03a019306@linaro.org>
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=goqEBEfGLkYI7CK/Up0YmDXR6yArgVZhMirUQAcStHs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWal1CQ7L59HDIdagnCzWwL6nM8gmaipgio2
 xYB0wmW6dyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFmgAKCRDBN2bmhouD
 13xvD/9hPWetnDaQhNDUBZwVHb1/nwXHFTdF5ofFd0rLeE/ZYgKAJfCgOgkbFZ49TGIvmzhfCY/
 Xo9pDCmDDEljIerAW+MotryTo6HIfA0d2gdsEM+tnDR5bf6hwYO5kJgyGJAg2hOBlOEstli5pbE
 xIc3Y7ptAdcVfizZkO9giRiOsNwMEnkpQ/CiIb/ld/c9Oj9yDOl+d/dgTbEG/y4qp1GGbpSLnWm
 Af11Px3FS2m/VB3Qv1J5zcUCWLILUKyqWiLm3LORFRfy7xTnGg2lLmvm+7Da0tPk3/HiSH5tXvP
 0mH0hlYdLe0swii+M+tLGFRNuWg5V/qPVoyIJqt5f3UM23aA/Z2xbxRKoA1wUU70ThRDL3IXuKX
 erm1WN22mi5Ej7KL9z9VVPiIWCopNAvzukn5YcojNuucWM87Hkx3UOCjVPA1eAWNVRVskUonYLp
 NE/PIoPn1tFViH0ZMjyozbmxu3uy3HI4axmIveMO2FZ0pbBW6EzjNNO+eVYlhmDLf+S6ITXuIhx
 jQyCuVbrFQ8ihFM+8AamT2G22ZWmtrnZq4K2JmLYVirnt5j/Hr/F306sZFKpXisYTiiqBLEkWkm
 G/1KPU4jDS5Gf+a+vbOXAZxSwsOYVYvGJxwgZxeNUNlCSoFG/XznBGeNNnTIAhp325njf+kaCs+
 hyJ7HeFfhTl+utQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Switch registering platform driver to platform_driver_probe(), so the
'struct platform_driver' can be properly discarded after init and there
won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.

The change requires using subsys_initcall instead of core_initcall,
because no device drivers would bound in the latter, as required by
platform_driver_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos7885.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7885.c b/drivers/clk/samsung/clk-exynos7885.c
index fc42251731edb6f8368d38638179056f8bc58335..0066c89e3515b852c7c6265322f8a1dc07af57ad 100644
--- a/drivers/clk/samsung/clk-exynos7885.c
+++ b/drivers/clk/samsung/clk-exynos7885.c
@@ -832,17 +832,16 @@ static const struct of_device_id exynos7885_cmu_of_match[] = {
 	},
 };
 
-static struct platform_driver exynos7885_cmu_driver __refdata = {
+static struct platform_driver exynos7885_cmu_driver __initdata = {
 	.driver	= {
 		.name = "exynos7885-cmu",
 		.of_match_table = exynos7885_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynos7885_cmu_probe,
 };
 
 static int __init exynos7885_cmu_init(void)
 {
-	return platform_driver_register(&exynos7885_cmu_driver);
+	return platform_driver_probe(&exynos7885_cmu_driver, exynos7885_cmu_probe);
 }
-core_initcall(exynos7885_cmu_init);
+subsys_initcall(exynos7885_cmu_init);

-- 
2.43.0

