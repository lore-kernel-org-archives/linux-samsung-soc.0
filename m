Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4242F176FBB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 20:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718743533; cv=none; b=N4VJtATBOGN7/s4aLlN4K4A5PFJhtBF9gv3FZrWxZmtJfF76T78+OKnU5K9HvHKIM6EaxjJ5mHjORxmijK81zlXzxIhY9xBLB0BTFDDKzd6xwvbkB5+JqUR+WKugtdKxvr0CAzGlIgr53VisZNzdjPIZwmZeRtUBChYd+KjdY4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718743533; c=relaxed/simple;
	bh=rUnkk/wWp2sBNpjdL8bQQN9zcFpLFYBuc4V2vmUKBPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fcGA00tehpNaoBMGzpqRoZ+4ZfG9O9gq+0G/0CihykxhA8gwOAtyscamjc0ennFaLo2/M3NEWDh1KcH/lAXlPlBESbNEiEu3TtNtBUO/LQDebcr7076nRs5Z7kTQqMx1XzZHvz8pn/sqDbQADfNwhwM0YuGbBORpYMnd2ga2X5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NpzmG5Ly; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NpzmG5Ly"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6fa0edb64bdso3199133a34.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 13:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718743529; x=1719348329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QypTvkVpwSwPwrJWMvND1OKOL2Sl2RDuWylFLER89I=;
        b=NpzmG5Ly3n1yFvYTlRk80TvVWZOIciXljpQqzN9zXbsKygeg+KQ8LUBMmiWBHxBm4X
         zcMfILvwCvaAvcnj6g/+qOUXMTovT/erA/aWUZ4IsIXHAvhmDw0Wtmpzk7evgP4iugEn
         mCg1X+Gnuo7PfQ5I1AjN8xALUtBCm0wCcuGoi7hkbpDih7n7QNGEWf7NxjoPqgnBAgbW
         1KYRktryaao8aqG/Hj5v0c8oKMPkIAIPMyK0J7/jHJgeGd7PJRsXrrzKJoDvb14hEA3B
         R4ojBAXrhmU1y0iUNSjeCtT40ZcEGoM9QFSPqb515PIUbJHVNkrm822YwJsCOovZ6WD3
         a6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718743529; x=1719348329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QypTvkVpwSwPwrJWMvND1OKOL2Sl2RDuWylFLER89I=;
        b=GynoGKS/DSBhKfpnFHznlbcdcH756lxBFWvk/DfwIJ/eS28tYg4Ttll01zHaEG6Phv
         to75v3qoBsS8IUUlk8ajsPM3J9dabOv7/DWVSE3LuBU//YuPzn9kRatvX6/GjIZS2d0j
         JnxrBV4AUyQKdtkkVLkLgv3ESyyGNzd4lCl0yWnZn4UtghZtMoHO8w3dDEoQqO/mSNty
         oUcwRp8/4kGhaj9f4CpEcj09him/YV9nXDk/xtpqCXSYgZlzg8x9qa7Ne/xD9Z/Zgv0p
         v5z08oI02fthvjWClclOJ7ZkR/dN38BALYyRmLGRqbVdOzmCbcfpZsqdX5U8MeRyAIpn
         0xAA==
X-Forwarded-Encrypted: i=1; AJvYcCVeXy2moJxBPFKslS1x4Ttb+q1GstOeEM5XBhL1r3hXPNvl1O31XxOx2HDjmR2KqDPkRTZG+lroo8yRyTMsIi2GmuK3/SBpstDQGenNdYyOA1E=
X-Gm-Message-State: AOJu0YxWNX4HWWLMwVSBmzZ+BqXtccOL07xi3m8DdJ7AbTjRf9GGNpk2
	zC2s0Ax+czFxDD1daw4e93EqCLh3ED/+WXjVlNYZawEXmJ4HbNIg0J7z6aniS9o=
X-Google-Smtp-Source: AGHT+IF0mhCadvOIWkaEzxJ7YG63of9Ku+vM0wRbKCJ3zcWLEWNNSJ7oU6/+slg8XAwGOA979+WVSQ==
X-Received: by 2002:a05:6830:1390:b0:6f9:7abf:c6df with SMTP id 46e09a7af769-700761499b8mr936632a34.27.1718743529356;
        Tue, 18 Jun 2024 13:45:29 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5b755c2bsm1938957a34.69.2024.06.18.13.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 13:45:28 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] hwrng: exynos: Enable Exynos850 support
Date: Tue, 18 Jun 2024 15:45:22 -0500
Message-Id: <20240618204523.9563-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240618204523.9563-1-semen.protsenko@linaro.org>
References: <20240618204523.9563-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Exynos850 compatible and its driver data. It's only possible to
access TRNG block via SMC calls in Exynos850, so specify that fact using
EXYNOS_SMC flag in the driver data.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Changed QUIRK_SMC to EXYNOS_SMC to reflect the name change in the
    previous patch

 drivers/char/hw_random/exynos-trng.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_random/exynos-trng.c
index 497d6018c6ba..841598037cce 100644
--- a/drivers/char/hw_random/exynos-trng.c
+++ b/drivers/char/hw_random/exynos-trng.c
@@ -313,6 +313,9 @@ static DEFINE_SIMPLE_DEV_PM_OPS(exynos_trng_pm_ops, exynos_trng_suspend,
 static const struct of_device_id exynos_trng_dt_match[] = {
 	{
 		.compatible = "samsung,exynos5250-trng",
+	}, {
+		.compatible = "samsung,exynos850-trng",
+		.data = (void *)EXYNOS_SMC,
 	},
 	{ },
 };
-- 
2.39.2

