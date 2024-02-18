Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759436BB4B
	for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Feb 2024 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708280510; cv=none; b=KZHJ7rTTnFAIeatIi5kdUUGAqlEPwjy/1MlBYcBjUjYele21AvJXj17yE722bKYM/kebU1Wg0F/pYPCXaO6fj+XBdFvwhttVOhcslQ2CQ94XNxRhXlpesMuOopeJQmsooXTSRsFywXvezEeGN4ziDVDyBK1LjSyEGkfziBpN+/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708280510; c=relaxed/simple;
	bh=hQBeupgLpMDdeU9/zRWMVh2cHsne/7nzl98ihzuTy0w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=b89jDxK9OPJTFgx96sD9vVnorZiApPoIM2ToVxz4s9SdYZOELCqgk6uhTUvCON008nbtxh05hDxAKmHSvA2wadSjaExYl+qCIsE4GKb2+UStLm7rafVr+DfOzVlTb7vVl9GsSJIISexXCgOrzg8EvNcEIe6KNuka9IWXD30M1EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GwBK8K15; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GwBK8K15"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33d509c5706so66187f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Feb 2024 10:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708280506; x=1708885306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJfZGgvEn4sXAQA9xUq6oU/7z2TY2Q42B8jeqcmrPMo=;
        b=GwBK8K15J6f2YQW7PkLypWhkj+YeRw9TU7B9UrWeICsbjIjtxBoLzFTQfGZvLi5Prl
         wMiB5PyH6ShWStL5t+7z4idZe0MYj2Gnbelkqkamp+iO1W+7O+IXuLVQFRwvnFlHt/MR
         9MS6tQMngwP67TEZRlv8MDnzQymCQupUXTsdSB4yIB5Oe0GvktbXH6ErEEmtKxp/skmA
         GFFXGnf52ABvsYTpdEujhMvM2uCJOW3K55Wyz+laSHZ/z6SJxGkpVBoD/9+1fhp4AhZY
         VfCyNQtaMdir25+XVGEpuFGBmmCW7SjWJXLPBKL4TnuSSa4GqguSkIJfuDgXN2Ur7jEU
         3fJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708280506; x=1708885306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJfZGgvEn4sXAQA9xUq6oU/7z2TY2Q42B8jeqcmrPMo=;
        b=H/HJRGUSFm59Etyk26zuYSZYzogoxC2SrmBYJLCTIeXun5aYqr9M2V3+tscT7GILlh
         1KhqtuRx/Lo7sCnaP0Ndga4ph1wcD/w10sJPS6MSdMckHyjjt2IWTpP7W7rOvSea5g2U
         eIJJPUxBRXVV7ZnH1DzULTNzuCVsqZJOTm4c7ZiIOXG1Cj3WRdXcUdK+kvkV/RoIuMo6
         tZx69Au5VMJ+QruAyRorbXusqvVnP4TiVZK3Z+OR1wpNClvVW2EYw73qT13soTfQJrkq
         GCWjQcfIIi0bV+p8zBXPscMOszsZ1jPMy1EIMf1WO4cf98fkPjrYnc/lvdGSWQt6+cm3
         Wt+w==
X-Forwarded-Encrypted: i=1; AJvYcCUx8z3rDes16MhRAtpPDS+jxaiQifIUADyyl/9bzGoBB2vYWIHoZdzDT5Zhi4g1vMo04QtlJI3qq/9fS3/bOmhyFAyv89/MaH2p4POAThsL8Bw=
X-Gm-Message-State: AOJu0YzsIxcoKwr1qj+u0U3kV9eHzf/p/CdVBYflanULNRRXUaH6VnL9
	9xvSYr6v3kApABq5fJkx4qosykhopKIFPHso++ASFZkDhnwQorUDT2vqvlF3i/I=
X-Google-Smtp-Source: AGHT+IHWstA3iuzTRuinVksImDMbVN9kjQ+AD7CMW4/fnnmrJ3dPGSb6Kk6Zp/IrLaM7ddA+WGbHeA==
X-Received: by 2002:a5d:50d2:0:b0:33d:5272:6a8f with SMTP id f18-20020a5d50d2000000b0033d52726a8fmr62048wrt.14.1708280505754;
        Sun, 18 Feb 2024 10:21:45 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id s3-20020a5d4ec3000000b0033ce06c303csm7867116wrv.40.2024.02.18.10.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 10:21:45 -0800 (PST)
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
Subject: [GIT PULL 1/4] samsung: drivers for v6.9
Date: Sun, 18 Feb 2024 19:21:38 +0100
Message-Id: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.9

for you to fetch changes up to 97d4b55111efd72926eb92cbd81c5ad8e6a7b3b1:

  MAINTAINERS: Remove Tomasz from Samsung clock and pinctrl entries (2024-02-07 16:35:26 +0100)

----------------------------------------------------------------
Samsung SoC driver changes for v6.9

1. Add bindings for Google GS101 I2C controller and SYSREG sycon block.
2. Remove Tomasz Figa from Samsung clock and pinctrl maintainer entries.

----------------------------------------------------------------
André Draszik (1):
      dt-bindings: samsung: exynos-sysreg: gs101-peric0/1 require a clock

Tomasz Figa (1):
      MAINTAINERS: Remove Tomasz from Samsung clock and pinctrl entries

Tudor Ambarus (1):
      dt-bindings: i2c: exynos5: add google,gs101-hsi2c compatible

 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml                  | 1 +
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
 MAINTAINERS                                                             | 2 --
 3 files changed, 3 insertions(+), 2 deletions(-)
