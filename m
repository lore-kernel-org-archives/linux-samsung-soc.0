Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EB72F83A3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 08:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762937324; cv=none; b=CtUkDYgl2r8SVHfarmO4tapNouPPcc1kP+buYIk3tzcmoBETLeM/lrQFCeDYJ+bTvN0RK8xSnawXKYlc9pfFX3jFaMdQTP80HomW4+okXIW/sOZzQZPiQAN8rbqamzH7Jw+m6mUfRHzeH3AtSfhSLNPPtT1xtytaO6d8cm+Km4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762937324; c=relaxed/simple;
	bh=7druEga/Beb9/UD0KVweY5n8TbkTPFBJtmEG9o1IjOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EFGaSOs/+7vrdi9d0tAj2FmoC5Rar9oaRu6QSRi9IItGp49w0XXAptpeaYAhkDY1E0cEkuekhifoZqgS8O8VIGv2TNaqhopXo03y6PiaiupQVlKNoBwYc8LVV9ZSg89WZPeyk12/uQy3hY2gmQu5W9xRwJJnYdDG/5rXc4aGWN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pazlbgbR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pazlbgbR"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477632b0621so3445535e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 00:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762937321; x=1763542121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qN+9Nh7UEIyQdcOnN3rR32056vw2TRuOg5ceKeN42QM=;
        b=pazlbgbR9/+aZQK64aKYvXFzNxlhIUziC0Yn06ABFbMBR7O55OTH0+0J5kFfRxsQy6
         FyljLeHXWPcHLnTPAx36u5oXvorlGG5zIMzoHvGGVE5iDOaUhScPQFcDIeevqHtYEuqo
         Gqc8rn0UT/Z28S8fT6NSC2hlZ94GvhQ+jmM1ZA/2rumTQgLIaESRlMp58CMwAwKTv/tQ
         AwTsD09czVsNwmemsH4JHthmQhiQstDor7lmxT5xbdemRqZV538ERS+ubTafjn0iHriF
         hLUF61KXJnNVPsn2uPOGt2VT9V2zoEt5wtRnOxLwIzhmA8ZPRKxDa+6si7p2qyZn7I3f
         9/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937321; x=1763542121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qN+9Nh7UEIyQdcOnN3rR32056vw2TRuOg5ceKeN42QM=;
        b=hPm2rVB1wtj4iDNjwAm1mOBBpqUo9xhU/klfajOjHuMI1KlgejOOWev0si6kwsLMZT
         QeBgcT/SGF8UDU4kTjBJPa3KHp0IlQjPU/lHigQI+of6IIwntFHY3HVSPPf51pqNNj/+
         cKgFPJJIwkW+/qFO2ZkwSMyO7zqeEKvFcvEeyz2friOLAb/7vGOX0uL4CA4OVuXloOGH
         htj42CZLvIV/uZCrQ+CohRL1XyRyyGVnDZIM2Vw73ai5vjMObB0cwTiZqvN9/5c2D0lh
         WTRbK2kY4yA+LrjvSfoiLnGIowtq5snDE8k24xhdzAqvaD/Ck7KuByksM18xg0E/C14r
         Oa5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJzNiKb1va9VtBPAo6xPn/KXiJcHJfiQl2z6FMDbryH5sEALC6flQ2X3JCJ7TPLJ+dKVIIZ3DKFCcALDbqJIpBWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlqZ3D/9Cm2dxf/MtF4ZXevkkQT1DJjEdngRJKr3sH9DJbPizy
	8zz/EAadUQHTTot2v2KehxCYAvxEzy8pAzsqg6Hxmf74cGTj874MgEKDhBVd4ndso+U=
X-Gm-Gg: ASbGnct6TrARE539BeyV/qd6SnsB/GevYh80uHFhN81mmpNk55QzmTF0SkBCtjFCXpC
	IfVfZh4whKthCO1wbMGcHIXcF9JzqLqGWalEhCYefwh/1+vc6DW9Op3O8HZ5VC9bWKu6L2IlhmR
	GPh4S+sMlBvzU8OjDYFGLSGuhzGfUoyRdDxjvIlS3QJ+8fJml4CPg0pcYlg8EgSe1dihU2nCwsX
	wRaqvt8JwkFfVHK1fysu5NVG9AtaTokn7Ip0Xvh2hgr8UNX7sMQkPzRXEEBB5/rvaIptyYYOEPp
	6UZhK3mK+Ys1jq/O8Z+2R6+8bXmRbYf3f5EahCfWDWB/+GpznCUCBSL7LopLJHCRLLTVaRMWytt
	dDqAbhRUYjqjG11UJjDPSXIS05FxBZh9GAFKUo2N/3zI+19mNjSiaYMOjLVk5v3uJ6vAjWpsUTl
	ED2fVAdRP7OFy8KjgFIQEg2VxzY1mf/IrIDDwjdQp8WcjK+4MAofnwkmWg
X-Google-Smtp-Source: AGHT+IHnN70HcY6VqId76V2Fium0LoTjsjCOhICOnZah512u7vpBHuld1VklT35Nc8Jl0M9VCj6zfw==
X-Received: by 2002:a05:600c:5488:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-477870bdf2amr21149885e9.34.1762937320671;
        Wed, 12 Nov 2025 00:48:40 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47789ffea1esm3732645e9.13.2025.11.12.00.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:48:39 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:48:20 +0000
Subject: [PATCH 1/4] soc: samsung: exynos-chipid: prepend exynos_ to a
 method's name
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-chipid-trivial-v1-1-ec2dea03bd83@linaro.org>
References: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
In-Reply-To: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762937318; l=1239;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7druEga/Beb9/UD0KVweY5n8TbkTPFBJtmEG9o1IjOw=;
 b=N1mZw0ORtHrf96WaYt+Xj7F23BBnNpcHrGV8KfTAnUSHyfJr92KB7oKg0NxAi49zaCk5kHrph
 0efls+TZc5WA/It36WYBngiDFYhBUehpqOeChlNefq4Hizd3mAQWTWO
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Avoid name space pollution and prepend exynos_ to
product_id_to_soc_id(). Add a blank line to make things readable.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index d3b4b5508e0c808ee9f7b0039073ef57915d60fc..cdab1d4326b9de5df477a0545839b7b8b402d55d 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -70,7 +70,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOSAUTOV920", 0x0A920000 },
 };
 
-static const char *product_id_to_soc_id(unsigned int product_id)
+static const char *exynos_product_id_to_soc_id(unsigned int product_id)
 {
 	int i;
 
@@ -141,7 +141,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 						soc_info.revision);
 	if (!soc_dev_attr->revision)
 		return -ENOMEM;
-	soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
+
+	soc_dev_attr->soc_id = exynos_product_id_to_soc_id(soc_info.product_id);
 	if (!soc_dev_attr->soc_id) {
 		pr_err("Unknown SoC\n");
 		return -ENODEV;

-- 
2.51.2.1041.gc1ab5b90ca-goog

