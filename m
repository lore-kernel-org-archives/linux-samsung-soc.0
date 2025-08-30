Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035972D3735
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 16:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756572530; cv=none; b=OCTxYcMuEWUP/v/SN0y0pZLoMfgKzRXqpllqBM/ERQTiC/dZCcHX4v18MN2vo/Y5585BM+ywMSLCnH8gHuakXIDT8SYyX3X/1o+7u9FqnpGtZeQ+KENx0xj4OESt+NjWvCa4Gsif1mf/leMvceiRuquxctDW5OxKSzZx/LrGwlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756572530; c=relaxed/simple;
	bh=ebjPcUawDuyYiStYmNU5ZL3R3L1PNedniR0atYT+P1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K5Wk1PPUr6jJcX0o3BsdtFw32cGmcCtZc7J4kKzo42opvzgJI3sCF0dor9dg5FjjW3yWFGhj8doy/5FGdI8WEdXA5I2djcPIDv0Mt49s1OAb1X8xOkq5+gnGa130CTr/emxZWqZVEGgCgGoU0NSS4QPG8BBkWZFTVaQ3wNAzY18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nASJHhB2; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nASJHhB2"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3c7b4f4be98so218102f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756572527; x=1757177327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lR2F57pXZlUmDDCYEA5++08US32un21m5O7B8t3ZqrM=;
        b=nASJHhB27GAWfqIrPfwhzZLmmEJrZPfQFU8WkT1oxfsDcWkZx8Id2GeKaEdn+AA0xJ
         VdF4ELszycKD/WozZlDxoMko6i9gi0LHzdcHeeD8/OdSq+S+SBiL9VbKugpbOU0mPOo1
         KinXYOVEK43cLaGA45KvnpGfV7K9nGOZ0BdYL6cCdVm/kjdsS9Hu2CjSvreBwWiM3MSN
         g3xB7rdO1zdvp68bhcEb5heKMjlWsl+PYHoW38VPXUaqO3jPigjeLoXx+3HuB/x2bUeb
         99t/F6N1rZSMrYY3ch2KVI5VUmooj3qL10NFVtoykQ1rnP0R473DWUPVHWzOdDSCiWAz
         2VbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756572527; x=1757177327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lR2F57pXZlUmDDCYEA5++08US32un21m5O7B8t3ZqrM=;
        b=G+u8yLXZDAoJiYSjOYP/ob3n5y4ta5OJDhPsyb+ZyT9jeiWYtANaJAG5MO61kbo1b2
         S4m0Jm9UKw7L+cr24AyJsIz0fl1COGKtRXR1L89ApZFlY6Hi+UnAHYGv7/+hrPj7yVRd
         k3T69zxDxJfAis0WmVdPP0HZxoK4M0jRHoTUwfC0JCwQR7Qy/nBo7+Yx3UhC02MxcTPl
         9qjslVVgvgKpxT4/vloD1I9czsbYUKIe+4RVOiXyOq24LE9lIyES/5MYfXmIwI7WdlU4
         4akTCZhl5/DESXW1DqN6iFMmzPFfQ8BQrbU7Ei1925q71Cw+I4V0guEanuCjNXOdnTK6
         8aXg==
X-Forwarded-Encrypted: i=1; AJvYcCWw9Oj068TYz1lDGRgm+MDmofCAQFmWAr91WGIRxn4yYdbq1tbCKnj8QUSuEQB/IWF2BOZrCuGETWxBR2lxQQw+nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ+JKqJV0ImrFlpcMDnS0bFoNlcR/DDv9/jiiMqBoByWzY2yg/
	XIxxpWBnDXYnNIMS9fhNT51jE0EUFL6GGVwR1z9jJLcERGyFHYOU3UKaK7J52gCbl4M=
X-Gm-Gg: ASbGnctqs+eBj//KvwuDFaYQUah3fV45hsITQ/84/aJlCRnesyXI+qFkQ94OKPhaeyB
	ZdxB56BpIKiczlID4T4sBZKJ16udjj+9uYChGuLgaK8zAvoS1MdvwxGBv9GAHZrkaMyqQrgFbj/
	y4rFpisU9EkikgRVQV8Wu+KMHzsvHOeCziIGq+BPY74Q1scF/vkTSPPkMfrKsEkPYxVjZ4LbkjV
	S/ZTInrnIwKEquYN9mHKAziQBoYvU67H2ZvzXj7vMLn8laebRh0/GAYDfv9ce7vpT9agXKs7qc2
	AM5VOGzQDf78FPfX+6NBs9Iao9Gl5z1M2RS0gQRChuAWXU83RgyfN05UU0mFmkh9/HbF0GhtRh3
	JR/Mz75+8BFFn5pdeB7bIvAAXKK2rQX44ijxPod4=
X-Google-Smtp-Source: AGHT+IHt0KuSMQTDPQqKwlDvsHq9uYVnTMb+JaxUV+LdGdK88mtHqEQl+7TJcM0mcCtVtJuqsHFZ5w==
X-Received: by 2002:a05:6000:2dc7:b0:3b7:8890:8e71 with SMTP id ffacd0b85a97d-3d0fdc6311amr1950866f8f.11.1756572527510;
        Sat, 30 Aug 2025 09:48:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf274dde69sm7818129f8f.14.2025.08.30.09.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:48:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 18:48:33 +0200
Subject: [PATCH v2 4/5] dt-bindings: iio: adc: samsung,exynos: Drop S3C2410
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-adc-v2-4-4f8299343d32@linaro.org>
References: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ebjPcUawDuyYiStYmNU5ZL3R3L1PNedniR0atYT+P1Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosytleZMp+yMmU7xsdbFO7JlxlKksf/lRJNJaZ
 YnqE1JDQ0CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMrZQAKCRDBN2bmhouD
 10QUD/4gM1mCrSjYdcPTKpWDO6kCTZbB6/rtQiu0sGhp1ajK+tkWUy1YKGoYABMormyPFvjUzls
 4xbQEJN5gc40zxgmpfXhXLCfD7wl7VQsCVTtMAycfoR7jhL8kL2OB+vaNPXyE85AyseRAEnvYAv
 IDDGCmTzXLhDx+HejGYmRE/6Xeh2UWau1h6nkxpE6RPsTkr2P8VsGyYtqwuIvhluJShhDAW7DSG
 oPtUQr5q2g8KUANF6+JswThvWjwy0ImF+dNRp+1dHdeg46dbXLuzviBtqGzGw1syBI4N0uyS24D
 UcpQCZ+F4MZLpV0Z4TfQkf8bAr8gwB2DMAEkBZOML7culmARpQnlbqPA9do2wc+bDQkP66EuRsB
 7QzCly5CwNSmvfX5kOcmkhggEY7fSzm025jZLBwEVTs2iskQ8VZTnuUzTDU3jWkgF1bZY+olaVX
 s37qaxVKymOdFawq/CMkiAmqz3E/Nuwi1Uk0RzqejCeuqArxiwsWKp7QfqEribbB7X3BYbmgAMl
 tqsbPGMttaqCRBMqUi1B1UdZeP9DjS2ZNWfI/Jt3Bdgi0L5CZSJAIL/Td07t4tXZ3joYpp+p5Ou
 nGEmXkZeVdmhA8UPjHErtSQ85D6cRgivmj+rE1dXRgsgmZfpzXxRTx+sOGdE/R8pz2K02gZgJm1
 c0y2ypd7f+7giyA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Samsung S3C24xx family of SoCs was removed the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index 8069e99ddac860b22c793c3ef9479f720cfd8c65..73d7ba0fda1def433a97d10bce21e762a307e36c 100644
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@ -18,10 +18,6 @@ properties:
           - samsung,exynos3250-adc
           - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
           - samsung,exynos7-adc
-          - samsung,s3c2410-adc
-          - samsung,s3c2416-adc
-          - samsung,s3c2440-adc
-          - samsung,s3c2443-adc
           - samsung,s3c6410-adc
           - samsung,s5pv210-adc
       - items:

-- 
2.48.1

