Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5362494ED
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jul 2025 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753261505; cv=none; b=F/TKg4EICg+o8rE/sWlxb6Q1f4l7CPm6n8bwMVJZp44N2mhshnabKy8F8IUBGnx84PHDrTVX9ChV93wE7LJpe58OsU/v4yCG8gbtTX/DAL2x2M2XBWuEKLIO+IfxNSY3LNpowGMPUbM+cvJy7X3JbcryvXlGZuvU8frsiCC5Vec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753261505; c=relaxed/simple;
	bh=jKxS63Re37hcFm6L5FR0wOlWb0i7sX+Y/k5+Rp76jT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TlFnyEA/2sPJOc2GmmwsJ4r7qIVfuS7vEfVAV1HoxiJGjq7dSt9NDSYQTP8dODYplbVsRy7cIXrE17t2FfF0QG9TQG05CPgvyUguTn+bxCHtsxdbYEaQNqEyabeVwGPOe7c7bI1cOqhGgspB9Yv1GqudhwIBKkvDr7pJreB269o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UFMOx8H1; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UFMOx8H1"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-606a269d440so1108216a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jul 2025 02:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753261502; x=1753866302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CoZCnvfP/rwehZqm543p76Ydsjj+4/YJqR0zDLYGaAE=;
        b=UFMOx8H19Rsg+CgmUAAmFzOKd2j9tmv6ECE2xMLR585XbhVoXzIBeQhOkUuXL1laB8
         cVbHq3hSkVT+Vusvbko4fH4427/vMQOZg4MElhG/yZP3TkKEym5CJXZNZ9iRQpwookT4
         EuvCUjwvKKZJrOw8ibTBt0RyKZ35s2aMl/Fvr2Rh63tRymOgdhg5ywaOhICcfhPk18Jc
         LMCEGgNYb4+zds+UJHdjiuJoEdO1un0vQbCGkEMgjQFrAqQPIIGoTSl5xX4CmNBwc5OQ
         pYnTji++M5eHtBFsfTgFixngOp50NRZLJBiEkwhCua1GBwHUUaoTSqn8V/RUCyw6/IiZ
         NFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753261502; x=1753866302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CoZCnvfP/rwehZqm543p76Ydsjj+4/YJqR0zDLYGaAE=;
        b=o14rOEOEmwkIkTlYGX2DvA3Q/QEidxpfwJbQ68O5TY7E0g73RWMYoE2cBVqqwrdv2Q
         Y//uoYqcIIe15MY/IUAGHxvssV5h/LM+k9jYVO0nBWGHc9nVBTNyZdDwelRtf1Et9eim
         74JskzVHAZ+JrGer5uichyIvrLUO88gRoowOwgoZ4gSmv8ov4rHwByBmNtqmanMU203X
         vRG6ChadibF1lITXhVr/vMjWVBhG6Er5500Hdy1TOFWNDyXBeiGC++I6+wQ0zUS00CDP
         18ZO/GvXqik1vVXKUD6MYypJsOa/uHzwopCxy8ndLVZAfq5xamRdaaWGiTTOijWZJDWR
         6XZw==
X-Forwarded-Encrypted: i=1; AJvYcCXh42PGHOZF4SD3TXMRtzkYpqHq3CyE5zPjHirMXkB+LurB91OBoS05kgFSWnkk/jzENm4YaiR1meB8fcWBQgFKkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycJ/u1I9SNV/3WyMOc3rGevzkLQJq1B/b3mdNHzcNFPUFFm6bX
	I7DsWcnOc5c9tViMbhKu4zfjKX9z20TgTmSYcz4CQSeZ6nNVmEu5UHdwmqApjpm/tBA=
X-Gm-Gg: ASbGncvbcIv2uIAiO5cSEzRQG9YMUkxy4G3thcpgCmYXckHlKmJDxIhb3djKgE2GRO4
	d2ycRh2eSHKP4jLZ9p9M/WCyA7jQiEv+3hbOX7Bi7lxNW0H8ffWF0ByLotnVMNiDtuFOnXSukZk
	NRhVlQI1TaHcZtqR8HekRnc5ZKY73h+Lh6fsqvgBwPrYHV6TBoIRTGk4HJi7QikjyBszGItizly
	jTfFfMz79FqOaDsXlSjFvaO3657Ht3GukIZq4TDr5yHnVmpC1DW/2TRm5nUQsDr1pTloOkcmD5a
	wsmW1eloLxlHEPc3uQ4+FEmkc4V8Gf5mk1ROt9rIob3EHmP4xICcYn0ynvRjdI94AmKIH0ti2F9
	Gavn7RYBL34+ns52cKBhYx34c2n8pmqcz
X-Google-Smtp-Source: AGHT+IEfzsllmY1ddx+Lz3lhSzSUYagxITt83zhZt/m63TVAuXGg4evDnAWl67hB8SYpI35/gQ1tAw==
X-Received: by 2002:a17:907:8688:b0:ae3:617a:c52 with SMTP id a640c23a62f3a-af2f64c62aamr72965566b.2.1753261502178;
        Wed, 23 Jul 2025 02:05:02 -0700 (PDT)
Received: from kuoka.. ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af22f6fa6afsm208165466b.120.2025.07.23.02.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 02:05:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] samsung: drivers for v6.17
Date: Wed, 23 Jul 2025 11:04:55 +0200
Message-ID: <20250723090455.25295-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=jKxS63Re37hcFm6L5FR0wOlWb0i7sX+Y/k5+Rp76jT4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBogKW3mDzwNTJovQ3V2taqJr+0T0EUFr4aTJQrU
 U2eCAEqgvCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaICltwAKCRDBN2bmhouD
 1yR5D/wLSF3mWxeCh6hr0nA8CzfZto/VRm7x52o6glrfAIZHQ/zaOZ1570ojQRpZeJP5mZm4qGY
 eCpgfc3Cl1f3osmJKLI+ojFPlK2gH/ipqWahqcUL3RsUoLEivfyXNMYgVXTlWkTORjB418lS8G4
 fC+/aTu3X6UgYmwLBP8r10DUaCbsZDfBDbr0mNCU1VMLKphSgTRHrJ7Fg8HVk8mXucjIsd0J/5t
 Wl9bVoa0hc/QJMAZO9hG2pK0KaAuIHgs/9GSO9HpcyHnlMKbMOvg09YptLZkXDUDs2zTlRF5wnB
 NQXTtkM/pqAfz3z9cWqPeRK4OkEILvtOIFeYAIO+qd8n3Pa3B7DyBhlf2r/xLCh6FOKtNtHp1dX
 tk1JND/+6NxXlw4Zt9WkiAj6vA4vu7Do4i1DEdR2dlB/C28jltww4CsTGu48nkO66/6iD1vCAA3
 ZMeQciN0yfxEl7fRNBiHs5JSXdSW8axGHEtdSU8PkD71n0nSR0Fwxf4RY1JSEk7vFdeFJlUUuio
 z03+FSDx3pT2g/B3sbq/trspGQa3YpomiGIBGJvvId9fUwkUa4CHy5DxEbDObIScg4zIs3oZ8W8
 GikDwiW3shZzRPhee2lB943Ur5FpLQDYG1LGPmjsUY7oMlNhTaPs2mEsEmIWjvC7ivChoKGwVrB R22rNCovyB27l2A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

Late pull with minor things.

Best regards,
Krzysztof


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.17

for you to fetch changes up to 687d974a218a719f7e729bef9c498ec36f18115e:

  dt-bindings: soc: samsung: exynos-sysreg: add hsi2 for ExynosAutov920 (2025-07-16 10:41:42 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v6.17

1. Google GS101: Minor improvement PMU binding.
2. ExynosAutov920: Add HSI2 system registers binding.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      dt-bindings: soc: samsung: exynos-pmu: Constrain google,pmu-intr-gen-syscon

Sowon Na (1):
      dt-bindings: soc: samsung: exynos-sysreg: add hsi2 for ExynosAutov920

 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml          | 3 +++
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 1 +
 2 files changed, 4 insertions(+)
