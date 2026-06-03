Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92911D5174
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Jun 2026 00:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780448191; cv=none; b=Dct1y2lV//EQW2x5DZDfymri+njLxyCYvzhM3+x3D/BElm0saAhvHl537J2O+nnKy2lOvMByctmV+6ojS1NNJxl/T5OfEjS/lB7PS658mAlBuwtss0/8dBpY28zBmZqez4qd5WzTG0ilNbSNk4Us33Jqll8F5YC/2WlaTJ2P2UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780448191; c=relaxed/simple;
	bh=Ta2gQrJVkAi/klbAc4VEy7bJguUUOZQRzpXiyaE7gDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cOBH5DGhclzWzkdWA8uxPTByOWs/RDuBeUTOBsCGFAeKnPZJiQe/IpsSeIZW0dKTV9+XN0dtR0fz37Wx0PYXVE6D3vCDWtzQOXF3AFBnuv2Ei+qXKa6wfzkx6Kxw2gQHIjsfTo8f90AP0UzBCSMRoHZwDzTxOTM6xxdERoMxeX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzwZF37f; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzwZF37f"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-91550c6ea8eso463528785a.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Jun 2026 17:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780448189; x=1781052989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uBYTSeXQapsOuHzeBt9LtaLn+b+KZK8UfNhCrwV35RE=;
        b=SzwZF37ftn54sDaz+zxNNMWDjkK2hNGA2rjklzsTpg1wWoYdTMDCbBZ46Jk8ClawiM
         489kax+TGnZMDtxosZVDyUIOiJH286bsybFcXg8wF3tTp9VoQIwPpHj1wLzk4PPD/asd
         ZMqFoIQxfKtjGR6eDmJBovTS9cw+OysQrsqNnrDTRGsf7C9904rDsqogPa3cmsaYMf6T
         mMxtfqf7M2ANDwZcOOSc1EJJBLdhB3tv5JwMlfxxpWcd+gx2MTUKl4U+AlumnCe6Imn3
         3sa97RkfXjSM96PqFkk8kgS1eikdyPbNE9EHAvjyeNa8vVLHAGmMtXfvd0H0zVwvDVYo
         ypmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780448189; x=1781052989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBYTSeXQapsOuHzeBt9LtaLn+b+KZK8UfNhCrwV35RE=;
        b=jtJPzxO+ReTodIET+4dSUrQ/gREfPrEW3TvMr9PyK/s+VPEPDhTySEX313wo3T1wlP
         BKoaYVe6JzoMhAO89D7TCzAAAqoNAQA4JlRD9sslOE0TTvZQ8WDFJ8YZEtJ8Kr3ioiZN
         rPWhfLr8GKtmEb1goOrMU4bTvuoBHvgWhx/t4x2hlk22wOk5lciAVrzONmf9G3yCZEwP
         GyvAAPhSqtegh01WyhdkSjdzf1dCVd9/t2nkL0gWfumrWftuol3z7upnvNb7TPQL0tV3
         BhepAdXZ3F9O1SQPQySgIp88PkrJgwVYvJ7BsV5G6NMExJIZ/gPpbfXB+dvYm0K52fyF
         605Q==
X-Forwarded-Encrypted: i=1; AFNElJ++j9ATwxk8MieVQCEEelxLBezd/Ua1MgpMefswIDj7TsxGo7SG6JybLcOFCb0uYoffrj6WVM3Z1cJ3CRcBVxemuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRRyx2cVErorJYyfQMyT9EcqDpfB7vaq1hBIbZlxqnEu9LEOS9
	Lo+gdSQ8kFIiU72uLzj0vdOrx1uYAWaIyVyBl86oYS8DuAeTJ+4X10Xb
X-Gm-Gg: Acq92OFlWGimgh03RxeNgbgtA38tbeS0tNplqKR8Eu8w49hWNusyV0ErprNnLavxSnc
	+h40++ob5IXnjZjxpK0W3Zj/h/xU9WqGgZvfLc8JIPv5IyhcSDT3V6mAm4Sx+mYE3DHT5xDJ09F
	bu3zklQPxgY4MMVoQ7AeTnK6J0E6olhqDuiQ1AH53bEtdbP7CQfh+/uNztHyAJIRWmCZzbcMNNb
	YdO5TdtjyxdSNKJ/29WroRkoeR/sK1JiuqbFSaLhYCDkIKSlg5owjte5TZRpcevu4YI6tiR/i6z
	7muohpkrhGBE1qMo7s7H08TCt4X5Emi+BrXiZl4j2XONo7gVZU5NOYqqBODuTA9ywVvb/oGfbzA
	Cm5JVoxdtNM228Y5Uoow6cbu36xOSLpcLV9pBmLdUcGSd+c5qoGPSkRsEyxFyLKzQ1DCpOMcfT9
	sg6/gNFl5Kh58JprD4JrmonQzQGzuvcvP3eBhyQzequ5pZjIcX/vIQo3TpqepIugjacXaS5c2Nq
	eztejSIj+DK3BVQcHid0RMy9dFiyCDyJPo4iTHAY5XZNw==
X-Received: by 2002:a05:620a:6403:b0:914:9ecb:9adb with SMTP id af79cd13be357-9158a834e25mr269631485a.50.1780448188737;
        Tue, 02 Jun 2026 17:56:28 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00ac5esm99574885a.6.2026.06.02.17.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 17:56:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] thermal/samsung: Use platform_get_irq() in exynos_tmu
Date: Tue,  2 Jun 2026 17:56:08 -0700
Message-ID: <20260603005608.227153-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace deprecated irq_of_parse_and_map() with platform_get_irq() for IRQ
retrieval in exynos_tmu, and change error handling to propagate the error
code directly. This improves maintainability and aligns with standard
driver practices. irq_of_parse_and_map() requires irq_dispose_mapping(),
which is missing.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47a99b3c5395..ff81b81b4532 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -846,10 +846,10 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 	if (!data || !pdev->dev.of_node)
 		return -ENODEV;
 
-	data->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (data->irq <= 0) {
+	data->irq = platform_get_irq(pdev, 0);
+	if (data->irq < 0) {
 		dev_err(&pdev->dev, "failed to get IRQ\n");
-		return -ENODEV;
+		return data->irq;
 	}
 
 	if (of_address_to_resource(pdev->dev.of_node, 0, &res)) {
-- 
2.54.0

