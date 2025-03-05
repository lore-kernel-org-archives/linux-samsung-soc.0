Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EBA261396
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Mar 2025 21:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211069; cv=none; b=ilX4/uJf6c/dPB1U3h+6Wpa9eLKhp3N9CocrTfoT/nlr0/ZhP5yDWDM8OxiCGAuTWDwQmr/aqUwnpvMbxvob/064pS5+7gvwO++CBXqe+bcPlXwIx1H48JEN+TAd80NsetWj6A9CIzuIblE9ZY1ugu/DoHs8P5kC3pCKXFwd+mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211069; c=relaxed/simple;
	bh=4eo93tsZ0/GxwIl5Nhb2FbHPag/3Lb/a4eLeV0239cU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ondTK/E1+FinhJywHpbdHg+LEOaMFD9HERwKj/bevdip9CJE/jVtPoznGqkQJTyvZ0bRYxMGeOlQW0BH8Gko6yEalLemQeqjv9kkE/IK7GxBQzygc0roRkSE6psZfmOs2GQybu6m7W9vNUhah7bEQV44tVSDXKdLMixUrD8yJHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I0g561Gt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I0g561Gt"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43935d1321aso8948855e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2025 13:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211065; x=1741815865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZSjThyZHhdWGlYf2wRahOUbPzc+0Bbe9Htg664cFk4=;
        b=I0g561Gt2Ita4QT7oJq2r6ZFCPiq5jPYSnXkhoPqjyL2AIJBmplh7kmMzHAdY/Ipwi
         BhUjL+r59aQjre3FX3TGV4gvkp8kqDQ4rme6Zj+FT8iw2FQU39iXPhMDzHE/wtIofGwt
         3JeOSYb/RJfe6ComO+g/mUmNNflUIz+3ktBd1tecSNw6nKUsRNCG6uXp9a1P8NKt9og3
         IVSQncKXHJAjDUAEEMnfvLjPwVz2FejjjFdcpDFFaSW1U5nE7da9sKpuPlR0rdqH0HPn
         Eg0fvTNbLbjPlBO1CqTyk7YzuhB0+4OSpnPOGIOfSYhDnfaJYy5hVbgpuX3i3L5V1SeF
         DXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211065; x=1741815865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZSjThyZHhdWGlYf2wRahOUbPzc+0Bbe9Htg664cFk4=;
        b=H9NG72DeVN6Rq/5r5icrybpspHGk24yjYLE8/Y79TOk4bYZcOCfxd0/64zBEDGQF1Y
         rG4g1k2wFkTqVasgfGsYK7BVXIoPEunwII/UFop9pF068pRajmj04DFz+QV/s/TabF7T
         CDaEQ+gXClyKGrtfOvAcREpGccl1YAVW4HkPy/8cFCCQrXa000uh/mwBbzuWv+BklEpm
         O8xMUR2HVleTkE/Md+xOc/xSZqlXS9kCx9iCjN2mYL+tmuXZLqAK2yR2713cxLZCuIMe
         ZDbmnknlGmCn/PpBs+dt/kfcRMf+STFbBNBlYEdQOZ3XYJcJ6e44IbhqOklzL6VYqZrc
         dxCQ==
X-Gm-Message-State: AOJu0Yy1dY0UxQ9/Zj9VOyILqfGxLQSPZhb33AB68R2lsgKG8RNVsGhk
	NIQ3nfxkYv4tIn7OtSYFQwszuH1/Knw7WHShRlxrMYew6WhpCLyKgAE+qb9z+WrT2TUt/mWCV28
	oWyM=
X-Gm-Gg: ASbGncvwxU4lot6s5EN0vgnnTAN/Dg8uao0lXC2twK/0kjGYUos+sAXbd06Y/QYSoIm
	Qe4vDnNVOy4rSYQd4zTDvEEwBeKX6LLk9kPX2s1/TiF2w1+AJ2DMTMIRk3x6Gynhf8nHKnVbM3x
	i+a0ZbgpKH8rUFW5nwGYp+rodKqcgt+5FVH+xuxtPdSl4Hx3wxVtDhKTrt7mthgUCuLmchP2WnP
	apvTk9lzaGV1FcPL644PESl/F7muAm3giGBkNjRZFrOjQn0Fug4yC6WAoKKd2ovuU84lYihCH1n
	J6I/8y1JqwGqPFD/LF0q8gV7XEhE+FdS9IKiA019PzvK8Qgg+aA9syRGtg48
X-Google-Smtp-Source: AGHT+IG9oDEbjWb5CHLFd4pvqc3zsjvr7YXKlBgukhSG7DD0dtCAa5qeb4IWgIRHQyUrKQp/E80hsA==
X-Received: by 2002:a5d:64cf:0:b0:38e:48a6:280f with SMTP id ffacd0b85a97d-3911f7ae2e4mr1607807f8f.9.1741211065124;
        Wed, 05 Mar 2025 13:44:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:44 +0100
Subject: [PATCH RFC/RFT 09/12] clk: samsung: exynosautov9: Use
 platform_driver_probe() to avoid __refdata
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-9-a4e03a019306@linaro.org>
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4eo93tsZ0/GxwIl5Nhb2FbHPag/3Lb/a4eLeV0239cU=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGfIxZ6hH8H4OVVzPjscb/kQnFA0nYBLz6OlbJrPwAPZTR0mW
 IkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJnyMWeAAoJEME3ZuaGi4PX1qEP/i8J
 906a4b7eLT78KedQQmJMTOfPgdXyHd49Q9w9IfrsXvcdJBs76T4161HaWoJG7HPC21WLVr+E+QN
 2jXbKQVbwE+y6AEoKemy+7NoxBfajrVUuMunNpMbQhFoLG2e3Gy+gTCWu72MN/5h0PqUekel47W
 vTvWxCIu5IUbrXN1c0eqU9yjPbo5p2zCQNmjMJELs+Dh3Ybjs8kueVKlr9kGmB3TEkE4/AsCp0O
 Evka9WhRh3B7SBGd5kD7yZMwNl0nqrmzilg3s/DoX7+hdvVkJwP+IthzN3Diktbrk4TsKVjBwU7
 kVxWVoT88D5ZO0CyGmykfA0KHdlIREpJS+UiPH67ZP9m5oIAGlfyTF3pkkPCo34nz+Wu+dXzA5Z
 YDNbSmtaKW+zIHRASAa0GyzhhFXx1LcN6YsDucmvwKnA8sfAwVT2jZ5uJXBn1NnqIMVhXk1xvvV
 7ssMaWC6HLnzVqkOHBCJx+ElQrxyfRjcmHW+W2JPsClUGcRsroTAlZq8rw9KEUU03SgOW0HMaLt
 FwukRkiDshRpksvnA4467ZAFGm368u8/8X1b0CRh6/yWzXY0JquFTiMW6+7eHgAcPhTlYTgyhfJ
 fbl3N7yGvIiZlZNkDeeeo4+6sA6BCEWguPh1Z//xwm4A1zmJ+KSTqo/EjKuxWxxUr7vr0k131hq
 qor1/
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Switch registering platform driver to platform_driver_probe(), so the
'struct platform_driver' can be properly discarded after init and there
won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.

The change requires using subsys_initcall instead of core_initcall,
because no device drivers would bound in the latter, as required by
platform_driver_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynosautov9.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 5971e680e566336ecdf55bdccacc3cea09a33201..627f3d2666740fc4cba205e6e2da65f53b8df186 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -2190,17 +2190,16 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
 	},
 };
 
-static struct platform_driver exynosautov9_cmu_driver __refdata = {
+static struct platform_driver exynosautov9_cmu_driver __initdata = {
 	.driver = {
 		.name = "exynosautov9-cmu",
 		.of_match_table = exynosautov9_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynosautov9_cmu_probe,
 };
 
 static int __init exynosautov9_cmu_init(void)
 {
-	return platform_driver_register(&exynosautov9_cmu_driver);
+	return platform_driver_probe(&exynosautov9_cmu_driver, exynosautov9_cmu_probe);
 }
 core_initcall(exynosautov9_cmu_init);

-- 
2.43.0

