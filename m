Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4283B3FADFC
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 13:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468317; cv=none; b=uNltLm81tT8+/SmblL253RiE8Vply2uqtO6U4gC/rHMPD0PDTaEd1qIz0zexjwnoEzoFtabBDU83CgblVbL/1lI5gAnLHDvRzpw2FknnZbnNPkdDHYKrEvhyBGddMLDIwyMFkVsCoPZtggq4N/UtActB7YATWpKJ0i5ovZcQNqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468317; c=relaxed/simple;
	bh=TrETAIBRtr5BpleipM5VXU32aMTdlU394IStlNmAoNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vC/c2lU1GEVSer5c6F89HYAZhfmj8aCHik15Jt/oCr545UCRDA6ZYuFANuq8cgC7m8uOi+VUi2ewnfnhEAYXUIFZJ0vWkwROpUc5CpiADfCXr6Eq68YvdopSw8eHFN/pNg3UENsFyVpys0E++c5U0osZ7+ehOmXbWhp/PEythIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WO7hfi0O; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WO7hfi0O"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-446fea16729so1455412f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 06:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777468314; x=1778073114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=WO7hfi0OTj8I0r4gt+AcC/GFNmGJ2kwUKPNET49mMFGmOkGQCOPiPfoYn16nQv4xQw
         HRju2Xkrl4X7Mfa7QQdI8fhp6jjrfXfhZe/sv6dQXewGP02tgAr83hlX3tB0BFsHezB5
         GRo63mO2Gkt7tcs6K7FWlF+0iHc/BU00NkSW2hH31NGoCK7ht+mSAceNaKnMGnmnxNW3
         wf1lpIRZP6OTN0W/7u3tNzmDKGJFKqjeYny3MOc8sbzVyI7KhTqFoH/onShwFDpUdw3N
         9FT2MAG/KCevGWkS32vnOF12IOIMpHIHWj//cDwhMdxeW/p8ZGlOQKkE2DSA0n6mbo4a
         jkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468314; x=1778073114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=NHdD4VXIVPADsPBZT2bBHc9ddcDQtNrtWGWflh/tiKjeeP4Bay2RLQNJ25gyD1FVSR
         qWnouTgwlNpbpcQF834ibESmYoKv+RaUo+ZlTzTqF7ohsDB14B70UFWhsqRg1hpLoOL3
         y03UW5sqjSVYbiBCrc7cSv5Lml8f2qVQC9MZwMScJY5O9TkFGVDnS1aW/uAs8sE/fE32
         HAQon6RpH7IMl2+LNpLmn2zd0SGM2oyt00mDfwC3RlS62JUyNnYxcW16gXOjMchi1agd
         47tDyxoEjOULPjYhPhmPQA7Gh/wytpADNlmuGH0873fURBWzms3SbmmpbqNMfR8MRLGv
         s+sQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1B+yzurj5oBxNqfJnL5XJopMV7Bv8I4qf1H8GiJbuBP5QpMxX7g37NjUUQHOKYD6pudAduXLEBc81EjxeQbs0gA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGjn4s9yb2gNL496yArD5wm/V1NQxLNGPqAWbSq91XJ4XJ7j1U
	obfFhLeDJ+SaCpZWB41guKocc+zOkmHS1dqAVIVc+07w5d91lPTaq63Lru//SEnY72A=
X-Gm-Gg: AeBDievBBn/Do2y6ezn/TX3DjKX8o1iH8tXLmiJb5sZQ/XI1AkJsjRSabMykQxGhw1+
	FiRO2Mv/BjKf2X25dFRu0mx/uU2JwYHMLwRIV9fmiR7gymWoghE8TFGtYJY4LTidCbBm27Xf3cv
	7ZIlwW9vAuNMrUkual6xAYy5immfSQcuGn3CwbCv+Tox8KhHis/ObGd2UTIHlAhh2B+R/oZE62Q
	x47vASsCss7QQsWKKSSxbSrVE8VGnheYPuKZLQO9bEd4HfXEiRCfX2eIxBWTgWkxOg7B/vZrhdT
	uuJACXbAhqG6G4gyRaKmYQjVlPZ1Dajky3lSS3C1qUkbbkcRAdMmfCX4jewjF4HPvzqz7rS82yX
	vKw8CohP4mI7g9iwow5OnWEvtQwzVynK4MMNjA0IBjroxhbptPfdWrNKqq7orDBlsuL8WPsnJPx
	2HfKmRxll/97HPv2Urm3IyzEfm44aV/sW8Zv4jy56WN+pIJt/59Di0n5s4NW2Nl6CR45kWJVihk
	G4IT59B5/sE1KWNdQ==
X-Received: by 2002:a5d:5d82:0:b0:43d:7946:bae6 with SMTP id ffacd0b85a97d-4464aced1c2mr13929202f8f.43.1777468313490;
        Wed, 29 Apr 2026 06:11:53 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca67b9sm4752867f8f.34.2026.04.29.06.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:11:53 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 29 Apr 2026 13:11:52 +0000
Subject: [PATCH v3 3/6] firmware: samsung: acpm: Fix dummy stubs to return
 ERR_PTR
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-acpm-fixes-sashiko-reports-v3-3-47cf74ab09ad@linaro.org>
References: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
In-Reply-To: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468311; l=1843;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TrETAIBRtr5BpleipM5VXU32aMTdlU394IStlNmAoNo=;
 b=BzENjihfCSCZFL3n7ZtJCw2aaF7Gh/2Zynwp/jBunN4QYv/RWtS8Taoiuk5IhWHY6l6iEMxVW
 ufkny/ebf62B5nQoJpAwAt2YH2fLC9o7HUUqzZp5c9a71p70GqOONME
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified a potential NULL pointer dereference [1].

The dummy stub implementation for devm_acpm_get_by_node() returns NULL
when CONFIG_EXYNOS_ACPM_PROTOCOL is disabled.

However, the active implementation of this function returns an ERR_PTR
on failure, and the consumer driver checks the return value using
IS_ERR(). Because IS_ERR(NULL) evaluates to false, returning NULL from
the stub tricks consumer drivers into treating the NULL return as a
valid handle. Subsequent attempts to access handle->ops result in a
fatal NULL pointer dereference.

Fix this by returning ERR_PTR(-ENODEV) in the disabled configuration
to correctly propagate the disabled state and match the API contract.

Cc: stable@vger.kernel.org
Fixes: 6837c006d4e7 ("firmware: exynos-acpm: add empty method to allow compile test")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 include/linux/firmware/samsung/exynos-acpm-protocol.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 13f17dc4443b..d4db2796a6fb 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -8,6 +8,7 @@
 #ifndef __EXYNOS_ACPM_PROTOCOL_H
 #define __EXYNOS_ACPM_PROTOCOL_H
 
+#include <linux/err.h>
 #include <linux/types.h>
 
 struct acpm_handle;
@@ -57,7 +58,7 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 							struct device_node *np)
 {
-	return NULL;
+	return ERR_PTR(-ENODEV);
 }
 #endif
 

-- 
2.54.0.545.g6539524ca2-goog

