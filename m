Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE0C38A286
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 17:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744234; cv=none; b=MoIFw/8DKvpUFX/E+uZ9yTOF1YgB0iUicK7R+PIyNKn0smSvO7ei68VNgi/BIt41EfStPUw2gVhjhDrpJoGfdMK+AZXqXomCAAnIbrcQASC6Rr2FLY/LMjgE+7JoGdctfALqA0RYhddb22abdZDW6w2YL3poH6C5cZDMxe7zAto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744234; c=relaxed/simple;
	bh=eyig287Nnlj8+oTI2VjyhVmhNMWY2BWMMLNoc8UPoE4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JbI6crRn7bmySdAh8uASmM4UArDYDoDivXq5AY7cU3ldpLAqpcGsjG4WeUkrogzPNtsRWLH0ppFhZUWGDaTISg4SDilRnCsJEs4OrqRx+/6n7fr3UAInN8/KV0T5M153thkRKtn0HCl+wQKEp2VrIpwHl0Fz5d702MGBdgjF5DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xYaO2mFL; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xYaO2mFL"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-658381b28e8so6252986a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 09:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770744231; x=1771349031; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kERB3uk5jipN+/VTD5GrnyxugRnR8slv7+TBQiLHjR4=;
        b=xYaO2mFLH4p4RGnwksi4YX4CkifcfFNjGH6PmYe7wKJc/lPTXtyuh41cPDJuF75FMU
         YuR5E9BilVJJmZ5LtQqSVZlNxe36YeYYIJV3Ec25jYAUkljbs3S33tIKNNXutHwYPxcu
         F6p0GblzcW53HY92wTVUaXj9+7ycKfS8EmUH+OiNGa+vKpTN72nmg7pbXrLwqjxJZ6Y9
         tnmGYSn8XU0JlSkAw+t+p8aT0sUrFVkYQEGBwQ4YtxnaXFyfPqIafrBvctKZYM9kThtz
         79xoVebGPerjkahNyT4sgSJgOIMOJvD5w3BJX6Jk6BLHKIUNMNweQ/LttpDy7I6sE/CV
         Hp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770744231; x=1771349031;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kERB3uk5jipN+/VTD5GrnyxugRnR8slv7+TBQiLHjR4=;
        b=mEhewkO3udE5MY+TvI8Uyv+cIK9Sn8ZBXHoCU6va+1srUG0kBP/FJZRiK5LLRVDNTQ
         p2zced7cN/AObCQ0dYOuCTDrZyDlGvGSqWu3rEieOj4INUxsL6GZr6SznN0UeMdheUj8
         tzsz/A2MGl5QGfHUAiWkpeS5M+L5AKHQZdO6IEKHZJYe8MozP1DEuEcf42FIRNHCKGD8
         6/53EnRzaVtiOqVRVoL0ork8NhiivU9lt6XVr+0x6wiRm2IO+WseRGPEO9eil8alFcGX
         yoaC+maIVbm6QClFffErr8a7dF6fS9/e785S57XlSzVn6ZFtUUi78tRft/+VuRCxIMFc
         GxmA==
X-Forwarded-Encrypted: i=1; AJvYcCWwAvLbo2N/HF02Q4/BM5l2LuWXv2iotXfKCDade1dS2mGfApOOoGK/Z6FFHTsLfcTJ9844yuQBP98C1O3Co96kvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIpXSANsmJvSTZbA2PQFwo7Jbt4LQ7zzrv9Brgw1eX/Alypwkw
	E2KSw8zV2t46in66MhvzGzJti+OMVn6pRfbxSvtmrbieX7mE2l7b6k8jaCX5z/H8Y6IZXbT4LgR
	viPKjKqk=
X-Gm-Gg: AZuq6aLSmB8tj921HFpNY31h4PuAXBxI8vfuP5qqB212FMpKgJUp1pTWbszROHe47LS
	JOL1Ay1zZ4dbXl0VQJLf3yPTxP73b084xGR0DbZiKJbv9BEGKdZk9IIYbaUwT5dWIaaBchxiVZ8
	E3eC/5U0aK9LRilpX+3UnvsJZRrhJcq2pt+qBFVEgxSb4TVnx95pu4VjdxlstWC5yJpIDj8HZQa
	RRnaKgaiL5Z/wo7Yp3RdinDq20PcvwH+veaMTX1jXK3hkuh1cOBo896iQzsneTZkiqK5SSQJOYP
	4QJLjC4DkX0egv4+emLlmpopuf0QUAYLHKJBf8XNnmfBF7QYdIepHVypSeZdfOHLsIexxlinqor
	vzzI/1FTX8EPzaqjmnPNTjqYh8vVn+CahqGycmjPcavZSEDYMoUlgeApfAZWFQDJQkJK3ckC93c
	2j1zpOJzulS026fDuJbPeYsJa+nTS6aBLn7oVThQcdjIWdskVh+N+vixNQ3A+tlWQoWiZobWMRE
	KzDAByNAcj9ZkwKEA==
X-Received: by 2002:a17:907:e114:b0:b8f:733:3fca with SMTP id a640c23a62f3a-b8f0733540bmr531242866b.56.1770744231057;
        Tue, 10 Feb 2026 09:23:51 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae3ae99sm565533666b.60.2026.02.10.09.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 09:23:50 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/2] regulator: s2mps11: two small bug fixes (s2mpg1x)
Date: Tue, 10 Feb 2026 17:23:49 +0000
Message-Id: <20260210-s2mpg1x-regulators-fixes-v2-0-ab3d3457f1ae@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKVpi2kC/42NSw6CMBCGr0Jm7Zh2IAiuvIdh0chQJkFKOkowp
 He3cgKX3//cQTkKK1yLHSKvohLmDHQq4DG62TNKnxnIUG3ItKj0XLzdMLJ/T+4VouIgGyuSaS6
 DGxyVTQu5vkQ+jNy+d5lH0Zz+HE+r/al/jK4WDbLry6rhumJb3SaZXQznED10KaUv1G6ozsEAA
 AA=
X-Change-ID: 20260209-s2mpg1x-regulators-fixes-2087fafa2389
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2

These two patches fix some code quality / legibility issues in the
newly added s2mpg1x support. Behaviour should not change.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- update commit message of patch 1, collect tag (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20260209-s2mpg1x-regulators-fixes-v1-0-ead348e64e14@linaro.org

---
André Draszik (2):
      regulator: s2mps11: drop redundant sanity checks in s2mpg10_of_parse_cb()
      regulator: s2mps11: fix pctrlsel macro usage in s2mpg10_of_parse_cb()

 drivers/regulator/s2mps11.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)
---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260209-s2mpg1x-regulators-fixes-2087fafa2389

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

