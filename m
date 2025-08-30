Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC74D25783F;
	Sat, 30 Aug 2025 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756571323; cv=none; b=LkuHLgozjkAzVFygKg8DicERcOjP2PRrnZ3qdPnfItveIiznhAgHTkVJccwi1oN37ISyGnEciWvyh7sAiPIioG3q0akX7bLju0Wp+0WGNJxjVwnLDWkM0acy7Jjv0UDUD8WAnyvc4ixG2ZNg1Hjz18E9haNBFSm7ByC6V/Uq8to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756571323; c=relaxed/simple;
	bh=DTu6htZoqYuzhaeQFD9mKEvbhzis4l6Wheni3yeZONY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uDR33ta9rgCt3BoNZvF9VTzm9q7KZlO3UAOI/nynZpF5h2IPLHn4G/fxJRXm+jMnMMPKWznm3QskESfZKolXPifPtozsM/6Ju59cOJHlXfMd7HBNKXVDDoJqIk0t6M4YBQDaT6QYrGU2Gxe98jfAg7wzjqO1BJcpcJwNFAQa6dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWlrbwxK; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWlrbwxK"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-70a9f5dfa62so26740496d6.3;
        Sat, 30 Aug 2025 09:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756571321; x=1757176121; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t5qRg8dL7CV+FgonqN1II497OJX54kF6SQzjUzNxw88=;
        b=RWlrbwxKc6Pf/Moi4jiXSV6IneKV1aSKoVTsaF3AIZohxOSa/UC6Gc+6ac9h67QQ0B
         Bo2NXW1KdvOhstkAhYOMjVSMOojThnesJ+Ox1BbdfY2rd482k2x/Xg6L0Wy28q4cQJ5X
         U15PFRoBuVzlgOf/Cs0c130Ze2blIUxT0hdXELmAhieij0zZWbLwT+r/hrZmT5LmUsnw
         u22/YLo3d81q3XPbBwom8VYfZCgLocBrjgQDjMSuHKyIPQ9M+Hi3bf4K95QOBPyS0uEW
         i0oxsT3+qcilUlLtNnVZABDdXvqe9ia1iS3a64RiBb3e9vf3LOAPhNO2+DJYoYDexbFp
         IVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756571321; x=1757176121;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5qRg8dL7CV+FgonqN1II497OJX54kF6SQzjUzNxw88=;
        b=Ch1oR+2qxVV7DrjfP1zzbRuiQZFRq9Lj3R0vW6xovNEwgvgEo1etGZrntX4zksWp4o
         72m7GoIvf/bmXHYcz/YADi6ycdm2YZ8Z9xzFOejnvL59W/egX5EtUQ3wlXCcrUsml+7t
         +AUUvhd45iNz1MCZ0MsiuDGXj1q6p0nlljaURoqcaAskIA2Vzs9bJAzB3WQNxN49vhzV
         dATuYMP8kE0L5rDBn2RRDDj+qdflfRHrlJ73Jqy3H1DiyDEDOj5tqUEliwrT2k8R4375
         ul8ctqVTjuU94VB2vY+/MLDHazNX+KK6Wyst8el5YMtM/PfrnV6aayxGPISmFKo6cF7w
         Thzw==
X-Forwarded-Encrypted: i=1; AJvYcCUYXtwJk9CClZH2bUerE652DYpS/cjNb8mGoO5UOnMC38SsdOXbrmxktzZrG//GasiaiNGAgODd1cnSEkKi@vger.kernel.org, AJvYcCUvvKG/4HRvsQbyrhLv67AQt7BAzy6XWTmCYJRgVWD2mcHBn14YcUkn9lngmghCU+N0DkA3i+cypsOA@vger.kernel.org, AJvYcCVE6V0e61kxNuIdEpa1Z/qSnUcNIx6e0N2lyQ6QqR8sZ8Dp0+3y+wH8rT+xl9T0okJHDp/VyWDf98sY@vger.kernel.org
X-Gm-Message-State: AOJu0YzJmVFQvQY5/FLMmUsGovii7F7LyesTQ/3mnsNdmu3Z5Ucradi3
	T+8L3+0QBLSLuy5VZFreGz5FEFLi4ynVFbIqY5zsmNslGQp8khi8Btkf
X-Gm-Gg: ASbGncur83Bn4xgmtFXMNgy52UodPLEz2IOcFFl2rCxIDlFZgv4VlSJ8skeXDDZy0u4
	yj/mdC8Ck2IHM2biTZ7w8pvAYNWncaMI0YdF+KP1yUt6G/wkdKvs0UvxZmnQ1MbA1tOOqdosywF
	sLFdjN7zRnrG2w9w+nxrLMiHPxSFMNlttpEXxRUzRRixorp/nDbXXOK0OsnathAUwbUVdirEXRf
	lESxsQQtSF6kSDvcfc5Jds0H78V5Y2yw36TBLr7wBwfJn7FvWXQyyuQESdk1+z5l152pvfGDmgs
	ReSI8LVYe18/aE5waey7Ob8jIX3fcrUSkuYxCsMIdCDfMPVljgmxK6I4mJQD1CmfS7IsSCLKoFO
	zLqxQC0jg26BQaCBJFngD+K2NYTvZ
X-Google-Smtp-Source: AGHT+IEDsnzVzmDqICYsDSEbi2aaTM/6NHF5Tn3lwCq02oQLmPIh4l49hBu0D6JUcNECJ8GrIWvnTg==
X-Received: by 2002:a05:6214:f09:b0:70d:9291:bdd8 with SMTP id 6a1803df08f44-70fac7c7ed1mr28987296d6.30.1756571320599;
        Sat, 30 Aug 2025 09:28:40 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.195])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28b5a26sm8110786d6.64.2025.08.30.09.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:28:40 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v5 0/5] clk: samsung: exynos990: CMU_TOP fixes (mux regs,
 widths, factors)
Date: Sat, 30 Aug 2025 16:28:37 +0000
Message-Id: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALUms2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC2MD3bTMCt3k3FLdkvwCXQNLQ/PERAsTC3PDJCWgjoKiVKA02LTo2Np
 aAIZGO1pdAAAA
X-Change-ID: 20250830-fix-cmu-top-0917aa84871b
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756571319; l=1607;
 i=wachiturroxd150@gmail.com; s=20250830; h=from:subject:message-id;
 bh=DTu6htZoqYuzhaeQFD9mKEvbhzis4l6Wheni3yeZONY=;
 b=TLrfWOSA0lvmaSNnT+NdMXez4B1AptncW54LbNAkWa5w+d2JzK+N+1IQ+yAVMSNO25fxPCFEy
 UBnQgmyzbFwA4LaOd57KjANj/h0Y/WEc/z/cFH4T5EBqdNC4JeVz7MX
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=rxHEBGA1eos5vQkPC9SlkEPD6sil9F03N6bc8qmUFrQ=

Hi,

Two small fixes for Exynos990 CMU_TOP:

Correct PLL mux register selection (use PLL_CON0), add DPU_BUS and
CMUREF mux/div, and update clock IDs.
Fix mux/div bit widths and replace a few bogus divs with fixed-factor
clocks (HSI1/2 PCIe, USBDP debug); also fix OTP rate.

Changes in v2:

- In the first commit the divratio of
  PLL_SHARED0_DIV3 should not be changed.

Changes in v3:

- There is no ABI massive break, the new ID clocks are
  in the last define CMU_TOP block.

Changes in v4:

- Fix compilation for define CLK_DOUT_CMU_CMUREF to
  CLK_DOUT_CMU_CLK_CMUREF

Changes in v5:

-  Rewrite commits and remove cosmetic/non-operational changes
   and unrelated rebases.
   CLKS_NR_TOP will be moved to the patch that adds the new clocks.

Please review.

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (5):
      clk: samsung: exynos990: Use PLL_CON0 for PLL parent muxes
      clk: samsung: exynos990: Fix CMU_TOP mux/div bit widths
      clk: samsung: exynos990: Replace bogus divs with fixed-factor clocks
      dt-bindings: clock: exynos990: Extend clocks IDs
      clk: samsung: exynos990: Add DPU_BUS and CMUREF mux/div and update CLKS_NR_TOP

 drivers/clk/samsung/clk-exynos990.c           | 80 ++++++++++++++++++++-------
 include/dt-bindings/clock/samsung,exynos990.h |  4 ++
 2 files changed, 63 insertions(+), 21 deletions(-)
---
base-commit: 39f90c1967215375f7d87b81d14b0f3ed6b40c29
change-id: 20250830-fix-cmu-top-0917aa84871b

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>

