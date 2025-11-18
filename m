Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D56361DC7
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 13:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474187; cv=none; b=Q2/njh2MvkJ6a8HWmlXnjgHFRbgNca0hHef+HHgU17K4kxWnUi7YjY+OmAe2dQwTC6z/oSp731JLL1mRwzac7AHjmWHR5uWGD0EaVV1EajyWTr1NyVC9F3T2EETjBqNAwIc+CB4FqGoZZkIGbSZG1t+Hx2fjfzYpsluVcIuAU7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474187; c=relaxed/simple;
	bh=TAfEcJT+KP/gybnFuuKe3YB9Vr01lZOY0yg12JjdBGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j3/xgwFL3EjgPA709amjlW7InOLJuNLJmjf/fuxsx41UwZfGE/de+2z5nLM3hpYZTxUErzV0aZGFrS5eiIPQu2eFNbhyT2ne03dE5adPBAnwblHR9EaSLzaoi4/r/9kQbZz3uJML8GJFnNQUcTYXTU8jePPekIzjjJsD1HI8pdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zjkt0vKt; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zjkt0vKt"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-429c82bf86bso3217118f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 05:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474182; x=1764078982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdDgG0OEtr9VDO6FlrjC0lVVwasyx4VrXjolMp7eFK4=;
        b=zjkt0vKt/lzBxvLlAIzxTj5aQXMQeLFW5fAMmPBjUTgMlkMlj4nW66sv2bPWbQn5si
         u01S7i+E/gYRbNXcxXtZGKGUVK4mI9SLi+AIGx+16iYsNRG3nDDPKIVlXPj2rn/M6exH
         JrVNRdEEfh/6IjevOB/8DI6K3AvoAa2uh70pJWV8idL3C3qVkwnj+MFelUyohQq42/Qc
         MXwUnOw01pxMNMKp9x/tVj0Stj8P+UYijF/21iozL95dwgR+inQteCxtBHH+cJtgj/of
         o5ur+LUu89Ms9c1flA1kDeMWih2qJREEhP14aaYaz/ZGtxkeSyw+mySCLBEMgEt8IX2m
         FsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474182; x=1764078982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FdDgG0OEtr9VDO6FlrjC0lVVwasyx4VrXjolMp7eFK4=;
        b=bM+x8ee4qkp6prenbIGsuM08a1Hh1CsutG22f11mGqAfoQfWVsz1p0sOLm8nutE6el
         qzcceWrwRbg9vz4zCDs5fTOGutOHapq57sC51F1mHCzWa0EdpYdSjDvvGIXfzrJX+BuV
         f5DYO01EBB8QutPE9H2tnyCdy+gFpTlR3m7EOHPsntLHsITDoQE+H7whLCGG6DsDEzFN
         LPoRMt86k/VR2Qj68jRsOoOPCYtyn6NJJZG7V34TYwdYIEGOrbhMafTx88urBetrHZgl
         D+m8YNo9AFmTODqnjX5Ajhdg7juHYVAZeDr7xhwO9TUABRjziW/eJojMDaU57jPHz4gj
         CSpA==
X-Forwarded-Encrypted: i=1; AJvYcCULyZ4+uV1Wo8rFRTteKNzvhxKvVUMh4u0GOiq+LTKJde+v/n/q9OzQKqo+JMPi+cdTYtnSXyahMOohJ1efAgCGEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT3Xl/hc6NBGbYjIW4iqo7VscpYzV3WKIp0uIJKIwuev1rt2gc
	ZYO1bZ1ZvqyAkgblIc8/ae6xJTXXe5SmsSKu4O23Y0jdfW8rB7Dnp2Qftvoo90MNMIo=
X-Gm-Gg: ASbGncvQ0dLstMp5F8ZUyVvSNOd6ip4vuIhlGkyHhSSWKzBNn+hHul8YrcKiIWd7gOh
	m5Whj8yoOZBqoKZb7XIYN+pp0eaXs3MLgTVNCCvYHQGxH+oXkAuEFaFnAaYLdsIo3YHnzjBo+FU
	I7WGUJrgs4OjonbH5HzpVqaeW5BVYt88VKvnCdJ2brWbewujoQq6mX1ut4xKWNGVp1qkTrasHZO
	9NJrOExZWhSGWuWuWBZF2NyAJ6/TL/q9UrJO3nfc2qYCxCS8KPs0iehqxX7UXGSKuxQQvr/BOiL
	91TrTL+DY9HcG7tSrFIne7lQRUzK/6jCcYO9d57yaUU6loye+1u9H3FLlR5W+1L7b+qyuI19ITP
	M8mb+O8s++XkduU4TJ4lBH0fp8PrNXzq5Y7ST2CAHL91WhcEa5LR2ZiJN6QE97eR0h36S0Nvp3j
	+akrWpQqyTC8PkNeueKkq6r1fuVXlv1hJnk4EM/Sn3oTtn30kseSE+8iNWHO9HEfFy/haHyryrw
	CS8vQ==
X-Google-Smtp-Source: AGHT+IGfMObgF/k6EWKW7rlaiPXKOVwaG77gXtBdH9U/El9uEDye1QZpAt3VR8koJaZq1/x7ozt+1g==
X-Received: by 2002:a5d:5f49:0:b0:42b:36f4:cd21 with SMTP id ffacd0b85a97d-42b593742e7mr15653326f8f.40.1763474182223;
        Tue, 18 Nov 2025 05:56:22 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:21 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 18 Nov 2025 13:56:13 +0000
Subject: [PATCH v2 6/7] soc: samsung: exynos-chipid: downgrade dev_info to
 dev_dbg for soc info
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-gs101-chipid-v2-6-e9f1e7460e35@linaro.org>
References: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
In-Reply-To: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=1017;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TAfEcJT+KP/gybnFuuKe3YB9Vr01lZOY0yg12JjdBGk=;
 b=acfWU97bc9wGkUoK1rXcht5oTK4PtuVsKYgoVLSw2tRBT55ufu6Iai72t/xeAp1NwaT3i31gN
 wHgEFrsKmGkCnjVfQYW1FIDIJ4bVWlqAyFGVpGVfPJsZKyXYU23iwUX
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The SoC information is exposed to userspace using the standard soc
interface. Downgrade to dev_dbg to stop polluting the console log.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 7ed7f44b6ae5357b71fee3994e4a4265aa870d41..e1b939e526cea9b2069da6e37a1a16950ce5ac44 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -224,8 +224,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	dev_info(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
-		 soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
+	dev_dbg(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
+		soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
 
 	return 0;
 }

-- 
2.52.0.rc1.455.g30608eb744-goog

