Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BBE34F479
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760630327; cv=none; b=heQPTb+M17ktHi621Za8Xt8NK9LmUZvx141Uy47A1HA3A1P9bCo8sZHQqHGjQCTPu0NIb95HOX/a4b1GzkPR/eNja8egKrQbN00bkPXaacPi0YLra1DjPG44INnMhgOhsZSBRIMbLP2WQLi0gfuQjCJB0WMq/qEQMbXc0DtWP4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760630327; c=relaxed/simple;
	bh=wrIYG3Nz5u06Jww4oYJhqOv0hyk+YRHCWFWVoDPnx30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qrk/Io4XCt0qIElbNCI+CUGK0Hq+Ya+DALMIiIAL05eyiiMMzn0fADjCo/r69ZxP2L8jJv8mEd12GmCGPc0OwCapo+Ioh0SKtv05W1pkAaw4nVKnuC6p7BGWx2ghlFe9LqfaxJFrHswtSTnEIttrSGmajIc6N+Aw0Bubuy1Q3qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qxd8D/ID; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qxd8D/ID"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3d80891c6cso379087766b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630324; x=1761235124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EZqCABiIEnd0Y9dNLKHtIhbcAbjGjEboA5l9h/vQsc=;
        b=Qxd8D/IDhfolUnz1Lc0tfc6fhnSEqzVHXye5rlrzSnJaLjIyoB4CIuRRnsgbbgZ8yE
         3z5hJKWC9Z/qYLB3Y3nZc2i2HsE4PK7IMuts/ff7eFES64jxbS7PEnVUFaeauwabUDHv
         fJtuveJOFII2WmAMBJukAD2OtFaxxJOItsGbvyN+NeNlvx5f4I9Nv1IC8YUxPphYAu23
         9488NaG1kU4BZtM3E+nYT7pwkLNH1FMcRsOHZ6PwXGs4TWqBrlTFzzPG+uld6/Pvo+GP
         PNzfTP2VM01VznCGC/vypaUanUjSh7DjJNWGwVumSuEBrZJi/rBnw0DDWCVZrVZFtpVe
         bJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630324; x=1761235124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EZqCABiIEnd0Y9dNLKHtIhbcAbjGjEboA5l9h/vQsc=;
        b=As1JHxBvu1tYsOl2YKPMC7LCGwrKWgz2IBTnOReNkgGDjhJj7TZzeDmsG1UhZqqZrE
         WMGn14hjxdSHBvTmvYOgDTXJpm6b3lCt4z+VHkWcdfafiNeINjuE98vbv4tyUEsv7rjQ
         BhgoNJhcWHLVeLISCrRoezKzLFZ2qmKJXiDr7e/N7dvZ3kiyRXd7TQFvyj+oDqEXi4Ya
         CuYjfYkpFMY2teye4H1IZW2/bPYMGALGIauKonz6yzxLNLQRG52xDsCl31oZSQaAts54
         lrEYMBYE7GRPXaJk/3d69Y4LzRa9WMjAbdnIeruAL/ohnuZLAUxcB9J5Y4apzHTlSBFt
         VKLA==
X-Forwarded-Encrypted: i=1; AJvYcCVbX+UqkeswUDKYpNBwHOdg6ZLqduSyAe1bENfuPvQRw/BIukuZBOHVvwyB4Gg3FdVoLWp6/Np0kVJEyNbE0pYJeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpAqf2xxo23dpxfwbagIk5xu2oIZN0CsQ0liASnl92Wa41TSep
	TbQNbkQCtqFdDQgzDS3l2tx4kNIZFcdS3GlmTKZ8ydz3deq5CFMPCf7zv7D6BEcE4Ag=
X-Gm-Gg: ASbGncterpo6cN5u2KR+CjDx9S7iqafCDCfcDQLQhyaJ6B2GX1sADTFTTkeflpJhhh5
	r2NnQsMec6pJKPIG8IP7UXHGtXp+RzJqtRuhufU4uPNDLQLdJTaeZ62w3BDQU88pI0u1KdnZW5Q
	itYKxmvQVlyDTdUP2GE6GJP+Noc6fNrZHRXBSBIk+4KCNMkllWZWlJ5SoWrgqeVICSmnPMVWKwD
	8mJyrBLFZnQV34QUvjcUTK6FwxMGqAQ4NlLMenSIk/o4HJwVVwy/tgAc1YpTI7vwguCJbwuC9nQ
	6y6AfLvRM3fcjWdPCFiju1L1A6xe5bT+pmRg9ZFw+ofAjqoyCTGrPj/gLkdFV+80GV9nZ0kDhOn
	p64DP+dkiwps//ldAzlTmCReHPv6jlKNmE6jyI/W+uqC4msl2xhKn1kXNuEZ+HFbELi2xw1abv5
	FM9LTSe2I92EGoc4xriZSbVXm4EcNclS6i9BdyTLnoqY0m9EEZO7KjEb+Qs8ZV
X-Google-Smtp-Source: AGHT+IFH5MBvT1BbvZNO7LnK4pIDcpdPVfm9z0TGyk/r6VaVSo4jUiDBCHuy36yU9LuWlmcxA0MaVA==
X-Received: by 2002:a17:907:d27:b0:b38:49a6:5839 with SMTP id a640c23a62f3a-b645d20f122mr99022466b.11.1760630323679;
        Thu, 16 Oct 2025 08:58:43 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:34 +0100
Subject: [PATCH v3 01/10] dt-bindings: power: samsung: add google,gs101-pd
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-1-7b30797396e7@linaro.org>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Add support for the Google gs101 version of the Exynos power domains. A
new compatible is needed because register fields have changed.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/power/pd-samsung.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
index 9c2c51133457112ca0098c043e123f0a02fa1291..c35c9cb0115d79e5c36142da2c2a5dd30cd2ad47 100644
--- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
+++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -19,6 +19,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - google,gs101-pd
       - samsung,exynos4210-pd
       - samsung,exynos5433-pd
 

-- 
2.51.0.788.g6d19910ace-goog

