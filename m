Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2609637E2F1
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Feb 2026 15:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649671; cv=none; b=Zlnzs/a+ua7GX7Yhl8GfWqkG05GnFmIc4uunCvGsUzthOHnfPHIH/nKAMxK7Iz5n7sgKvIow5SmRaBHsmJzNgMKnDYOADEyiFU8CItUSl/g5xQkCYcOumpfH0Ng8ptxakxDUevzH2UyZWORKgoJ4CFT9c0YOtLOzniv3yB2m2wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649671; c=relaxed/simple;
	bh=C7mQCeEr/HdbKguNqig8yEGFQ8i0l7imyEakSsdZ4wU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nGYEB/zrU2vpkCRq06h6+jasdZa2a58A98Nc15clkJ1J8r2GleNO4T+h+dGubGHZDXwj99BILXDo3YcQEIQkcrwvpzvaWalWT1r1Lu+VYbOlUykgRMLaPs1rLmH4SK95+UL3PsInA+1q0zgE/RA3DWDeRkLo5vPN+BeoE+0WAk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Px7pYXIz; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Px7pYXIz"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b885e8c679bso411890366b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Feb 2026 07:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770649669; x=1771254469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XegibK6nZtE74LWspbesvNEx78XvtPq2jMKaE0vnzoI=;
        b=Px7pYXIzNoRnX6/1nw7mMSYxejRIeX4YBej3uecoRzNR1dyjl0tnSDP+3U3DP3pLiq
         Q7+gZqG3DjviAJbXJj3tCZiiz4R8KX23Me0cGJfIgOervpu+A+6ilwtdYb89ss1MtEuy
         NMQ+1pKkPuM4xlGlAVW5IeS94Zq9b9vf7ioM9rYQEL4xngcJX8YbXTFmoSa9fZ1To1IS
         KvFFl5F8/uqbt22tTpJHdFo243IAn/+ppaXH4efpNCLINiRmt+Pmn0lQbhRmwNph4onc
         8dLLi9xa/3kANVv+KDjdS/stNFIt85e5tUdGSTIgZ1L0iZhBFLVrxyGZ7rbCM4GaxRq3
         J0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770649669; x=1771254469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XegibK6nZtE74LWspbesvNEx78XvtPq2jMKaE0vnzoI=;
        b=X3OLZkMmXRglhJEGmF/z9//VuF5BJDEy9A7pIj1lvIEkjfE+IjctZhM14ENKot8+5V
         3b6yIrSziOvbZhaHnMGgDkv7gcSYKZRFrpX1l6H/9TAe4xIrGkwgJiSLtJk9dU51lk7b
         JbcxakgVs7+HCGzEmIEBvB1865ZWj90kmXcEuLI429exd6ZYbj87uXXuU6i7SjxI0AcW
         QN7JjxJrEPHvCqjePdmhOtFOEKAztNL6IdsW9+fSqC4jAeI3aQVSv2IxZ2RSGL9CK/Ki
         m/7P+xevGuMZlohLI5vtQszAOwQQdOfN5BOhXVEAPBlfDTkQDWW0vZ72f9f3HnXqXnyE
         l4Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVLoZAWgK+GdpsxWIHDMEVDr8aO6ROIejZGeJZDNDieSX5gJLy0rKMcnDSEVOxlr3bFveMR8Q0PwajGKdSiupxNjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7LnBqrsQw3sgaQPhOwMYI5z60pg59OpXks5pykQKol4xNb6ih
	KnLSvUVeybvd4C2huOvUqgxaNlvrDvxao4DhyA4QyaoMYI8LcE36bua+6/BXtHI+CHts1ChO408
	zJb5UAp0=
X-Gm-Gg: AZuq6aJ5Ge9caJmDkUSq1rKGAFLdDx70PIAApS5/xiJUqHyucjmPaVIqbPSa22nu63r
	98n1ROnnrhiH3ytcWEam/231suwh03xOgApPJtLr4tWq13NOMvSZdYK9L9cjcqDHyYYmzQDe58k
	4FjXH0ObSup62GmI0YtSXUmjV6wc5mqsK5GQGikQHt5W1ucDnjJyl/MqfUf7AL+zPPBOaALzLNS
	jYfKLs23EiIt7XWtbBz+jNvhQ1um5YsGr9Ux1eJZtdNbipdK66ksiRlCRn30sCTldU0GHi0/KEX
	8K3pFBDFzBUSUMU+rYko+mwofFU306qshFIYoA5iLQreLagfaPjMJKnh5sMyn5yDECjjLgKoAeK
	0Wota1IjTp6vWF+kiye2bPG7tFvf9MOixVjf1dU8bq1gQ1pDgaBXpVeY84QD0cEKiANVTyEJle1
	YvEJODsnxPxGXPY7JWblrHD8jAJGoitftpT7z8TvGzVMSaCIe1wx5s++OBKj5HFg3j+Yb2VxGO1
	kLYKg==
X-Received: by 2002:a17:907:72c7:b0:b88:505d:2ac with SMTP id a640c23a62f3a-b8edf14ca75mr556288166b.1.1770649669481;
        Mon, 09 Feb 2026 07:07:49 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae6fa84sm393516366b.67.2026.02.09.07.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:07:49 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 09 Feb 2026 15:07:47 +0000
Subject: [PATCH 1/2] regulator: s2mps11: drop redundant sanity checks in
 s2mpg10_of_parse_cb()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260209-s2mpg1x-regulators-fixes-v1-1-ead348e64e14@linaro.org>
References: <20260209-s2mpg1x-regulators-fixes-v1-0-ead348e64e14@linaro.org>
In-Reply-To: <20260209-s2mpg1x-regulators-fixes-v1-0-ead348e64e14@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.2

The sanity checks being removed in this commit are useless as earlier
code checks for out-of-bounds conditions already. They also are
incorrect (as they're off-by-one).

Simply remove this incorrect code.

No functional change.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aYmsu8qREppwBESH@stanley.mountain/
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 2d5510acd0780ab6f9296c48ddcde5efe15ff488..2d67c5c16f487506a2e9e4b119f33faa846269f7 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -478,8 +478,6 @@ static int s2mpg10_of_parse_cb(struct device_node *np,
 			return -EINVAL;
 		}
 
-		if (ext_control > ARRAY_SIZE(ext_control_s2mpg10))
-			return -EINVAL;
 		ext_control = ext_control_s2mpg10[ext_control];
 		break;
 
@@ -503,8 +501,6 @@ static int s2mpg10_of_parse_cb(struct device_node *np,
 			return -EINVAL;
 		}
 
-		if (ext_control > ARRAY_SIZE(ext_control_s2mpg11))
-			return -EINVAL;
 		ext_control = ext_control_s2mpg11[ext_control];
 		break;
 

-- 
2.53.0.rc2.204.g2597b5adb4-goog

