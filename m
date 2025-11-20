Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93F0306D26
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 11:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763638187; cv=none; b=PmmgDyAYEFGMZhL7sxhiS9iBLYb6yCIyd/mHFdSR0wmGIvCyZTrxwmimfBiLXx7DLomuCukSCUjUUPm2TQog60uc23AhBn+nUHiF3VjS7xzX+DE1lkhGGvivD6z9qGFgGzCLxQ/1p3pxMEFpqIPinnT/jL+AOjh02kvpm5Qmo/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763638187; c=relaxed/simple;
	bh=Y18z4hcXC90TeZ6W8D9Rbg20IQrWgPSKie5Vj93bfbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWfDVwNkYBNPrvzpPXnzHJI28qOj+/kP/8fZv/leiOuJzYJs/9JIlVc7bOXjtjLj64DPkuAuhYEFhPkCSwioyQaWVfQI7SmeYARY6g5rWEDYCJbSDan25z2E7cfozl0n5OBs4gUTroUWONcPA2w3GoYwEBXa8bRc2Mxj21oCLn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GL0QwrkG; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GL0QwrkG"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso435734f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 03:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763638183; x=1764242983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3hYzhfbEc/1h0Rp/vYsV0pqk39zwnFra4S41/QfDJQ=;
        b=GL0QwrkGuvGhbVazsPyQkZb4wFxNIsEY8vxRo6lK/nRc0l3MTiOXxzXC8++pNzkxFf
         DVEGhxZlx826OT3Cw/q5s+/76drcDNZ/LquMHI8uN3CVDBbzHhcnmpI9l17XTUqjMB+q
         AaK7BC3hJ9XmLCuwG0VBlGfvsmTEoMiwInK3uwa//gwyIXtrX6cW96WQ9uMBcL0oXhCc
         /vSlxdqvjvuWKIpWZ2HaROFfJiU1oCjunLg7zedIR4enKcLM3yw0E+1Yagc9e+7gX2Ye
         z4OGAofutYI/ftLizWFXWgHkd5wZ7nWXdsV2JD1lr7BUFGk9gL9uoPNvKcNd+UkoZwWn
         r77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638183; x=1764242983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A3hYzhfbEc/1h0Rp/vYsV0pqk39zwnFra4S41/QfDJQ=;
        b=L4rFaUTIC/AyKBP3fv2VY9hzL9vMkCVTCUmKWFIe4Ne059tlYcEbzK/y/+jzOCm6Ia
         Y3h5+QTwmDd76E9KgMp2q4Rd6iYZcT4nLuK7c0vHbCAOFUuQlJvjh+o43MSAIIXAThyn
         ZwWbDTuXdXgpycKXbDj+64y71qT5Q1c87K/mfDridU3lNbZ0IjUPZFgplxS1Dzj3mNDq
         UzHiZKsOq850/nf6+uzPQKTRWDbMO9/EFa3O/PXFHGEfroQY9Hpc6mkQoDOPSxe05yjE
         +kdzcKrToelTzc3cWRP3C40MyZfcDorcUwEtyemP+9HkQbpAd5rysCer9dRhKvBOVZTh
         0AyA==
X-Forwarded-Encrypted: i=1; AJvYcCVBjq//hs8CExfp1MgQSO2ZD6O/h6JrErgUmV7s9pqlDjz0Fa7KWQHFIibS/5St7vig/MczCHBOO2fDGQzVOCGC7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0p1qyKVHEbxCm9kHLC7Hs0NpwiY18COn7t4olc383gbEg4/8n
	kQxEPxuKUS0kj+ZXa3KVed4Qp5PIvf8uOhCANQfTYmaW4vZ6T/9SKwZmVHM9WNWJSt4=
X-Gm-Gg: ASbGncsuMIRz2HjEnBQZPumJdQcuzHpNvNBTQ759cTTIY7VNV4jfMOH95JGDSdW1S6J
	jJHjQTXtBD7fLZRYByqI/n/OYq0z0OKlxcc7k93pEBVY/UstSgzcbJGW8Uq27bKJ7Lo++iaO7FV
	BaxGQZPOOee78/073V53vK8SlXvX9YjKXx0t8g52Q1ua9igZCoNTOTeIxkU43NDVEf6l6t07XD2
	unGfr4+bp+vOtpQKvJt1OMfuLXg4bUzJPcbJWnWUMmiRyby/OrBc69jpd1vxC8vK9V4ma2w0ggk
	9MEfd/te6HZT1Z7fH6tPKWkLRTfvg0MkCza+Fyo117suwoux9UVXBtThZR1HjR8pTlatovhi6HJ
	T4vWecor9i2Jb8/lA5xzpqTTe8ARDYY+9UZ8u9pfYnob5DlltcfvEDHaSA+2xvjVJ1nRpPD3cVP
	/+Qc/sfoQMv48nqbLwfdCaGIG0WAaoQ8xgyTw1g78vzMsDI6GTpCerUCLl+SJlJLs0CVQ=
X-Google-Smtp-Source: AGHT+IG4ntQvX7ciO/wU08V89VgHHrDt7L2n7nGEulisMc35UphimRXBwOW+cZM5Xe/Cnjl9vBsYow==
X-Received: by 2002:a05:6000:22c7:b0:42b:3b55:8929 with SMTP id ffacd0b85a97d-42cb9a2c101mr2454960f8f.19.1763638182983;
        Thu, 20 Nov 2025 03:29:42 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm4961040f8f.11.2025.11.20.03.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:29:42 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 20 Nov 2025 11:29:38 +0000
Subject: [PATCH v3 4/6] soc: samsung: exynos-chipid: downgrade dev_info to
 dev_dbg for soc info
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-gs101-chipid-v3-4-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
In-Reply-To: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763638176; l=1017;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Y18z4hcXC90TeZ6W8D9Rbg20IQrWgPSKie5Vj93bfbM=;
 b=x7UrtlIUxcERWQm8HpONr2RHp67YbtcMLunqjbK/iMafjMqh43jKa8vPbr0uc0A3LNBdYp78R
 2RkQ+44aAl/CZIOW58N+VCip6YSMoUJ1DOYB0/MfEsW1dxBkj/FqLOd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The SoC information is exposed to userspace using the standard soc
interface. Downgrade to dev_dbg to stop polluting the console log.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 88d264ef1b8835e15f774ff5a31f5b3de20f74ea..5c8660374269c87ec38ebca242918bd7b1d362e5 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -170,8 +170,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
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

