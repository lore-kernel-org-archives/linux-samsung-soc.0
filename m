Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CF33546E3
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 14:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608343; cv=none; b=YlmhNp8QcI3VoNBkTehzwSOpO6IdWYVBLEn1tkG7APjIxIuMQsWxgwrV2wcELSPOkoN+yWOOohgkFlwawfV8VUMJZmle7RPwSof0WTv9c05G5lGikPTqSl+ZTksZjRxRVsnrUJqZHTSrZ4pvpOh2gQ35U0YYCk3PmyCDeLAjros=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608343; c=relaxed/simple;
	bh=7Z3yih5dD+Gsb3wABmKEFV3aH7k8cqoROjarxbshbP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bUKTbOeayZXkz6VRI+0nIlazqjfPdor8o83JzCgG64oBNffMqbOyIt7ZAEBDDzw/rrJqO+wE19bEHRrWAGHZlj4c3e98CdtSiWqBAHH8434re8x5jnQ4fI83z1X2Fo58j39u8bEZR7LHkc8JwHh9LfT65/u6V/Q+G6xBC2IbV0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BUSUkvTP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BUSUkvTP"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1111979f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2026 07:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783608340; x=1784213140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bktDzvvSDnTVQSEknn4n+r4fNa1uNeKA3U3mhbAncEQ=;
        b=BUSUkvTP9kCsvgd5TJMhFuyzT12ALftMYjBJl/wQiYoYHzCD4hxs8zH4NasSjsQD3R
         FLlI9wPIi9kl8K1gVbX2fjPhZQYwBA87LydyI0e1/guAyoq43p387qJKdi5VwXukj7AC
         i5Dw4R6CHURo7+0iCzR+54+woDrz/uhgDT/4TG1lq4nvakbZzZxNsG7c9DYr28IeHJj0
         cdThIw+Y+uxI+omK+uEEUtb+qwICrHP5YxFCoyYcDHdy2AJGUjbZaEfimba0cgC8vRYC
         qHs5377P8tqT9ApwhusLWFNwXqXZ36cPTuck5LFNwiWJTiPZ46ETuYGgNSkF3/zKmfS4
         5+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608340; x=1784213140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bktDzvvSDnTVQSEknn4n+r4fNa1uNeKA3U3mhbAncEQ=;
        b=L9JDXWysotkr0haljpM4A/NA8mL3Rn2JzXCa5jC+gFCKNB9Mytt9g9jJazlnajsQua
         AMO6kDSgHqdpDHExdn1X14XpICERkTY88PAvNvBlRXaX7LVRSNRXUgxsrNk9dMwnD1q9
         XA0MMslYd8vLIPtYtBUc+oEW4TRmMs+z4xT7UaRaLvpmXTBUIBb0wLGNYvFXGhXrqPcr
         O/YH9IYmi8FrkSPdTv2QLoZD/j8lIRqjbI+YM+0R9e9F3+XDEpXnuSM2KncViOrV7DN8
         PEDXrIMOeAR8qjDsnDtlRnY7Q6uhiim5aqovLCB+8T4OJpQQ3M1EGPrWdJMi0f9BsHcK
         0cCw==
X-Forwarded-Encrypted: i=1; AHgh+Roo+G14j/5YUkliDXZcybKFNVP66fV5kwGEpEy+Pejd0jVOMric3xS71Tpo7Z5Hzc1Hh40L+SlUa0RpPvLpQOdTdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc1y2UJ8z/G4Cla9YGmlFWI9BnZ0AqldsgEVbwiWkY2F9yVnb+
	QE/4AeLOxtjyxxziU8T3P/w1NXgQEzMAq05RwzARkCWqH4t0mFJCuwie47mWrOaOK6U=
X-Gm-Gg: AfdE7clkuSyWbgRtLhJajtMfTrjgn/ShjXyafn6AhMTheiL/cFgMZwbEUsb55+N0n1H
	bBicXAc64igYIh30DeqxDrfP4FiOhy9Xwdftpa5P2iskQD11KPWacdwDJjdxsANaxawaejamofG
	d5TtoWh+Z6/GHeg7PM3LqqsU/zGQCgZYU513BpISjF5kW5o67hNeidjZBR0xRx1zUzB3dse1jdN
	teb5AOvRUT7dkx5gWC6dhPFCLAuZrkJTQKEihuyQHsYb5VGIw9YFltRI8jn8UZNI6AMNfyH5Kve
	J4CVt0JCtlcQqGN9yuBXulJXy2raTKbI9VYfYqqX9GFavezGVa8Rd25ft9mEB6T9TBUOBlh6f+M
	hk77J5IkF1hJ5LgpZ6mpzsC7XuOcdt9rDiVUjUXCxWkpz90ZgZwG5Js2rylQ5rm5y1Jt4yHToiY
	PgCHH7+zW6Fzb33wFPy054MK7fgu/sfcKX/AwRi04HqUEFUcS/gGbe8JZ8HcDzqmCuRxlUIc+yW
	g4M
X-Received: by 2002:a05:6000:2004:b0:47a:c103:8a2e with SMTP id ffacd0b85a97d-47df0808ff0mr8297411f8f.45.1783608340408;
        Thu, 09 Jul 2026 07:45:40 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm50995732f8f.28.2026.07.09.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:45:39 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 09 Jul 2026 15:45:36 +0100
Subject: [PATCH v4 1/2] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-exynos850-ap2apm-mailbox-v4-1-caf2fe9a237d@linaro.org>
References: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
In-Reply-To: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Document support for a mailbox present on Exynos850-based platforms.
The registers offsets are different from gs101 mailbox, but the
workflow is similar, hence new compatible.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
index e249db4c1fbc..c109c1f7af24 100644
--- a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
@@ -20,7 +20,9 @@ description:
 
 properties:
   compatible:
-    const: google,gs101-mbox
+    enum:
+      - google,gs101-mbox
+      - samsung,exynos850-mbox
 
   reg:
     maxItems: 1

-- 
2.51.0

