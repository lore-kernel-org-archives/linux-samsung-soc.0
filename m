Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36912417E0
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131039; cv=none; b=NDLidOgB20rugpTz6iHmfsgtVq/k/v+vCfpG7MQQsQULJbbfMhOuJS9J1+rosWGJ9tCEZ0vUzl45LgYXuO21CWl+if3dWZz7uZWT/DiGNVcNAMTRIfPylcDCaF7TZhyLNXZKIrxbHWqUlCIRTZzQBjPKUjcBfH4t8gsc9vRJ3TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131039; c=relaxed/simple;
	bh=S2iTrSKyId8Z4Fz+KFg97dcG4QI+SgeyYQ5rhg6W4Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rEqzJKQlCTPlye6s8jBXxASBLeVNiPcrrDxhizYxhmH+avh/sTds0QEPZXGtACMyWDq6FpfHyitFAGKlKGmh7ujWiWocn+fsTzJy6vwJJDwPviYqTBcCd7C1fomt0PYG26mrfe8qdGgUpoOOLBy2M3qP4ojtfRbzq7qTQdqVGWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i2EGmgYn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i2EGmgYn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442cd12d28cso1533015e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 03:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131036; x=1747735836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eT4RifiabCn3jNXGZ/1SUNp8XFTerXnwE9dw2ciCKO8=;
        b=i2EGmgYnTv3attlg4uA7zdfFhOXHjtJAJ8XYVdBc00hgLOdaXdoI2053lvr+GwV+Us
         ynCXe/xIuGqFesVdcgtrgC+/gyg5Ztu1T3GJGmI8wrzv2DHU9MyTR32J5TnFaqvH//Ae
         giHJhRCGu5ZvI1nbi/KyFDawgsZyr4CdRjAU6s6tuXWzMtYPr1HJNwsz23X7icbwNdgH
         piPTEBP4FuZdWUd4la3Jy98AZuQJmZ2ypLSV0e5lEikMZsI/+6+ph7tRU4f0kV6kYHm8
         q3X4+xfZae6wlhWTc4Xjon70R7HF6t+zEfqP1mTdobXqFO+HqnrJ3afpzzu9t0JP4d5h
         Xd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131036; x=1747735836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eT4RifiabCn3jNXGZ/1SUNp8XFTerXnwE9dw2ciCKO8=;
        b=sM6THiEW2deHQtJl4KIOidtP0L94LyWnDdZRH++gqqxwQJadACf4sjhzf4FkJgD4F9
         Bz94teGhFL4aIi53Xo5XNDqdJcJOBjqp8U1s5A80cHIMbzqIj/7k9PrdgdKqyF6Rib+z
         NHdC6BW9K5RuEnrkGp3NmK9x6xo2K1eBBXxtdHICzmBmNlE/XozrHhLxsXlZ9A+SjZ+7
         5CBLxUMxBTeG4zKhovL1NrQYcTLH1r5MJajCQY2NCVb6iDWEtX0L+i8w08BHNBD2Q/ZB
         wqGUz0xAi/eN7BoNCT9vBszLHHLAmaP+iEEq6tBaEARzZkMcLj00+Y1IIkbmoqgsPOfh
         RdCg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ6o3oNuOw0redct1tcWudcAkBcdWhpSm+n6xdSW7uGBC8QcGdsequjQRs7njHFxN2q0CmkmQbcVPeiPxGrstpuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFB6k9sAZPbTDM8qCAUSTNxYgFFquShoiGBxBOr+F7ZhvTNG01
	DVr+dP36XoF/+WWGBiWptm0+GC+DEXXPmAXqAr9cE4zqfkSLEoNR9KhTFLzb30I=
X-Gm-Gg: ASbGncvP00J8qdyhuwIMkm/hAZ0qs++K58ewAOnP9DfUD8b4QpEzdS3PUBP2mDZuOkk
	qTJCz7WGHGt+6c5N2p/vtK/mgQW4uSTRN2+I2EY7ai3gS5rCsj0+jWoWGVZO0weGlFXQFtH5YrV
	KJDj/j4MV7OGrZVjXQUfwbta66yR2ElL1+rBodssxCqTXYKtw1cJpV8tAtuAghDGtBFXzwGFnyq
	aE8Yf0/8qh2PbaaNv+wb5qNQJkxuM+EXYgT9jPzc8aMBsUJNqSzjbDf3qyYDjz88EFTOELq1Bss
	rZSShU2+vUt25ZjfwKImm/YC0Clo0xXfmeHP7p+gPSkz88tiscxd3+rGqPHn7+G+J01vbqaqANF
	grEUygWeD35gZge2iMnHPBKRYLnwaDZeNrhwaiqs=
X-Google-Smtp-Source: AGHT+IEMONG7o+2qqLec3J40u8cxE5Hikn1gleQY4dduRgG1LUtg8CN8da8I9rkzzSsfliL822Q/Vw==
X-Received: by 2002:a05:600c:4f43:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-442d6de79b0mr53581305e9.8.1747131036030;
        Tue, 13 May 2025 03:10:36 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm159683635e9.11.2025.05.13.03.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:10:35 -0700 (PDT)
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
Subject: [GIT PULL 1/4 fixes] samsung: drivers: fixes for v6.15
Date: Tue, 13 May 2025 12:10:22 +0200
Message-ID: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=S2iTrSKyId8Z4Fz+KFg97dcG4QI+SgeyYQ5rhg6W4Fk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxqPmFvw4YlLZILw8ztH+LBScalD7xKqIX+Ch
 i/m/UIVK92JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMajwAKCRDBN2bmhouD
 1/eqD/9MbCSa5fsTfL4M6Msdl6XVHg9QIaMp8B66liyP+bBooJn55w6uXhxdlwHF9ySGKC641F8
 0Q1O0VRsta3YWmVqQswD9tO22ySzkEyzl0q4aKLWMuasrAHJcQcVIdgOQC0yNNJip17k1LvXj3Z
 UHxJULw7Td0SC9sdIVsYgteRyMVemT8dZK5zpNGPLwTN5oKFrDtiJgyDI24sFknyq745ownKXvX
 WZ2iukaUZ8tQIe2JiOy63Sc4OHe3Aqca4auvoJtF3k3o3+u0kO0wN4DeyNubrYXKjm2zgCTLP6F
 l0CyTXp6qLXSXc8FhOwM0TLdrJvfyYDSGsqI1FnXyGJ+xlZOKkZQ6WOKILmPVA4DqSbvIpPpXFZ
 PDq9RJBQt9ryi5c2neECV2UWcAEhvfuWf/A1M7g6MyKofT8qf9bWbAyCBDV1qlqWRm1HbWQmOF/
 IeEgAn4K3cl0l4xRZ9FuxhRxTk9peYXqenF/s+o4vnGHsewyHM8EAKzRbWejkywbwTHsE2Wj7s5
 qUHiYm79dBT3JNWbYJA3c71y65aW96Uz7nH/T33/sKRbmHDAnaFxvwzcOUl/y1ZDntKGKW+Wl6E
 E1u3eXEFPjrr1v+0gRTvgG1vGf8uFKkN+fZM9uBSQezJZCkwjVxr+Gv3ly/VRKhcIvnUjtLBrBK A/ZSg49r/gysgUA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

Please pull for current cycle. Both commits fix issues introduced in this merge
window.

Best regards,
Krzysztof


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-6.15

for you to fetch changes up to dd303e021996a0e43963d852af8a3277e6f5ed88:

  soc: samsung: usi: prevent wrong bits inversion during unconfiguring (2025-04-14 08:51:18 +0200)

----------------------------------------------------------------
Samsung SoC driver fixes for v6.15

1. Exynos ACPM driver (used on Google GS101): Fix timeout due to missing
   responses from the firmware part.

2. Samsung USI (serial engines) driver: Correct ineffective
   unconfiguring of the interface during probe removal.

----------------------------------------------------------------
Ivaylo Ivanov (1):
      soc: samsung: usi: prevent wrong bits inversion during unconfiguring

Tudor Ambarus (1):
      firmware: exynos-acpm: check saved RX before bailing out on empty RX queue

 drivers/firmware/samsung/exynos-acpm.c | 44 +++++++++++++++++++++++-----------
 drivers/soc/samsung/exynos-usi.c       |  2 +-
 2 files changed, 31 insertions(+), 15 deletions(-)
