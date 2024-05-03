Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC8F148840
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 May 2024 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714724846; cv=none; b=Arc8A211Hb6+qVRFcYvdTn2Rcwqp1QtFa70rWvc1mZYlNUpJxMWGs8bk6Soe7r/YKbHvKI9MluAIAj/kXKJbOBNnzM3VJBgPJVYEfqswQbmocjgNh/qGb2sAgxQxIvVrmg2Xe93m1Gru+psB+6rRtPlt+mNASu2HITW9KmhvkWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714724846; c=relaxed/simple;
	bh=IEfn+rA7KWKKyDU/jxXAsX8WmECqMPMDg0OqlVECxMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rze+qLCmCOtMA1vy0QiJriU+P/st/3d3odoK75WMsch6xL0ZoDRsAdCQt1DTVp/ESj2e+gNQo8FciIs7yNqKEJdDrg7cTQO0yWuR/H+qWwGUAnnmAqNZCEd9ob8Ac9iK/C8I/K22/mlB8zS9CVs3VOSn0GQg2gORYEYgkpQnJRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JVDTMsEF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JVDTMsEF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41bab13ca4eso47649445e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 May 2024 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714724843; x=1715329643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T6a6lUh+GY188jtaldul0p+3R0GTrct1Qv8MGiWgRPU=;
        b=JVDTMsEFBPBEPLgHDzzuvQQNIXehnnl4nf/bvl0JHtaEAkfzoleCVcIUSVUHXYhKDe
         oUmP9dveq+rEAS2tWqDRs0R0bYUPMJrUkke+DJD9GtlqbNqg/ZeBz+fkyr4on6uP4nz/
         5ZYlfICLbCQxH8N4HjgRC2q2NTKP/Q7T/Nu/Dl9EQnURPaoMAbmNwnKC4o+q03k9QxA1
         wRZMRB/mCco4rzJE/5ytImAyrA0nj6ldhHRCSdpJ0mkwd1Cj/jGVKGu6Jvv28xgShZU8
         CyubNM0KpV9ZVApDUGxcNGju1xYX9n98/g3gFKecfHjsyvD7FIsb86M/WbvVdYXiHNPZ
         vTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714724843; x=1715329643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6a6lUh+GY188jtaldul0p+3R0GTrct1Qv8MGiWgRPU=;
        b=T0XzTx6T4GchnNBZk47utlw25itF4Zt+96J1LmfbCRgRRt4xkDNHJ4Hmm7Lu7FIUtw
         65pnOGEWllV7iShvu5hq4OqarMwkpAMeg68DdvQe9wHyTuwhoy5z/muBdZ17jUDgiNu4
         u2VBY8pQz/pIK/dpV23C/IbDnCNWqas0XxJ8reLu0YibObbNY1z89NWva0kKXLYPE3/k
         VSDoUXyiVFqb2jcgt/qBf2IEYOKw1PA/yXUe13/2w8WQoZnA7R00UWCl5XMWbf7bjZyB
         gj8B4Doc5KUiglc+lfFUyNYllQ/GPdl135E40oG8GA0Uy+AzsXKlqG37douUvshsC9M/
         CIJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMxIeCDtrwoEbF9l7gU7cjENSLjSZ8Nxcj+5Egc+FaYW+FGs1ZnYUVwfnbUeF7Q6luK5grzuLF9EDm2kgrv69P8rDFDmEHyWfYbFNj6qyr+Uw=
X-Gm-Message-State: AOJu0YwOlID6O4a3s5psZ+/GNE99dLXMKyGf38zZRB2R3L22RZMsNr5W
	s2C1t6Vr0qlP4FVrJyyv2fYYQsyEwDZMwhCqUwRQ9VKtQqzZRmMbn43kTFNNOZs=
X-Google-Smtp-Source: AGHT+IH+dWf8de6Y0dzA0LihElBWCS6qe1eDpqaJVWGQWI7rqiM4itGea69KiJ4DSak/Q8qdGVJp/Q==
X-Received: by 2002:a05:600c:4505:b0:41a:a08f:2696 with SMTP id t5-20020a05600c450500b0041aa08f2696mr1673113wmo.12.1714724843540;
        Fri, 03 May 2024 01:27:23 -0700 (PDT)
Received: from ta2.c.googlers.com.com (203.75.199.104.bc.googleusercontent.com. [104.199.75.203])
        by smtp.gmail.com with ESMTPSA id l8-20020a05600c4f0800b0041bfa349cadsm8488050wmq.16.2024.05.03.01.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 01:27:23 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: m.szyprowski@samsung.com,
	joro@8bytes.org
Cc: will@kernel.org,
	robin.murphy@arm.com,
	krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] iommu/exynos: trivial use of local dev variable
Date: Fri,  3 May 2024 08:27:20 +0000
Message-ID: <20240503082720.966423-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

exynos_sysmmu_probe() defines:
	struct device *dev = &pdev->dev;
then initializes:
	data->sysmmu = dev;

Replace further &pdev->dev and data->sysmmu use with dev.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/iommu/exynos-iommu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index d98c9161948a..447cf0d07625 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -774,8 +774,7 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 
 	__sysmmu_get_version(data);
 
-	ret = iommu_device_sysfs_add(&data->iommu, &pdev->dev, NULL,
-				     dev_name(data->sysmmu));
+	ret = iommu_device_sysfs_add(&data->iommu, dev, NULL, dev_name(dev));
 	if (ret)
 		return ret;
 
@@ -806,7 +805,7 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 	 * dma mapping operations on iommu page tables (cpu cache flush)
 	 */
 	if (!dma_dev)
-		dma_dev = &pdev->dev;
+		dma_dev = dev;
 
 	pm_runtime_enable(dev);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

