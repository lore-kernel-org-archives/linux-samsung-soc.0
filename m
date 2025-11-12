Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E71E2FD661
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762937325; cv=none; b=mEIfjEGefnArR+yS7neaJFEyYttNwWajLKVH4+BqYO9hU+wT2/Pggo5rE6cV94vfwdtcC6TxX4gA/T4dCS+b5AgpWiVa6V5hI4E51jDQeVGU1F7jkDsDDFmcR3MF6sg21QEZ8p6qa/tZgCqnFVbSdJXnmiFMBDa1OAmIV4CYEp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762937325; c=relaxed/simple;
	bh=RCAfXidI80M/Q7eFcJ2WvQagTMEdD/ohdv6ENAxLfKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tI22rybe+F4UMpnG+7jrfzBpgGrPnta5JaO2XSBiKzsekVcuHKJhcJlZEHIrAzYTusGq1RMpM7GXeK42pyKng3naHUYJldp7MIVLHvTBjHEKNwwJ+pMkO0TPK/8zWVJnzM2iMmkkG64GgCr9lkkcsCeyuIMbItrlbaGkoJ0rXKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EU1aoFlN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EU1aoFlN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47777000dadso3572335e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 00:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762937322; x=1763542122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVPUnWtWGToKWpcPTHZ/hxaM2+CTnOqNCH/2mEyOSiU=;
        b=EU1aoFlNtlFAQvTUUvSSggU+/eDvRKLjo5HgN+c2j0jTzZbQuoWF/p8+FbUwfoRSPX
         GeQdK3/js/k+6AjukreNx9qk3o0p8kxZ0KQgNxQG89vGgAumONsbhgiuuW/ju0qNcnUB
         Jq4MzKkWV1y6J8l7bl0mU9WuAQY45Atcx9Z04s6jt478wC3bo44GKNTdCYPZjd71RQv5
         ilU4hsCCHBLoi6EIXiTajFVSs3D6v4hbQtvkqUkRe89NMmOQmCrtOVwsf0Ho4MPg30se
         PxsWgkJXfH6l/qv8sWKhmNh1u6Xr6gD3yrZEJsOm+PqeX5vZ2N18F/Mvn+1hW0H9YjOO
         TW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937322; x=1763542122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BVPUnWtWGToKWpcPTHZ/hxaM2+CTnOqNCH/2mEyOSiU=;
        b=dtHsNHEEm0DmS56xxYHLEzcHhAyzQh072NkMsGy7C+MSnebEkEqbcZx+rf6wjn6ILT
         zk7mHyIPdS8oOxNOqQEb7aoF9NHYP5fzoCv1NRJ+UToHPLZKz/iT+f4jopvCHeQDUBgr
         Qi98bF5DUc6Yxt/zhzZoFnmxhSmKctsVgh2FO+mRSHp2cJpz2WZxqtYjdKB5gb+J++7k
         90CkcvfD/NJz1N9i17+ikLkwcKgmzh3IGkUmAk18tjAo5TvjBqga4XERivhp123MCqwd
         SQpAMX9FVfhF8zvEe/Wn8AgdnpXduS1mKaA1xaXitzjzRLfs5jFQoO8srpAHhlsTqZmN
         XsCg==
X-Forwarded-Encrypted: i=1; AJvYcCWuOREo5GNAUkeYXOEw82V2fE49v8Vi7Qj1O8maeS7HRHpB+U+nX3w2zLYUyKzQReDUfbwxRt5mmXeXcTk5P7pXYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu/olKo/cFOz0jHFuEcgumdPgZEs9UsDYhcT2BvSF296BPSWyr
	CSJaOXqIZL2LwJiiWIrih5YCWKZYXE/QMISGSkqC7rktW5li1sVNihp4BJ7QvdFyozg=
X-Gm-Gg: ASbGncswxEZb2OthsCLdhMwAItM9H/R75ajQLRDRQV9FcS776jVp4j1NbfbOkzVx3/H
	N0L6aTw8CcGkPFfgPBl2kxS0rlnIaFz5MFn59unKi93Hj6NyduYlGA4eX6V3WXaBRhDcT+aJ10a
	+pCc498Q+bzWcZaEx1cDuBjH5T33IxBoAig8z4Nrvfz2nYaF/VWCEq1qRBif5vQT3sqwGDpnlL5
	sy0CWLlfhjRH2rX+MhOZDege739EXfIzf+MB4HcBrnJTPdJ0A6OtoByRkmh1IRAOP+W2UUE6u5q
	RL83kH8sSxbDuJ1kSbJanuN1uL1PCVtjDlJojGeX97HRkUg5L7KVknz4cxInSvir7jdVSEOMOuf
	9I3/UBCb371tDqGEbSo8hkK2TXwU+d234M68Ft8bUsJ8TVHYHAli5Eim9wVuYi05uubyLrO5Iv8
	Uzzol0SpeQ0G6y8vKsmn2lxCdBWWrglFbP0ZHUuicm+Ct+LyODZCd1b+Ht
X-Google-Smtp-Source: AGHT+IEt7OwDsDcJANR+ViPUh1ScTLjLVqjF1eOouEZusB6zlVJflofXVhyDNqKf92Nzra23MWQEJQ==
X-Received: by 2002:a05:600c:4f8f:b0:46f:b32e:5094 with SMTP id 5b1f17b1804b1-477870a6e5fmr21321335e9.32.1762937321949;
        Wed, 12 Nov 2025 00:48:41 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47789ffea1esm3732645e9.13.2025.11.12.00.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:48:41 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:48:22 +0000
Subject: [PATCH 3/4] soc: samsung: exynos-chipid: simplify with
 dev_err_probe
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-chipid-trivial-v1-3-ec2dea03bd83@linaro.org>
References: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
In-Reply-To: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762937318; l=1084;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=RCAfXidI80M/Q7eFcJ2WvQagTMEdD/ohdv6ENAxLfKc=;
 b=Iuyx1Rcmem+gTbp+iq/ldL4czfZa+yzrFYBAtmElJwUtpSKiugcRP40UAvhwbCRq/MQa7IpyM
 B0bxpDc4AAaBbtxve8UQ6SDwWZlyqRx/xCuMxuy+I4U++uW/w30900h
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Use dev_err_probe() to make error code handling simpler and to get
the standardized format of the error code ("ENODEV" instead of -19).

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 3671ed718b933a2dbb9e154202bd3235e3efd758..b5866a324d8ae911a5c99d0290328efdcc072dfd 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -143,10 +143,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	soc_dev_attr->soc_id = exynos_product_id_to_soc_id(soc_info.product_id);
-	if (!soc_dev_attr->soc_id) {
-		pr_err("Unknown SoC\n");
-		return -ENODEV;
-	}
+	if (!soc_dev_attr->soc_id)
+		return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
 
 	/* please note that the actual registration will be deferred */
 	soc_dev = soc_device_register(soc_dev_attr);

-- 
2.51.2.1041.gc1ab5b90ca-goog

