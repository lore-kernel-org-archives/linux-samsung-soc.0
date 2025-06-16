Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1421F2741B6
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jun 2025 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067146; cv=none; b=udKiqmmoPcep1TEguBCRQgIFjy33BchHFlrMrt1CY9ca6UHdfkhmxNKfhVFJ5HL38qLfIkH9V1mWLVf7OsWnQ33kPVa8rTfpZUajjXW09BJuFFSliU4C+sS+q6DqSeZhwnW4q7iHwiGURFHsaYbBMNe4ej+zD0odc2KR6/gY0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067146; c=relaxed/simple;
	bh=zkQWBO37VN3NVGbjoJhPxoXCrT6Q3CmQrD7g+/aYgks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KftCRrhAgauJ6qb0KzV1ZPeSyoe/vcqLhzwZ+facEv6rgKC9t4tidkNFDzjKG9oQLMS59JzBwqWmMqUwK1+9vnABzW85SytiazcN6xWgT5frJem7hOGNgpftJHub1sxkek5/5OwTl9D5oWWETlJh2JisQYV+1JWUlXElY6uSUVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bco48ha3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bco48ha3"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso345690f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jun 2025 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750067143; x=1750671943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=stfq1sXWKmsRuu2Jonzta4jrsZNZk4m5C7fvRbIkSl4=;
        b=bco48ha3LteeKVsX713f03R3hndl9dyEatmE7AQstiTZ73Io/sYhfVISraYpFmNKZD
         0c4xEGbf1Sw0QrwbPuJf5ZLpDyHVM07oN/O/dcn42Rl0/5hYCjOzLBHRu1/w2gL85ARv
         EKdNUzsL7MNydBFm6LzYMqU4sC9LTBDfcCelhdNjeVVlv5/dKEURFosoz/ENfR0fcmFR
         Q760fHhokicx90+XYm/wYwqdPYzL3JyUyd9VT1HQtYEy03HfG/B8wtP1lyV2i1sqmjcm
         WN70d7c1x8DTAKAFL9WQwTglh+uKX53WO/GjdMpcT3+znYdc6rjDQOmS/H5brbLHyA8O
         1Y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067143; x=1750671943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stfq1sXWKmsRuu2Jonzta4jrsZNZk4m5C7fvRbIkSl4=;
        b=S2hZNeyq09BiPoprGSpFg7hqrj6zpUvl5ihe7XsllfpM4rFmqW7DJFNyCoV/7ohDeR
         PMl8tY+QBMJbZlGpJMSCSk9f7enNh6yhV7F5dGj9b3IPqWEx3iybgy3k8xa55aVPdeCP
         FZ7k2SUCmF7Op3QACgpOnpA654TpWMW1chYXgs3UdtYlFuGEhujuHcY8tSB6LyHpUQTM
         z21veJSYTE3CYYhtmf2+yMltxYKurS3Yhi/woC15hbZEt83iFJF/kU4C3Fzpg9PCDpob
         l4pA6bnhw4YdaWnL6Le1SlyuAozqxaHVsowFxeEH7yn+oGPkWIADts22rcHFIRSd3XzV
         fFpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOdq19y+Sx/k7585FpVzwW+4z/zwJtO/bF5Q/KyY4ZmxOaEm3dSEm7D/nwCwsfDATDOcRFhMnhNqI44CZK/6axKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwItkGiqw3ikJ3/X1zkh26Z6ycWfyGrgzs24uS4ystsCU7ZmtVT
	H9fFKUIeykChTWyeOPRtlPNr5kMd68ssChZYJR+cxdfMi16X9fkmsSFtMf9zMvtqU3A=
X-Gm-Gg: ASbGnctkfxmbJa2e1w6OLvQfAntGrrKFQXDJKAmTNg8rfl+AhFb4QoA5MPi+g45qqr+
	Zfy5CQrjdttoPAwThxdVT030s3FahT7K0D4oadWYZnvt/OUuxOS4JiB8tyOPype7wiQen6BWPqJ
	AezdLHw+8mTEBwLoaFIGU2ulep8LQYX4KABVHbK/LcJ/HEcw/IummllP3rV7vX7FMBS3pCsFMRN
	A7m9uddiQ8H+9uq2ELSS7VSG/0oqyBLzPT+/q91A13xHVE36w7KVFEGtRsWXNjfX3kvX67Zq3Tp
	7CXc7/Qmevcegmv/XnABndvkuD2/Cwe5cpkyA8jdeMPR6raUtGDAtdwxEOsTcxRL6ktCTMxQIQ=
	=
X-Google-Smtp-Source: AGHT+IFmhUzV2REZ+armXUuBCrTN/HZvKEo4jmpES0++U9AIxkv7x67178KFZZA0J/Ne420xjaKjFg==
X-Received: by 2002:a05:6000:2087:b0:3a4:e0e1:8dbd with SMTP id ffacd0b85a97d-3a572e7a579mr2511491f8f.11.1750067143332;
        Mon, 16 Jun 2025 02:45:43 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a67361sm10711943f8f.30.2025.06.16.02.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:45:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	andersson@kernel.org,
	konradybcio@kernel.org
Subject: [GIT PULL fixes] ARM: samsung: soc fixes for v6.16
Date: Mon, 16 Jun 2025 11:45:39 +0200
Message-ID: <20250616094538.33256-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=zkQWBO37VN3NVGbjoJhPxoXCrT6Q3CmQrD7g+/aYgks=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoT+fCBAboPqnDdMQ1PbbW1abt+tp9PiIs4J8uF
 Zr8YV5NFt+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaE/nwgAKCRDBN2bmhouD
 1+wzD/9FB4y+oWO5csn0+pLRk1mm9Z+42W/TegH2R2wag3jd3cYzP86Vv4/BBQbxHc4hsGxAAZ5
 RJsw5q0sX6vx3hDeyo1uZH1BmKQHEJASDC8WDPDPC3pYHQYhAxRYU617yNlp5UNNk6JJ9rC+25p
 ZXvz6nLdWoj8peI4annyXHOGVlPEZ53Mn/2PBlzdYdLvUgDMX6bUwli5SWfkibYRWq9FzXrZ8FP
 MNZtWXFU21u8GVRwWqONPdwtAkYCBVIuq+Ven2bdI7PCds9Qh04Nd5QIT/Nd+XRAV8IQBZjUd4z
 xsdRNotZyXzhceSmHfMDHx5jFJvSRz9OrXXYvaW1uXHD7bi+b0h+xai9SkzSyHsMzRL0FX2+hB3
 MA/GXCreM+h2UXk0QhYRP4oQTQHrJ/ZF1PxAhrHw7+7H8lgOnevjGTQ0SF1fpVS2Ve9x1XmKcKd
 B8dODZghP92kNu7iATg0RlDsXFilqRJ9fsekxbzPbmqriNAWrQ6Ozc2sHyDPTc1kNJ881pJsHRn
 DTkh3it/D6s8jI9+0Njc6Yl8YEK22YfjkiY5LGPe0+k/i6XgGxbMBQPkgpOD9OZsttb/J0TtHLc
 KwAdUydr1wsCOlqvU3YluXNrJddgEq6JPnGl0er01MlMYa6C+e/F6GjLgjO1EEas12HlvlYxHV4 fpTfFw2FA9IP2GA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

Fixes for issues introduced in this merge window.

The defconfig change affects Qualcomm SoC, but the originating commit came from
Samsung Soc tree and it was not yet picked up by Bjorn, thus I am sending it.

Best regards,
Krzysztof


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-6.16

for you to fetch changes up to 8d2c2fa2209e83d0eb10f7330d8a0bbdc1df32ff:

  firmware: exynos-acpm: fix timeouts on xfers handling (2025-06-10 10:20:16 +0200)

----------------------------------------------------------------
Samsung SoC fixes for v6.16

1. Correct CONFIG option in arm64 defconfig enabling the Qualcomm SoC
   SNPS EUSB2 phy driver, because Kconfig entry was renamed when
   changing the driver to a common one, shared with Samsung SoC, thus
   defconfig lost that driver effectively.

2. Exynos ACPM: Fix timeouts happening with multiple requests.

----------------------------------------------------------------
Casey Connolly (1):
      arm64: defconfig: update renamed PHY_SNPS_EUSB2

Tudor Ambarus (1):
      firmware: exynos-acpm: fix timeouts on xfers handling

 arch/arm64/configs/defconfig           |  2 +-
 drivers/firmware/samsung/exynos-acpm.c | 27 ++++++++++-----------------
 2 files changed, 11 insertions(+), 18 deletions(-)
