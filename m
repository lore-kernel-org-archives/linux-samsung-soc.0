Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECC421FF3C
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Jul 2025 19:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088533; cv=none; b=sJklOwq/MEoFJNBALz84qECzhOlLOhzPycWL9xE2Qa+VfsWNuqu3ib195zBPY7BJ5cJl+i5NNPEcaA6soqiESK4GS00y2wk6Cc2WkIqoyT28be34pXLZDKtcY1cS2hIl+VaO7dGZNS1c1wRipwWlWZwtUgRCgnKvwpHjj9s66Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088533; c=relaxed/simple;
	bh=Vg3SYFcxbZhfxzHwdzewVgAiginzpLipvsLFtGoX06g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AncCl4iP4aw60hVSgrIuvRFuhvW8+tZ6fPR7sJN84HvZHYdsbRiSFs9SjC5Op4qzJbwqnudqhP+Kt2uPZf+6WhvtAzZ8NVSAm2ucyAWg9PO0oGUAJ6wCfuBcGunmqHrga2zFNTNhn2SFQqQQrvfAYZnBwEZRviaXDPe/pUqfBj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GGMIXGsU; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GGMIXGsU"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso39923f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jul 2025 12:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752088530; x=1752693330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IOUI37vOvArNOMfbDlU1r5BFH53BMkpjGIGFBJa2WR4=;
        b=GGMIXGsUNhJI6oHDJ5ZgmWlONrkEqHZhIkZ9ufW/GC9LhM2yYdYEIoa4j+dns7QowV
         kva0huBNSQjEvnP7JO7zlDkEX03nK/XqmTU1QK/6VnsSzBjpttrByHE99s30Y+r2XYTc
         4oVXgkflaXx2cjZzquTu5s2K8dZ9DPt6johmdtLa06hNhjdLDVBqTBSUIvEmIXC72BNj
         9ufzeU5eBQKGg7j/q/+H6/QSh1JxbO6deJnrlc6DDC7ZOpmlOn764hhQUgWxyCvouGcX
         gvzTyBZ6YvYXXHNsYsWIbOS+IY8CfBL2V940Ez4G2lI1z9l1NZTagDV63uleFH19TIvB
         qqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752088530; x=1752693330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOUI37vOvArNOMfbDlU1r5BFH53BMkpjGIGFBJa2WR4=;
        b=SstwffkgNmqF0AVxuQ79Ld0Coqu3YQ7pIV1nIO3fqgo12vqty8Yv+JfhsAXAZlqP3H
         F6li2ngWNjrxz6sjnS5RWAFicO5FtbxTJu2MSt+94aU4KpHlJHijGjHpPA1gx+oZrXq1
         g9gzoOJZUTvlkvYuUQ4/r+LUBeJjPPoBdtgRopSwL+PeN1CeJ7J7k+yQR1Y/Z+3uqDts
         TjZEffdUVt5X2EInOWa1epfUQ8bb3xmlYAQN75NQJCo3eeJI4u3mN6hYqTrou0PwXBJL
         xBVCkSqaBaGtInSVLP6cGxinWfCHHsksiQNv9d8EEPV7egxfLZOBZoQHv1OJdLsAUdUT
         +fPA==
X-Forwarded-Encrypted: i=1; AJvYcCUPBSRZ5z1GLIMigXScrciqoJ9g6sDuh1q4C3z+gJbZy7u8BmOFtD5peA2p3TbebcieMj2LSi5t3PppEnyrZhRr8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTL+q9qKPgwXcQgp37ibAkRUS7WFI2kWvdG8C7jATzxr0w1VwO
	/KkV95sbDxwOJNTfd78oyrKaW67E8usEnPd4ht8/NyrAz12I9MIwVLztTI64tFpNTQU=
X-Gm-Gg: ASbGncstOR2kbCeqeJW6IGM/Lrfgi33dLZxznyWwyaB1DiiYYMe0h/m9xiNHdgsfmL9
	ZJhl11smfgq0++Jn6PbiJ7LsFrns6r9s6uRaUz4xJDAJN2C7eVKRROLZG8FjHpI0+UQmSkgpRSK
	zJPQ0oQuikfEAZX3MGlvZM+afGqv1Iu1M7eOTfEZpr3O0PsyvyUyG+G3QZOP8EMe1L/C2qF6dCB
	MAk8NmTNPdPhCbSQzFHmtPXKI/dkPsFxReDza15GQXtwKpWngIFEDcInTGhMW/7Puj5YMOk0YzF
	Xnz743vjEPwejFvoHsh3O7/NqhFOrLiOLSPhZih8U/4j36LzB2ya7Ko7gKNp0fupzGzCmn/z33Q
	=
X-Google-Smtp-Source: AGHT+IF5fQuSnWVC1+1FSPZh+mnfL3zRfmekTmST3Oxxmhd4JajNQiGduP450T3HuQ8hjxFtcBtDTA==
X-Received: by 2002:a05:6000:2888:b0:3a4:d4a0:1315 with SMTP id ffacd0b85a97d-3b5e44e107cmr1444727f8f.6.1752088529780;
        Wed, 09 Jul 2025 12:15:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285dc08sm17159588f8f.98.2025.07.09.12.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 12:15:29 -0700 (PDT)
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
Subject: [GIT PULL 1/3] arm64: defconfig: for v6.17
Date: Wed,  9 Jul 2025 21:15:20 +0200
Message-ID: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1262; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Vg3SYFcxbZhfxzHwdzewVgAiginzpLipvsLFtGoX06g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBobr/LrlRRiB7NlTXa7KpRiF8ppNyVSL6muQZyc
 U/nnYOJbbOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG6/ywAKCRDBN2bmhouD
 1631D/9+mUsRGRHWiIdpYnSIndM3CR/VSb5CpOedsp/WMUAxCfvyYm+cNPdqWe68MxqUBliQTxh
 1luK/jO2yNlAMjmvD96Q/UOLXSlS4g7NdpSePbKoaT3isLHiX8n972jvmX1pE684SlPD+rAl8Wt
 BflVWx59w+n0qWa66Hc+lMgBw58NXoJ2daiG2t2w50XLSdskrcF/Oadi1bwI5f00HEywZMPxKnj
 QkquXmlnBi6dyHdHfFGHu3c7k/Zjg9Qcy5F7ut+IOUC4wdJkHSsnAS5xgRC9nnjB5holPin6heD
 ozlaZ5iKoM25cHC3GxOJnmDjQBaRrMbb7vIdJkEVuQlr5HAFmKbPiZHusiVlJgVYMcu9nt4Axme
 fGeQkPXLKa6wxYWeS9QI+IrZEVm/Oai3bSurC/PZeyvoJu1w6pHZebKXR3FoPsLR0klnTkGBbL4
 zenZDZRqCT6Nq0kS8FAy0rAIyPykug3COaM4NCi7WsbJWpHXhM4hlrLXG5Rqtxo63beki5kfn3K
 yOoWXlfEQ6J9zcesgUhIyAFhgqvATrlJVJG318inhKHYbiR5YgeWikUbEeJGNlwgXDb6P2kITWk
 y2Hpg1qxObvXjVB6wKFdAVf++28TEW/v9h5UVrsnsxt4X5nEidEK+72Amfzl0J6zxKZ1N1/gLw+ ol9EG7e7CPuRbbg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-6.17

for you to fetch changes up to a7d7aebed4005b9c287f9bd9d22c273da63c9028:

  arm64: defconfig: enable Samsung PMIC over ACPM (2025-06-30 08:03:28 +0200)

----------------------------------------------------------------
Samsung SoC defconfig changes for v6.17

1. Multiple SoCs (including Samsung, Apple): switch sound to module from
   a built-in, because it is not necessary for booting.  Also drop
   redundant sound codec options.

2. Enable PMIC drivers for Google GS101 Pixel 6 phones: MAX77759 and
   Samsung PMIC over ACPM protocol.

----------------------------------------------------------------
André Draszik (2):
      arm64: defconfig: enable Maxim max77759 driver
      arm64: defconfig: enable Samsung PMIC over ACPM

Krzysztof Kozlowski (2):
      arm64: defconfig: Switch SOUND to module
      arm64: defconfig: Drop unneeded unselectable sound drivers

 arch/arm64/configs/defconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
