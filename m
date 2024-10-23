Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C464174A;
	Wed, 23 Oct 2024 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729674104; cv=none; b=a1LrGrj9Mm9sbuq7lHWOFIMmVDFlCR94C4cagVZ0sQia7trU6OG8YCK/ofHDUEeKs3Jy6yvgjaZ1TQKurz+6xx/7MdntBlntCppoJL85SnPa2RpUuUr5MUz4apaMzFLNSSAMfnLVL1/XEp/3LbUzSux3aHmvn3N40zA3cyhAE2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729674104; c=relaxed/simple;
	bh=PPXT5Az1WsHT/KayziijpXvUrKfC/ssnM5aOBrrYdvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rowd3WWJ2+ZVwF43TVlZ8ms4hlYXiAjNjcJcmONfj58Oe/ycuNIMANaP/EPwmmZxJNcEJPkIAajGKGE4OziFQzHurQOt78RSIPQ04u1vhF+pH2YGZEd72EIo5d1hujbnvmc2hSeCTUr5XDKweVVvbeAI2bvkkkpp57Q4KPKrUzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDDO+O5l; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDDO+O5l"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9aa8895facso315861566b.2;
        Wed, 23 Oct 2024 02:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729674101; x=1730278901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eZZ8g03ccexKW0AVt0r8Py0OQvrq3R4oM4t3ytFYc5w=;
        b=DDDO+O5lxLx+15OXs/NJxoAgVWPYlACNiA7LJfatnCrASDV6xq0LZOqNTcTIlxhVxj
         rk0iSI3VxPfib2TIIbFKF30g0Y2ytXzaevEEVvC9tc+SyO16GtewGgl4qgeYqunKuRCl
         HRq3BOM+HMn8jgn7rX/R53S6n/2PbuMqhyojgBRueSUuc5zuF2bGIxczjUKtjzxMuQdR
         AzjNTAerc4SJQrbE+JdwG84fWAXC2nckaQyCIGa70N+yy7M+YkW25y7bXFoalFexrCoY
         xV4hwWvfIwt4blCQ2slxk4utLqPfeTWcN43EqV+JinVkLTInGst9QjLL5DyPI9zIptzU
         u/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729674101; x=1730278901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZZ8g03ccexKW0AVt0r8Py0OQvrq3R4oM4t3ytFYc5w=;
        b=BNI1bHcdfEnUalRKVC+O3DfdT2J4pcauOvjJu8Aif9bil1y09dNWRWRXC39P9hvOrX
         mzcHUWILBxkHhXdU1uxWmUTcIwzMU8Gc4i+klqnzlzmufuldH0BTBrdvrWwmK/yXhyCK
         8YunMsWzC4agTUMO8JGOrOKwCr3yz6TCfzQBtZuaugqIAPJqBagJ6yb0Yj4MrkC1BlE2
         FZyAVQ95Ma+WBz5W5yn3EXvsC+G/UGNuqzmq3hQj0YNlhR5HDSweOODhfHVmKPjBykY3
         0IizWY/Kkm6qywRdXCdbeeLAM5Qd84ChFE8KIRoUDtoGSfCmXBCQQu4fhuaX2Q31eEdP
         jQ1A==
X-Forwarded-Encrypted: i=1; AJvYcCV8w6mUkCTFu3obk2S2jQqlcEuGdOXrEKbHmrG7urNbICE4wYfkCI5+sCzrzkWPgMjgWr+gp5/T2OzR@vger.kernel.org, AJvYcCW5Iz0moOONfq63A01HZ88kQ3hKnWLDjJ7/CBXP/GcTE8n8DwN9i1vE5KCa836VK3FyPrZsUwzOjuFV@vger.kernel.org, AJvYcCX7bDRUMo5z4+CUDQZoOdxBTmlp2fMaaFSivLO+RW9FP9STRfYVRjQ7z19vc+tOhYk3zxuXWS2LGGPvNYkc@vger.kernel.org
X-Gm-Message-State: AOJu0YwmOgRh6qZHSFbucHMqWBrJRdwQuOpZOv68Zm1u4z/BJsuZkywe
	Cb4ZCoVgsc7zqE7IFvI88vxNxSfV32aSbBPKXWQSQBSA1OEnMZ6C
X-Google-Smtp-Source: AGHT+IFnhZOlq5eXPBtpu2Vh+a+dV/cdp/AY/xiaG+pd+XArp9A5rMI/bDwXWr5Li75rBOIWXMD7tA==
X-Received: by 2002:a17:907:3f0c:b0:a99:f656:2bd8 with SMTP id a640c23a62f3a-a9abf91cca8mr173667966b.42.1729674101140;
        Wed, 23 Oct 2024 02:01:41 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9159a23csm442767466b.205.2024.10.23.02.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:01:40 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3]  clk: samsung: Introduce Exynos8895 clock driver
Date: Wed, 23 Oct 2024 12:01:33 +0300
Message-ID: <20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds initial clock driver support for Exynos8895 SoC,
which allows clocking peripherals like MCT, serial buses, MMC, UFS and
PCIE. As platform support grows in the future, other blocks like APM
will be added.

Support for the following clock management unit blocks is implemented
in this patchset:
 - CMU_TOP
 - CMU_FSYS0/1
 - CMU_PERIC0/1
 - CMU_PERIS

Changes in v2:
 - Drop headers for CMU_CORE and CMU_G3D
 - Drop Sylwester and Tomasz from the dt-schema maintainers
 - Alphabetically order compatibles in dt-schema
 - Move the required block in dt-schema
 - Rename clock-names items to follow the one-word convention

Ivaylo Ivanov (3):
  dt-bindings: clock: Add Exynos8895 SoC
  clk: samsung: clk-pll: Add support for pll_{1051x,1052x}
  clk: samsung: Introduce Exynos8895 clock driver

 .../clock/samsung,exynos8895-clock.yaml       |  240 ++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos8895.c          | 2803 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |    2 +
 drivers/clk/samsung/clk-pll.h                 |    2 +
 .../dt-bindings/clock/samsung,exynos8895.h    |  453 +++
 6 files changed, 3501 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8895-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8895.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8895.h

-- 
2.43.0

