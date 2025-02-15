Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117CC1A3153;
	Sat, 15 Feb 2025 13:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739624710; cv=none; b=Bf9GIh3TEC8F8A3KJHlJcBci+vKLa2kgPZpClI3eYc8yUl/K2Ehw1PDDE0Z9g0kj7uCJid4DzjxyQhJwJi7RwN4j/em+YyGXi9lZ7Yv454t/f2EjsolHWZwn5zGsaibbFIg/i2U2rVuRMS/LIDzV+R3t8zEC73GQiOcvxL1UWUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739624710; c=relaxed/simple;
	bh=IjtCzPtCeaQsHDBfiIXllvRsHTsROB7p1mV5VsZTK/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BC6wh3/X+RuEBykSBLqROx88VUGpHC2MsbFM6cTFt8Ph7pQ9mIZRx7IOvZT/93CHi2nqVzJoW7el2weAEpRpOIAgdDZaFCJ50mEIszbjNA/lKXoUcBDoo24xDUI+QlhXoE3+bzWAyYTHw/vYs4IiI+W3TbXan+ekWfEZsQFfgzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDg4TRKm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDg4TRKm"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f325ddbc2so748011f8f.1;
        Sat, 15 Feb 2025 05:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739624707; x=1740229507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EnzWEyG0F/nkFAdJDRcXTNC91j8CDzx+Ml98DGY+G/I=;
        b=TDg4TRKmVpJTqUOtlH/DFke8qxOWtNYiUuy1c0sDVFwyQxiEn8fnS5rqsETv2wkBuz
         0YWFM/r5tXrquyv8CGlE3MynNMxNepzaDUhFKgk3d/nxgQ5B0nql0YwPDWn3axODpS4m
         aCuMVQrkKuSry5xVlQWCp20VFygXGiezxjPbGpIx8kpa8vt/8ESsgV2GBxyYuiTtupyk
         Hy29Sq7OkS3gF6AlHW/s2n7dbSIVrWR6a9UKhvejkKwDbJkHmjnQnZ1202pB6/sfJ6Lk
         NJ+O2uZl9GqHc5CfV7eodokX/qd7eJrUvkT2FAEE3L/gx5lRFBIWn05RDGwDxgzRg6aN
         eqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739624707; x=1740229507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnzWEyG0F/nkFAdJDRcXTNC91j8CDzx+Ml98DGY+G/I=;
        b=K4mzNpeHvtH4OHJ0tUQeBT1JAbClVxriH87ivv6vNYzqWuHjYO6QZQf/FnzCuAu0Je
         1EplpPLEhIxfsucV2Meq3XVNMMqAH4uITGLGXvjjFeQwOaoMM9tebafUaH2cmyF6O7sb
         YLxxkB7PpRglpRqpa4Ah/Gtyh3zJtU7fj2T08zfF0Hq6HIGgZfnmo3uckmiZI7k/uu1/
         mYlmElQXnSaImbb80nxVuH3DyoytqPCc7EhrGzuarH6Y7YsxfFo2X/WN75rlcAzSv5Km
         9uT3g3SJ+PPMrdr7jsSsiFqDEASdMtU71TAIvUo/iH6PIbMX5lLzlKhZ3NEwF+qsWyWD
         HKig==
X-Forwarded-Encrypted: i=1; AJvYcCU02e6GPRdLYXSeUp+18i+NwZ1QDByK4RxrIoGfZPyOibzi6zBmjGWcaFl3MMPKNywbxkcvMeidMA7o@vger.kernel.org, AJvYcCXaeWkCTH0s6jZ09fRlPYxxToQicYWtRdJvPNG0URixIFaKkFg76fqfdfZvpoFEzFcolOK7BTp/3LKu0D2x@vger.kernel.org
X-Gm-Message-State: AOJu0YyvnVmRpuf2bppRbz9vYGST3hKSeF8iod29hLapAqHpC72PQogz
	J74Y02KQob4ysv3qc18YF+jLFIe4pm5LJFGFs1P7PKoZ1AJhsbnw
X-Gm-Gg: ASbGncscwPpdyekh/9fFu8v79DUxu6Mp2vpBrEoYAp8J065+2kbB9ImOYmFe8xRPS5Z
	/uSfjWQhVd0WWTbvVroPqlv3qck8eqRnmTmOpDc408ntTQh3rkYASdGNt9y3ya/tRYj3IqPCISK
	S8OkK3F1v08G9yGQkBP8STDP8Di9E3BfhJBBb5UNghL1Rh+1dcToSs6e1e5iZEBh8PnMuMDu72A
	lagzUXFYU0bHJYxeT06JpczF7p00DTmJiXs4pasqXQ+xJ53RkTUAgschXp7QUPNyPHGpChLP3k+
	pXKLeX30kzZr+Y2mI0Ib/djLMGki6gotQkNERedOZ3+MbRCSKZSqzg/+NnAxbVVkTHU=
X-Google-Smtp-Source: AGHT+IGPH6nFSzgJGVGOdy5Vv5Ptqx1cOrQXhqFYvlTcihepkkW9W18HUSoDwHWBrrhWnva3n8h1ew==
X-Received: by 2002:adf:ed48:0:b0:38f:2a3e:870c with SMTP id ffacd0b85a97d-38f33f38891mr3726621f8f.16.1739624706983;
        Sat, 15 Feb 2025 05:05:06 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b412esm7091418f8f.1.2025.02.15.05.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 05:05:06 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Sat, 15 Feb 2025 15:04:57 +0200
Message-ID: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
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
[3] https://lore.kernel.org/all/20250215115433.161091-1-ivo.ivanov.ivanov1@gmail.com/
[4] https://lore.kernel.org/all/20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com/
[5] https://lore.kernel.org/all/20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com/
[6] https://lore.kernel.org/all/20250215123922.163630-1-ivo.ivanov.ivanov1@gmail.com/

Best regards,
Ivaylo

Ivaylo Ivanov (3):
  dt-bindings: arm: samsung: document g0s board binding
  arm64: dts: exynos: add initial support for exynos2200 SoC
  arm64: dts: exynos: add initial support for Samsung Galaxy S22+

 .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
 arch/arm64/boot/dts/exynos/Makefile           |    1 +
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts |  178 ++
 .../boot/dts/exynos/exynos2200-pinctrl.dtsi   | 1765 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos2200.dtsi    |  560 ++++++
 5 files changed, 2510 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi

-- 
2.43.0

