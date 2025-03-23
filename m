Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54791DB128
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769576; cv=none; b=LRcWXPNcFS2Dy2yRx9ndBhMQdGbtCrkWcOfGSESsUZDItW0pKm1h3z9gZY8xGVdex3tb/jWYfBiPt7jBIocO8d5UHPjtU2GLIl/xrDHKNPpbmtzNfyPTolAjct++L76jcvdeJB+bGRIYBiuJdoCuID2d4Y17LYDwHvtynhRZ0kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769576; c=relaxed/simple;
	bh=vhmwcNLdq/vAk/57/nIwHgfUXmRE5veIwzqtkTfIDCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z7ZGJcLIoHlHnKLAeMT0hd4gumlUbSYvQ0sNOoeP9LrSYW9Qfodf1rWBmbwnyDcVPqNC3WfEn3W2WikPfuHeXTAY7bVsS5/ypvNdAY4Lj6CnT5FuugDW7ZzaHZKTzPs9nQLHsKfEoaRcEzpVGoO6nMb3Wx5S7i8Rtrl6E7+9krI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=evgXH92t; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="evgXH92t"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac345bd8e13so673815566b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769570; x=1743374370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPaIY3x3VVrMkB4/G8kk/a/tWB9/OjPG56rBALdlvrQ=;
        b=evgXH92tqHyJLaExNh4ZZ8xmGgq54s0dUHli9+RWyVVeMQgxKwBPqgNUNz0NTbUKmt
         X4nhCb8UtjXIROlwBJrVveHFIKsHis4G5uEl1/7Acxh9QIiC6kQX7TJiZgX0p5diHZOV
         iJL0kLCMz5v5paf4P1xrwduIoXzK5eIpNYZDwQQsG4nCsRR8mZu8XLdMOUbz9SgpNut/
         sX90rblFd5gfW4jk0iinBQPRvGGsXH3u1AhRjMA331+a8JdABeHlrzOy7Mj+BV69FpGy
         47Az53jUg/1QoF2F+L0D+n+DDFucYPdV8DShGzY0JJiw203ZlWQQsZ6Z1sXAN6JjEx3r
         w/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769570; x=1743374370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPaIY3x3VVrMkB4/G8kk/a/tWB9/OjPG56rBALdlvrQ=;
        b=goUu66C55qELl0qc+12iGjKYYDOYsMMqXIoFfZhMce6LNbuSXdkv9PHG5BJJnP714U
         GuXSezZbZJbc3hIqmdwlqCFY115I5BySsErn4hclf2K37ZwEgBZlUhNkx3HORr9RNu25
         QC22NxxxemjF7IcOv+MHZblea6Tkun1f9iVXtTyFNODbR1Rj7+UlQevv1724J83Y1MEs
         ozkcVas3Khf+HtHuMd0c2Qct0yMShKSjFY6EPZEZMQGWGPHkID8E7kGVi7JtQoop855i
         zbi84pD7cfaoQWXUvjSwXDc3PZ4N2nDujsOzlSZOxISrLG1fIFr4jBScpluLc1EeuuEK
         hTlg==
X-Forwarded-Encrypted: i=1; AJvYcCX4cOI6Vlz0/ZzM5A92tWh9EKEjDHu1my9mgAxGKdhpoJ2o3rXrtmOwJF+eF/Oy5v1Vl+lBnQ4okeTxPmejHoBUDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAzcSJfE5or2xELrmn0RsIugR2ePeDxOPWwwDI4uTPeSVsUEuO
	oh4bTBFeDN7v2Vdx5Ow4jCa6Bxk8ER13I0t3Da29wuOTapqxJYHThdjxJFS6l/Q=
X-Gm-Gg: ASbGncuu6lhdDFdWlXAbBMigwxuaIOKcEnP+Yyhzmu7A57RmF6f7Ns4T0ufz5HhxXb8
	TBifiS3rvkAUHMdGe9HVopFNDMWwhHZqrjH3oDMvhBXedyVVwQlDIJXZBEWqQNapiBUR2oMyXf5
	ap7xoHEuwQ8JPwCdZeftA9mRgF9PGefz4AAa5ewGcIfmYvy00rn6yP8zuXVBNmuBRs3ifWg7nkb
	Ljhoe0FZXx/xkEkdoP0OV2ULQG/i9c3ByNVv3DX/kXk71kfhCOTUzaWX/tcZxI4gHPQqPUMuvTr
	rSk+LMLLM7LiRmAxsLBfcyESa62eELHUhVqyC7H4lHHLfSSKWP9VT9r3ca+Uc6IJpp5SfQNmEsS
	rdRP29roFN9r6DpzqKCyirwe34ZRX
X-Google-Smtp-Source: AGHT+IFPXn5kuydsVZ5juxiG+97RkmMKn/3aV6ozY9UpbUvRFJV9i4K4wAS7EARyuWbOU8je237GtQ==
X-Received: by 2002:a17:907:7293:b0:abf:fb78:673a with SMTP id a640c23a62f3a-ac3f22b0fb0mr895769166b.29.1742769569876;
        Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:27 +0000
Subject: [PATCH 11/34] defconfigs: rename CONFIG_MFD_SEC_CORE to
 CONFIG_MFD_SEC_I2C
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-11-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

We are adding support for Samsung PMICs that aren't using I2C and
therefore had to rename the Kconfig symbol.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm/configs/exynos_defconfig   | 2 +-
 arch/arm/configs/multi_v7_defconfig | 2 +-
 arch/arm/configs/pxa_defconfig      | 2 +-
 arch/arm64/configs/defconfig        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 7ad48fdda1dac69a4a9612eabb573729bed7b3a6..251f45be6c14af59263373f21b27b15f42ec7f61 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -167,7 +167,7 @@ CONFIG_MFD_MAX77686=y
 CONFIG_MFD_MAX77693=y
 CONFIG_MFD_MAX8997=y
 CONFIG_MFD_MAX8998=y
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_STMPE=y
 CONFIG_STMPE_I2C=y
 CONFIG_MFD_TPS65090=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ad037c175fdb0ec8601c9b3607aca0c0e5f3c145..7d06ac5369b1a2f325462f2cf5b54fe22061ca77 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -612,7 +612,7 @@ CONFIG_MFD_QCOM_RPM=y
 CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RN5T618=y
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index de0ac8f521d7612704ce327e9ac16ab9e999f3d3..064e79baf20da809c9ab1f1fa18282aaba11a41f 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -335,7 +335,7 @@ CONFIG_MFD_MAX77693=y
 CONFIG_MFD_MAX8907=m
 CONFIG_EZX_PCAP=y
 CONFIG_UCB1400_CORE=m
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
 CONFIG_MFD_TPS6586X=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e8dfbe22db68d9aa24df5af0786a2eeb8f33bf3c..cc4dc330cfe82d11ca0c4c9ba8cac4b14decdeab 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -769,7 +769,7 @@ CONFIG_MFD_MT6397=y
 CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RK8XX_SPI=y
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_SL28CPLD=y
 CONFIG_RZ_MTU3=y
 CONFIG_MFD_TI_AM335X_TSCADC=m

-- 
2.49.0.395.g12beb8f557-goog

