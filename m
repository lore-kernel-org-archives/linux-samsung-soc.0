Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268E9158525;
	Sat, 15 Feb 2025 11:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739620491; cv=none; b=s8ZFINKhFfdRxB6WH8y6quZAsWJposnhoJ3Af74/kd1z/o4bSnsY+bBS992hrelPfe6ABmKnDQU2rSNUWa/WLjVxMg2GDA3Sqqr6NiF9BkfMwdDtk+Ql+2bk9ORRpijxplYWGLldoaZZddaiNRz0gh6N9yTFsjMk2IAtwrqq2kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739620491; c=relaxed/simple;
	bh=7Zf3Ae5ZzFJVNk2BAuzXQ31GnCunARpZs92590RFAEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J0+48ZZX2FEyh6tCE7P028/qx9JDlrmyzDbHykJfeAabdMczASkMWkplOIVwZtF+/RVdMvd9sFFJ7Kxo5imxTKjC2cFcwVBKJdq9yFJ3oAMaAnxhaX2NNm6/ruf2x6G4c4dqFzqgzsYktkfLwwEo/VyR6NCg+BQr8MpOl2z4FnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBAvT6pd; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBAvT6pd"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f1e8efe82so3337540f8f.0;
        Sat, 15 Feb 2025 03:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739620488; x=1740225288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=is1pTYO6hsOD/Q0FGbUTVInc/xQnTq9eedN5nnjkq4M=;
        b=SBAvT6pdMWbWhHPEnRNs/3rWBMlVBPJX++oeSe/xH+0qZ3QwhyL4+Nuu5VmfuBSq6M
         qFujcbZL5EuC1zdq1kG8mzF6CTRYfbNIbhXHSOPRO89gxkwYl7dHsFb5WWl19jxK3R7g
         oi1I89fvghwQ1C3V6rILBhqdSfuKqmfiiSceuHtj9ouTj1VAJKKQm324zJQ/2vxlv+jy
         zJHTfYGb1Sg8HAUQeh03A4mO1oWsgJydtBTmqKhFsaNQTGF5d8glDNj66At9/wMsG3pf
         CY5k+o9g86YVI81Si7/8KC9CFiY86Oiw6cE02whc+cCxZIv995uNvPH+8XeR8OSBSdCX
         305g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739620488; x=1740225288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=is1pTYO6hsOD/Q0FGbUTVInc/xQnTq9eedN5nnjkq4M=;
        b=XW54Wy0cUCoczWPAEZrTga7fdBaT00oOfmy/DjYX4HW5k0L3UECrKbAyaV6xi76kTw
         30zdngp4wFnvt/K/s0RYF3CntutyJA7yGqePN24EB0xlDiwAx2nqfnZdPgSejj6k5Ads
         Ju0gGsPPPGobl5xjBW3Xi9R/VSy8OSED1ssEH5FAqEsqpvZ7SHah6pdobD4PZTwX648A
         kWoeXAuFTPiKyXKT/2RtgT6Ih/lIdJV31kJkDPhYxeYaaVnx+7I+6VOO6XuKWM1uu6re
         NToE0uZFvRKrAKQI2XzZIidq8PP/LyoDcmHk1VFeIYgj3+bEpSZpgHk1Es6Zu3N0jwKk
         X6GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr7qe68GgKYvMiPgaQbnKz+9EYZfP111/tRWvy/GTJvalVXXgZECwk2gC2grYAZ9qWDW9Jd+1xlC2+@vger.kernel.org, AJvYcCW86BRggcueO4ZJ2853FOA04gYS6FCp0Hxa/VtHoa22KtqdynbzRP/BxIdBtAxqhAfEWaE5XKEmcW/mQv65b4Z3FKw=@vger.kernel.org, AJvYcCWsiJnO7+e3OOCC7JIOten69QDJBLkXb8FiOYgh/YcJiNNDEBs/WdSs26gObGoaqI1wDebQzekXRVIC@vger.kernel.org, AJvYcCXw9fFmNPai9VujG8k9aTHgYIeWxQS9i+eVTrD600Nqw88/5nTSUdwFb8WMGagHjrFHHVgqgIDLF6oxKBGY@vger.kernel.org
X-Gm-Message-State: AOJu0YxLH5lRiSw2MpmZx2AqYJWp1Ng4O5LANMyjetCtUNm5EznF1SFe
	7QiRWT3bvTowaS7YzRGOafin6aU2rtXvLMBsJ9Jm607TNFvBiPIj
X-Gm-Gg: ASbGncu7g7Mn61rJXsBzVvop2PPhNrZYqCGi1DHUxAceBGMMUa6b6omh6mAG9VyzZLs
	7dqslzVnJjcHvcKZ0eLmDAd/DzZl4XOv9qxA8l91OHCJ4Q2BKtp9VDtzjSLNEPf4+qRsDJDev4x
	mpJiK+MZiJCttYC+Vh8zy/7VuJHpK+6LauodhCjama/T/yml58N3p4IpivnoVlw6OcBrtqv0uqD
	9CC9aNZ8wCp6phjGO8HIbZ5ygKm5ldL2talJj+tABZE6UCtUcy4lyEsC+2WeU6NLBF04Vu1SxH2
	hfcw+EA/EWMwf1wzV42Fg0LfVceH8IOd/nHehdEb3Za/JIjLpP3UXVOTVmKZqhzO9Os=
X-Google-Smtp-Source: AGHT+IH9I+kF4E4FBAJ0uc10UZJds1ZQ+kSU1H9nf3tIt5AgUxMSTM3lxPiTDuhkF2I5bPfPT8RVxg==
X-Received: by 2002:a5d:59a7:0:b0:38d:c087:98d5 with SMTP id ffacd0b85a97d-38f33f125d2mr3534739f8f.8.1739620488237;
        Sat, 15 Feb 2025 03:54:48 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617de5b6sm70029875e9.1.2025.02.15.03.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:54:47 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] clk: samsung: introduce Exynos2200 clock driver
Date: Sat, 15 Feb 2025 13:54:30 +0200
Message-ID: <20250215115433.161091-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset introduces clock driver support for Exynos 2200.

It's modelled to take advantage of hwacg (hardware auto-clock gating).
This means gates are not defined, so that hwacg takes care of the
gating, which leads to a smaller and simpler clock driver design.

Gate register definitions are left so that they're documented and
in case a gate needs to be forcefully left open in the future, we
won't have to define the register.

Best regards,
Ivaylo

Ivaylo Ivanov (3):
  dt-bindings: clock: add Exynos2200 SoC
  clk: samsung: clk-pll: add support for pll_4311
  clk: samsung: introduce Exynos2200 clock driver

 .../clock/samsung,exynos2200-clock.yaml       |  247 ++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos2200.c          | 3928 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |    1 +
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../dt-bindings/clock/samsung,exynos2200.h    |  431 ++
 6 files changed, 4609 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos2200-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos2200.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos2200.h

-- 
2.43.0

