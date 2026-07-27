Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF30409624
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158629; cv=none; b=AIPoKuh1zMSLS/SVX4Vcr5fxvPc1V85FRaklYfk5ij71Ihx/TSN/oSqeF4g7Dkup+mhkXfhs2sgHvcBARtRodBNIGfDUBSWwkAv9NmUiPVe1dKomLZZKhv6h8/nM2XxdHjnNzbdHheagObYfWeXc6WdJQsfZK6SLmGuQZGIJJZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158629; c=relaxed/simple;
	bh=safVrVPbQKLrg2veq/edFMGfd2XqNn19RiZeXHcKIrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gTRkLCSbyit4M8o68mx0qUL6ldSGLJ4nqyzAu+CXuZHttQeUKsRSJ9PlnDLWBzo/MTqxv88wmiy0GYz1V//S9o7VpxAawFA6dNdEmcSWiHmUd9LPze1jDcZzIfWXD2UOg28Z6xZXKQq3WUEzbU1MWjhhpKp0hSjeu4efl3eY/6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tBcsItL+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tBcsItL+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954df200ddso17502555e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785158624; x=1785763424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KbIu2gZIapFLsXF2JAM5/C4wzKnu+IiYoG89ZkGUQTk=;
        b=tBcsItL+yQp9qt6xpOgUHL21xKjts7UiGTmnNeAEffp7nrIZ+xgAZfPU2Bjq+pExC7
         ZlFQSRtdJK4Cl1/ZxDLdLR5OQ4DGqXod2Bxb0tv4n0TQIUuPINGBwn2eRuDpUFsptXgM
         Iw73/seMIVxe+BB0bNipjm65cH1m/lR6jb/hliC7T31+8WxduEmqgh8BGuIaRK783F09
         0l3AMojt7xgH9v6PWcsTURVWzSd1h6DicWFo8lYU9GCrx7MrKr2T1axPZHUZHbCh+fZR
         F+tMdXZCD6L/bxtFqONm3t3ZFBBOEjxZO+oCufzPVAQBedcs7oacva1D2jcmdIHhQXVf
         757A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785158624; x=1785763424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbIu2gZIapFLsXF2JAM5/C4wzKnu+IiYoG89ZkGUQTk=;
        b=Hw/TOkYDWYcvk6iBViaczEPM+9N6w61/PUkbk699RuR/IX+ANXsU1AtyfTptQmW10p
         RLAJue22Ml0dOQIHxNJrVwmXJ9PM/aM9VZAZLXoTytwssvngycv/pAnBTy/lxdePyRJ7
         tAqm1JZ8L1eXh9R5yNtaFK1jfxjEIQixpxpCVTqvHlz0+dt90JLMG6t2BJ1AzAZK9RD1
         4eoLmdTe4hjFnBlX4BKqchMcN/PJ/ItkQIe/Vse6i+PTPfcB+BCBdarMBQHaMQKSuBJO
         7d7mBkfNf5PDNIbOeE4dUFHraZhCz/ZvW3SfnTZrPkI7JB/rTxFIEcuI3La/+oDhj8g8
         S0Zg==
X-Forwarded-Encrypted: i=1; AHgh+RqUI1Zndlp4BNX1W1WY+FrUKQi5iwKdqq4h+mdiVuzV0Vwaqv9sin/DCL40zSk9esMTApvreGMK3PkQ5V8+gNnIZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOsgaaRw2HOxX2lhLqyG+tDullNMXcS+OqOHLIKPeB6Sc4zYIS
	qIGdcMWEV5QjnJzdYkjN8j2sXh/txaWncbyWPpAotsEGrE80xrk9zGYueag7y+xxai6R7Dv+HvC
	0n8TxRVc=
X-Gm-Gg: AR+sD11DdzpuyE2dDo/i0iDMzD3/3wgrpcEZDip7/H1gheSv80VJeBkczoY+ST7Qd2C
	YegJxq9yG3TsmshwGIDsAQkwaysNHvBRnNDZ+sAJZsDbtODDk+1SAeIg2k+Jcj/a9m6x1DOCP6+
	o44C389a+c2OkvOLQHBk1NzBk2xKQeh/5uXnjuzBFyHjDwfSiJRjo9VAUYOE8QwpX6wIYu1kp5y
	N46/+FdiS1nULFmZE5ziCxUvy0bWZKqR+KCTcfwH4VRKgv2DfmrKSzj54CxaCx91ZCFTstNlb9f
	dPTNMCdsZyTK4COJjq/0M6LSVS1a3fakwaKolJwpY0XLckxHjNfrnOZMjApoADhIJmO0lavUPxf
	Ppueylkx4L9gYDHiDVWWsrgcqw5ofmhHEy7tIk455fyPTgIAa2TtE3wti5uISv8IAXl4uNPfWen
	xfiS3b3WPawRpwW+jKelTakQqq7r2Z80Ly/J58nWCOubnUDe2Nt14rU9IiyDoQqQYzWw==
X-Received: by 2002:a05:600c:4ed0:b0:493:f6f0:d66b with SMTP id 5b1f17b1804b1-496b56e6f19mr106760005e9.1.1785158624502;
        Mon, 27 Jul 2026 06:23:44 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee4504sm224730055e9.6.2026.07.27.06.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:23:44 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 27 Jul 2026 14:23:26 +0100
Subject: [PATCH v3 1/2] dt-bindings: sram: Document
 samsung,exynos850-acpm-sram
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org>
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
for ACPM communication on Samsung-based SoCs.

The SRAM is consumed as a whole, is not split up using child nodes and
properties related to this are not required.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index b83fc6831947..b9c4d4f3199b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -43,6 +43,7 @@ properties:
         - qcom,rpm-msg-ram
         - qcom,shikra-imem
         - rockchip,rk3288-pmu-sram
+        - samsung,exynos850-acpm-sram
 
   reg:
     maxItems: 1
@@ -159,6 +160,7 @@ if:
           enum:
             - qcom,rpm-msg-ram
             - rockchip,rk3288-pmu-sram
+            - samsung,exynos850-acpm-sram
 then:
   required:
     - "#address-cells"

-- 
2.51.0

