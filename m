Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BCB2AD1C;
	Sun, 23 Feb 2025 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740313850; cv=none; b=ja/f0yyL5vfQqs9JU90RJZBaQKm5tmdib4ZrJqTJ9bBxQHmjRb1O2bsfsRjro+1JXWigDKDHEPrlbrcEWHRVBjPP1OWtomKoZJ7fe2fN2009K9qhZE8cM+rpr01ueZBYFvLMg9OBN3YlRSnpry9xkZjpeMgOqMa6qAH1jzxSCos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740313850; c=relaxed/simple;
	bh=ikLoAe4mqVpFAFpnUnV85cz1XltN39PolBkyuiIc+Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sHLXaPGjLyf/aE8DSVgpWgvaGdRTE6T08Gpu2h4JN5rLqg+6eSVAaYS062tgaCLgZhJGy27HqazMV/d56Gj803BYlKDmCTElzXI4bsNgeRDEIEqZus53ImYtEEkwFoVFov91IYJhUODZt8OyGpgQTbfR+XYibbX664qjQnMYWyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gorM4qOW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gorM4qOW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso35271315e9.1;
        Sun, 23 Feb 2025 04:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313847; x=1740918647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eXqHi+96U8DE66IBSv5ozW+UKbtywue+9B2TMWS46o8=;
        b=gorM4qOWWnRjZi7/VJNzQfK4TuVNIgKZx4pJwdwSRnC6jSa402g05Tj6owZOroqJDF
         Mvtey8Z/jFacxb54Lu9Sid9YztKfyvVxCErCWvXGFDc+srfp0qLy27FL0aBtKwhqzk13
         F1cxhIP9czJVea8M06jqcO4tTF7h1nadvi6wnwSSAGNQU62apHpvOQLC8EWDypBRJDe/
         pJM9ZOgLD+LTaJQrT+qr+ba7aIYmJ9b2OCSXxCQM4KaZOyy6HGLDBabwsw8P352vxI7T
         o+bAUCAFNcFaYgSHsef/W9AZHKt9yHNTxs1R52K8krqy5nZUsP+LrAlaV2H6fFoGLk6j
         2I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313847; x=1740918647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXqHi+96U8DE66IBSv5ozW+UKbtywue+9B2TMWS46o8=;
        b=p5YCBhQzFyU79RL+G6zpOiiodyxuRZTfTNqAKuV/x9nbGv82HO+x4JsYbEM0JljrWF
         QohnxYuytxDMTgJToJpkoDaDBPH/cyeXQcbX7gcj2HtOIvtbDu35saZidz0e4cboNKir
         yN7uKZBhdBmiDK5r2qErHAbgPP1yF0TWA0ILlcQ+/1ZLJ7gKQWuc0fJGHOuCZrERZDMb
         OvXXaQI1DeT/ys9HXVfcn5HHM8BSWi+oCn0FdGCXVDxNsqte8DQLWItTxKRX1zR+w4GE
         RGiTxggIdStWCHu5GqRd+0eGmcTd8cvSF06d/Is1xWId04mcl9AJVcBEcq2hFH0E/qEz
         ANMA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ6ZWtDsVCLsvhxLTdxZQqju3QYMCZ6Rjh8M9wC9Jinl9ITi7EmCfb+6ddjFiTimx6wD9jVyKKJzqhe789@vger.kernel.org, AJvYcCWYT+vKulfkLfDmWIQ0NX1B26mmK685zfLQyA0Avb3XA9dhCHb7/Xy7v4caqdBvUiIwHK+GR76DxeG8@vger.kernel.org
X-Gm-Message-State: AOJu0YyWAK++axlcu76U0sqQ65+wC+8oDjihJ50q8FouwWJPQ4CexNbt
	6u6tUsZnVArRDn0rS9WW816SSr1b+fnpwBwC6qcmbkaKjajl24Ei
X-Gm-Gg: ASbGncuUVtoGYO3/PPh4mPW4W6lHnoFGDLiLR/j2SfKHDghFAUSg2e0g0hUKynTcDVW
	MJ2usi31cNg/F+qwxV7zK/xBGDGflOKKa74lnbb1fCfc6/OmPOF6ayBc1gR/BwSIlxebZqfEip1
	dWsg6EOjGaXNSGhcK/IOt8aplHQQbqlDZE3H7uIK///eUIPV5I36JuUyvGJIl5vD30PAO+mwm4n
	5LnSYGQ8UAwnYbunBEOP+PSsGgBjzY8p3H7Jz+bHO6H9z8DoTUKLgxc32k6M56UlXlvhAdz7VBN
	58iizlUesVrdIIC34lG9j9UX9rjBmCAF9sNF6ZyOcGLj4EIu949Ia43F8T49ciVsVDyOrMoXI+p
	ycQ==
X-Google-Smtp-Source: AGHT+IHG4/4YB1K+lr5+3mLAj1UHPyPnxgbTM9pHrmIXg39uKwLK46eTLD1PeNVsgfYMaSy2k340EA==
X-Received: by 2002:a05:600c:4f88:b0:439:96aa:e502 with SMTP id 5b1f17b1804b1-439ae1e6a2fmr90254375e9.12.1740313846813;
        Sun, 23 Feb 2025 04:30:46 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b030b2c8sm77061935e9.25.2025.02.23.04.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:30:46 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Sun, 23 Feb 2025 14:30:40 +0200
Message-ID: <20250223123044.725493-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds device tree files for Exynos 2200 and Samsung
Galaxy S22+.

Exynos 2200 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy S22
(r0s), S22+ (g0s), S22 Ultra (b0s) Add minimal support for that SoC,
including psci, pmu, chipid, architecture timer and mct, pinctrl,
clocks and usb.

The devices using this SoC suffer from an issue caused by the stock
Samsung bootloader, as it doesn't configure CNTFRQ_EL0. Hence it's
needed to hardcode the adequate frequency in the timer node,
otherwise the kernel panics.

Another issue is that cpu2 and cpu3 fail to come up consistently, which
leads to a hang later in the boot process. As A510 cores are clustered
by two, it makes sense for both of these cpus to fail if there is a
power issue. Disable them until the problem is figured out.

Samsung Galaxy S22+ (SM-S906B), codenamed g0s, is a mobile phone from
2022. It features 8GB RAM, 128/256GB UFS 3.1, Exynos 2200 SoC and a
1080x2340 Dynamic AMOLED display.

Further platform support will be added over time.

I expect [1], [2], [3], [4], [5], [6] to be merged before this patchset
because it relies on the aforementioned series for drivers and device
tree bindings.

[1] https://lore.kernel.org/all/20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com/
[2] https://lore.kernel.org/all/20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com/
[3] https://lore.kernel.org/all/20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com/
[4] https://lore.kernel.org/all/20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com/
[5] https://lore.kernel.org/all/20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com/
[6] https://lore.kernel.org/all/20250215123922.163630-1-ivo.ivanov.ivanov1@gmail.com/

Best regards,
Ivaylo

Changes in v2:
- mention the board codename in the first patch's commit message
- make all reg values hex in device trees
- reorder usb_con above usb_dwc3
- drop regulators for usb_con
- remodel usb_con_phy to take usb_hsphy phandle
- include MAINTAINERS patch in this patchset

Ivaylo Ivanov (4):
  dt-bindings: arm: samsung: document g0s board binding
  arm64: dts: exynos: add initial support for exynos2200 SoC
  arm64: dts: exynos: add initial support for Samsung Galaxy S22+
  MAINTAINERS: add entry for Samsung Exynos2200 SoC

 .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
 MAINTAINERS                                   |   12 +
 arch/arm64/boot/dts/exynos/Makefile           |    1 +
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts |  175 ++
 .../boot/dts/exynos/exynos2200-pinctrl.dtsi   | 1765 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos2200.dtsi    |  560 ++++++
 6 files changed, 2519 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi

-- 
2.43.0

