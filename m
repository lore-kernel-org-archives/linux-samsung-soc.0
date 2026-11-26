Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795668731;
	b=t2YX32rqQsuFffiWBzgA88b4FaFAnOFD3xpCQYun7fpnc21AT0LIyqvReuC9oYB2/HIT
	 noKPPOSPu4+dzd2w2vTvNrZ0O5x3UiqItrKtbeqyvpv9nwl/jxEuSmYjE6uz0i/GoBeNp
	 m3oiZhvNo5DCEVQ7QE8GaDjvcJ0dN7qwSQPrBPzZO0EW4r5IqO6drQqa6L1T66u9Qa0wI
	 RnmQ8x/e8K42PiIIEQzj8ZsXKVSSpkKEoxfiWp2KV1egGIaujeyIY7x8nZIw3ipmdq9CV
	 SvJGV6Mivf3jHGSltl60GufuVNPz8OQwCte1EmB05nExWU2vFRKfsYlf/i/voF0G+Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795668731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S3q8xfPDIBkp3Q9114uqxEU+8XToiBPIWTZl/xj0hLw=;
	b=Uf5hCtod+kEmO+vrtgjVElscblBIIk/sEBxbUNu5igdsVUsK7fo4l1SjiiqYq1mbomyp
	 IjzbNvLphvPFTQ5CRaLTu8zhcxJc33oHWi9yiJ5disapRpU82Bcsx3vhuBu/c2bbas5Tm
	 OvlTzNRNuFRdmG6ZS9ekxNMh3s4QWPYMsiaFmBxZFwLLqgX58rfSCJpJwBfP4swhAX9ud
	 n3OVnuZPWblE3bmUpN/u0K7zrPBp4FHGnZZEACoCbkPDGeTjgPGc6cXaEoU1Aly4I+fSR
	 pglh5LhLEoztpo6/FoqiZ+3hezIDWcCMyavptr2vv4X73L9H0KpDc/L31CcsZDE9rHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PxMtADLx;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70548606A321
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 04:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70548606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PxMtADLx
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f02ee04378so52767345ad.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 20:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795668731; x=1796273531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3q8xfPDIBkp3Q9114uqxEU+8XToiBPIWTZl/xj0hLw=;
        b=PxMtADLxgQywbpOu55+IWj6I1eNzRpzXQEgsa9sOqYKUYvhjiLQcp2nY39hwQpwYCy
         E8p+EJmBUkPocvUQSxpaI9A+rdeGsOCqhU+266Q2Dm/ivfUXI9ET7wiQz7FJ4EK+aRR/
         sGoEMOfrizBqGjI4k6PooxW0ORmmQcHs3tMpRdlkVJ3hz9Kps9cmqNHRCAqf/Y3XavUk
         9d2dpcySLkVtB3YVgtDsuTuWwf7cSyi7KFaF2bMB2FkGgjiLBzTPhW0Z0iGju/Euig9U
         WyRGpF3y5E2N3icXayoGw/MpdvCJi2099nQQiR/WnMvNfN5B2PyZ1DcNi3zT0gb6Iknw
         hvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795668731; x=1796273531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3q8xfPDIBkp3Q9114uqxEU+8XToiBPIWTZl/xj0hLw=;
        b=y/CzuznGX68GLNVHR9Sy5MCoQdMhlxMUEkIcnxBF7H7+/THgK9gkFGdGyzilS/xJ0x
         ficA+l6FVw1Qt24N22kvUPjuS9/eVoajjZx5dmr06qwGQD3bSZf4CJKESr/GqlRLUpde
         /UUU3S6wu0Z+JCjaQ6POYAw6J5WzZRn+1gjTQSZCcbfvC+sqXMjvk2eW4u7t51HYqVqY
         uDoikF632XTRTLY9vcr+snLMlXxAoCUQw/YVUiMSVXC+XQlXeb76y17h2EdKd/DvveF2
         OoFcimOWmaXvQPQWR4okcxIhlHS2Aj896AipZ8N/Zh3ccJzz5hu228xwjdFtdRh9fBhl
         kzLA==
X-Forwarded-Encrypted: i=1; AL+hErHZZ8tCz7MBWWJbc8aUv1xPT0u2bmfmjl3HBFe3LeLHIyoODrW3p3lhc8ncmKQK+zScPNrBbSJKiAvBSyCvcgSOkg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9mbiwkpszv0pE82cKRF+OnmKo78cBL/DGDELzw8XTBpEFB9FjT
	msUIeQ6M+TQqeHvL1tIFpAFa+J9NVVbgSjkhlDmo14z6Bga7rJuD0Xhf
X-Gm-Gg: AZFdTZf+2Vg8KZSS5Dl6FeGRL7EJTt1hfQ3y/4ZNSvPA+DRYACi0EBDXVFLtUcXIspV
	2wzXtwTGTeaWd2i5vp4f4U60OinK286lU4oUczm8AAOtLRbYVmr85ShPHGuX89nKWuFOABZy4cT
	hcLdrdZJ6lwtZhm+ruZNRtFjSQZbZhSn3U3vJMjvw/piQWDiU0brFXyZ8qVTinTKXJQMGhUUyRm
	wKmdNQqoE/HCADaaC+ZWXLp8P1Lc5VbMz4353OMwZgYtFFL3KSYRdk0Qs8FcNVVe2+ROP9c+VC3
	sEgpIvrqFYdJRbYnnvip/DNfrKOuP6Q74ONrGm0xdKVqqbSwV0bZNdAqv+FYVFR2iprR6kgLd03
	BAITw+7bKRbY0jJI8xj+qUe7Io5JR83pxME2UyGATRmbSB+9buFsmMRBpAeQm3/2/j3yjZoOYPC
	17ZpF1YQjP4Fh+bfNhP5WV/jtLc1bbR39QR8swRbBNMpcab9BS4RpoybB2Wb2eRaK5CYCoqJkVl
	PDXU9CgOTQPIYVSys3M6csJjCyW303ca0kGkPy9yXQud/4XtuQY7TnK3pXW8G7CBhcmy80BClow
	1vB6FPiQuzm+L/UF5lbne3YJqRwY+3XEKYWNjvAzsiIbRg6MW73Bx5dvhD+DzEah9kMBqLdDEMh
	e0wxwWhycLG6iIWkYnN0XmZGI/46OY+n5CfG/CRTybg==
X-Received: by 2002:a17:902:ce85:b0:2f0:3e44:4761 with SMTP id d9443c01a7336-2f03f25e801mr210179985ad.54.1795668730721;
        Wed, 25 Nov 2026 20:52:10 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad0:1caa::2db:4c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120830sm96700655ad.61.2026.11.25.20.52.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 20:52:10 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Zhiqi Zhang <zhiqizhangg@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] iommu/exynos: Disable runtime PM on registration failure
Date: Thu, 26 Nov 2026 12:52:03 +0800
Message-ID: <20261126045203.62181-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

exynos_sysmmu_probe() enables runtime PM and then registers the SysMMU
with the IOMMU core. If iommu_device_register() fails, the error path
currently only removes the sysfs entry before returning.

That leaves runtime PM enabled for a device whose probe failed. The same
path can also leave dma_dev pointing at this SysMMU when it was the first
one to initialize the global DMA helper device, so later domain allocation
may use a device that never finished probing.

Add an unwind label for iommu_device_register() failures. Disable runtime
PM there, clear dma_dev if this probe set it, and then remove the sysfs
entry as before.

Found during static probe error-path review with help from OpenAI Codex.
The fix was build-tested with ARCH=arm exynos_defconfig and W=1 using an
arm-linux-gnueabihf GCC cross-compiler.

Fixes: bbc4d205d93f ("iommu/exynos: Fix driver initialization sequence")
Cc: stable@vger.kernel.org # 6.2+
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 drivers/iommu/exynos-iommu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 7c337ba96..18a536008 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -844,10 +844,14 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 
 	ret = iommu_device_register(&data->iommu, &exynos_iommu_ops, dev);
 	if (ret)
-		goto err_dma_set_mask;
+		goto err_iommu_register;
 
 	return 0;
 
+err_iommu_register:
+	pm_runtime_disable(dev);
+	if (dma_dev == &pdev->dev)
+		dma_dev = NULL;
 err_dma_set_mask:
 	iommu_device_sysfs_remove(&data->iommu);
 	return ret;

base-commit: ebb7a8dc1e74c705daffe11c2faf38ec2628f838
-- 
2.54.0 (Apple Git-157)

