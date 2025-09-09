Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F776146A66
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Sep 2025 18:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757442913; cv=none; b=hPBqP+P9rHAhTrKIGMIGrs3oZtvm5GMM6w4DQhURn5uknHrHkXyC9j3ZLxFBpnOUSWBA2IY3UlxR5XGvIjUZRuNsO+23UTZtxAwPExBkKbsIyyu86rvgg7d5XzYFDdD0VvHhFpNPAsXmWGrBryAMydwACMPhCW8x9ByEKoz7QyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757442913; c=relaxed/simple;
	bh=SP/f/OHmyENYFgXEHOPc8/Rf7ucWnwCMfoZXoYcF+Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rv59e+BtBW83kDjDRtmwAzeG/iu7dN2hz1u82FkaSA+xrKLERnIlcOVL+TlCxTr3l4Rd/lTWDkMbCn2yY7p+NQkHnjLi+sJpS3oB9MKcsZzXKBZESYaGK6JRZOqTBfts8+9+oukl57vuyl3p398+MmLpmle/eitssMqyPm8fhvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fKR8dC1Z; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fKR8dC1Z"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61d1fe6f160so1185481a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Sep 2025 11:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757442910; x=1758047710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SwcRmJEpAdsIjXtM8gO5g337Luht7EqqgA9HVxaMN/w=;
        b=fKR8dC1ZxKD5eQ7nCZs3VKAlInEJo8EKtOYvE3rDFMsIzkw0wjavw5+MX9zl0qT23H
         m7/vdMni+VTvOnjDZJY/DHzbA7mbI9VLUryA8ogVsaeWbxsXKdQX7MPrVEBiZXK8+1I4
         PnjvEmroIY5ULlBIvH9OyCDwDcHIlBigPivfFDoR7GXF50HCb3ZI+WRJozasyQD5NNXl
         L+y2/kZUcNkOcjvIuWKqathysmv8ybpkak3eZtoZ5AFSHBGZa099BD66fDp0AW7pVjak
         OxiHkussRUTU6cVXJ+R84bxjTxZbhY0zCor70/yWY0IZ8guEO43HHesICiYASt5+5jGS
         yF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757442910; x=1758047710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwcRmJEpAdsIjXtM8gO5g337Luht7EqqgA9HVxaMN/w=;
        b=L4/iCWi38gbZotgqXjvN6z9GiTKYufyMgU4FJyiLSeggrZgxA0yFucBJ05d6w2Jjeg
         FsrJNtV/bRRyQqnKki0kZj04h9fjmSeNwShGY0jNImxbsvWIu971/wlIBdFCd5qyt4te
         HAjI62iC561qb7M4ASL4xsSseFSm0+GCsstvUpLVzmZqE+glGBKmI53wcNB4er14zF2R
         ut+TEpB7AhFvsj7nzd5zzarHZLOA0oB9qiiRNdDEISG5F5xpJizK7VOItWhBhFcTNu5b
         mGe/Bu70xNqr0OLb4SAYXWxnvSvGx15rUxWHprCKSXIPBddIHYVWnOKjsE4RBojh+ATt
         F+pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl3OPsYyAaga7wy7j5EmwxHrJDJNYyy4eqXs220wh7Anrs074bRWF5Pr7LyYxUutnpderNhQ1WnGIdU66FPNJNaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLmgs0lJgTQ9jenKnVBUYxdC4JKKeUCiwJrdnrtlaGrMM+YISJ
	U4+p8bsmfzHa0QWplBLUG3U2cMxolcKcjPB6xddK+PacWBCTi14J+ni2Gc4m8eeHXxM=
X-Gm-Gg: ASbGncsSAcSi4omqPSEY2CGjXmObJN75weY1Be629NnDEN2sbJGh51Mp1vuqmFsMy8g
	daybUlicC8VhRCXtgrHBGcHJQynvHSYxFT/KNRTwRrwva7P6AowyREt9BrDixp5NX3lJigQwC+Y
	bA2ogJr7q+pTS1KhsU5gKWM1WClRYzQC8SdJfpfUBEerL8e0XG/imbiy04MhDuwgL/HRcYLorBj
	KzkvdTGGatKS+IpG2ET0IPyHYNsa09O/YENDbIsdOL/ESliC0etUO7guOTEcooc/h5dO3IvifZc
	s0CAI+01S+irq7AxWlAwX2JujkfgKRT5zIJ+7l7TIdRIXYtOt71d5Lm7MfhQ87wegTSb5HHJp7V
	oGK0iHnSgPrDCdtc8NLqBW4WsV8kUmNaieg==
X-Google-Smtp-Source: AGHT+IEtJecmV/jjQmnrF4shDa6h9ku/souQrmOu0T5Vo6piPtCO7DvbXGp5/2Tji0sGHNxwh00KNw==
X-Received: by 2002:a05:6402:1e92:b0:627:6281:e432 with SMTP id 4fb4d7f45d1cf-6276281e7c1mr4700848a12.6.1757442910428;
        Tue, 09 Sep 2025 11:35:10 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c0123f08esm1707282a12.33.2025.09.09.11.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:35:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: drivers for v6.18
Date: Tue,  9 Sep 2025 20:35:04 +0200
Message-ID: <20250909183504.104261-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3592; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=SP/f/OHmyENYFgXEHOPc8/Rf7ucWnwCMfoZXoYcF+Ug=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowHNYyTMtXdgVINSVVMUfHhVmyZrZSKfFw9c6L
 Pz+Jl63/jeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMBzWAAKCRDBN2bmhouD
 18jGD/9/DW7x7Gnncm+III6OLPIJRggeJ3ahi+ZOIbPAcqzETQjteI+PC1+r+WVnJR4LgRTjnfy
 nh99rONItP2xQpqCUvO78IyTJlg55fci64+pL/81Zy0VuFeCNxKhzfudG3mVs8C3fmGO1v2V5SH
 mdpHObusWdByV49x327xv2Gdt/WR//yjaPLKQH4ALm/XaX8CqB7fEVqULhcBXoJw1gwffBkYPVE
 2O2jXhQ6WnmvQb04PLoizDRtfAJ5FkemhjCuuvkDRxBlycZR5P+8dEH3v+R8CKUI6XcFV/KUW3M
 loomE0efVKlueZz/d+cG3v5aGtLfpCPnCTXjWbEW2ey8aqtJSZO27Jd34CkP4+Q6BnIUv4vqlGU
 NgJFFQc7IcgMicy2YaqUM1mAj5U99y13U+Ec7w52T9R4sts0SYZoQjuNd2/jCkIM/kLZLAs7PiN
 IbpQXdtUQe6OqfSS8ixhQ/UM3Gu6P1tmRukxzTt5+7thjhbYz5N5Yt67ixKFq+t+MpNhDMIRdQJ
 68ZKfAxI7Pw1F0S2Vj/qj0oNKMO/qIhlaCjKseMfTmysXUjKYKsiZu2Xyd+WoMnAY5z0ziCEsVK
 KtI81ktQne6TXowGhZTHLfCmfvBIKdBxRcArVAz245DgcLmUnOBj9tJiX38qUjO2ib9M+UJQbgK ki7dl0vi6BLGViQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.18

for you to fetch changes up to b3b314ef13e46dce1cdd97a856bd0250dac8feb9:

  clk: samsung: exynos990: Add PERIC0 and PERIC1 clock support (2025-09-07 11:12:45 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.18

1. Tesla FSD: Expose CSI clocks to consumers (DTS).

2. Exynos990:
   - Few fixes for fixed factor clocks, register widths and proper PLL
     parents.
   - Add four more clocks for the DPU and HSI0 clock for USB.
   - Add PERIC0 and PERIC1 clock controllers (CMU), responsible for
     providing clocks to serial engines.

3. Add seven clock controllers for the new Axis ARTPEC-8 SoC.  The SoC
   shares all main blocks, including the clock controllers, with Samsung
   SoC, so same drivers and bindings are used.

4. Cleanups: switch to determine_rate().

----------------------------------------------------------------
Brian Masney (2):
      clk: samsung: cpu: convert from round_rate() to determine_rate()
      clk: samsung: pll: convert from round_rate() to determine_rate()

Denzeel Oliva (10):
      clk: samsung: exynos990: Use PLL_CON0 for PLL parent muxes
      clk: samsung: exynos990: Fix CMU_TOP mux/div bit widths
      clk: samsung: exynos990: Replace bogus divs with fixed-factor clocks
      dt-bindings: clock: exynos990: Extend clocks IDs
      clk: samsung: exynos990: Add DPU_BUS and CMUREF mux/div and update CLKS_NR_TOP
      dt-bindings: clock: exynos990: Add LHS_ACEL clock ID for HSI0 block
      clk: samsung: exynos990: Add LHS_ACEL gate clock for HSI0 and update CLK_NR_TOP
      clk: samsung: exynos990: Add missing USB clock registers to HSI0
      dt-bindings: clock: exynos990: Add PERIC0 and PERIC1 clock units
      clk: samsung: exynos990: Add PERIC0 and PERIC1 clock support

Hakyeong Kim (3):
      dt-bindings: clock: Add ARTPEC-8 clock controller
      clk: samsung: Add clock PLL support for ARTPEC-8 SoC
      clk: samsung: artpec-8: Add initial clock support for ARTPEC-8 SoC

Inbaraj E (2):
      dt-bindings: clock: Add CAM_CSI clock macro for FSD
      clk: samsung: fsd: Add clk id for PCLK and PLL in CAM_CSI block

Krzysztof Kozlowski (1):
      Merge branch 'for-v6.18/dt-bindings-clk' into next/clk

 .../bindings/clock/axis,artpec8-clock.yaml         |  213 ++++
 .../bindings/clock/samsung,exynos990-clock.yaml    |   24 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-artpec8.c                  | 1044 ++++++++++++++++
 drivers/clk/samsung/clk-cpu.c                      |   12 +-
 drivers/clk/samsung/clk-exynos990.c                | 1240 +++++++++++++++++++-
 drivers/clk/samsung/clk-fsd.c                      |   28 +-
 drivers/clk/samsung/clk-pll.c                      |  161 ++-
 drivers/clk/samsung/clk-pll.h                      |    2 +
 include/dt-bindings/clock/axis,artpec8-clk.h       |  169 +++
 include/dt-bindings/clock/fsd-clk.h                |   13 +
 include/dt-bindings/clock/samsung,exynos990.h      |  181 +++
 12 files changed, 3032 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-artpec8.c
 create mode 100644 include/dt-bindings/clock/axis,artpec8-clk.h
