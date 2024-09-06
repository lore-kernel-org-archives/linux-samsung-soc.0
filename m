Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CED1D0140
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Sep 2024 14:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725631522; cv=none; b=AlG6ZHhvXJNisTGy1z5mZo882y0LmgSOB1ckmpIhXMuFun/4c38iGLTJHdtCvKA3Sr/hMq6zm/1Ovyr91sed1hZxasPWrAd8f7PP47+v4eMIlSU0SPz39lIx3B03IU4uA7qnu6jqwQ5NbgCB8fmgek0j+s9Ya44+C3JqA6ALltk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725631522; c=relaxed/simple;
	bh=INmpE9Xt6+2n5aTSRPZNuCInq4AObUwjZW5w3K2QuXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E8LNO/BnTejU+VuszwKlLdOd/8A+/UmINxfVShFyWVNfl+Xl4tMACduknQzRhNEv/Y6DeFIARnK04OgcfOwBkQ76L2KnDgiEORV6aoA6oz5COd9u+hPo6fdC88P6uRkAmFF6k5T6KvW9FSyaKap6FGwq3tS7zxtO9ednybrOes0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U61Qa0OM; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U61Qa0OM"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c245580f52so250297a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Sep 2024 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725631519; x=1726236319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0KtTAkDnPVtI+Xf63+eqBvZoy4RV22T/taS47u19/A=;
        b=U61Qa0OMWmfsWN8pJU7a80m1IGQ35QpW+gvbix67e8uEwrnqDM4yWVAb/lrgvN/LIK
         R7ceG/taTAyYcWBwbI3zkWDfmz3mlDpx90S11KcVAApfIqBYcXpS3Dxxavo+1x2oTNx8
         Am81IRnrKi5KQP+jXytAIMLwlIvLlx+2gr3M3nlsxZwuQDDyrxYW3t4hE8RGj61/EPZj
         6sFExM3Mc0oKY/epG5b7Vf057sjwbdnM8YNsV6uxCCKHRk0OSsfhf4qNPfsIeryPgxXA
         kELIuRUXOW2Ve4VhA767fRpXsQZEOwYuv8xSuK6NXiKfcZIeK7mTSxsShN1zcxmXhsdh
         1Iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725631519; x=1726236319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0KtTAkDnPVtI+Xf63+eqBvZoy4RV22T/taS47u19/A=;
        b=LHWUql/Q61vPNzN3kgOsgQGAkumAz8c6JruYiB7I1ZQfvewSsClUV0rKyLN862odWD
         q+FnWVi3u8huxcXn+gy/nzQOl5vN6WS1VZ24a3fiYMXIodskUf19DXjqzN4ePYmiLGCf
         kuulcFBeC907oz6JgDvRlYkeoK6bEXZpSkAMDObFMfH7ib17LTuNh2nHypUjgDhtG/b/
         P/fjOB7ZXZLrq236wxBwDFff03mfeZPXSqZR+c3HnhoshS8b/0qG84YGvmmezKsgrLJ0
         V24djWfI7NvbiXpId9zKlROyjo386POkyiDxItf3rz1SAk7Eqb2R0frinPenyISuF4d6
         8udw==
X-Forwarded-Encrypted: i=1; AJvYcCVJnTUmAD8k9UI83oxo91Cn/pITpR9KUKKml2P7mYGXmHQl+3joYNqEwsPmAfpSYIA+bNAyhJRn2tocLme5lF0AAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3phS2fXrrpFZFND8U25dXS7cigbZ+kJOvUziGPImvUNDfr76b
	KJo2nQ7Rganl59macX/CZuuOmCYejdI6zcyBL/2w6Z5bZEjcZF9MNNk9PJnNzfJAmDyJewfKB0o
	X
X-Google-Smtp-Source: AGHT+IH4jOU5C15cfCX8P2TTmcku2hXBGZeYp52ClIPdrcJIGyBSc1Si/kzrYhGwc89fJNBRbV5OjQ==
X-Received: by 2002:a17:907:da3:b0:a79:a1b2:1a5e with SMTP id a640c23a62f3a-a8a88909224mr102991566b.10.1725631517829;
        Fri, 06 Sep 2024 07:05:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a7e223498sm162319666b.196.2024.09.06.07.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:05:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] arm64: dts: minor improvements for v6.12
Date: Fri,  6 Sep 2024 16:05:11 +0200
Message-ID: <20240906140513.71307-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.12

for you to fetch changes up to a4b3f197bcd17ea81605f3121a459dece448e877:

  arm64: dts: sprd: move/add SPDX license to top of the file (2024-08-12 12:09:54 +0200)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.12

1. APM: correct node name to match bindings.
2. Spreadtrum: correct node names to match bindings, order properties to
   match DTS coding style and put SPDX identifier at top of the file as
   expected usually.

----------------------------------------------------------------
Marek Vasut (1):
      arm64: dts: apm: storm: Rename menetphy@3 to ethernet-phy@3

Stanislav Jakubek (3):
      arm64: dts: sprd: rename SDHCI and fuel gauge nodes to match bindings
      arm64: dts: sprd: reorder clock-names after clocks
      arm64: dts: sprd: move/add SPDX license to top of the file

 arch/arm64/boot/dts/apm/apm-storm.dtsi        |  2 +-
 arch/arm64/boot/dts/sprd/sc2731.dtsi          |  5 ++--
 arch/arm64/boot/dts/sprd/sc9836-openphone.dts |  3 +-
 arch/arm64/boot/dts/sprd/sc9836.dtsi          |  3 +-
 arch/arm64/boot/dts/sprd/sc9860.dtsi          |  3 +-
 arch/arm64/boot/dts/sprd/sc9863a.dtsi         |  8 ++---
 arch/arm64/boot/dts/sprd/sharkl64.dtsi        |  3 +-
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts     |  3 +-
 arch/arm64/boot/dts/sprd/ums512.dtsi          |  4 +--
 arch/arm64/boot/dts/sprd/whale2.dtsi          | 43 ++++++++++++++-------------
 10 files changed, 37 insertions(+), 40 deletions(-)
