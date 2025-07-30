Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC1C1E7C27;
	Wed, 30 Jul 2025 07:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753861380; cv=none; b=f9i/nMD1w0I+ddnnFznQ6MUUzsGdSbawmUrgBELGxK242tHE0m3WgRt3UcXNY+qcNy90Lrg46aP3rCSgzknfKYc3HSCtdEKzYWYSO9WGlQoz4ylXHN9/6PVbkvvHG+RQtnIoEAoYZjfpEu0dr30hUytccTy9dTBB//sw4T8MeEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753861380; c=relaxed/simple;
	bh=If9gNpv4iuv5ZBX6KjGQdiCeXynHnG/2N5eb6pRWKTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i1w8p68uyl8HibCscOmznHR9TjBscUlarFNbi35YSKudfVD0pVlbkRTcXuOaD/QoFYX4QcUMMOrL2Jbz+SiPhGhT6pULHZlSrH3wcKPV/f01AwNKh5yC6N3rO7sirPGKKBgdYs16mGmSHL0BXBNRu/wZst5jBDm287kFyrB+EI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvaaMgcA; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvaaMgcA"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a575a988f9so3480690f8f.0;
        Wed, 30 Jul 2025 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753861377; x=1754466177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=chG+U92YJTb/06zPnc4uKR/tZueFYP4V4J7hoK/qdXo=;
        b=GvaaMgcAftupl5aEfKYvU/wUS4yBRquRprZqaSoTxaCjDsQEyhFJ1gAFVsqno/GjY2
         g8KSLS3hdbzWQp9YCHmdOIWDciGX5DBRLb4UZ8Z10Eg5iXY84Ir6PakhZR0MQqgzgJgR
         +tEnAKqTzhAsczU9uZoqjjJsKx8KvNyCuuC+oyu6A9QPJjZM/y3dN7Jc9RgsLEqvTReL
         f8RYmNDEGWMLQae30ptIlMEOUuL9eODyZ1m3cckXpbNtPhqCfDAfxT1e/oSn5QZbclyS
         26dnVYSMPtIEgCgrboMJPApLwUdU+D6PJppetwtaiQgk607D7qn1sCMuiUrY8TaIjPUl
         1Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753861377; x=1754466177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chG+U92YJTb/06zPnc4uKR/tZueFYP4V4J7hoK/qdXo=;
        b=vBnjzvmMN1yg+jHWTWwjDhhkc16YO5HzBbT2absScSUgVbfrVpxbNSDnVEcp+9Cvf7
         1bOCBn4Hcw6fHedylSutk63gI8COll/hh7UHimc7jMJclVahiZWIxCjrC8XS3EnHf2D0
         2Ojie+qDrOPHqgaMMqTiDfJWk18+uhhPMdytQ3kEXADZuA/YXFcEExSekOZRd/dJTbMl
         NP3Lf2syJBYBfiOCKaVpN2O6bYJnElPpY5H1ZuoOs3mzt9uFNPS72O8gyCobR2HH9mdq
         CCIctW4EXLJLNk8ED9cZ87maNPeHupo15wX5KP2jPqaRHB6ECz44RBaTpSxA62bfaK/B
         iwjg==
X-Forwarded-Encrypted: i=1; AJvYcCULfXf5c4Gk9LQL6fgmvuP38MuKnnQauLNV4sRV0eHPbDV6NLARPiEmjJknQeTYl8vS4trgtoLLuCpkci3y@vger.kernel.org, AJvYcCUh5gUav7B6OuUUJhwGHSMXcp/Gxrer/8xrTNf381qxHs6uzSByMvxj3B4FmSa6VcEpLOylcIFwRt+L@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc5aLvZO6MsU7QW1ZszWZRw/osdXxltL7tIV2eHSpNYGS5S3O8
	b0nBdesTCS+Xye+c5hhK511F8pTMW4JlXCjPw+I+yfo4zafAdp6Px2Qk
X-Gm-Gg: ASbGncuPh4TKzpTQfZjF8raidP+h5ytO56Djuuw1nvNgHiy3I2+kaZ6uI7PEddJFyRv
	EXSc3cAlYQ/dJnknnTIyCjXIJDiP+19bULROhEKaZqA4Zboj9AbXfZyIPYseN6em7u5V+1mvygK
	5/Q9gULAvP7Bpm7jyn83bbj+45TtNVgrWotYuUYyp5Pk3CD7TP2TE9CQNRtyf0uNCvjQhj3gRbm
	t9tfhPMhS9QCxPkTYccO6vjGWrbN5S1mt3AjPMxj3oLgPWsX2FxnFmoKO9pMZyxU0pCJxusSXqX
	FosbLOwQoXpU0atuWF9jAGMbnYXiPQW4uIZW/eBEsqkahzD4It6DoVmM2RNDtos+gq97qph9E2K
	M1NJFIv09YABKY8NST7HjveMCfsfM0Jafb28rLj9eIBocuQ00BiGVbca7eVxZa+eoK8l4qjjYcU
	y8TpNvOmXP
X-Google-Smtp-Source: AGHT+IGL8/AcxTOI0rdRbKser4vIAzAAFwvdC4/eIKFajFt1OS3n+7CpNkbdjokahJIUyITvnfm8Ug==
X-Received: by 2002:a05:6000:2212:b0:3a4:e841:b236 with SMTP id ffacd0b85a97d-3b794ff34f3mr1712839f8f.33.1753861376651;
        Wed, 30 Jul 2025 00:42:56 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eaed4sm14783835e9.27.2025.07.30.00.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 00:42:56 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: dts: exynos2200: introduce serial busses, except spi
Date: Wed, 30 Jul 2025 10:42:48 +0300
Message-ID: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey, folks!

Before anything, this patchset only has binding dependencies, without
which it will have undocumented compatibles. They are the following:

[1] - https://lore.kernel.org/all/20250730072730.1882549-1-ivo.ivanov.ivanov1@gmail.com/

This patchset adds serial busses, implemented in usi, as well as serial_0
and serial_1 for exynos2200. It's missing spi, due to me having troubles
with reads when testing.

Best regards,
Ivaylo

Changes in v2:
- add a patch that switches address and size cells to 1 in /soc
- adjust all new nodes to define reg props with 2 cells in total instead of 4

Ivaylo Ivanov (5):
  arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
  arm64: dts: exynos2200: use 32-bit address space for /soc
  arm64: dts: exynos2200: increase peric1 and cmgp syscon sizes
  arm64: dts: exynos2200: add serial_0/1 nodes
  arm64: dts: exynos2200: define all usi nodes

 .../boot/dts/exynos/exynos2200-pinctrl.dtsi   |    2 +-
 arch/arm64/boot/dts/exynos/exynos2200.dtsi    | 1459 ++++++++++++++++-
 2 files changed, 1424 insertions(+), 37 deletions(-)

-- 
2.43.0

