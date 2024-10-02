Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5908286A
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 20:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727900175; cv=none; b=U6jaLMOiGFJ9p2/u8t5RpGBUrWRUnzlvx4sLVZU+9NyOFqs9uSdhVpTQkJ5WqW4ffXrqic/GAJB5xtJ9fB582nrqK3Sh+KjtAFhRq4KAic2XDXA5SmUhBTsLRXnRsuvmOfyJeJd+YCoC4yHCcCZp87z/yAXA+ritw8OWWc597l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727900175; c=relaxed/simple;
	bh=sx3hF4SKRW9J0+Hapfp4C+o1lNWniAwqrM7MUiYK3nk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YfnKYgEUgJ8xTSR6S+EVHr/CFTER8jbcTlRMnXTdGlq5dMcwIbIp7MEDXjwpwVRPwHdbUTYZ0om9kCaxVe/PjVzx0KLLGBTIaPFU35tIshgVg2WEFjDPuR6ge7H+m63ioLtOcEgZLxkv5T/91f2y25HRLHY5OtSpIaELDtQ5dG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y88Q97yT; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y88Q97yT"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37cdac05af9so208953f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Oct 2024 13:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727900172; x=1728504972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2gY7cgnLDjYMtByivBu9ewLraOBL1gPfpCgKRNDFNVo=;
        b=y88Q97yTCYWD6YGrGHaHB9BKvdlHLy4bsw9SDSZbZnC2uPYAw3aSW8AJRCrPNsJ7at
         cjqkouAbdGoXz7EY6fGX+SXgdzrDbQJ+xDGAdBieLL77Uu2PKMFvZq5I6rPnOZrWHOfv
         UI3SBT+XFg+F2OYUavyuEVuzWCb3D8vUmfbkjVj5M2QHlXtk2BTIB9KS9Ktq7Ck5d07s
         h+IhJS4yO2PNzuF1sK3PK9cp3P8bRxrXg+H/1fmrAr++v0DCV226KNxx3WoQ74y+n2ae
         M5K3RKsv9ARFT0LPpMAEz3jDG+VfT1Z5EJ5uY58Z3BmpziHB1rv+i7QtWSw/m/gW3Cd6
         MF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727900172; x=1728504972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gY7cgnLDjYMtByivBu9ewLraOBL1gPfpCgKRNDFNVo=;
        b=OAJSuOPDoTaQAohrNyyBNzDApGLrd/cpw6kLNCSS61FgW1dLqnQG0d9jt/g5qouKkm
         UNB9Sw7bBgtCCLkz468WAS0R6vHF3d2qHgfIG7lnkxudbE/9QjvcN7f2aAlvVUxEQcYV
         +i94uY5qiUKlERCymrCFLW8NSb1GxxC91tnK8GQ9wj1mnEO063mde7dPZlJQr2Z6z16W
         IDU4runqHicQbnllJTKkDkND4nkmj71T5P3cL/0L/5bCj0ESfLyn8chEspNh1cMSUdWA
         zHkNIjelR8kHKhtxrDuc07sSHA0GooqokMivCUh77wEXYzvUyA0hoM4VkuZ7yt3uZxxX
         xIsA==
X-Forwarded-Encrypted: i=1; AJvYcCXFRwmxXsUzFi9YJP1yghjHSFNxOJnWsLy3oNi3OiTYwAifGU99tKPC7u8zhoUpall8gfBdKk2whB8sZW5DRKgLgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBRxawnRcuDd1uPxP6r72p6Ui7oP+aYe6LbBZZ85fo9ELc6P9h
	0HWuCATutMM22UQGVt4c7ptffeyZf0kStPkzlfsElDD/JGzOq/HwdVGu097jV1ytPw1JnRJBM68
	z
X-Google-Smtp-Source: AGHT+IGhYj/A27bQGsUEOm42j2NO+1J21Z92LR4K77UI/ry3eizF8aKxTBJVM0F6v5v89gUQbiJYYA==
X-Received: by 2002:a5d:4603:0:b0:374:c3cd:73de with SMTP id ffacd0b85a97d-37cfb9d4418mr3809189f8f.35.1727900171931;
        Wed, 02 Oct 2024 13:16:11 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.66.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d2e8sm14850600f8f.18.2024.10.02.13.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 13:16:11 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: vkoul@kernel.org,
	kishon@kernel.org,
	krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com
Cc: tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/3]  Add phy support for hibern8 enter & exit on gs101
Date: Wed,  2 Oct 2024 21:15:52 +0100
Message-ID: <20241002201555.3332138-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vinod,

This series adds two new phy modes to support UFS HIBERN8_ENTER and
HIBERN8_EXIT.

This is used for UFS phys that need to program specific values when entering
and exiting from ufs hibern8 state. Once such platform that needs to do this is
gs101 SoC found on Pixel 6.

phy-gs101-ufs is also updated to include these hibern8 enter/exit specific tuning
values.

Note: a separate series will be sent for ufs-exynos driver that makes use of
this new UFS phy functionality.

regards,

Peter

Peter Griffin (3):
  phy: Add UFS phy hibernate modes
  phy: samsung-ufs: add support for HIBERN8_ENTER and HIBERN8_EXIT
  phy: samsung: gs101-ufs: Add hibern8 enter and exit specific tuning
    values

 drivers/phy/samsung/phy-gs101-ufs.c   | 31 ++++++++++++++++++++++++---
 drivers/phy/samsung/phy-samsung-ufs.c | 18 ++++++++++++++--
 drivers/phy/samsung/phy-samsung-ufs.h |  2 ++
 include/linux/phy/phy.h               |  4 +++-
 4 files changed, 49 insertions(+), 6 deletions(-)

-- 
2.46.1.824.gd892dcdcdd-goog

