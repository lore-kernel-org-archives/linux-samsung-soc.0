Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B4C1F12F4;
	Wed, 30 Jul 2025 07:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753860460; cv=none; b=tYsUL57OWc54CA+V++iCAVcgyp+UnowAPjE5Q0ukPCqBHkvo54TRSs/ARslpo0TobPFAu8v+6V/gzkGJ1lkR7NI+lJBa0MHJQ6Ekkt+p00o59FgQGGOQ7woqpuH5YK33m5+y0HpEBODlw949HnyMGql/Y/P16+TG/ZSYsOLALUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753860460; c=relaxed/simple;
	bh=kiLfI1wVhg5HCODuS6QMhP1+3AJY6AWK2NRmz0k2lBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ja0w6VCVauc07vW6rSpft8RCckTXb8jTxElp1P5g5zWvzovKICX7bSJeZvZwARbqNiJq0qDLWKCFkaWYPCwh5Zsc2ekRFtPHjNckv4sBVkkI5i6TXrXEFbjMKGbrPeQDvVWyu5dLqaKKEbWwAWL8tQY45rXrZi/qxLUg02bhk5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nic+ijc5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nic+ijc5"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45622a1829eso22325345e9.1;
        Wed, 30 Jul 2025 00:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753860457; x=1754465257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6f0FwhvW4mq7M1CCFYzcRZRTS9S4BaVix+fIhnxA7VE=;
        b=Nic+ijc5EwCST4GA5Rktuv4rK/IH82vi+yxRyJNjRTfkMo6J5vSAZaKR1KDFKb/Nxq
         dp2yjQHrsbyRphs9aB1Sf2/ZHuYl55Wk4F/KTeU1yN/uz8YAoUCQxGQOgppzB4pGkOOy
         cX1Cu4bttZfZq8dGYeAGWLxaavTBo7Dfx0csoe2r8UnUt6jT7aUncRu1QbEGz7fQOUgW
         /nlbjIhIc702Ly0U1WfRsqAiI0gD8LNq/aJ82UpCyGwA9vQJIdopwv+LH+yWqJZAFvyo
         86fv9jy2B9xG/OnwRfd1SQKVR/18tZ0iSCT4gOUiUMFP2MlXJn/D+hAjFmgLa9Q/Eifd
         WFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753860457; x=1754465257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6f0FwhvW4mq7M1CCFYzcRZRTS9S4BaVix+fIhnxA7VE=;
        b=n+Fd8dnf8LdsDyH/f1HSQAza2cQwRLA56SN49Wuad4aBe4PHPRNguHdu9XfsAIf9qj
         nkesaYpac9uB8RrGf8Sm0TPd3yarHDe7y53t4faUlVd5OGO6hJbrFSR3sa6Y5bXw92Bg
         2femh/LFZOx/MB0hJxrbxYlyxWs9Dk5W6GIOlMlp0O0yKnR1uDUL4Xp5ozqIKWZxxcNm
         g37eFE9ib0fIJtT9zhzTMvBjoOmw0HJTtJVC9WcHPGxVbbGzHTL892IU4z4wIx6NvsMN
         EzRmP1Z8xHf788ZXAgiDAtfyzzHkZOurANCICEwxWSiwApLgQUf7W56IaAJwoBFjcVwh
         1s/g==
X-Forwarded-Encrypted: i=1; AJvYcCVdptvGE+vajWwDZB7Ne67gu7cJGate9O03bkycucctZSbHQjgvq23pBcD4EBEkD/r1v5mFILPeicVn@vger.kernel.org, AJvYcCXCIKUwIbilMt59hRYV1bN1Zan9EWe5LwKeDVIK9fpBiSFn0xmfU2uoHEbWOoh9Zuw8/JKN18wxyw/NhJGB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/+H3WmuXuE/uWl10BjT1Y9zPIERPg3hU5FXHXGBrWGwe1phmJ
	0GidGr3IBPW6FXSVEdeM7fG5WaugJSSOA51cnF1fYgPYRtzWFi6fPXuL
X-Gm-Gg: ASbGnctqCcPBcU42M7YLxfVaa5phZtozVE9i1ZnJRFtQjOEVXNLiKYHcblHnn2nGQEU
	0L9YQBXAKi03g9juqok8X6F7/CjPcLyopsCYJJGIjpzfNU+vuIKBZvpc009yE/1uXnJ0E5rxE0S
	2dWWdchr/eycVJLrvAJkQ+tWpwv2Tb/VrVjsDkCaHSKAlqIGMozR5LzbMU39WC2+Ecc1RDvqacR
	9sMfqVBT9RevEd2U7r16lRfYqbIG/1xoD7wTwjCw/O33NVYWywtkXubqP0Hdm2AD4revij1aThu
	w7vaj2mzjkjmoaG9Hzv3NHWxm841C8FRKhxMJpdEj4HjQNb3TiuFRKXAKOcXdIkiDQGAYEo8lwI
	IvGlG3dTIZKSeuSf41foqG8O0B8jz7Jt4OJJv86LKIXqdGdKzNDW20fFtgwDOdsvDw6zk4DuIWw
	==
X-Google-Smtp-Source: AGHT+IGitxQ0sOEC+WgVaNX9L6/ItIfmQxZmM1ZdgBtR/19JOebjrySx8wjPj96seElfIW/TIv7EMQ==
X-Received: by 2002:a05:600c:8409:b0:450:d4a6:799e with SMTP id 5b1f17b1804b1-45892bc58d3mr17968365e9.20.1753860456652;
        Wed, 30 Jul 2025 00:27:36 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78084f79csm13259467f8f.71.2025.07.30.00.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 00:27:36 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: soc: samsung: usi: add samsung,exynos2200-usi compatible
Date: Wed, 30 Jul 2025 10:27:30 +0300
Message-ID: <20250730072730.1882549-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung,exynos2200-usi dedicated compatible for representing the USI
of Samsung Exynos 2200 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

---
changes in v2:
dropped the first patch of the series
added a r-b tag from Sam Protsenko
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index cb2263709..c694926e5 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -36,6 +36,7 @@ properties:
       - items:
           - enum:
               - google,gs101-usi
+              - samsung,exynos2200-usi
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
           - const: samsung,exynos850-usi
-- 
2.43.0

