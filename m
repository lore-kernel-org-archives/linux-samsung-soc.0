Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CC26BFA3
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 07:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714029546; cv=none; b=lKqCXVJFRAe2a1UkyQhE4R5ViP3GDhsntg4YVBGJyBos2apoD+Kfwu0lFSV7sj/zFISC0WMZ5KbFTwqbENI427MIbuyLU6bnqYTW9AAv3xDTqfmkQ2fmyy49jzYSfyvjshuRPOiYBaMNgPav8ipa+K6oZIoPFatcmnvcT7gwYrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714029546; c=relaxed/simple;
	bh=ufI2zcLTn2csgH9AexYYedelSXPGBL/36WoMZX7qNPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JrSZrm3r2vQEqcDJDHZV9ETggozcj6TFQQQpdOfiS7PYbflbfZhHKGpe6/AObPWCfoio3/TiJxYP69lqq5YO57vu8WB3T65feR1DfyWuS4590drCXzHe8YDuLTuqlxrCsSRrJSEtz5xAoOFr1MQ6wYTsgaQ3ZAzCf7kjYSyl99U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=twhPcKFP; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="twhPcKFP"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a55ab922260so84173966b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 00:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714029543; x=1714634343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDtBGib/Y6SrLcaq1T7Za9185cOkevaJjpxXmDQw774=;
        b=twhPcKFPury9WSSAvSwk+TXXronFlZHxEJ9Wrdr9TYqIeGESSgce8qufG8vMZ8ONOp
         lZNX6Pvbqix9M9xILEiQfBCw6ZKBECBsww9KENUG++GT8TeV2HblGgInCesmlhdqjONZ
         w53qfNK4+/8yBLWrL+RQYp31/I+aqxRWVtoJm84P2235lvdL6T0EWnPZh4uh0KWf1g6f
         CXYGyrCLeygjC1a+arnUDdsIBD9dsmDRmL9pkLHygHtaB7jD91flEC2xdlgP8m8NjZVV
         32cIdnXLitZ/OSqRdT6f+k6joHjD/LKo9NN9Klj9ueO7Y8bYo92dXKx6RHzKa0/iuq6v
         8ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714029543; x=1714634343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDtBGib/Y6SrLcaq1T7Za9185cOkevaJjpxXmDQw774=;
        b=FOFv/kebPKaN9nP4rt67vHTphJ782KTLGlx8KSwJteSgeLzGG6TkYKyjY4PCGyQndg
         y/ViQ+TuOU+6LrMoMvveaGohVbhyoXlCMXUo/Bka2mJPL/UFmer0/INVC/cWSJruK0z8
         47/4yey+YJDdEqp3zKVEG2stnMcoJji8Gf78yda8nnVSszRjPXxDgPAbcSedseH5xvO8
         HkTx8U1jSkoajPfovY2UbLvt1E4xzu6czpdaKGMz3FdpSJumEK/UMBkOvv/RTv9snLd3
         /h1dSB2QSBbvGYIjKiGImPtxMiVmcS1+PDdudTz92aarTpt8RWyUS2BmXNFjp94v8fZ7
         +RQw==
X-Forwarded-Encrypted: i=1; AJvYcCVrs5gcU07Dkr3nCfSdOvn1jjWC+f/WZO+jOlQA16bOu4DlCPKp3qFleuTeobOWIsLxQynFbcAXTgA4dzkXOo3Yyv+DmXSVEOsnt6cfgJTrjOQ=
X-Gm-Message-State: AOJu0YxIDIBNDmxjGuPX26tXpXk9ytteFclyp1qYaw5gcCtyX6kb3DG7
	ZYxvKdwxdxINLhTYh4EMNTZoADns2ISpNdbzSYV9HkVM2ouu8tEpn2bFy6PloUKZvOmUMTfg5Pb
	RGW0=
X-Google-Smtp-Source: AGHT+IHcW+odnUXlsGsaZcYoRQyADpE9jTnNF7imEjFFLWjqptBhedzpNGemXljntpCtWYL/qIg9/w==
X-Received: by 2002:a17:906:3953:b0:a52:4394:888b with SMTP id g19-20020a170906395300b00a524394888bmr3292157eje.65.1714029543241;
        Thu, 25 Apr 2024 00:19:03 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id hd38-20020a17090796a600b00a556f41c68asm9091174ejc.182.2024.04.25.00.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 00:19:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: samsung: dts for v6.10
Date: Thu, 25 Apr 2024 09:18:55 +0200
Message-ID: <20240425071856.9235-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240425071856.9235-1-krzysztof.kozlowski@linaro.org>
References: <20240425071856.9235-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.10

for you to fetch changes up to a45c3a9b1ef9571741d40bf10f22ce3c60bc5111:

  arm64: dts: exynos: gs101: define all PERIC USI nodes (2024-03-28 10:51:16 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.10

1. Add FIFO depth to each SPI node so we can avoid matching this through
   DTS alias.  Difference SPI instances on given SoC have different FIFO
   depths.
2. Exynos850: add clock controllers providing clocks to CPUs.
3. Google GS101: few cleanups and add missing serial engine (USI)
   interface nodes.

----------------------------------------------------------------
André Draszik (1):
      arm64: dts: exynos: gs101: reorder pinctrl-* properties

Sam Protsenko (1):
      arm64: dts: exynos850: Add CPU clocks

Tudor Ambarus (6):
      arm64: dts: exynos5433: specify the SPI FIFO depth
      arm64: dts: exynosautov9: specify the SPI FIFO depth
      arm64: dts: exynos: gs101: move serial_0 pinctrl-0/names to dtsi
      arm64: dts: exynos: gs101: move pinctrl-* properties after clocks
      arm64: dts: exynos: gs101: join lines close to 80 chars
      arm64: dts: exynos: gs101: define all PERIC USI nodes

 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |   5 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  26 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  12 +
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |   4 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 791 ++++++++++++++++++++-
 5 files changed, 823 insertions(+), 15 deletions(-)
