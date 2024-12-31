Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764AD19D086
	for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 13:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651077; cv=none; b=md9hBlIjCLSS8/B6m7lP0Kdd3lWzheETByGiW8rklTJClxPW1+6Ca0AR/uIYrxTYg7tvOQC8YhQirOzvlouduIeQvFSmB16q1V2Xf6egEMGbHt5dRtPg37BvnNf7Nd0WXrXiZ61FxHUT6aX6rnnTsdvyrPVDErk9WF96isYbakU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651077; c=relaxed/simple;
	bh=lXuFYVatNyFJ4wB/b1+2Rpi5zJ331Okt17cFbvKPAro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y7KMFQuDK51IiX27+AxpswQlldUMbQ1VCOf4MDGzPMVSw3Wp0wrg2bXyv2qalZuhi75dvkYeOzGfUE+x7lvIuuxAYmUvajGF44Oq1swkOUx0BT+ygUEn8n0NcNGETbLDVj0bkjC/P4OqcW+Vj5ln2bdvzqn0K0aiEbutfLCJS+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PynIuWQP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PynIuWQP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436203f1203so14888195e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 05:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651074; x=1736255874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oePPkM2EZb5KL2UMInv1q1keKuOWLPm8JuSZY3EdJrc=;
        b=PynIuWQP3e5UI0lj9dFZlcnnkYpSv8naCx9H7/wDtFJ2yPty2h4QefFm6caGuoJxwS
         L2lTJM1Ou+0Cq7y1Kb7W+Opo8v+NnBS9jRjllb8kK5mv06fzsp3pdbSIqqa338OthbWy
         g/bBfd2mQOtS7eIgjklSOIPNlCo6ckrYeg/mxDRl7IR73Y/dPTMj0dtqApNZy0mD0Kjc
         MEZbDjKgYZ3Psvmi37O1t7iTgzCnFatse3hJnmzC1H42pxJJ1I1KYcySRg07Y9UKZlAk
         Bmu0WjATuWgvAhgC3xWsrST1sB4qmLR2nOM/vZIlwNJTKELTd9g8wOSDUV5N/fiJrE+5
         xvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651074; x=1736255874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oePPkM2EZb5KL2UMInv1q1keKuOWLPm8JuSZY3EdJrc=;
        b=j5Nd/1qZrZVES9vqJmr/mnmMiEhggmeqtFUDz195mfnlEHVf7AtzDMU0rgtMscKW2Z
         0TzoDHfCNFKourmWJsAhYs8S5xPhMN5qzRco73hgIypcPB+9nvKZ2dn/wk2jwzbInEwn
         KnDTDRuIVTM9wnVB0gL2YDgc3eiSKC8gX1yduvRWk+J1hDYzw5tloCO77/dHfZmaBUax
         gI0ZHOL8+DzF+vrChOSxn/LUo0hBIzI0804BOF5vX+b/CG1TIjQldBGayEqOkI6MLGws
         iG12Lm3q4JlPJEApNSZzZ87/0U78dphUDGzZIOrXpgQRfEPMQjKnwjuBnpvQeAWN7/B7
         a5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXggQkcWghKXHxIi+X/O5E2MlyimZ6Wd+vXNdiW2YdxPp5BxpEkc5BNkNMznGdalc39/TyIAVOXEeWtse/9fW7A6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyryJSi8IvEk2TEigP31M7kuRjh5VAQ7/jKROD0LFwrjGOelLZz
	tLlDX4FloW+2JLhuzLWdkRsFw0avIIZF2QEYfoGWNrPtqxwi4ih9owK9bC9kAEo=
X-Gm-Gg: ASbGncuAPcrzYe78GFPq6Lx3SsXMkt96K4rqAv+tz3FaPM4Q4O49HWW+H2U2mWf6P78
	o8uyv/z3A1jQoZKG+QsnXJehKENVdN/R8O4sCgyXKMCdX2QkpE7KC9Jn6Ciplf/LXisOmPAAhO6
	Pp7TS+hI1lKuwkrmfGcGvux/a4MSfmOUWc+/lrElTY3uO0Z69hKenmH0Jqv9a/wfeaA1cvmZ0R0
	DsOgSvHvmKK3aYVrsv3sA23FhSsCXzYGb/R05cXL8AJpSRiEwNuX6a2ItKGfMM7muOVXK0=
X-Google-Smtp-Source: AGHT+IHwIcO30my8NO1sVZZTyNw2buq1F5yrDPPMvhxLCGfi0UoB+FAXsU2f2Eydww7uhdMVOiJeJA==
X-Received: by 2002:a05:600c:358b:b0:435:192:63eb with SMTP id 5b1f17b1804b1-43668644155mr137490065e9.3.1735651073685;
        Tue, 31 Dec 2024 05:17:53 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm420068305e9.40.2024.12.31.05.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:17:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [GIT PULL 2/4 drivers][PATCH] dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible
Date: Tue, 31 Dec 2024 14:17:39 +0100
Message-ID: <20241231131742.134329-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
References: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Add a dt-binding compatible for the Exynos990 PMU. It's compatible
with the Exynos7 PMU design. It handles system reboot, as well as
other system control registers (i.e registers for the USB PHY).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Link: https://lore.kernel.org/r/20241204145559.524932-2-igor.belwon@mentallysanemainliners.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 6cdfe7e059a3..8e6d051d8c97 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -55,6 +55,7 @@ properties:
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu
+              - samsung,exynos990-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu
-- 
2.43.0

