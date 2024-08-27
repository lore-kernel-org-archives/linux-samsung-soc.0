Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4E81A08BC
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Aug 2024 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761007; cv=none; b=lvoYI2hJJ5yBUt+XHX4tJILYEfo2qHpo0GmyT7XviKC3YwV+7yVkW8Xd7GBr5ROkBSwEIaU65wClFpGeGWpB+RKJUubFjkV6KjDEUc4MWzVVB50QQcBHHC3Yb+KRvpHqznYaobh4C//c/9WU229KsKCmFvI+n0/ZNwfLTgj5YX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761007; c=relaxed/simple;
	bh=hstF5/sh5Y44tbVwg/VS7Ydbd2LlFd78AAQ6zy+kvSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0qVZBCCKwf/2uOAYdxhMwnA84mGRSC11AAUhhrmTzQCpeybHYqMhuYlNMMZ3P14EuAmeWLbWFtanieVQXf/P7gpt/9blQPOYcYLdPhBDJOVfH9G7aLH0m+CzFdPVw8xvjCK8xiWXRhAtXdRn8wUVmbHdcsp4Ce4O6c00vQVbNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zxAvnFYS; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zxAvnFYS"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4280772333eso7866715e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Aug 2024 05:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724761004; x=1725365804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnEbZFJ44c29HA1TxWo0cIEU8ZZqNT1LBIsiqX+Pjlo=;
        b=zxAvnFYSrLKX9zcezHkIuglv8qyDhVkn6ryKWCeF80JOgEUhgtQhuhDZZ4gNkoBQiy
         UUWzo9lKxplj8vxRX0F4ufbBdtSIW5qboFJ0FjPx7wd4oEGMHiqrSfywm7KyM+zE/1n1
         fQhSIcdL4akF36H2B+3PcVX86cunJ2PqA3Yg6Tnvn1DCud6VGSLBwmdasTxT0PRJcIgc
         VQlvREHcGd2V1etidLpNszHx1ukPkd7f6YPseG8tOObXB3fq9wVpWjdHLnV2rwVpcABO
         YZHNG3ufczOi51VFxoiSnLzuGqdxIstWzKWAsMKe7ZuzvyDjcbz6evza7FfyuOPH9aLp
         O/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724761004; x=1725365804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnEbZFJ44c29HA1TxWo0cIEU8ZZqNT1LBIsiqX+Pjlo=;
        b=QmzTie4J3qr54J7NGQPuTLfNYaDsidp78H0BS8wxkUNwH0CFEUmgggYF8P+gzAkaO8
         p3CrIS4mx0JnJKaFOALVJJ+Ndu6RLD8OIPGv5o152ZfmOnPyTSacac47/CwUcgegEPjN
         Z7hiSpox4UY8yjwk4GPpNktUX1ibdfF4juxE9xhSq4lDjMto7+2L2ICaHH/im8WQ7cij
         WyGVZV4vTDCwdIJxBAcWjvapvPaARF6Q7Z5pBHWgiay6s7flFa7wCXFYDW3zavNxKNdt
         xQi5pHl/Y5glUiwbcoZ6AbmrMNaFIrHVn1LTGXnV8oceuA5k0aIfXVgTtWbIp5eDV+k7
         OHPg==
X-Forwarded-Encrypted: i=1; AJvYcCWoRWdWCz/ixcA504tTOxys4BAgUoQHHODte9N6K4lfrQMX23WG5BaVqm5lBd1mcKJHRsGV/K8RenqzbRkZl1SmaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4uaEgWPzK7jdNW0nxCd6nZcCxYk1Xa/rxGvgIKCfZpPyRC7yS
	PI1BmPEJDW8ODBUH/3nkmj1GXoEyfX+RR95giJtk93+HHBIGVUjaYecXQwqg3sA=
X-Google-Smtp-Source: AGHT+IF4No28LsKRWaN0NTlD6PDhR1XvnFF1olqMjPVqMhBmdTAToVMw4YfhoMTTHeg+gG+PbElOjQ==
X-Received: by 2002:a05:600c:5118:b0:425:6dfa:c005 with SMTP id 5b1f17b1804b1-42acc8dca6dmr58251725e9.2.1724761004329;
        Tue, 27 Aug 2024 05:16:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730815b7e3sm12998658f8f.53.2024.08.27.05.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 05:16:43 -0700 (PDT)
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
Subject: [GIT PULL 2/3] arm64: dts: samsung: dt for v6.12
Date: Tue, 27 Aug 2024 14:16:34 +0200
Message-ID: <20240827121638.29707-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827121638.29707-1-krzysztof.kozlowski@linaro.org>
References: <20240827121638.29707-1-krzysztof.kozlowski@linaro.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.12

for you to fetch changes up to 4d06000979cda26e914552d486e5364248025fcd:

  arm64: dts: exynosautov920: add initial CMU clock nodes in ExynosAuto v920 (2024-08-23 09:20:52 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.12

1. Exynos7885: Correct amount of RAM on Samsung Galaxy A8.
2. ExynosAutov9: Add new DPUM clock controller and DPUM IOMMU (SysMMU).
3. ExynosAutov920: Add initial (incomplete) clock controllers: TOP and
   PERIC0 controllers.
4. Google GS101: Add reboot and poweroff support.
5. Add binding headers with clock IDs for several devices, used by the
   DTS.

----------------------------------------------------------------
David Virag (4):
      arm64: dts: exynos: exynos7885-jackpotlte: Correct RAM amount to 4GB
      dt-bindings: clock: exynos7885: Fix duplicated binding
      dt-bindings: clock: exynos7885: Add CMU_TOP PLL MUX indices
      dt-bindings: clock: exynos7885: Add indices for USB clocks

Krzysztof Kozlowski (2):
      Merge branch 'for-v6.12/clk-dt-bindings' into next/dt64
      Merge branch 'for-v6.12/clk-dt-bindings' into next/dt64

Kwanghoon Son (3):
      dt-bindings: clock: exynosautov9: add dpum clock
      arm64: dts: exynosautov9: add dpum clock DT nodes
      arm64: dts: exynosautov9: Add dpum SysMMU

Peter Griffin (1):
      arm64: dts: exynos: gs101: add syscon-poweroff and syscon-reboot nodes

Sam Protsenko (1):
      dt-bindings: clock: exynos850: Add TMU clock

Sunyeal Hong (2):
      dt-bindings: clock: add ExynosAuto v920 SoC CMU bindings
      arm64: dts: exynosautov920: add initial CMU clock nodes in ExynosAuto v920

 .../bindings/clock/samsung,exynosautov9-clock.yaml |  19 ++
 .../clock/samsung,exynosautov920-clock.yaml        | 162 +++++++++++++++++
 .../boot/dts/exynos/exynos7885-jackpotlte.dts      |   2 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  46 +++++
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  40 +++--
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  15 ++
 include/dt-bindings/clock/exynos7885.h             |  32 ++--
 include/dt-bindings/clock/exynos850.h              |   1 +
 include/dt-bindings/clock/samsung,exynosautov9.h   |  11 ++
 include/dt-bindings/clock/samsung,exynosautov920.h | 191 +++++++++++++++++++++
 10 files changed, 494 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h
