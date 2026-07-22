Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B28D49550B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jul 2026 09:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714176; cv=none; b=Lu8HOc/dK5wOUK7+d1WIFelQjeBaXB6qFRwcIGlS3GkA8fYMB9h0EYbNpCbYOw96k7S08VloLk/BtkwS0Z/PW0kWYgqbHZCS7VHo580wsAgAHAJUcnLyIOSg0BW8OWUexfsM6dD+Y8qBfBObCCLVrDlRIEkpzind/FiHhYo4jOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714176; c=relaxed/simple;
	bh=l8/EKsiOhWbe4eZl51252HGz/A19lmdsN3st6z2vITw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDEXNe7ay/qP8O7U6WAaC3Yj8FehMlTkuK+WbOW9zIFONM+3Ou+1Dh0dPgblA3DnDmadyTBa/lrK/7V8UfD8rtLbZNsbqPvVG/SqsRQft1ol0UkvJUMgzOtMCxLkT8KQXE8m5ccaCOTKEN42mKxmd/mJ5m8gE8yo8pux3zi4Lnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mdof7fv+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mdof7fv+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-471eeac43bfso11550337f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jul 2026 02:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784714171; x=1785318971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLAkjC7ZOsFkeH4UKT66qvPXrNClMizkw0LQHgeVsaI=;
        b=Mdof7fv+7tRdj8pSYvjAuz2Ib2+bVQfyjxRwypLgQt9nHmPKa1OQlG8S5OwiXfFfPc
         kqGGPAoSzUVxMJUTZDFYMMmbdzvEpkRQBGF8bq2kPKm14gbcKrQCukB6MxTYqYwTXZEm
         Vd/uTbyzexxnnMDyPupMLi9aRUaAH6cwHnYV+hrUraftY9DJDL9huxeUObmKB06gouiQ
         ipujV1Bpj4B4Eu7JlfFvblBWW45BdGyboeUhY5e4TGpUGfE0VvL/JMzkBiorbUkeoGAr
         UvQmyaMwDAaw0Udmd9Ol7ciaSUHCED771ganBQ/6Bl7rMM1MmgDuxPKJFU9Ls1zARq03
         4E1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714171; x=1785318971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLAkjC7ZOsFkeH4UKT66qvPXrNClMizkw0LQHgeVsaI=;
        b=HydJ40G7LU61rIDLW/hmA5YAoCblkbh1i0QEF9EkUGwrXY6oNPcCbmsVQITOrtoHcb
         8qxi00kALkVeR5B85fbaE2p0K4FJENrsUmn7IKr/zL3yt3sNCBPUdbDnp8rUOD8VZ39d
         +CWD4WBAfRUbyU9dkLhVQRRcDc8fUlXkaBouxZMzLOc4aPofSaVSFX/bOsITSab01KO6
         zjn5OqvKW12ZBsvU1bN07DMcOfuNn6c0NLXgmV83mNJMSE2zvny1geiIElgsxGOaVhSI
         +OjqReWRMBz1fTUbM/cpixPnIShbsGhuy8jg6+1Sm6ECb3bMPvQW61fwx9DNY6/1sk5+
         63JA==
X-Forwarded-Encrypted: i=1; AHgh+RrrVo3PhJpQTcJSZoP5MpoYxmtdlLRHTT1texV5tnigrACDUxg597TfSwUNx6YDBL266lo8w/mTUYJeIjNxWiHUdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlE8K6bXqGiE0xrfFcKA2iO6RylRREFETUBQcM4Qe/+MayoV9A
	EN8YBeLJZCrWndfbLHEdvfgcQz/fi101TiviZZYTWjYaAeRWIPhfa3Jd0iEsKcv/LD8=
X-Gm-Gg: AR+sD10kv69LiASK7dQiYAJwDSJmTDA95+xM8IxjojVIVo9fmf5ThaxLLQUeZWwbu21
	H/L8nawcEnf4IbVT+5xDZ7ZDM5zn0GCAFs9x76AnxN/uinp2KbQKAxo1PpB8NysInKxhsP46qQM
	LRfNtwNrQdUI4/z+RF2lvMJiPsEkVOsybfcL6+suKZpmzdowbul3SSVhq+GvOwHHw+rG7DvQ3CD
	h4/2pqNPXkTBOrN7mKNXLWwwKB2Klj/ROSPDPI069uS08NXVwd73izYVj7fquwgTThlcXa/CiOS
	+s0Wmah66uPs97kfJbjEFCHHMIbF27IjFF4mysGQTZe2XWc1P3TUYUTv0pOBdtG3CTZF8s9t2II
	dS1+QZlAs82svvjOKB6SszUiBrlSWA7u470FYOsjOlastf+pmZfju6YjW13CMPrmix4wBCH0S3F
	aZXPCVB8/LFd9LxamL0o8IDJhT1mXkfXfzlw==
X-Received: by 2002:a05:6000:4b07:b0:47d:ef38:260 with SMTP id ffacd0b85a97d-47f6230aca5mr25975619f8f.27.1784714171048;
        Wed, 22 Jul 2026 02:56:11 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:ea7:d5d4:79db:6d52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm4414533f8f.22.2026.07.22.02.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:56:10 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 22 Jul 2026 10:55:53 +0100
Subject: [PATCH v2 2/5] dt-bindings: serial: snps-dw-apb-uart: Add
 "google,lga-uart"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-contrib-pg-pixel10-initial-dts-v2-2-3abae9717feb@linaro.org>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-serial@vger.kernel.org, soc@lists.linux.dev, 
 Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
 RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1322;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=UIAuCpn9sBr07oQ2RwIwe4pVzRGN2evRfhuSeBFU/iE=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqYJO2S5G3RXrgDdc0iZBu1hTMoCLLrgE6SJbjY
 TVJinLwtlOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamCTtgAKCRDO6LjWAjRy
 uqBaEACecjhHzGhUtBGP2AxwpzQCb4I9hjLzjVA8jel/swb5ul1VNx1d33WlrwkkFTN37u+iL6f
 RToG6IHnRdaPjHsxUYQLr5fWNm2eb0Z84Lf7e6k2slRSz0W8CvExX797OFAIcT7OEiUNlZLsRMH
 ksu5N7kYRnG6YnvIf9qo+NHRWWsAG3U1RrrTAbtc0fQZrax1ruAc9ku5b5fge2NLdft9CSNKWlo
 rg4Gd/sQ5eoT7f5Da4zLKz3xnkt18jGUuqPZ8CZihaQ5eKs2Gf9zwCMU+ZAZsBgbpwXnHUhvZHF
 o+dcAJHqoId0jbRYc2rK5I8gBj5uLvTEr/Aug8sxICYE15Q8wVjI9UB4vQ3ds88Kehjw5OC3sN+
 /AfaQRq4yBX8KTFf2HDtl/IFm8Zg1pBDmkB4mROcen7Lly6fvdCBPp6Cj5SZFcn0jiDCD7gRMSu
 XTMVmblIjGBcMllV4+aYIjXsWabeJFGKxV0fppeVhQPiSUN/apDQbejChCTeB6wUQzpXyRvIWVS
 nFxJ7I8LlLBn/zGwuFKB2qiXM2Ak1x+T5suXnWeAvWFM/9nqdQ5kEqLRvsO2r2CRD7kLBvr5aeg
 QWSfClbNCzjPa6WsUkXVRyDc+NKTs+iBTjJLW/riV6YG4AooRnm8elO2hpnxbNr6yloQjXtp12X
 4gZTgROw5MX8Z3w==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

From: Douglas Anderson <dianders@chromium.org>

The Google Tensor G5 SoC (known as "laguna" and canonically written in
code as "lga") has a UART based on Designware IP. The UART appears to
work reasonably well, at least for serial console, with the existing
driver in Linux. Add a compatible for this UART based on the canonical
"lga" name for this SoC with a fallback to the existing
"snps,dw-apb-uart".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 685c1eceb782..24589466a4be 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -54,6 +54,7 @@ properties:
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
+              - google,lga-uart
               - rockchip,px30-uart
               - rockchip,rk1808-uart
               - rockchip,rk3036-uart

-- 
2.55.0.229.g6434b31f56-goog

