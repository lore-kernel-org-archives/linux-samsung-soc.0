Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072A727FB18
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Sep 2025 18:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757440899; cv=none; b=SQib+8USau4HgGPJz3uApYVfKaj9SOTfw5PEU2DGsZqChz4HDkrj7Nu+bD7sJ/FMi3qIwMWWGZEX9OB2xMy3dFUpndnqsiNcEBeFxV/8qRpgtZbzQOQiYc0gTkSs6lfB8JGkGv2a2KLTJgaRMSB+9CrBLnffbDlWiBG4/O4NNQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757440899; c=relaxed/simple;
	bh=z7stafhZYkYX4fyP6Uo0x11l37pExFzKqc00XYTP1Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b1V0uze+xeh5TjBsk6VSXuxx5MPlf8yOFODt7c/dE0oZn+a/HdwO/dsql6PhN98yaZdzKANvCN3BolFnDxHo1MdMFbykK3+ViLfgqWSniJoD1LWfVA17sxgItt128CzIJaWef4Awc6fJhFW8BnoPEVPUXxIPFsPoF5VdOwd+dvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PjzIzQJZ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PjzIzQJZ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b017e4330c9so67918166b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Sep 2025 11:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757440896; x=1758045696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uV+QfManP/XoG0f0/tsZKH/Yp6Kp4GYm51f/Nlkl9ao=;
        b=PjzIzQJZfnLK6slKhFdegoSiz3IaDO8/0F3oRJ+bWNcUAkFT4Lap3cnDUhnVUpZqTi
         YDkeyck2GHXYCMsjwgF4fEUG4dNsJYzVtSdp5vH7I9uKCGCYHYVGl5cYCilfHynwpv2C
         5xZcJOCk3fGZgWL/GnRpEAIoZ2LnNvWhwXh32p53Has6Xr/HgX2cKIWpSktQLb2WQG2m
         QFwL7u6wZmDjDj6ebH9kYML4KUNCVzz/yGMF4qcEdXKC1KuarhsQQcPtveyMlecnTvSR
         dv82VFTFGcUK2l3Yw2sm2LZfDVtNH8euKB9MSICYV6XNZgErHzt0WYeUA35F+bj4h8i+
         JRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757440896; x=1758045696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uV+QfManP/XoG0f0/tsZKH/Yp6Kp4GYm51f/Nlkl9ao=;
        b=asQRIeHCF414ZPluc+TDYUuTCG0B57IgzI1Ej0Q14DCvhvXD+ukbr3vr391uf+/FVl
         mi1FsP6JUmU3I9sIPM6zg93oONeqepRo7aRW6hXTsOP+Sg26LlG5z3HSO3B0/5I5sKf7
         Oxw4BoAZe6ududAaW6COmWfhPp7lQ7fl+LPEnC8DaFrF9cY9ILSQhbyRdNCcApw9bVVS
         DJuhO46RyuYsfBSniLkJJ30N7BZyg4Jbuy1cTnCNiMKVmAvgA0Rss5b79d6FtFAQvL6h
         TCXGgrXiwiGLqqvMoy+O2ELqj4SfFrRpCqQhFghOUhaOCwCTRW198Sxe8HQ2BRHvL1Fm
         +nuQ==
X-Forwarded-Encrypted: i=1; AJvYcCURKnoLjxgJmKVlc2YT7ERKk4CvI9++uVpNO3ylbbm3b3IalXHalsebI6ozTQFMQBcenlX6u69Ja8l3GQsVwMvzWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6nNbp17DYC0IS4BTozUzT2gKAYgkBY17d73y4y+5LOCncG4V1
	Z0/EiTzInV0OOQtytsOUfDmrl51Ickb0ORNL9fvGy/AQm6SR1ebGY8pjM/3oq/Sgw2A1Tjd1p29
	xegt8
X-Gm-Gg: ASbGnctqPmb9UfH2B5MdAyij1tuTog759Ize3t37hw5robfbjroaGAvhIHKZfFv8Gbc
	jSurYp1LIdxzXUusJwwscGwp+vvv0sDq8abxbe9ABCZoniVrqS0B0PiWCCXVp0D7Qw7oMSPFYCN
	siUHj9RthzBeBBsqnOxca0PYZujcq4b3mT2NSEX0eIMSfBdMXOQ5brrGwp/O8k7hQ3MMxb8aePT
	KiIcWOBe63pL4ExKOMQRl6A8ERQF0s+j7YgzzZeFMplvKDXuyCZZtcsuKQyfqbNhjwqTgIFwosm
	lQOtsMYe5Ocl9/NIb69pbEtacj98Xtu6QVjpiOQXEgFYrFHDOIQYSJqBpoI1rBfo+eZR1XGN6Sl
	XgB093Hx8cvvn9kWD3pranGhUWQFu+pQAWiVc691ZMbPKz/j85WS0A7o=
X-Google-Smtp-Source: AGHT+IEiH+nmvrwhayI3HbM5/x4e5TkLk/RKC28fCLjYZn/wZHTfmtWJ39TPSN3Baj56Zpj1yrngbg==
X-Received: by 2002:a17:906:6a18:b0:b04:57e7:b1c4 with SMTP id a640c23a62f3a-b04b1007b33mr621356666b.0.1757440896219;
        Tue, 09 Sep 2025 11:01:36 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078334e899sm26294666b.64.2025.09.09.11.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:01:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] arm/arm64: defconfig for v6.18
Date: Tue,  9 Sep 2025 20:01:26 +0200
Message-ID: <20250909180127.99783-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=z7stafhZYkYX4fyP6Uo0x11l37pExFzKqc00XYTP1Tk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowGt3dWN1F2E/oAo07Sev7IogTOAGCAVnRfrAE
 tAIRR/xEx2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMBrdwAKCRDBN2bmhouD
 16K3D/wM2NurN0pcMDt1sn4GtZ+UY0RjSV1g6m5jXzx7W9wpkCf6AgOqOkCgrlial1N3Cg6nyut
 n0f93rWXhYCkJEdySaS6Fb/Kd19ssb/EyJa8UwpNCtvOYhq9OcXpuHrKV/FA9RqOY8gKnCpl7iS
 CHrUCwBEWsM7HDURd305LXyUvW4D0NqopERgqnFT99F45YzfjZgc5cAJ3Ikt5hsjTgCm7NwKKvd
 +AkY0qUV91zPPtxF4HQ+vriYWjIFcj9sktWO8ADOVdUo2lamNS8l5sle/mV1Q/dsctKBwlbgjW+
 l+KOKgj8ad0+UeSY3meSiKUE5PQSsjqKwySarxXvq+cIpeO5VeWNqf3d4zuBG+mj+U5NymVc8GE
 U70TByD1BklEtmLmlS/zgr7kB7YhJtl2voV2h4cIetMcfa3MjtRODCU9O4CBD7uoEkyL9+hgcg/
 J8D0+7TszHaBOu7/7Y0eD9+ucpMj2bkJ9Et4voZdNpvPUvtTWv+Z/4JVH9myOAEP5e55nVxRP/8
 lX6CUAVAdx9ERGwXrnlo6rwNfpyQGAzYEOCVw4JjwnePwiPQCd1mWONsHs5Qn5Ne9dBQ5IXA3TQ
 xtk9kQ5D1jHD0XtdHhGlBtInRQuuF67uQq187t6HO+fqTHUQnfaYVUbBvUMxNUbDUgvkvWowRqt dROa47FJgYCk9sg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-6.18

for you to fetch changes up to eca86a61aedaa40310135c8799b28187afbc677e:

  arm64: defconfig: Enable Axis ARTPEC SoC (2025-09-04 15:44:49 +0200)

----------------------------------------------------------------
Samsung SoC defconfig changes for v6.18

1. Cleanup MTD_NAND_S3C2410, being removed from the kernel via separate
   tree.
2. Enable Axis ARTPEC SoC in arm64 defconfig - new Samsung subarch.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410

SungMin Park (1):
      arm64: defconfig: Enable Axis ARTPEC SoC

 arch/arm/configs/s3c6400_defconfig | 1 -
 arch/arm64/configs/defconfig       | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)
