Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0C219F424
	for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651080; cv=none; b=chi0yFmBFj8Ks38x1LmPAXfE19awziQ7RfIeLRf/Ln1bVHF3u5LpMji63q1o7L4ywu13Zabo3yy6VefWJf7/nWN38W5Fg8rHC6d+taJX8EpN+lrm4dgVO1jIpeprBeRr+8l9H927JCNb2b9D4v6i7AoHxqwwDHOJyWEwo6fH2VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651080; c=relaxed/simple;
	bh=XOB3DdxLeKQT7B3j7VApKObYv3yCbJNATZfIvtjOFHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRMDD+zJUei5tbE3umKt4nooKd+NyFsGtIBLxVAJCF83+zS6s7SZSYaPID6DAiaTREhwvkvFHYx2XXB/Ckp15OLi4RLPH5wHmusFxdrlo0u2H4WoSDTeIofiKlneUmjuAyEJqIiCxEXHc6o8niHwZwhUIcy0m+dhQuwO8qiqMik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N87QwiRP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N87QwiRP"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361f09be37so15116505e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 05:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651077; x=1736255877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Cegx4jkWYm3KNBPZL9uCiDiWoGmBVTmnbwZR3twevM=;
        b=N87QwiRPBvGRGms6l6QXTTNszE/j5Ikjue2+oDopkbvghF8vITh4Czi6t3Pt80riQI
         7iSUMpj50BM3iY/N1IYl7zqinQfKvqDHLDrbm9TvUQVEa2NJ+sa42PnWTIQfXJwBz7Ql
         1TdLF4KWJwuTNp305mE3Wzorfi6GsUKWXsamHJTyeibCNblSATYCtiBKZdgRFuroTn0Q
         UdIU4ERs8WLJahcHz89TwGIGieL8GnBFnqR6DjTs3xHaxpvGfIRgogxS96/f3SL9ocBJ
         awz9cY3KMU3EG2CsXAh9684KKtRgmNdeTsBUjrqZ8yRn/8w6FOCfDRrfpNiNaAPmCdPQ
         uHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651077; x=1736255877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Cegx4jkWYm3KNBPZL9uCiDiWoGmBVTmnbwZR3twevM=;
        b=HsjOf83Y7XySFOVuLuLVHlnk8RG2ugUXwVbO/cI+JpPcNsQnMWgxcGjTJDj+mxHOLT
         OoJUlADN1/ElST2+KU9j27l+eLKxPujUdgYxyUa3WqJ3Ntev99iI2bUXGWU/5+43KqO6
         ugTVS6cSBEquiyvO2+aMR9//xMHUccKdV0QvV3bCpAhC6F8DIlS0ZmqOkBZzLzLxvCbB
         6CbDmv8aNRM4H8PNA5ofDp66vvxhUtN1lRHDiAV+wfWauMwH3jgcvb3JnH6MUWwyb7kf
         Dk0cDLihTfsVk8olnZ9IwKf+WLeqnsBTKTCn70gXr74BgV43HLx9b82kLB1w9CZ5i6M3
         roEA==
X-Forwarded-Encrypted: i=1; AJvYcCUp0Wk0Tpou6l9No+5LeVNTeIv5TJrvBKeI+3WPj2fSFyfxFrTl62IK6hrU52AQ3Nu2LqzwEEfyefopEnG2fTUwTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOcj582+HvzJAA/MCCv6N/JbHsgzk4Bg54DB/+HxNfksHwlEh5
	pCz+5ISLECnCrTwVnrPDezA6GXTe4Tn9uQEP0kwVEvsMkL9Ir21j8NTSld+eVOo=
X-Gm-Gg: ASbGncsaVVCH8IlFmFoa9ViuU7Sm2LAsBGivbUxbko4hbiHeYINbIRz2VZFqJqKD0QP
	B4tLcqNZ+po8yMhGJlCQMBSzWmAKRUVQY18KXB/zWJzXhCDLHmSEHybSueRPTxOqOZ1wd09qcqg
	Op+78uqDGL6BaRTA0rcthC+A94dmk+2hrsgtbJe9aUyI+yELyl3fpPBf6h/fSKg44ObGkMv/PKC
	0whxhFCpAih8rb0Ld0PY39+BkyAT2pKd1SiRro0Qm3iP9cAUUJ5AbWD94REN/e8m8FGQ0k=
X-Google-Smtp-Source: AGHT+IHw804talOfXWk2gKgWu9RUYC1DfOft+MhnzFGHwJeLypmOC4OiQ+wNsLYlowqo/W1PfUYEHA==
X-Received: by 2002:a05:600c:1d1f:b0:436:17f4:9b3d with SMTP id 5b1f17b1804b1-43668b602c1mr129738655e9.4.1735651076746;
        Tue, 31 Dec 2024 05:17:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm420068305e9.40.2024.12.31.05.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:17:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/4] ARM: dts: samsung: DTS for v6.14
Date: Tue, 31 Dec 2024 14:17:40 +0100
Message-ID: <20241231131742.134329-3-krzysztof.kozlowski@linaro.org>
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.14

for you to fetch changes up to acd33b48ce663c7e293b11cd77df7ea702ca34f6:

  ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec (2024-12-29 11:05:46 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.14

Few fixes and improvements for sound on Galaxy Tab3 (Exynos4212).

----------------------------------------------------------------
Artur Weber (3):
      ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to WM1811 codec config
      ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec

 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 31 ++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)
