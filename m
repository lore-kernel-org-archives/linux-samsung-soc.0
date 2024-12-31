Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DD4196D90
	for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 13:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651736; cv=none; b=NgUSrDWBSUR7evfVS+vr0Ph9HK3JcEmuM69KBzrrb6Icrqo4TFsAYu6by8oX03/7VwZVwYj7JUjsRL5Q1WeQ++c2OiwV1iP/cy8fsNHvVrMAVlhrg2FbZflrWqXwoFvj6c79ODnqgP12wBDQMe9CMmHWdk7PaB+seAry4Xj/XzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651736; c=relaxed/simple;
	bh=5csFtTl3KMWd11R6aG8AxRTX32SaLbT1LLs+/Px17Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nx1wIZ2qQ7IMriNDwkLjOm+9wUnluMYx2Wv+E4rc/s24nD3CLkoenfIUWuvKQPs/SsL0pXowB+NF9ymt9QoYL1Mf0uLu/dyhpUGJ8u0idHfMTX5oeNssOHtUAeS2RxAUdwZfw7kKyMzcoP08g+SSLkDkekaVKLPA2rdIcTy6EOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MGFXxIM7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MGFXxIM7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43637977fa4so9637175e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 05:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651731; x=1736256531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=maCTQepsTUVpu3pdm5l+blLPz6LwOEt1QP+hRHzrnnQ=;
        b=MGFXxIM7D7xYeLBgyTQU8ieflvVC/zMfobeb8ZIAlM58a8iXKkautNEUc0MSqRFESN
         Nx6V5gFTi7GZAVDdc3GwTJYVUhN4JF/8V5NsApt6zpbw6LSe7o/8snbiITjgbSGTsdG6
         O/pMvcGEvbC9IawJm8j2CAC38BVBQk3rTBnALmbqXspsDQSvVmII2dCEqSkuERCD0+y0
         zAwwGGOdGCLWrSeTkphTyQ3FbBdO4E9ANZwfI6CYiLVWU68bfzWRIHJtfjj+thZ2Ncjg
         CE79ipvR74jzXb7ZvPa1TZzGUs8xo75uO+krS8W2kkk7l4alWSK5SqgmDL5oKczYcYzP
         DVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651731; x=1736256531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maCTQepsTUVpu3pdm5l+blLPz6LwOEt1QP+hRHzrnnQ=;
        b=wJUhQV5uTifmNaRPSTAf1lrjV0BCBT5R0UxytRnVHHUN/iqLjtgyKKcl29RRY6R966
         oDFuJ6nbBDYJPWY3hpwk2LmrfAFnTM+QXau0x40ASgOfEWXZlcOwp78iIWIWRDJIkrm+
         y+1p2oFjS7pPzs2u2b8olt/q948LK29gScfCsiorgI9SWFyI+fRHqig+q/RwK53/EM7X
         Jbi1tWAUIRa2f/vAqgMTChHFB9D4Z2y40U45WHJKgr4WNdoC4KKukcVlEHtapziRzOSd
         C3wassfqoF+0JNT/rGTIFgX8PDa7JqDGGQyk6322asRymYeBH/4R+8JWXxyBFcmnidbR
         orzg==
X-Forwarded-Encrypted: i=1; AJvYcCVnA4eIHc+Y2Hjo7bMBAWBIYJww2Eu+3XXHzSjtS1kNFkC64+buKvbLQzMq3l9fkgudgODkKbUBDYT8wuZewKke8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0umY79QeOvZIPJxgmXXsvyyRIv8xnK6ETb410WQ88zbhlPH5a
	PWSr6eWY1HoaiXxsgqVr3U8W1HRTl8zvWLNr6UtOQepMO3uXpRmCYKEwdG+GX2s=
X-Gm-Gg: ASbGncthI1xH8d3k8NcHQqMSDfTINjKmKsCi+73KF8GFPvQtfQdM3s7+VgjTTuPb5dh
	H1q3q+GJ5B6bIzB7fTAwqaC+jFm3uctfQYVlMpZpzUbQXVTFPw2fRxfvu1x7D4ENIOxVPHUHwqi
	+ZUbBvqHxb66JHhXExla6/bmRiO7yiDGnWTV3wSygJ4FeNrrF9UgHlVzLPnSjPP3lUGEBYFakyX
	XV1fP8YJHoqH3cwLr2Uw6MAkrOWmIjA8hD9ohAvqkrVevvN8sPehM2WtZT3FE0rwzmD1YY=
X-Google-Smtp-Source: AGHT+IFCgCggkijd8BCvvL0HdAA1DNcbL4lkGRKWlrZWXZ/2B/Du2w0fh9jPXbFcqVFRT4zZ1tGerQ==
X-Received: by 2002:a5d:6d0f:0:b0:385:ebbf:8736 with SMTP id ffacd0b85a97d-38a223f7484mr13078577f8f.9.1735651731380;
        Tue, 31 Dec 2024 05:28:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8334aasm32800220f8f.41.2024.12.31.05.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:28:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] arm64: dts: various for v6.14
Date: Tue, 31 Dec 2024 14:28:45 +0100
Message-ID: <20241231132847.135814-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Few cleanups for two platforms which were not picked up by maintainers.

Best regards,
Krzysztof


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.14

for you to fetch changes up to e1daed030b56049caa2d8cc040c824990374d941:

  arm64: dts: sprd: Fix battery-detect-gpios property (2024-12-06 09:42:08 +0100)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.14

1. Spreadtrum:
   - Correct few issues pointed out by DT schema around properties and
     node names.
   - Move fuel-gauge from DTSI to DTS, because it belongs to the board.
   - Use undeprecated properties, like battery-detect-gpios, already
     supported by Linux.

2. Uniphier: Use un-deprecated hp-det-gpios (no ABI impact expected).

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: dts: uniphier: Switch to hp-det-gpios

Stanislav Jakubek (6):
      arm64: dts: sprd: sp9860g-1h10: fix constant-charge-voltage-max-microvolt property
      arm64: dts: sprd: sp9860g-1h10: fix factory-internal-resistance-micro-ohms property
      arm64: dts: sprd: sc2731: move fuel-gauge monitored-battery to device DTS
      arm64: dts: sprd: sc9863a: fix in-ports property
      arm64: dts: sprd: sc9863a: reorder clocks, clock-names per bindings
      arm64: dts: sprd: Fix battery-detect-gpios property

 arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts |  2 +-
 arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts |  2 +-
 arch/arm64/boot/dts/sprd/sc2731.dtsi                   |  6 +++---
 arch/arm64/boot/dts/sprd/sc9863a.dtsi                  | 14 +++++++-------
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts              |  9 +++++++--
 5 files changed, 19 insertions(+), 14 deletions(-)
