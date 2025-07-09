Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9756923B63D
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Jul 2025 18:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086889; cv=none; b=ibY5dDWF66OSsYPlXmdqV1RTsJUGay6LakWWb6+cD5LanugCzbOwLVwC7u1NbvN9xqtNheEbwwe/FeL8WXXT8sHEWQkj75I5AJzVHIVWtwWI9CVUOVnQLKIELWEnFe+sUrLIfWHMIr4quuSbHEMrVlZO8h9J0yI825vWlR0rKOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086889; c=relaxed/simple;
	bh=u3Hc3nQp0O5WYAc3HQ6CtOu++sD7TDGjIrpQ003ybJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EUy+5zia+jxm17ywAyC0lt+nZptlH/Fzj8KWQBv0q4WaBTSypsEKXl+zCF0QMuhsAaY/kL0WV0Fj7/sLexjW5OoPTcwfsnWM0KnQFHcTXM9xLKQ1EYtMzNglMZdN7oIhQj7lao5snD0NxK0pVBQqw2G5w6wmdu3xcPHigSs3+H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BUXmrQgC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BUXmrQgC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b39c46e1cfso29740f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jul 2025 11:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752086886; x=1752691686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzY/wkRIsQfHZQP8v4qsHJxPM4X7h0KVostvHPrFTLg=;
        b=BUXmrQgCKvQ7k0najR66cD4UjUgiMTTCm621ecoZa2wT+K4t6SjxYa6ysAgIGtbOTG
         4xTSFvMPI+L1qE+/gzfivVXzeLalBgGsOPfWQ8pwdvoeLgA+ihGCLDvWP9FWjCqE55FE
         BVLqj7weGGwbZ1oo5IbgkqriErG1ZArPuwFzEwhv9ZorI4APg72r08mu0BlPyCWxxfyQ
         hQWzCJ2tlFSUjkxo8opJ38lEjlOq8+1ywzc2uSm7nLL5dOGpewRk9/s9v5vajlO55bcO
         3/rA1V+qsxh1QPVWNWWkn6fvLYw2M7+mX7wvagh+4oHbNs5UeQoR2jB6qVhJCSPKBJzJ
         +zNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752086886; x=1752691686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzY/wkRIsQfHZQP8v4qsHJxPM4X7h0KVostvHPrFTLg=;
        b=tqRg9hQNFjNb7hJULuUuNjtNDiuGxmki2z0Xo1DYP/Kjzn6cINOsy/5Wk3KDdi1Ppk
         x+JJO54wjaT1Shyz4zucIAjKyJ02oKJYXUlJJYCN8nENUfCyUiBagv8fDILCNXWFiSIY
         gaq3AdaOnWR2Y1wYhY0d/9z/Mb5cjVyccJPvnUJChVKgnDHy9X/7YUoRk7/GzdwXdchL
         RUgTSHfQsNUNrngUpsDTLWxKoJhSYg7GCuG6v8XEJKxRuRf9hF9gTiVEdLYfhTQzPcko
         NnamQWc/W1d5VONDFbFZUynGtgKda97Mu56tL9aIrnfPFZDrHfPQc+BXcBXouHxNB5AJ
         9T+A==
X-Forwarded-Encrypted: i=1; AJvYcCUCMJoDMB2YgtFtx+ZrYv9na7TunTpMD2PQy2aMFxvRRmZlRkwDhx7fys7PMb7FvjJsJtKKu55yWVHGPmPRJAVFgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5xQKQkzYGk54Z43IV/zSfXsyGb/gxfyT/dlC1KuEaKHvyFs9y
	shs0G/tfWJV+xesWBN4wfE84102RV3LcnpgPp4xZUyrBIJw3cJGLzbNXaEt1xQGMVDM=
X-Gm-Gg: ASbGncu+G1Jg0SikpefrwhRWzGkLm6lhOvooXS/yL7wGN5LYEM1O0FAg6u7OuDVKK3d
	w10/aYqs0XXrMfpExxWnPIFSQN+rSQIclgVdV2uG/e6NmfRwseaswYM/Yb+wPRczFHSTFAn5lrB
	WeaytrjBXh47foMCU7y1zWVGuGvHVtq4VS/7VN1Fm+UHA0b9dBAPgsyoKpTzTA/FG9dXU1egMz6
	zqaiZ8bPrQW6WHFiu0q4aje80xRzzo4rJM1x6TVysim57RrIsymGkSsxiJpVOkhfggZthKgB98K
	vR0ikIYzpT/tx8qaFYV6LGrzZbOWQ1VkvELUOIYxHLeWTVNrcv9glkfWWQZW4dC6IpBl6D/tjro
	0bHv7YT/pcA==
X-Google-Smtp-Source: AGHT+IFjKA2bgIqGaBqRLesEX9wcoaMoKB/p6ZG4Z389Kueb42crYAklSyrFhdYRjHDnMQwyszNa9Q==
X-Received: by 2002:a05:6000:1acc:b0:3a4:f8a9:a03e with SMTP id ffacd0b85a97d-3b5e44d4291mr904572f8f.3.1752086885818;
        Wed, 09 Jul 2025 11:48:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030baa5sm17171045f8f.12.2025.07.09.11.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 11:48:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: dts: vt8500: for v6.17
Date: Wed,  9 Jul 2025 20:48:01 +0200
Message-ID: <20250709184800.168462-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=u3Hc3nQp0O5WYAc3HQ6CtOu++sD7TDGjIrpQ003ybJ8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBobrlgVC0ilF996/5GTTUNwBoZFaYVvZ5ULFp4m
 G/hCGPoMsOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG65YAAKCRDBN2bmhouD
 19zOD/9i+E2GOi/b039lg98NNZcohGuoXIVSRC44kihPhyF5fktFrk/DYRA34Z97HujEDDnMHZ+
 5EtZNNNIWw8FuyuAWLGSElMQkrjbj1rf1iDE8+cvXFOWDCKrLSeCijgz+hkkBUAwhzA3KplHhq2
 ZgcttfJOK37Shz4j04++7ApseLxU75w9ou6ELjVcMB6wly+eWO4G7MiYkWnWXrp/tT7yj4sBxoS
 U/SbufyU9eNMZZFqdaLUAwF3fXPMCgiMcyvNab97TamLWvQM6ixfCHChj0Q3G7ZAD1l8YUk7Nkj
 +hceANY6G3tkzjZnmsfh0Ti0+/fKZ7Gj/qK0GepilBUyO994ZfExWdLyXPV3MmbpA5NJ8lAqVuY
 EaQ+58rT7omHCIO87qynp4FH9QDWpJ1/QjDABkO8kwNCVzfau6GOeQgYCe4xud9lY+ArFwQEiB2
 n5N05oj4H7VfqWpJtG0S/waFWpeH4gCidQ7CE3bHTcqIfBWYQ59tvK8nn/PnJ1Hs0fYb1LhrVga
 LCO5uXg4nEXPLUSQGFS7B1IXoOiKOF/9djhL3PJAcKzi1QjF4mDOa9YgnQGbakhDqgAaj829iC+
 0n5aePn0OMpoFv687cCUiDgzh8diioDXnEbvfYovugu+4Ij5nNpSjr9JZL80/JKvgKRrtmOMUv3 JAHzaOEGLKT6Zrw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-vt8500-6.17

for you to fetch changes up to 6cd594ed969d5cfc7f97029f8ca0d240637ebb8d:

  ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950 (2025-06-12 17:25:18 +0200)

----------------------------------------------------------------
VT8500 DTS ARM changes for v6.17

1. Several dtbs_check cleanups.
2. Add missing cache topology - L2 cache controller on WM8850/WM895.

----------------------------------------------------------------
Alexey Charkov (5):
      ARM: dts: vt8500: Add node address and reg in CPU nodes
      ARM: dts: vt8500: Move memory nodes to board dts and fix addr/size
      ARM: dts: vt8500: Use generic node name for the SD/MMC controller
      ARM: dts: vt8500: Fix the unit address of the VT8500 LCD controller
      ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950

 arch/arm/boot/dts/vt8500/vt8500-bv07.dts    |  5 +++++
 arch/arm/boot/dts/vt8500/vt8500.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8505-ref.dts     |  5 +++++
 arch/arm/boot/dts/vt8500/wm8505.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8650-mid.dts     |  5 +++++
 arch/arm/boot/dts/vt8500/wm8650.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8750-apc8750.dts |  5 +++++
 arch/arm/boot/dts/vt8500/wm8750.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8850-w70v2.dts   |  5 +++++
 arch/arm/boot/dts/vt8500/wm8850.dtsi        | 21 +++++++++++++++------
 10 files changed, 56 insertions(+), 38 deletions(-)
