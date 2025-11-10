Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B78C337B91
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 19:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802950; cv=none; b=oyZ1BV62yBbjNadP6tT67aYxVotBVU1mBfsT2CyaZnFF1eoQtN8GAlc3nLSscdp1EPYgu1afYfEVtoO2VhTcaQcquAyT8OWW1UQVuTJ+FGkaeDLRQis+X803PDqEPw8/qhrsId1CBNUuNE+4tlGVcWsdSiCWy/8wjTIee1k10Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802950; c=relaxed/simple;
	bh=LFqwaRXkPRKZ74Dqqp+A0vwR8NwubHOzJRAJeqzjYvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nNAHA6+PqtheGRgLbEBLH7bS56nw8Jh5+yQ4zyns5GmixNQf61dcWQROQzXIH79Wgj7KATkvlENC0Xxe1arpCEcQ5eDWGCTP0LKtxVs3bhvygmfCDPwxnUhzr4soCQsInBua2jwcBfYfZSqDtiBSm71pIq50RB39KHxCXyk2zZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jiR8GVoX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jiR8GVoX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b728a43e410so732788266b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 11:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802945; x=1763407745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5EBs/gWqE2YKHs84UApaIc3+cFTmlomp04y82/W90v8=;
        b=jiR8GVoXbgkuh/KishRQJfNZ57afnpugy778QxGm6RMfpiczGknpEvpHsT1hzpnve/
         FhHZs+MUVlCaGcYqkguvwTqLupayTOrL/Swh5t+pMipT2c3mhjruRK12ToJhK/pUvDo7
         6vwlrv1dxmhIjGnjDBDBKTSyKX8LzJv6ZTDVpM7LAFB/+8BKTwoVzY69ShjfiQsDrero
         s4D8KFclLPaJlffZJi2Qli0k7GniGMoGRX7n5NBl1jvGZC487zf2UPRqTgv1e4LacTG9
         2SX/l8gG41G95ynb2ZhZmL9yZIVb/pg8LL1axNxQom8li+8MlnTjD0flbUgvJYYqcgvE
         oIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802945; x=1763407745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5EBs/gWqE2YKHs84UApaIc3+cFTmlomp04y82/W90v8=;
        b=Hxm9xJAORCxKMPyJ2Mgjf8hc4pCWjkm/1Hmt49CfXLc/K+h2KRAbWs7Qg5MuWhyJvb
         zgj2lC7wjKFGCafhYGN4Q6uWPw4ZKt4S5ZFZ9jiUNMLz7a1iaG6vLb+N5AGpR1RxywyE
         fgAxU05rdI2yCFwJIxgYfMgJ0dG0PjIdpTfZkJubdLPsvd1H/zclF2AsRiIryXhZpK/b
         sfFYSN1PXdkPPj85D8yq4+6n5uN1fTQ1XWDB/F+PWCSQD79UdcW636W9WbTOHuXnSLuC
         7WMormIdpoS+6eKRv4gFT8FtahKoGF639JqQRaawRqUw+cmR6UZo18sE91yyk2cSv7oC
         u64Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBc7/C9s39FKu6/iZ1LfPnXkrKw77Wir6g5LiAa3rNYtUhDI8lmUc8Og3BHN0Z4a4CwAOZuOTdnpSrU6GuFbDv2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJPSbQBVXKgsHe834IxxQWnOpLMydmJrFpa0ezCDiG8PAlRA3j
	vu0mtIAv5Pz/NV3vbQAi26m8/0/KsjH1uSoUlTawTd0F3zUVh1xigUDkziLq4rfQn3g=
X-Gm-Gg: ASbGnct4ex6OCjGJgeJulLfp/KdymUkLS4L4AFOXNu83cIiVndr8eMexqISNA8Hoh44
	4Q4iOJjlRCCbGlilRwWvgt7EGhG4Q/oeriDAZPnpgXTDpcx6IIVJ4mqJcpJn/t/kWuNoIkzH4zI
	000OgMCuW3uZElTw1Fv9WZ/R5TZYESXMJcO2zMc5661i+Gl3hi20xjwCE7PVv+2baiU98ZL6V9M
	d4Nhdm29vZDKGCnRQDtGwR1hdXezLum6/E4Vfm5o9ckTIn5MDv+t1a8ICi7/O2GuA+Omysu9y4y
	2Ny+pzv0K/jx/Kn0gx1QJ60mqw1RyjZ8c1O5NH1B77s0ULJ+CfNkqOzBZKDQ6UV0fx8ZwyY+7Jk
	p3pwmnfu1k161ba1lEQdVojfKVt2pZfwIwjgEZBADne+NWg8+7UrYFN79Ut+bCkYTQyvYr2qLwZ
	4i6W5plRBEAJfMxTmjDzSuX7USTnnr0j8UtEkhcxZcfdsW2bk8H+QuLqWLljvUwWsMbXWRNBw=
X-Google-Smtp-Source: AGHT+IEw2F9SIUsYVJ6/B6ilFIzlh+rE7+nJUNc1mZL2I5c7Ls8Ayt61iA0IZHhJvuKlY8hxgKAypQ==
X-Received: by 2002:a17:907:3ccb:b0:b72:d43a:4fab with SMTP id a640c23a62f3a-b72e05e5a05mr774948566b.43.1762802945073;
        Mon, 10 Nov 2025 11:29:05 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:04 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:54 +0000
Subject: [PATCH v4 11/20] regulator: s2mps11: drop two needless variable
 initialisations
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-11-94c9e726d4ba@linaro.org>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
In-Reply-To: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

The initialisations being removed are needless, as both variables are
being assigned values unconditionally further down. Additionally, doing
this eager init here might lead to preventing the compiler from issuing
a warning if a future code change actually forgets to assign a useful
value in some code path.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 04ae9c6150bd5ae9dba47b9b3cfcfb62e4698b6d..1f51fbc6c7b6e158f9707c04d9f030b9eee5e842 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1207,8 +1207,8 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_config config = { };
 	struct s2mps11_info *s2mps11;
-	unsigned int rdev_num = 0;
-	int i, ret = 0;
+	unsigned int rdev_num;
+	int i, ret;
 	const struct regulator_desc *regulators;
 
 	s2mps11 = devm_kzalloc(&pdev->dev, sizeof(struct s2mps11_info),

-- 
2.51.2.1041.gc1ab5b90ca-goog

