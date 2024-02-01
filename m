Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A635B046
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Feb 2024 17:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706808150; cv=none; b=gYalKnskj8CKlxFLr6Yf1hXex8rEfrzL4inpCkBXavK7PAr2a+YCV/24VxXwotlytGwplh4JEpXGEdSb1ezS/8fQT4KjCnaIgKE8FzbVkpQiFeLUaYaLUmdEiwMfV0FsBsAzjB055WlLSqljJUOVw+3lggNJh+xI8Pjm8iU91rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706808150; c=relaxed/simple;
	bh=wio2kvsDF0Lwbbyfrpz0pcyiINO/4Uw796iSRQW0d6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FyQSSWW0HhXEvg7/w8IOQdsS+9i4hzCjqv5rQzuE0XZflPe+/8zfb5sUsQWsohz7BfWZrA1+cBL0GiDyLWaY48Wp6CleBXv7lwsxzlouhN/xrvIfRvAXIX0B9Lcxlsd/AqFyk2d1MXj8XrayAfDHy0a2Xwmp0MFVi+oJVrpBmw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oZ3a9pb+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oZ3a9pb+"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33934567777so746430f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Feb 2024 09:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706808147; x=1707412947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3CJ0iWr5V8UXz357xaAC95F3gSkf5APXRSfTg5VtQM=;
        b=oZ3a9pb++WndpFEuncurBjNMEzeztvREzSruBVu8n3JrU2d9FAUs49pT6S/IrJKDnE
         eb9p8XhHJOjRLf7zsL0xrxa6hOxoUh5r95fPXrOPoeSLOn5o+Li7K2HzwmertGwXyCGu
         /0Veq+TVUYI7EVz3Z90AuOwE9ddZfBMB1wLqOunkoC6TV+W2PWzb3Hqk5cc4PCHhLWgF
         pQbSURa9m4aByv8D0ND7JNi8FhkPjelaEJ+7p6dkp7JFL9RiLyocpkboT9aJv2BFqygy
         DX5VjrhVwEOrYDEa6Co+tkPMAUsr97q8o46dTiFPWCVpFUAvCQrVo2OaNIqaNX+OGc9b
         VeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706808147; x=1707412947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3CJ0iWr5V8UXz357xaAC95F3gSkf5APXRSfTg5VtQM=;
        b=hLQ5EzShDoP76AMn3bTz8ZSiNRNdthRQde8/Sd+BldurcSmKWuPxcIqutlELKj5QvZ
         2KOSChMsIzvi0rvJTdPHIbBNeySriihNN9tV5lrPLVllSl+QT0+V15H1PMlWhg35mjkE
         Tslw+51Z/WBNDDRGarwXUtvbGtBqZkBgWlv97AgGL4V7F4YxOzGTxmn19Q8QNEi5KsU8
         Uffhe72sSVEo+bjMoZV+VGUJxLcrQUqz0EG34zC3O+ynxVfdUWWFU/qndfrAOR8UgjIk
         vKf9S0jSDp9nJRMXhM+0vBy1e0oSfjOm8Y3PGOu9M9hsSt81nRoMzKh7JRji7sDjr2Na
         CvHg==
X-Gm-Message-State: AOJu0YxTAoCTaIxZdaAp6HjXNvNbpUvWWUf/bqwO99o4Klvofhn12uEH
	OXvrwpjDES1tl7m6HXnxBwagEBBttCND/er5Hu8LRrt3H/HWQSZj2FHWmWjxiUmK2pzLT/1PmrA
	aYgE0hQ==
X-Google-Smtp-Source: AGHT+IG9KadcY2xJjtBrfhIPHRE6LP7zQktj8OvuqEn4klZ3Gzs5w6aG6iH028vzAbgRE2G2RFSCjQ==
X-Received: by 2002:a05:6000:ccb:b0:33a:ff92:6e2b with SMTP id dq11-20020a0560000ccb00b0033aff926e2bmr4389377wrb.4.1706808147348;
        Thu, 01 Feb 2024 09:22:27 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU0BhG3V9zNV82xJGHjYnuO0Z4gpRCANfGDa95RdqgHtQTIMdD71aouDdJeaXM6j3dFwUJWzOlXRtZHLITrFdkFg/4voaPT/81epNOedVuw/ACRtDmU504ztpfV6kyyjc5gepYfgCgFI6WkhluYhbMdOXhJgQGZjiSV0I9s4UzjNYQCymKENRw8uYsSolnzVwjDh0Io4XZbyEcOa6FapOguMvuc3OxtxR/9FgQInsz+bLOBKN9/k8lTk/LfCuY5sghJ5sVZGL8m4yVcV5yz2d/ZMHBqgE/8FwdkDcob2+dcYZCV3tCfcar6LI2PV3jOio5uQkX2KJZGm7/j2a/5qFBzWeb/E+0nJFijyv23O8n+bRR8ez4I62lWGWEhNgQMClXH3XVnHlBgZCo5Wpg+OcVFHvG0kToKU3XwnBcnK7zteV/uWj1sviNm3HwldDb9bcG+2KHFm0g7Z9dZdz4aDQRl0jLIyOV4GuKP1gKANwfJkan2d7pHhj78Aagr/AAimbE7w4jIEbZ4u6nNK9XdV468cHg5imPRbtM/ijszlM6gwotwD7nWcGu0wZ8phr9z3X4=
Received: from tux.Home ([2a02:c7c:7213:c700:e992:6869:474c:a63f])
        by smtp.gmail.com with ESMTPSA id f15-20020a056000036f00b00337d84efaf7sm16733582wrf.74.2024.02.01.09.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 09:22:27 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org,
	semen.protsenko@linaro.org,
	peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	klimov.linux@gmail.com,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	arnd@arndb.de
Subject: [PATCH 3/4] soc: samsung: exynos-chipid: add Google Tensor gs101 SoC support
Date: Thu,  1 Feb 2024 17:22:23 +0000
Message-ID: <20240201172224.574238-3-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201172224.574238-1-alexey.klimov@linaro.org>
References: <20240201172224.574238-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add GS101 information to soc_ids table and related entries to other
places. This SoC product id is "0x09845000".

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index b1118d37779e..7fee6094db12 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -60,6 +60,8 @@ static const struct exynos_soc_id {
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },
+	/* Compatible with: google,gs101-chipid */
+	{ "GS101", 0x09845000 },
 };
 
 static const char *product_id_to_soc_id(unsigned int product_id)
@@ -178,8 +180,17 @@ static const struct exynos_chipid_variant exynos850_chipid_drv_data = {
 	.sub_rev_shift	= 16,
 };
 
+static const struct exynos_chipid_variant gs101_chipid_drv_data = {
+	.rev_reg	= 0x10,
+	.main_rev_shift	= 0,
+	.sub_rev_shift	= 16,
+};
+
 static const struct of_device_id exynos_chipid_of_device_ids[] = {
 	{
+		.compatible	= "google,gs101-chipid",
+		.data		= &gs101_chipid_drv_data,
+	}, {
 		.compatible	= "samsung,exynos4210-chipid",
 		.data		= &exynos4210_chipid_drv_data,
 	}, {
-- 
2.43.0

