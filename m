Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B932524E4A4;
	Fri, 25 Apr 2025 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587666; cv=none; b=alqfKVJK1AJmJ856IQagOljzXZgB3dhBX32OQD1LGSyHOi8mJmYv6n53dXsgzUtz78w7fYLn0GgLDzjYrTg/Szu1zq9yVr4mg4rvJAcPjyjvJmRTcCaOd+PvV80D+ZPpW4lGjzC4lLl3KIO1eodtXBn0FX/CCZRO55eENu6UDAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587666; c=relaxed/simple;
	bh=tcdus/HuKbFweXtgaZf6ql01FyZg0WzxYXzccEMPaPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i89qgytlBPmOEZvb4lKOGZj5KeB1NILDZQJqxOk+/uwa0PD1zvDjlci+ajr74JPxeNzDdoEoSNuxTRV9DJ+/VseNv/apZWJB3L6kzHijpeZW1Da0s/XyJqO7P+UeWmOnYR0BH5MEe3f9QQwpbbKe9V48G6anlx7nWafXr1y54YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMc3OQ4f; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMc3OQ4f"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2241053582dso34470945ad.1;
        Fri, 25 Apr 2025 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587663; x=1746192463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r2SD1OSUWdCldoQhvBnkDEM/QjZ2T8xhHE0qihkTzOs=;
        b=fMc3OQ4fEVfxXQYlNheDYDm1jDGlNNPpLEJitoRLlay0KSOTgDfkzvkDWXXsAQi+hP
         nwoBuMwMWsH3GRdeu/93iA+f3XS33Cr7S892WF26yl3338IZnHJKmnNfShc8FbCvmjFR
         tbwjF0wIdNYKjl/3du8V3t4PDqEdDMEdyzYfsDmmKK7/B1BkV6F5XLF+Ank7hjIHiR49
         DjfidiQ0Vo8m4O9TZqRBWnP1lNkMukmuOC/4ShLXxdhuhbK1g+VJ2VaJBgiXr8phOGbp
         5CLpqBCA4tWfTArhs+qbqt4tQnopJd0XQ+GUNglhZZ1PJ6V8OdM5e1FaucE5CmUT+3Q1
         1k9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587663; x=1746192463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2SD1OSUWdCldoQhvBnkDEM/QjZ2T8xhHE0qihkTzOs=;
        b=oOUsgaCp6fVkLKrC/IqXCrKVhlSFW3CYhaF2yXts9A7dz7vdZCGXgRf2zzZwfBp5iY
         OaLBxQ81Py7bk8fH4GHdwgDsSmRHG4HAINH7IJtkvX4TWUHhu8CRLVJDWAsTPncx7m+B
         KE3tV30ZJoBOtPXTU29kKNTrzyn6F1lr1UShxd6ZDEfaM17g33GY7JiIa4KMywqcjbo8
         WOQxTYw5Tv1ouwv4DfW6erXA9Bl5OUlnHigQhMLTufkKIBvMm4Y2GcxuC1RiZ4vMRgwZ
         stdlCQ28QQNtqvBevWAHctzJseGW1ayqYBj8atJ3dIc8MDyd1e7kLKBtdT6CYMzNGu0x
         oIJA==
X-Forwarded-Encrypted: i=1; AJvYcCUCujKYeeMO5WHJtfJ/7B2az/Vjw8duCfYhizQeChCw13ReVoXCi5BhCQ9WdwUTBf/dW0MLPN28lftf@vger.kernel.org, AJvYcCUNEf8HLiVq96y5C7cYchARYwzMrSJfrCkd/e5aj7EPTaiWF2f29zH+sfLCrsBbPXLX/mFO/8gODdviRRAqwJaC7A4=@vger.kernel.org, AJvYcCUz98nX/O0ItxzaBj+bGexgI0TK/7coZqzCph8ca/b4bcyJO7pnFRasoNPgmAyF6WSGFLyBnCer7C88@vger.kernel.org, AJvYcCWKNYLKqfDeHSfivioxGh60TNZ2TkNOd8FN7X/jf/tSuzLCm81npXwqDYmKwxd/pHgepeDdRsP8zutqvfyL@vger.kernel.org
X-Gm-Message-State: AOJu0YwkA0rBf1Xb1jRi5nw/Elg9EzwcA7qgRZjeRhsxnLaEClJCC9x0
	nKW9xt+TWi+VpXJw71CT6q6nSsun7yd/NK2aPtTBXr5MwztMdx77
X-Gm-Gg: ASbGnct9vxDu51aQI/eIj7pxs0oEEYqcbjOd4y2X5fYako/YyBecJlqCeAdH4Gsm7jN
	1yqBDUWssHxsLX6wB7YIWJGEd+Vs5++bG/9yxjPy6tHadfYpxcSLrYZBqmg6XQpjACVCf07VmEP
	0nu4qHO+P/jqq0ng85x5f3hxC2WLDfMEzraiflXTObo3d0s0g6ycJez997RWhVpL8SWWtY9v4Ja
	BbaP7kZPw38GNPJ2r/UVgdslu+thIllowvJHQbsY68nNTauhco60LrGtCUVu0OzUIZUC4ilvGJX
	aVMSZ2g2MRiY+fXD1smGoXrAYnT/2e5twye5tGLywwJYCyGnz1EsiQ==
X-Google-Smtp-Source: AGHT+IGUB9p8QXy80D1gjG9EUjUhadcx0Mg+hVe8ZgGUVZ0uSDDJqvE79n62bP2uhHNnrtRUSn2xgA==
X-Received: by 2002:a17:90b:3d45:b0:309:f53c:b0a0 with SMTP id 98e67ed59e1d1-309f7e6e981mr3905427a91.24.1745587662858;
        Fri, 25 Apr 2025 06:27:42 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:27:42 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org (open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 00/10] Add rtc and suspend to ram for Maxim MAX77686 PMIC
Date: Fri, 25 Apr 2025 18:56:20 +0530
Message-ID: <20250425132727.5160-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Maxim MAX77686 family of PMICs supports RTC crystal clocks.
Device tree bindings have been added to enable this feature across all
devices.

Add information which regulators can be disabled during system suspend.

Regulators which can be turned off during system suspend:
        -LDOn   :       2, 6-8, 10-12, 14-16,
        -BUCKn  :       1-4.
Use standard regulator bindings for it ('regulator-off-in-suspend').

Tested on Exynos4412 Odroid U3.

Previous version
v1: https://lore.kernel.org/all/20181204194025.2719-1-linux.amoon@gmail.com/

Thanks
-Anand

Anand Moon (10):
  dt-bindings: clock: Add RTC clock binding for Maxim MAX77686
  ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for
    Exynos4412 Odroid
  ARM: dts: exynos: Add proper regulator states for suspend-to-mem for
    Exynos4412 Odroid
  ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for
    Exynos4412 Midas
  ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for
    Exynos4412 p4note
  ARM: dts: exynos: Update proper regulator states for suspend-to-mem
    for Exynos4412 p4node
  ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for
    Exynos5250 smdk5250
  ARM: dts: exynos: Add proper regulator states for suspend-to-mem for
    Exyno5250 smdk5250
  ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for
    Exynos5250 snow
  ARM: dts: exynos: Add proper regulator states for suspend-to-mem for
    Exynos5250 snow

 .../bindings/clock/maxim,max77686.yaml        | 48 ++++++++++++++
 .../boot/dts/samsung/exynos4412-midas.dtsi    |  7 +++
 .../dts/samsung/exynos4412-odroid-common.dtsi | 63 +++++++++++++++++++
 .../boot/dts/samsung/exynos4412-p4note.dtsi   | 31 +++++----
 .../boot/dts/samsung/exynos5250-smdk5250.dts  | 63 +++++++++++++++++++
 .../dts/samsung/exynos5250-snow-common.dtsi   | 55 ++++++++++++++++
 6 files changed, 255 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/maxim,max77686.yaml


base-commit: 02ddfb981de88a2c15621115dd7be2431252c568
-- 
2.49.0

