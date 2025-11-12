Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028812FCC12
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 08:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762937324; cv=none; b=erTmcJ95rU+wQZpoDRcbzHnwygN9SExldQ0vgmIyfTOowj//UZ7/H+qyYUm0A9y9AnHMMSaMDQTPjnz3A3Nzlmk8Hh+GtX3JPVEJdRGWWzNhgLqVFbKxgkD46EMUwGCNplD/D8EhafxwiqYHpvwTGPdL/Tbb3dkpMwld+n31x8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762937324; c=relaxed/simple;
	bh=EhORVg5AyonyLqgYmZ/jq75ZA9P5rTDSsH8wOv8oehM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=suqYhRYlkH6f5mSnpK21c8dJQ1OpilOeMZLaj+Q2d4eHSEdFqc1gpHoqTpZ3GHoeVADhEmiLE1Z8sjqDnLYF3u9SHuOJDRgNbPS/UKOJtT38RPYOf+CgSfr7XGwIYMjexfQ/sgzxPV6zrjKB/Zfb5Hxe4LrG2rg3ebOwIRnhzWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b+xl1xP0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b+xl1xP0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775ae77516so5756845e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 00:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762937321; x=1763542121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6j1Zr2nqSljgnBt8lg1GB0+pNJF6HsLCg+rohPfLc0=;
        b=b+xl1xP0IS3gDhfYmXlVsKVN0CcH2wsTZiDsufMUo4/vowIjLOf2W7U96puC/TuD0/
         vYmMQqmal8pFK7ZOnNeRbfyz6rz1teNmnEMniUupG1njrDV5FNhPzyvBKt4wz704T7fU
         krIII08PiIvaxAAuekL7VGNC/ZAJVhsxAi7RR+EtlnqdfOggpkzOooo4AaUPeiVDd/SH
         Cq1agcJfh0UcTBJFGFRLhWAs4LUymIgJMPC/fo9TdLygWDvJrgZBb0T1qw1ZQY7ZNnL5
         kHQtmcwQ5PHe4hApbukSb/oeJsg97plsRXJtjJCl9O3gCUdmIWgb+7YPB8JHjY7MeCU2
         wSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937321; x=1763542121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U6j1Zr2nqSljgnBt8lg1GB0+pNJF6HsLCg+rohPfLc0=;
        b=YgTzJ/GqzQReKri5Xf1DN4q/+ugC+lyoo+CLb+Ta9lIhpBgeq6BkKDpbhG2DtZacAY
         fII/GmEj0jamNv7Cv8XGJZAM8TdRyASrLaf2UvJLe/4uKT7K1Oxq0kr/2ET/ttHB0kk5
         wirNLcXb4ov1OK9XOS9bkd8A9+b6WnFGd/jWgwwROXrC81Mpo4BQLMfZy147RaDww9GO
         GcEiHb7lIAqYDjs/MuPoy5aeTHDwfojq6f0Qd4w54H8pvl4DFUNRfD5WKn17SG1y7vQm
         etF4V//InM3BaUqgHokaDD5aeRYMrK5aG1ex8+mohMMnBuey4l5BdmipIh1fAe482moc
         l65Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJHfHyurT5t0EQnjrQmpnMPkXRDaMq4xBWqhG7dRcapfrBrpgnqL9bi8lt75IW5EYKAr0gnzDbnUFL16mjQipzpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj+xdToa928PeefE+1sUWyp8oTTdZHN+ZIUVGXpKIrbWGn2s1K
	PBiPO/qBSMU8j9lLWPIxuTsM/Q2Vga0EOFZlq7xn4FAKmHnwuTBKVA5Mkznqx6927JU=
X-Gm-Gg: ASbGncvxiWv2q/LSsx0NfDxCv1roEOYCZHg4EFjCkA0AjTj9l0y4iuRmM3H79hGpzIN
	k/XKAxacjJoQBvZOrRMq9xqDOqk73n+VDx0UrndlkD6t4oJEfR2XVhnwpigHAz4WTEUsjZcflhj
	OgcD3OYHDpPin3m4XMBvIPLM/I2PEKlWu+yv7Fee+Fbf/8m8Af2Df8fuoMz4cQeJkYF1+PLm6nq
	hC+eHzsJZz59jhqaYpI6v6AbEDl80KJyzSWZu5DIvqEPl+o3hL7jd8s571QgIbYPckudn4vSGIg
	qrm+M1Bl2IibdJfljiZzdT/Q6gi2kjU4Au7OW4lfzKkevnm7YeV4FA2DnPeIAsHku6X1fCXeskd
	juxYCd+W/zguCFyRiBFWtBP3qsYo+dpHCIhfOFBx0otqZbGcpKhsb5w8OwbsaPdOI0p6JgNEiRq
	tqw1rKHhQqP3prNngiZETvuAwRK99e8GlKDrAg2PLZGrcOxo+/H/obZY/pmKKt+E29Dqo=
X-Google-Smtp-Source: AGHT+IHRlvqObTp3cztt6xzj5JbmMm8qTfj4NgJhVxdpVjTif65CUEVPFygwa1pmkHguCLJvzFL+7g==
X-Received: by 2002:a05:600c:1d0f:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-4778704cc7amr17363625e9.10.1762937321328;
        Wed, 12 Nov 2025 00:48:41 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47789ffea1esm3732645e9.13.2025.11.12.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:48:40 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:48:21 +0000
Subject: [PATCH 2/4] soc: samsung: exynos-chipid: downgrade dev_info to
 dev_dbg for soc info
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-chipid-trivial-v1-2-ec2dea03bd83@linaro.org>
References: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
In-Reply-To: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762937318; l=1028;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=EhORVg5AyonyLqgYmZ/jq75ZA9P5rTDSsH8wOv8oehM=;
 b=KQx82sEfBGkvY2sSWUcfokNVQxltnCs2thIob42A5Z2BsHO52ZwpBzxC187lGiaoZUytR/WBf
 vin0DwG0RlxB7zwM/KikyLCfd60l8+F0Z4xUdL3ME26YySbIxkUe3LB
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The SoC information is exposed to userspace using the standard soc
interface. Downgrade to dev_dbg to stop polluting the console log.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index cdab1d4326b9de5df477a0545839b7b8b402d55d..3671ed718b933a2dbb9e154202bd3235e3efd758 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -159,8 +159,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, soc_dev);
 
-	dev_info(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
-		 soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
+	dev_dbg(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
+		soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
 
 	return 0;
 

-- 
2.51.2.1041.gc1ab5b90ca-goog

