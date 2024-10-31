Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9661BCA02
	for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730386852; cv=none; b=e1KHQweNq+lY+hp0n8NQVjzSBbjlArIC1OWClro8cIcrk/tN8KfbgY8FpLj/rxfDMZEHSn1gEWXjTzzYb1S5V/lenXbS18TuEgb8pw2wk9z/dmvMupNhz/pCmVhBiTrQJmgKiN4g7M348uyQlURxoCeys3qAl/1KrzAb/jLSj5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730386852; c=relaxed/simple;
	bh=W5vmLTxbqbRWektRkfu8sRg+KXRkgNHrmzi/8ND27KE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nn6824eZ2R3L0XcBqhNlJSZQQY7nNJZLt/uR2aIL/KOy/W4O+tHOTJQ05+TnUiwjQ59Nnl2Po2hj0yfwQxXCaqNmPrOhbzH7tdgOjMDaux+YVLJOTAUVztNhUtKzuIn2pJYirr8VScmAh8VtRZfu1s2aTcpfsXRAJoEZSKcSLWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KsoZYNCZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KsoZYNCZ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431ac30d379so8707355e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386849; x=1730991649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdJwrtv6R6hjXktx6QL/5y82lOaBKNXG+b2XzR89bZE=;
        b=KsoZYNCZgP8wc3K1q2K1VZEbwM4W/gnGpfabkAQkSRXxVExXORzTt0BGnhvqOtk3pG
         cDHd19p0xHF31ZdUTdlqawR/5FBn10bGGMHXVwQEBiVbL5MKadNJzka+tnCaNTon1VTU
         TnjL8Oai2klrUpQzPBYj9kcFt39vpezaOxakmvDRXs9Lq7b7ubmyiIgK2DYzhe2+ndoy
         M4kr8FaVEw7Z1IXqDj7HkDMlblAlLtWb9HvcoXzAPVyLEyNrbnDRA2rAzorSBe8pY7Bq
         CyQOQrOMUdS5+H7OtP7xJfDzugJ99l3M1HwoJSnyRyRh7aos39SYkGuTRL3zsAZCKN8w
         eL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386849; x=1730991649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdJwrtv6R6hjXktx6QL/5y82lOaBKNXG+b2XzR89bZE=;
        b=LZ78BO/ry8Mg+f8S4Ubgw0ENsFMh2BTlv4iGn50JLX6wDmXGYVqr0IhybSmytY99+G
         kD9yKFgACWEzh2GA790a3R1H08tzcqBMKE0WuNCBk1VvbmaEgPuNn76b8IchY8txJZSf
         hr/ajQucHLLa6xQJkg99ukYbgjX+WPH2KWSasZXXvTHBHfSQZb7ZwNi46LLmVAcNM5aJ
         PYobV60JO4TjBUFOQ4aLL23sZh7xlN11zqkkO4/SfvDer4X+rjTGuXl9wSmqFe/CcanZ
         9PJaQBRxSQipUgFyRh9v3cFp85ReJzxjXEIeBPTrNsq0hM9Z8LBH2DOf1vT8WwTLz8iL
         6leA==
X-Forwarded-Encrypted: i=1; AJvYcCUuj6HuXUF8kSDUl937EkkMiGTERexro1PwWbdLlQxqNQPcryrHWYqma6HDKP4AOK39tqlM36UYVW4+oeBTO7CbNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEhj5ccMC47WBrupTLdkjCeMgi3tFmm2BWZNBVdN12i9J3fQ/h
	cFmisXxj7ge4hyqRox/6mPAJywtb/DtcBdDOOoI85AEGiaCpOfajZTJ/nJPj2BA=
X-Google-Smtp-Source: AGHT+IGte4mqUxYrFCHTiw7rYYrBl9FrCw5E7TjmHzs9HacaVeMVUjhzif1Rg3DaulCZuAOdHbN/KA==
X-Received: by 2002:a05:600c:45cd:b0:431:5eeb:2214 with SMTP id 5b1f17b1804b1-4319ad363eamr152298075e9.33.1730386847155;
        Thu, 31 Oct 2024 08:00:47 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:46 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	krzk@kernel.org
Cc: tudor.ambarus@linaro.org,
	ebiggers@kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 08/14] scsi: ufs: exynos: remove tx_dif_p_nsec from exynosauto_ufs_drv_init()
Date: Thu, 31 Oct 2024 15:00:27 +0000
Message-ID: <20241031150033.3440894-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the assignment of tx_dif_p_nsec as both users of
exynosauto_ufs_drv_init() function (exynosauto and gs101) set the
EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR flag meaning that tx_dif_p_nsec
has no effect.

Additionally both users also set the samsung,sysreg dt property, meaning
the execution flow will always return on the regmap_update_bits() call
before the assignment.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: update commit message (Tudor)
---
 drivers/ufs/host/ufs-exynos.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index e477ab86e3c1..378c16d905c1 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -200,8 +200,6 @@ static inline void exynos_ufs_ungate_clks(struct exynos_ufs *ufs)
 
 static int exynosauto_ufs_drv_init(struct exynos_ufs *ufs)
 {
-	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
-
 	/* IO Coherency setting */
 	if (ufs->sysreg) {
 		return regmap_update_bits(ufs->sysreg,
@@ -209,8 +207,6 @@ static int exynosauto_ufs_drv_init(struct exynos_ufs *ufs)
 					  UFS_SHARABLE, UFS_SHARABLE);
 	}
 
-	attr->tx_dif_p_nsec = 3200000;
-
 	return 0;
 }
 
-- 
2.47.0.163.g1226f6d8fa-goog

