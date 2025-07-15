Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2548B15B971
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2025 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752573863; cv=none; b=f31zd+fWKM9u4VA7j3QiSU58jSIkIoUk7v6vViG9LYvwZSIzRJEMVdF/JYiOPC9vHVt3atD5Hmb8ljdRsm43Qoat5GwRz8s/cKjGaCud+xlaFoq/sjfv1VjnLX2AQPh7yXuVz821ZiwC2abuzyk++s+vbJerYHRWlf1PAtWCo7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752573863; c=relaxed/simple;
	bh=SB5SCWzU4SrF0bpQDxGLNYlzODumqwqpchHlKL/3Y8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kgD1F7a4iha80fpkh+EwFS/We+CNBsUauDSqXMN60FGY/IHirscnDxnoRUprw4CwnJV7FUBtQi8NvsK2HNivjet9lXhT4FUeCZ5dR/Z/81TOgYAqCAJypv9e5KEYChZUEHLq9diytadTyScQTX+jN9q1hS6HAlslLArk+Ktjyyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ODKNC9Sy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ODKNC9Sy"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a528e301b0so297381f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2025 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752573860; x=1753178660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h3GwjKh4XQxSRfwQPxwqnuf4H24N1Uv5D1O1oOMjSyM=;
        b=ODKNC9Syvry0oOq7pYFH3Gro88yybGuhg2Jie6d38ZL/EmzVteEBvqJRoSkUqgonLq
         5GJdBXGpsF3xnyJez3cnDMwfE1qLMww0yn1bRdlxwzaYiZvv3HSWZCIbIIJd6Fr1W0n3
         w2JiCB5jNvLKzoFzE+sd3RTlCakGDY+5XY5DtC1t1rkTDdeNuPojOXtcZ2fTyCSqElV5
         GlRR361P7QQKvZRrW/c7zaa4ZeXAw+Uy1RnU4slpSNv8ySzlK7Jjxy/2cTM2su4WbfjI
         FGvg+P2J5dmZ9g3TPDqGEgeUW0Tc1u3dkmtvEW7a/6coX3bbIX9Ls9cl+weqg5Pi9sbc
         lvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752573860; x=1753178660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3GwjKh4XQxSRfwQPxwqnuf4H24N1Uv5D1O1oOMjSyM=;
        b=DmalZ+/PO8h/Tef3d8TgeH+RX9pIVCcPlfluUnZkWfJkw07aAKiDN0qp8QmG6fOeB8
         ZBVmeGqJmkgF07Rro+/mBg1Y8EocdO9FwckvU2ApPGcs2oOssaoYx0aMVR9ExblaWoA9
         X082e1tfEKdmKEJH9STHVkkKmNwHh5H5XXJ+xGUxBCIi/l9Ay3acasOLr1VwqruQKBCg
         c0fIwV4vr2zfCAtsBYePljzIHqF4F9qd/X+GxJrWZx1JA/CbgVHfTwIN3+ft/f1PQfC2
         kpUQ5dq2Eoe7J11ZJWma2areb7bVSDDoFGoJj0FRUzaJqZrZueE68m6gOhuItfRMPauC
         sqQw==
X-Forwarded-Encrypted: i=1; AJvYcCVnRjhiJN8rdn9A9xlETKnAIT/Fy2XZNh5L82XvS80V6Lu9xBHNwdwdIxPMuGRTb2fm7LYeT8Uih4cHA7e6wDwmmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXh3bRNGLBgI1FGdYgcuEFxWpoqQ6WtOHdFLRZLNaj804Ps2MQ
	Qhqf4s91n4WiAyh7RMMLqe7x5aXCzESYBZVJ9dZ+gjS20bF7fkzLD/trx5BV+RfK+Pot+gV91zw
	ivwMs
X-Gm-Gg: ASbGnctM2ZoArfrlcyVYpKN7qkNcrALJu1FVs65TkFkfa9d27fMQO+XDlOWPSS3tNnU
	YEtvYvIzCs7pV50Xn+b4o/Uv/cEZSIelW5sZu4oUJBXX7TKlrO3CTIg/paPiVpahGW2VAeZa15T
	3ssd+McweJZWh3HL7bbXnduErDmc4bTvanBfhxwi6dH76A9UBRl7Md5CyI/wIP21b36RFB1zrl6
	JO1cW+aLGTcipqDDP+lA6LV7/tfAvZU42gr8/g7TSbOh+OwxeuRR2S9tT4mefGT2bbyTVUG1bJh
	aRi6rTv5GiFFsy4y3k+l7qBkuR+Cu2KaTp5Iob/fC857EKgZPvgqdVofUq4RkLiyBmkJqZwNgap
	zk7bZJTUoyvYtp/vSZIVs3RXb6W4W0x23OcJaDTGn91GKVA==
X-Google-Smtp-Source: AGHT+IHMrjY0VOQQ9jAAOgpScWai9DyRMoY9ri1wzCPDLxklTJKGMPp+lNZbCBa7EyLMTB8MbldPmg==
X-Received: by 2002:a05:6000:22c4:b0:3a5:7991:fee with SMTP id ffacd0b85a97d-3b60b3affadmr360862f8f.14.1752573860331;
        Tue, 15 Jul 2025 03:04:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d571sm14964623f8f.57.2025.07.15.03.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 03:04:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.17
Date: Tue, 15 Jul 2025 12:04:15 +0200
Message-ID: <20250715100415.60487-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=SB5SCWzU4SrF0bpQDxGLNYlzODumqwqpchHlKL/3Y8I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBodiefBvfgeeH/sRvJWFZDCiNYk4oeYz1pS3qxy
 jayWCXCSCKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHYnnwAKCRDBN2bmhouD
 10t9D/wLdtc2naCJk+QxDqceFLLmw9n17tnaDNQLktCQYeD1Oj7BiPOYSnvKeu9IG72Ru6pTQom
 t0ivRHMXRkjNg71dTTq6hYzeNMwJw7aa9FLd5BmYivYmQ8v3LyLau7tVDwQp+mne+uKAwpI+DdA
 JaiOqgxoenmPLxUpOlHwwmTqqfeMoO+5ra9LsspbkIeXQrSZ/ZBnCz/OlCPFEVFmPUJ57vdJecC
 Ik7N5ll7va/s7Wze8FVj5nBAYVd3O4TrJyf1betn5N82xkdpYGpRTvzbjoBQNlco/7q/fJW73cb
 8GCl5Y9NWoG4yUJjYwytEc7waT6sil08JcnWdOVSVdq7Ekcfmy2Ior8ooXXMjuLxvyKglJh1CWZ
 YU+VVpYaQmqpgn1Z6Njq6M2t6Yc+u4no6sRCd1s2gCDTVBPmtacsN/uIwMBpbYYbrH7Pi/0OBQw
 NJ5ryZM8Jw3oC3iIZDqfCD0c/D3NHkIZgXstzEC6CohnbvnARNNLWKKqMnFwwjuhwrNjlQjcbW8
 g51fowHAe4Bw+t3NtQn5u3+3iYHJc4oTHet5S4T6K617H8KMtk5gyEDc7v8aJ4ShnEPwBbp77EY
 n5IN7ezkxsmMrWi/AwRiA+TxofirQlpx01/rk9cS/qdOc+dFIjZW86wT/GZkAr7RImesc3ptZ/p i2w0gdEkgVu03hA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Linus,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.17

for you to fetch changes up to 683d532dfc9657ab8aae25204f378352ed144646:

  pinctrl: samsung: Fix gs101 irq chip (2025-07-05 09:35:22 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.17

Add support for programming wake up for Google GS101 SoC pin
controllers, so the SoC can be properly woken up from low power states.

----------------------------------------------------------------
Peter Griffin (3):
      pinctrl: samsung: rename exynosautov920_retention_data to no_retention_data
      pinctrl: samsung: add support for gs101 wakeup mask programming
      pinctrl: samsung: Fix gs101 irq chip

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |   6 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 103 +++++++++++++++++++++----
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   4 +
 include/linux/soc/samsung/exynos-regs-pmu.h    |   1 +
 4 files changed, 98 insertions(+), 16 deletions(-)
