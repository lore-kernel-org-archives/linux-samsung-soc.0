Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5118B1C84DD
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769570; cv=none; b=ajqmfkfLDavireYry9V5sHv+kQApVqYmQI5mMmRfilWxz79VsrPLIg8D827VmdmQTk327m9+00qqY9jHIHTfkH4OzUjkyGvWoIhCvOTxHw9PAXrUitP/gAFYUXvlXA7ZsxQBf3K80eluQ2EoXUyhVvxjvaiMor/aEDXCPesVncU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769570; c=relaxed/simple;
	bh=UZVJoMISWFvF9aHFwyrjWSN+7tVwoe3JXUCgzfVpa24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IAg0aJ3z4wO79qkh+EOuoZ/W3wER7zKN4WOchwszoHdedfN42IUtB2MfDfzpW7rW1r3RyAHan7C3o5WjFIx2ST9ni+Xz/btZ7QmvrBCWYcyBokG3iBWHUKEbQdGd3jKB6P3At0joEUuXNYNGExHeBjD5WEgXfwST24IyPbN5kg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ljwy1hg0; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ljwy1hg0"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab7430e27b2so806321266b.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769566; x=1743374366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vE10aUiMRjd8RDkwLK4ZfbXWjVS481xd07k1tbR4ePA=;
        b=ljwy1hg0w7d08uwjQpIVjewXX//G/+dGER5okwBKZPEiZNQ6YK2oBUxFG3GXFLe29P
         OCvtpzvntIqjjr8U0w09CAFbhy2Ky7AvBjD5Kdvi+aTV4sN0KpidNYNx4nJig1k4I+oi
         9S+ucAq5kUlkX2JN1J+hGhC6zSta+NuKWQugSMNj+Q4cpVztQ8RD4okNJq1qRz1a7wXa
         /72AML98KCLC8/+/+qqDE3OtktZiNIgZcKCUrF4cnyLkuszV0LPBvCDP2hfZxholBsRd
         HWDaloMWO1W217gfhKlAozTvBtCPG7zvFoAGID3n5sqKgByC1zG7iIKzToYofx5b+udG
         GlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769566; x=1743374366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vE10aUiMRjd8RDkwLK4ZfbXWjVS481xd07k1tbR4ePA=;
        b=Xobp8Nk22Y4C/kwM75muIBc7/sDt6arQM6sYA3V1Qi0pkRqFiDoTljVbL08SK6NOsa
         Sk0aFmnFPPYjUtOt+l4JDlrSL6qvRKbY1r5gklY1eSA2q2JaIALp6wD9h6gFH+R73KJu
         Nyn8Ic/HsBA1ghgo2zyeZ6lPDcLgEF9Hnr+bOU0uRtt4sWLTixyj3FU+1OJx5gReqnhZ
         RoL6Lotyf+pYpiVgY83bWnMksIsWv6N3hVewy6AbmlwiEYXyOuh+rbRiVqnetobdNABB
         1G4GX+szraHjfNoisioAiglzYbniN3e/fwBYVusbt0M8mZRVT4cQOa9lKsoyz9LO0PxF
         ERRg==
X-Forwarded-Encrypted: i=1; AJvYcCWca6/xwek9Xs3D3jtHedNqWBAKIB5ob4qJMQsuDLEdrz53ZjDoklbk7omeaf32wsOLTOnV7FvfELstdkhRb7YDBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNNWPLgVawQtZb2jTDNbxaZUUmzztUZXhcL0vhmXkwSDdJiFka
	gzdNv80AAuxs3+8znatv35NFeLGHUaCJGtRN2pFhMyumRr17wXjyD/wU6Vwg+do=
X-Gm-Gg: ASbGncsb1hIQLx+Uu6egMpbFQs+ALOz9dzQwWbF06SIFJeXJL4Qo4B0nCkNjUpebl6x
	k8ahNrgcadseq5UsPCjsYuqWhlVMCJiTF+AUxA5kqcho8cWKRQ1c8ZzV8j/wP60vcL0cLcNgJlC
	MsRMu78wa56LHv2Kz1yB/tsUhJzWwYVPG2YVQO1OEIBnpCYtbwTKrkGpPv6t4nfJCvdwIcHnsb4
	Y4RsYaIiJUNiMnt2C3apMTJtf4QPC6qd8nnbFFdWhfZ643b6G44ayccIowHOgXbAwvSaworr1SS
	hAtIWveuZpvtuKwLX4BnP1q16JdNN3FeFRGmR4UIa6t6NPYbOyNSZG7EC/AXHtGBV5l17wx72XW
	lRlrRbsxCi0rnhoFp1ICVD+kDYuqC
X-Google-Smtp-Source: AGHT+IGpWEO6t55UagtbffDf7jAwBntYjANUq6862eIF7eGvrz/eDXOggCL/0jo6AVynnVDx8dSnbA==
X-Received: by 2002:a17:907:97cd:b0:ac3:8988:deda with SMTP id a640c23a62f3a-ac3f24d7916mr1017581866b.40.1742769565973;
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:20 +0000
Subject: [PATCH 04/34] mfd: sec: drop non-existing forward declarations
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-4-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_resume() was removed in commit 6445b84abf91 ("mfd: Add s2mps11
irq driver") and sec_irq_exit() in commit 3dc6f4aaafbe ("mfd: sec: Use
devm_mfd_add_devices and devm_regmap_add_irq_chip") while the
prototypes were left. They should be removed.

Do so.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f35314458fd22e43fa13034439406bea17a155c9..b7008b50392ab857751b89e0a05d2c27f6306906 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -72,8 +72,6 @@ struct sec_pmic_dev {
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-void sec_irq_exit(struct sec_pmic_dev *sec_pmic);
-int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;

-- 
2.49.0.395.g12beb8f557-goog

