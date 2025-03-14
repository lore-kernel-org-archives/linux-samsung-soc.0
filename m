Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05BB18B494
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Mar 2025 16:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970406; cv=none; b=SfSwXrWzNuNYJ2aCZpNiFXn0sy6NBwqyX/kGm6jr4JxorLKkIAY9Fe280UfQx+rbhSejByetFic5dOYXiDc42Sdz+XGywThnbyZAdveG63+ihgRQxCBJ4BIPFhUbmSmFf+xwB5xKlP4UB2Sfy4KGL0s13lqAISqpe6io2ajqdLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970406; c=relaxed/simple;
	bh=VajMfayeKQOz3VOYSjkIp/5rQbCz+OcLxQOVHfXWSdc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MVMLbPZkUJN9KmEaCMA+nunHNwtnd/ErBhWnsxYLFNzwHQyCkwBBHpOpULq32UhX7r8+F0su/vp2MiB3/64Y8OUaP9p3vZT1yWXGSdLzSvSi7gW8fXDU7lrMkohzJRq7KKpImKgRDy3XN6L/n7vv27lt+hAmOgiI/IeGgBFIFjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yEk4w/wW; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yEk4w/wW"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso3434983a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Mar 2025 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741970403; x=1742575203; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KhvzLiY857SGZEqzmins+PvzyIr/NTQcyLXE/tMCnFQ=;
        b=yEk4w/wWrrsAK0EdJyl66u1ASaF8V83cVATbkJ3lE4t5ihOkDvYuCqdNZHnWoRB8SA
         7kCu/4ePthXgdaa6nCe4IQN5TPxSTz/3/DQvI8U4eQW8mUKUCCpJcFeKogfHbDvw4KAQ
         EYik9M/CxhaKeoGpS3OdpTAhIbcIHeKh6LzagYcRWUE/r74xiAhniPw27IqlTcI/KqGo
         CKGe11yCTYb+z8KtdUz+zrx18n8nJSfRZfBf8CSEfcn4TmRPReuu1ltMJvguEA3UPLqW
         cLUlS1ctxERXRjbT9s//+tnDlGZqZZrU5LUKuznZmXYX1UmWoZZMsmzjIAEaZ+oDsIbW
         Nclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741970403; x=1742575203;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KhvzLiY857SGZEqzmins+PvzyIr/NTQcyLXE/tMCnFQ=;
        b=vXS8dYLfOmA2foSkGz3lQWQbnXcuL3Cz3COEwRzolMl5FGDQ3ZYyBtm42Go3vqD9xw
         3Lo0ZIf+9sY31Qj3eGmRH1RYRNPZMT8gE7kqJqU8jzBdxLoemLjvgxAMn85yMD8FevHd
         KCwZngucmw6Li2HbCLQJzGZsIe2lE66iK0Gn2oh1yQ/BFltwPLhiNPKVk+VSTS/VHOVx
         Skg6qzUr1DHvvHyDhGLUl3QFIcQAHFdvHiHCJKP7aZHZTmhIgj0IqT429FFFr9OSfQ8E
         RdWY8kOTFbtYVZ3dGgbpc+TLI2Q+loHuuq5yIqmKXGoXfSa/hjqdIWc6OkqJbAnWK+xA
         XBjw==
X-Forwarded-Encrypted: i=1; AJvYcCXRiCG9xSceGDBUVZs1uYxPUPNG+Fd2C7fKPe/Iw3A485DjCs8qGwvZ/JsWQhP0wgvus8fP7ECd6frcs6zCpI3OdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO5Eqf3Am8RR1DGih+izGqWKHi+pjyAYJ9EMaF0IWln3EAOKuy
	38DBnWCttyC6vtft+t0Kka/tjAlAOrQen/YzSBhRDGdr+P+VKJ7grTMD+05Pxg4=
X-Gm-Gg: ASbGncsWffGR1n9qIjasMPzyyM08pWU9W2hIAhXetAFp6w7812gIm4mJ9KJsgvRFRzC
	6ZkuTQ8UDJiTXsq7pvhDDH368o9u/QFmM8wY1aNlEiGGrqCQCAKNZ2MoU2Kp+FtHkggLq99d1Zi
	Zk/oWOi9PJcIKaBqli6ahwS8QwLBCGNX4vfWdXaFmaQ7Fw9V1p6WoMt9SfGo/KDgBNfBSpYL+0K
	3vjivhN5YfCGxv10FwIGIA/ocW4gfuthVYrmetKgOpphDzX238HAsAEqiQ4WO7CUa6U0wmBOPkd
	Q02QO0zgt7s7pmh9miaIJ8G+eGYN7JdzcpKqj/fNn7Ai6auKNFux+LR245KRVJiWPFLNpMCllhg
	2vluo96N0O/p1SQpLcaDAn1zml4HF
X-Google-Smtp-Source: AGHT+IFGfvz33USapJBinW272gepivtVA3O/20eKJ/+H17ddACPCm8qjeCgFc9bP4W9ixUKFcXUt8A==
X-Received: by 2002:a05:6402:4301:b0:5e5:bcd6:4ad8 with SMTP id 4fb4d7f45d1cf-5e89f24c63fmr3817601a12.9.1741970402855;
        Fri, 14 Mar 2025 09:40:02 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816968cd8sm2115727a12.18.2025.03.14.09.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 09:40:02 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] firmware: exynos-acpm: read fix & reduce log verbosity
Date: Fri, 14 Mar 2025 16:40:00 +0000
Message-Id: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOBb1GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0MT3cTkglzdtMyK1GJdYxOLZANTCxNzs0RzJaCGgqJUsARQfXRsbS0
 AgKKOcFwAAAA=
X-Change-ID: 20250314-acpm-fixes-348c058476a7
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

While trying to use the ACPM driver, I stubmbled across two issues:

    * acpm_pmic_bulk_read() doesn't return the correct register values
    * superfluous log messages during boot

The patches attached are the result and hopefully self-explanatory.

This driver only exists in linux-next at the moment.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      firmware: exynos-acpm: fix reading longer results
      firmware: exynos-acpm: silence EPROBE_DEFER error on boot
      firmware: exynos-acpm: convert to dev_err_probe() in client API

 drivers/firmware/samsung/exynos-acpm-pmic.c | 16 ++++++++--------
 drivers/firmware/samsung/exynos-acpm.c      | 13 ++++++-------
 2 files changed, 14 insertions(+), 15 deletions(-)
---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250314-acpm-fixes-348c058476a7

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

