Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EF53B5E01
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2026 20:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779913493; cv=none; b=FgPE2TPjXFxeI2maS/BwOp1IcbWCXpNHwCP3W9Xr1tV68IRxhu8Wiy5hOIHoRQpa/ZZNsqRinMrDuk6K/syE4tsHwxZD6ikmcaE3TqLWqPxV6rf8H/aTZZusbjcBVjKQvpG3RccB77YJdUCllviDTemIU144mrOZNXLr7Uno1xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779913493; c=relaxed/simple;
	bh=hEG04w0NuIiDOJGDNAiKSS/GMggED2A1lv9FYfRa75A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hJsIqgFC3qf4Lxa5hitPMe7kn3SzJRIRnxH2jObCyVvaFQqcSwcQU6uEcLHLfX00nz4pUe6Zr3FdPIqIH8CRzSZB+tdkdxp6nK+xVFGSOvABUncPvnj4hRysGU8boe9E75htNaU0uv0UWd3cgwor7TfKodUGpQwoi5xHKEgxe18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oOU0VJR/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oOU0VJR/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49068493267so26337925e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2026 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779913490; x=1780518290; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4l+LLyxgHRhdEK5jMHn+Sq1qQUJE6RD5Pardc9PeObU=;
        b=oOU0VJR/OFVFbKxEB4cshw7X6pVLA7QD7/VjwOoX8fT19RpMzYcQt/gYE8yfI3YU1z
         9PQdYmxsU+bDU1z+X5F2xvS5WivaSVubiIpY3lT5Fiysr0g12p5pCpHKcY9s9yh/Gh4Y
         6yFcDJyee9lY4JPkUBWchN3tZMkpvQnhYWwboc+vvgZZeI9GjaX+PaOJ1Plc9854R7mY
         8NkXv4xngpJAn6qCePRsBNCdK4tvXxBzBm9NxMBLEgP06XmK/d9Aem0Nj/SvRta4vVT9
         rJgGgbeMmJYJlF9WNbkzF+k+KG2iVLK7C56Llx+GBxPRQenI+V1MjPj2DvDIzSD3HA7W
         MDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779913490; x=1780518290;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4l+LLyxgHRhdEK5jMHn+Sq1qQUJE6RD5Pardc9PeObU=;
        b=SQM/Tbetz/6s3uknCV82yoSs9yvbtGsNj293Qf7D4PiaoKDTvP56Qw8gTg0Q2IMTmC
         kSF4a9ofIDbh4rag3cNux9O1pIpjUZdAZBLmiVjPuKBPgyu81tRyRDSL/wdXEMcBz+Lv
         wHG2taZKGJTzLkCl6b1V/CA7d87YwYATGkk4r7Ca12mnr6/k64txzEfhjyAJWwbX4j4K
         RjpBmuPxUiIA24bwLNGqWLRSvvw6kxrpKxCfjAIvUnD2560It7k2KZuop/krLj0KYR4W
         VpNKmPnRgB0LNmGaa/oTyTkidisG6jezVASE+Es5xK5UX5aOuwPCtaEtxsxovwJ4VVEI
         zJXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QYWD8Mmv8mODDQO0tvxpxD8/MjfOQjkgMInKiExBeZjxb8e2AJj+cWdWhNiZaQiBcmE00v19VAYvn+vcP+2RhKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcCd2DLHGri0Y6xwywByvfhWf6OQWUgKjk9Zn/6mFEBTRzLZoD
	dGudm1S+BLV5XCx7/KGYg4hUAr7ZMk1e0JC6nIK78Qx/luFDsXxhjm/kQVpF/cORY2YfddS0qDg
	soOoB
X-Gm-Gg: Acq92OF+sca7nsWd3kh52jmFtIDCtfZq4pdcY9DRdO6UU9zZya9kfzEjC/UJ8nrpdF4
	jOvoP4tzDnnrc9Ja4N2MYrYv+G7WqpgNp/dkvnEfQTzXmwdQi/DZi7q7GMFxwm7uB+pOstvM0TB
	jz33SScmkJTkC5cz1yYYVx4vVOftDAlr/Q9MuC1oE4wvNA062/5fz8SdRYbppLhKqbuDp1p9DL9
	XmFF+WaZc3cpYO1dfFTW39+jUJNXjy0UZ2ddct4YpbTlKteyQs6CS+7MRx/1hMi7CTxXO4JeJsv
	q469UIiT4wJqTjWI4yv8gayrXrdeVvDHnVYiKzlICkSaskWDrGw8LwOdOvTPOQmmfUtk73VBe1L
	HqtPASt6kTKuYqki0HatCayHgAQJbA7S3ns2dN9tBwiPK00IVWZbaqNvsGbDtTQqsh37PnfO/U/
	pjmFMN3AQXjFftQvrTy9eSN4hl/c37wYK7A7cRUOOTMR75DxAMMeEeSPhiGzfDnm9v6Hc=
X-Received: by 2002:a05:600c:2a8b:b0:48f:da34:ec4e with SMTP id 5b1f17b1804b1-490426cf045mr286111045e9.19.1779913490478;
        Wed, 27 May 2026 13:24:50 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3124:1301:985d:3d5a:fde7:e337])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454cfcaesm412208435e9.4.2026.05.27.13.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:24:49 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 27 May 2026 21:24:29 +0100
Subject: [PATCH] MAINTAINERS: Add myself as a co-maintainer of Samsung
 Exynos SoCs
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-samsung-soc-maintainer-v1-1-40829c3fb133@linaro.org>
X-B4-Tracking: v=1; b=H4sIAP1SF2oC/x2MQQ5AMBAAvyJ7tkk1Ua2viEOxag9KuohE/F3jM
 Ic5zDwglJgE2uKBRBcLbzFLVRYwLj4GQp6yg1baqFo3KH6VMwaUbcTVczwylNAM1jkalLGughz
 viWa+/3HXv+8HC4fpfmgAAAA=
X-Change-ID: 20260527-samsung-soc-maintainer-6b899eb06891
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=hEG04w0NuIiDOJGDNAiKSS/GMggED2A1lv9FYfRa75A=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqF1MPMU8Ic8JlboSiI5k7igA1U83zw0RCTt1B4
 R05mOiL1h+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCahdTDwAKCRDO6LjWAjRy
 uhmTEACJSxwoy6PsUtWND072OkpQv3ISdQJEft3gHAsz34eVOArwTXYah4QdDAjVn/ki3bCpiKb
 7fBDnEaAlsxBAmR5CjRXgwAz9nfD3FHql458tCnzxxhCieQ6tSpbaR3tgiYHoLPNwoUVTQi0tNM
 vosB740yqMfwEvmOfVnFeekKd8M6Ig31JjUmZze0uU8md4Fusb624wiCt4UhFYMEq03+sosjFBy
 17tWuQT8woobzFAYP3+rZf791BDbAF+WRQYwJNyWEYbtBVTd5nNQ3xQc//h/2teRWBVhn94si+z
 C+od8VVEsm/W9rfopXseAprSnyKc2O5sn5K7pt4DB0RoolI9CPTnAu1AC09EGL6FCsMCDerRUYb
 5ruwhW5g7htEBTpUd1d9AUQROiXvpqSgYOCPmdp6nBPRLOLst4RyCWj+ihexbRFmrd0R9la77I8
 ENPMNPm+RraOAYlbvbyCJ5H6a6k6djTKPoHJ+0CWK+ovSgeXWA2lytYLmVjmZr7Nx9yXp5SEUaj
 ZjdGwB12KLWhhk1Pz72gY/EJ+GiNuU3dZDs8jwK2zaaE6DnlJ4r0fX0fan9E05/XbA7roo1LTjt
 UOr9wEvOPpcPyfCAiAEREwa8wfUyDT51exrurjt9KUOLwxZw7nr9/dhnFoxOFsJKWOqTjyRlxv8
 qVCuMTesEp5yJig==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

As Google Tensor gs101 is based off a Samsung Exynos design I've been
working on many of these drivers and have an interest in helping maintain
this code.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
This follows discussions with Krzysztof about expanding the Samsung SoC
maintenance in the kernel.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4087b67bbc69..6f0246f2336c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3504,6 +3504,7 @@ K:	(?:\b|_)ROCKCHIP(?:\b|_)
 
 ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Peter Griffin <peter.griffin@linaro.org>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org

---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260527-samsung-soc-maintainer-6b899eb06891

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

