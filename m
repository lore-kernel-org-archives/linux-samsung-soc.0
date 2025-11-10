Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC9E30CDA1
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 12:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776839; cv=none; b=k6SjKRqK1Wgqry2r+iasMQfh1hxXWKLYdfHLFMjOfRhsQxWwWp7RQJsQrMLbA41XSGuwenZPQm+Lb0Spongo3osvoPr/lYXTSP/21wSVs+IQ4IQAfyoCdJrL/sb3ufYPCRyHCbPwx3a6BtmdPo7H/zqrzZec7iN7orCf8xD0oEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776839; c=relaxed/simple;
	bh=/iPfwbC+FC8ePlc+R2aZlBP8mfESEoHeMp2+5WX8iC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ok0HfQExwPBOHwsqMZ7oD6Wtl34jHElCCmteqrH9Q30giSXLSBMSEIXtvIsNwYqhwmHRIFkO25g96/MMJnkg8WLCNAvKRD/SOwEhZlEZny4xy7KPgT6E5IeD7QXYPkHjeUaHYrFQltFqgPCDE1eFd7grmd2RfQX9ZKy96GvKXMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NWkqmiHo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NWkqmiHo"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47776bf5900so624305e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 04:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762776835; x=1763381635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WjmbME1436pSDYkp3aIgIG33gCEKBJTvr+5GarnqYuM=;
        b=NWkqmiHoFInrcNICQV+D7fO5odnVWhtK4Ig31Pgkq3QIC9RDTj8WafK6RTflxIucxy
         g15CkEB+FXQCTRlYLb38gnOoc7LIWG0X1s0lR/i299DLd/OOurVbroGSgsu0/fskaicr
         lBsfysrGJScGvYNTfCL0Gu5mWROEFgPwo+lMqZvRc9IYFad/iJXB4YQl7sHtkRoWatQ9
         YTcCXRK+cEYFS+c3vh5Ko85CgQxBASfSkoY9gKmTtzcbbhmvPNjkQk0xbX5LUQpwyL0l
         m9dcz3HWikuI+DECd5Wh6eWa54SCUt+/xyjClygYpbsfWXnEc5CfyWYlUIukz70+rfv8
         sonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776835; x=1763381635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjmbME1436pSDYkp3aIgIG33gCEKBJTvr+5GarnqYuM=;
        b=U+QQ2hQF4cPpO+ssh3CVWwu3rQMlw+iHvhwz8XyhOli+wGkGAkcce6gWAzRGQFXe7U
         SytxZemLCalw80uoo7jqoFKMbP3t930rp0Ys8GaF79Q2F4CJoxUouF+JzAK0welf3W+a
         oe3oFXRQYXiOCy7MrhT7MdqCnx7EO8T51yYpFGjRGB1cNzPYmJNU5cdwoQFCnCRshU9Y
         nsi9uvcCeRffIxAqWAb1bVd2GjaQzIy51BrGrEm01RyLN/8JxGwoR/GrV4WXGYZIE6ML
         kNf8T8+Ed0XRgzT/TpwAg3u0egxwUDTisxNsFXaqVQgtXjRkEJU5TN6GXPCwVlnoIBG6
         Ksgw==
X-Forwarded-Encrypted: i=1; AJvYcCWVo80gdoz1NdKCLQHt5NVueHSTm1EjuC/Qit3YBPgKokVPkiFReGdI92MOvqKc/hZee/5yYYRZss1cQUYC8+Qevw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMKkNLpJBpAXeAvfByMkrC1Kz19ON4N4ma/yN+1JFndz6V9OHy
	WCyqm7mlvA70U3QGs+I1atnq2ehPivkG3+JdiGJxMTkQyvIQM2GYGXL7mWEyS0gJE4I=
X-Gm-Gg: ASbGncu25J3AtZsHlDMosK6eeko3HFycwMBt3jBo5NMCf5Tiupg+Z5ksWPmJhvd6TK9
	1CZi81ajqfpZwOrHDXr9cM6cJYoCfFmbEeORUK5tZPrpIIUlZMe0CWbq9+PF97F+wyl9WZSsvPV
	xhAkScTuXw+dPb9/cqbdb6dzByjywSulgf9qCP83Y00519MIN0U/yHbcexe19sN5ufqTOE6yft6
	rYj5uUEtgYoWvG211/SRjoRXiwGyv1ZYe995d3InTFV2UfPJO99JJ5uB0TNg0ER26xER6OiJfmk
	5lkDHdsARwQ5fxlypjZkIA7U4Uoy0ULKP9SgBU3auwrYgtKzk6lXMAzotwfPJ4Z6mC8PI4sErZ3
	tuXQXvYAbFgRZNUPbPg/iWl8I+4DAfIWoyvSIdwh9xPE1HqRaisz1uPBWqXX/9L33H9oXcudMsB
	wf9327Dp/JxtSyppSNV3XOyw==
X-Google-Smtp-Source: AGHT+IHbNuArn8C9DWSTKYZ7LhUSvorI++lgVify2RunMzFZSAkl92QQgyKvse2NSni9jyc11HIbCw==
X-Received: by 2002:a05:600c:4f89:b0:477:563a:fc9c with SMTP id 5b1f17b1804b1-47773236215mr36141105e9.1.1762776835461;
        Mon, 10 Nov 2025 04:13:55 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac6794f6esm24922667f8f.41.2025.11.10.04.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:13:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] arm64: defconfig: enable Exynos ACPM clocks
Date: Mon, 10 Nov 2025 13:13:39 +0100
Message-ID: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=1RuGJhko7Tg/2IZzsHP76G8AT+Tj/AWNxpQIu6+goLI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpEdb46cR755V6vYrD6XaAJ+OSnAKc6fvm/6jTB
 xiiJhbvE0OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRHW+AAKCRDBN2bmhouD
 10KaEACDLPQR0FrZpAjYo5Og1ep/uckTjcjFC+xCzOXqOEdkrzcpDl037REM1q5jViFkjhTPpXN
 SrcT8a/d5hhSfjHToiBEaoYwnPfJ9jRk8xdAeQotkzc3dCqUznEibLkng8olbmhebHJFB8Ry+Vk
 BPdygN/QaIjOVtyQ8CzlIFatPlF5AFkr/3lOUvqukBIXmWG0Iis/flbwcTR2/cRSBh1KCrx//WT
 8vaBkth4y9WjLiYCCqbheWjzD7HbUAkfV5t6ysaq9OBpOhHzjluW1fqFWr98jJXzda6FiDRWlD1
 TdhDDLfTWyrRTPwum+lUHGJrHjPNbcO+1npr5MfE5tOntgnu4hCeKrxRnoipk1eRrB1/MBWU1zP
 GFQjaz1w8dVPenwryczUMq3vNTVpAFmbPzGkvJWSuW3X9fh+7Al8vvsiURFB2ZuYf8pvS/IUZjx
 TDH9rq9EH5rf6nzBP7+wdNxIQ4rHsVY183B82SmCHrknOBF4KA043+Klx4m6FSgj2cogLngqZl0
 K1Hb8lOSiJ+jphwHeHFiIr8qeSzpJWmITsaO3uA+pN+Cx5y0fBUJy3kKtOd7BnAoxK9QG+bIGkU
 Yyt+4Kddltq1mXkDymUIjL7HnCxfeqMKLnxxQ5XJWeWHpRTrRg9qPy8G3QQ4als6oTKvOzSW72H AYWsXO6gNunbeBQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

From: Tudor Ambarus <tudor.ambarus@linaro.org>


Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
Link: https://patch.msgid.link/20251010-acpm-clk-v6-5-321ee8826fd4@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..646097e94efe 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,6 +1458,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m
-- 
2.48.1

