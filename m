Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0676F6BFA6
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 05:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715061596; cv=none; b=frtBklyGt50c/JrL1V0pJjj9O0yr07s47vqEXQstgZG/IAB7FvA0Smxn4x7Bn2Ywj81g4PYvaNWSHgCW+a919ry4OI5N7gNe5yiPi4T3nhOlnAeG5WGUbiox++fa1zGjqyPbEwLtijq/AXFiZTdUOiFGqEZwKNrjU9h4MTQWy/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715061596; c=relaxed/simple;
	bh=Yguzo2c8YUB36SQvoM6wmMpm2FeEziBCRIGTv3E6rIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4ivcXDICIu42cVCVes854o6dNmt0d7QB+CcnuCuzmucN4LsLfY3GVqNqfyxD5ldmIe3p5pOhtBU/tVXJcAK/xBXCtZSDUuS6VsA8vaghYPpu3BVpcbWA4O/R7U2NuhYZQrcWaMIMbrM4K3MEKtcmS2F8Yq9JJVzonjwWnwKF6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IItixv1P; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IItixv1P"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51fdc9af005so4148085e87.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 May 2024 22:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715061592; x=1715666392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V2DqXD03WzJThrTJ1Ryt0LAxq6uqFsgoSmVFQ8TUEf8=;
        b=IItixv1PJ99VTcEpMTtQgZ0xKHqvcCVVoCuyJkD7FuUHF0PoQ6p9fxj5r9vhATGz2U
         0h3KN+yEb7o7pd+3yLLTzYVR+UUADNefZ94Jy4g8V3hvBqvMU0j1AIQdg443FK7A2RQi
         Wl2xH72wmtjb2Ew/zL7oBa0pnPz/ZFSI+nWYrBRYn8spT14+LfVn0jsy0YgRpLaqsRfy
         FsQJVTpvB/W4apPzylMUDhKXYqtd13b1A2mEeR2hdXIMJOpDksjK1S621j7J8yhHoQU0
         aXOff9Ch9oOFJL+zch1XDsSuaB4s//0L7RF1YS+ZxSZ3B7Wg4VjTVbTiMI5AjajNMA8u
         3plQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715061592; x=1715666392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2DqXD03WzJThrTJ1Ryt0LAxq6uqFsgoSmVFQ8TUEf8=;
        b=P4uSvMNVoj3x/NzWxvYnjUUAYZMAutJC7dv4niuk9r5RszZY6XLOK+n3LPRONGGlAH
         EcxAb7dNGAPI4ZLUfwgs4zQbxczhRoGbLROUGG8uzg/dx1hoLMTJPNaSDwTuSeVSTbTQ
         mrNxZmhtuvBezooTCw0GpCSFiMRi8E8HgMgPxFLJFFXQ6DCu3H1+IeA+67d1z2jd1Ng4
         S5HymbZ2MUVWfQF0d0BdDMXyVpZ4xyk/4Y5XB1/7MI4PjCALYX6RFghwMqhY9vuWWnr4
         /SMqvR2tLNh+nFyeHs8sfb4LCr/PwS8v3lTBjJEdnfe2R420vQIsqAD2SUTux8yMCUkm
         ipSg==
X-Forwarded-Encrypted: i=1; AJvYcCUaJbxUZYK+vbgAnyvGZ4GOdTrFlCQv6t1q41Bc9KNp/oC428eGSwMdECq6zylmsOpD7di+Mi7xmA0IVyW11iRWyfb+rz86hLZ1gFGLLrgKo8Y=
X-Gm-Message-State: AOJu0YxHUmOW2omSt8RAdLb0PTBE1UI7NWWVYAy51KjGChCSWLhe76kF
	NGbnsqrH1ANbakmliiJ3CsKcdR6Th7u1mqTiU7NU8lfY3yWK7cyJ27qft9NALt0=
X-Google-Smtp-Source: AGHT+IHAoEd1Vj8PO/OsWzB6VwiWyVdXfuzPDSC6+IUdzvwVU7M5dm88SzviPvIsnMQnSANGCGrSDw==
X-Received: by 2002:a05:6512:6d5:b0:51f:6ab6:9e5b with SMTP id u21-20020a05651206d500b0051f6ab69e5bmr13524658lff.36.1715061592083;
        Mon, 06 May 2024 22:59:52 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id z18-20020a1709060bf200b00a59cf813f34sm1975488ejg.144.2024.05.06.22.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 22:59:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] clk: samsung: gs101: drop unused HSI2 clock parent data
Date: Tue,  7 May 2024 07:59:48 +0200
Message-ID: <20240507055948.34554-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop static const arrays with HSI2 clocks parent data which are not
referenced by any clock.  This might cause -Werror=unused-const-variable
warnings.

Reported-by: Stephen Boyd <sboyd@kernel.org>
Closes: https://lore.kernel.org/all/8bf65df598680f0785c3d6db70acfb9a.sboyd@kernel.org/
Fixes: 093c290084a4 ("clk: samsung: gs101: add support for cmu_hsi2")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index e2a6a1992505..ba9570f7a5fa 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -2601,21 +2601,6 @@ static const unsigned long cmu_hsi2_clk_regs[] __initconst = {
 	QUEUE_CTRL_REG_BLK_HSI2_CMU_HSI2,
 };
 
-PNAME(mout_hsi2_ufs_embd_p)	= { "oscclk", "dout_cmu_shared0_div4",
-				    "dout_cmu_shared2_div2", "fout_spare_pll" };
-
-PNAME(mout_hsi2_pcie_p)		= { "oscclk", "dout_cmu_shared2_div2" };
-
-PNAME(mout_hsi2_bus_p)		= { "dout_cmu_shared0_div4",
-				    "dout_cmu_shared1_div4",
-				    "dout_cmu_shared2_div2",
-				    "dout_cmu_shared3_div2",
-				    "fout_spare_pll", "oscclk", "oscclk",
-				    "oscclk" };
-
-PNAME(mout_hsi2_mmc_card_p)	= { "fout_shared2_pll", "fout_shared3_pll",
-				    "dout_cmu_shared0_div4", "fout_spare_pll" };
-
 PNAME(mout_hsi2_bus_user_p)	= { "oscclk", "dout_cmu_hsi2_bus" };
 PNAME(mout_hsi2_mmc_card_user_p) = { "oscclk", "dout_cmu_hsi2_mmc_card" };
 PNAME(mout_hsi2_pcie_user_p)	= { "oscclk", "dout_cmu_hsi2_pcie" };
-- 
2.43.0

