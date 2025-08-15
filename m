Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1D229A303;
	Fri, 15 Aug 2025 07:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755241517; cv=none; b=oIm7XuoH5RFiV4ybEjbpcJeH4wORaPR8Jmb3cFOWHFmLuWjIRb/lDhLR8iNegT8VXcIBwJjzD/KkeJZnPQXwFpMTvRRDppew0jrKfclNpCobTAg+t5SJqs5ND1qGBAlicYCQBQtIRX17aMP4RALxAphsxWG6svyA+kqdEhwWXUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755241517; c=relaxed/simple;
	bh=4sjEqhiOyDoC5pPeaJkl38pRNkcnU+3veir49RK3zO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lKAzYYNX6/dzVg6d/ZVuk1Jnr7AbX/OphcjbkIhksSmxg38ilOOQlip6JeCiE1IS1N4qbAoFMAN0FrGyeUG17djzCSkyLf5TdpcGJqMAHwl0q3hunsYN/cCbriH4euvR94U/waaHRSTPxKoGGJ24AWQE7F7S/pX11U4thqAjoGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MolPRpLm; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MolPRpLm"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afca41c7d7fso443833166b.1;
        Fri, 15 Aug 2025 00:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755241514; x=1755846314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/iag55hYlHoA9rnpCQNvkxDZTtNeIJre3YWIpDvUXg=;
        b=MolPRpLm9UEAdnoW8Sfy38p58Y3T5VQWLxoWTJmL9IO7NrSDUY5odI+cO6Br4wc2zu
         2Nwf2OGb1RI1oM0EQmuNidBdFIHM9Bbfu4Xxlo9t8DnSG2ST66U9iXj/KUZUUXp/gFz6
         H1ZhstloXclbpYLi30SKVqiJbgUD1SmvmODEvtUjcdumMA6OAWzpTiswx/ucNtlspZB3
         qkkonl3IzCYtl2NoZA/PcZXy+b3O9Ri66CPcvRpjXI2jEYhwiNxWm/pUfvTzTr6zIsyo
         9mpDpLR5bWRVtexfSUnJX4LeOl5C3QKRXmxpYGbIV5xkZPfWmn7EDuk5tEo24w6frsVv
         iFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755241514; x=1755846314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/iag55hYlHoA9rnpCQNvkxDZTtNeIJre3YWIpDvUXg=;
        b=bYJu58DQKZaQYeu7aJImwdjtS4Gjrj3rNdEoa9WZIOKZCYqj8qnmTnE2rAODDaE5rw
         AtoB40tsyYLue9SNu0zLLwIAZ7pdcQka9ngTM0biJGvSN1cO7UqEUQa6r/gA+oR5VRdF
         HqP56BQWcVwpeh8p7HwJdM2V9g8qQY/9uqqcKeXsKEKVI3ZVbOIH3oYDu5ZTd8/eg/q2
         7ZcLMer9rvKcD/qKUo+u1C7S/rquMxWPmaL72ZTTo1irpU2x0A/jNrpb7n7dPQWoRfOq
         LzYDIBsf6KTR2lqzlvLcEftNpaIvhQm/noinR2wuqrx58VjBK8NAvWvI/i3hIisQd8mu
         8bOA==
X-Forwarded-Encrypted: i=1; AJvYcCWweyv22WmSCXCfkqcOxR7YGbGf2JfXFefiz4Ow6S6r5OTL5Evz8eTNWZIYqFtBik3Bd7cUkrc335oL@vger.kernel.org, AJvYcCXH2YNTPLQanYYd49R7vAA/dD47sztLUnXQUSKEh1x5E9rwAFmS0AAtnEz1UcReAxmkt3prwceUnI6lZuUX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpgujo9g9tg7sn70P1dZUMGwFpC8kbAKDMYY4WZjzvj8wvsDmz
	6q903DLMI1MHZzWGknIIPiW5ThMmpGNhRIEW8kJBwxdGXNUjUrau+mVo86/usA==
X-Gm-Gg: ASbGnctMm3fcBai/kCCU8244tkJVO1M1gSG7ShEhfXa9vRIMGFSTFScQkLWFRzThumY
	f03F1j+xReEVJG2etdNz5aph0OlN8XuWBi8sXcICw7hgf/a1vJjXhNb/BAWxWvrcnFXa4iJ6kLq
	Fh0/oHDDngB8oOk0N8d0Jasr36y3ZyAwQ/QRW0nonHI19z9QD5U7hj/DAM1UAhaH5cFwuPIKbfO
	0daf6FA66ehvsAlMSFMkR9OqLOLHpKuHcYa7MsVh2QGaOvGomlVChHyZhejT5jx663yX1zlJZoY
	9prZiZb7tNee7/8q3uMhkMFpK18Rl7jekp1+Fjq+gmqLyAaSsjg4pgcIzp5RO3vKSr2Z1wXZD6N
	MlbWFWp5+2I0dlU6d7KOVFdO3XojSXy8q+Eq2hhmSE9nk9TSK1HCTg5UPdSvRVD8V6Y3KuBaO7w
	==
X-Google-Smtp-Source: AGHT+IHr6wQG0PswCNw4vR3Wy1Wht3/V4Pr6akT/HuqhweLdwtaQD1imuiELwGEOJjYU60NXC5rzJQ==
X-Received: by 2002:a17:906:794d:b0:af9:3344:56d3 with SMTP id a640c23a62f3a-afcdb29cc4cmr102205366b.22.1755241514144;
        Fri, 15 Aug 2025 00:05:14 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfcb2ddsm74269266b.74.2025.08.15.00.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 00:05:13 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] arm64: dts: exynos2200: introduce serial busses, except spi
Date: Fri, 15 Aug 2025 10:04:56 +0300
Message-ID: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey, folks!

This patchset adds serial busses, implemented in usi, for exynos2200.
It's missing spi, due to me having troubles with reads when testing.
Serial_0/1 have not been included in the patchset, as it seems like
they're encapsulated in usi blocks, but are the only implemented
protocol and/or do not have a dedicated register for setting other
protocols in a sysreg. That'd at least require patches in the usi
driver and bindings to add support for.

About the naming convention for usi nodes, I've chosen to keep the
downstream one instead of relabelling all to avoid confusion when
cross-referencing the vendor DT and to keep consistency with clock
names. They're labelled the same in the bootloader too.

Best regards,
Ivaylo

Changes in v3:
- drop the serial_0/1 patch
- add r-b tags from Sam
- increase the size of all syscon to 0x10000 and not 0x3000
- change description of last patch to be more meaningful regarding the
usiN and usiN_i2c mess
- s/usi6_i2c_cmgp/usi_i2c_cmgp6, following the TRM naming convention

Changes in v2:
- add a patch that switches address and size cells to 1 in /soc
- adjust all new nodes to define reg props with 2 cells in total instead of 4

Ivaylo Ivanov (4):
  arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
  arm64: dts: exynos2200: use 32-bit address space for /soc
  arm64: dts: exynos2200: increase the size of all syscons
  arm64: dts: exynos2200: define all usi nodes

 .../boot/dts/exynos/exynos2200-pinctrl.dtsi   |    2 +-
 arch/arm64/boot/dts/exynos/exynos2200.dtsi    | 1433 ++++++++++++++++-
 2 files changed, 1398 insertions(+), 37 deletions(-)

-- 
2.43.0

