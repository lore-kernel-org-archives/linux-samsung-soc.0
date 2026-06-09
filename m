Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20B53F39C6
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jun 2026 09:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998769; cv=none; b=JWuVBoRNMREseOMToU+Mb8qNKDI1a9lkF5LUsC0GUCPLF9sZOsnyyIOODZPo7F3qGOKZWHTXrNQ+cGZHtuGIbz9uNIxTu8dL5T8hoAhuN0ZBxkICv2FhqlcC0+Z3QlL0ldnSEWfldsCl8vLrf5WTP5gXiRXtoePpfZQuIHQplmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998769; c=relaxed/simple;
	bh=sg9uFcDrc2z3pcrwd6sZYiegogyRF9VxALB/8gGABwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8Awi4By66ZVXQKD7PWbfBMFPB80DPPgsb6dQppUUDtADI9ZP/Lmhp14YL4z7WuJioXD9Ju0Pr/ygIZMI77uu6qCqrsWl1quTDLzOhTyyHNTu00MsEjTCefs6kvPgMrrZbpcYD/AKK25bUDbLZyNIMegTwN/N9q3eySUj4IVZO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEgk3re1; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEgk3re1"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so3471257a91.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jun 2026 02:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998767; x=1781603567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A73y2Pg16zM1/WvH9t48h/2ALu7N8J70iHXokd8IsZ0=;
        b=gEgk3re1Vf1E15C4hSUNAyGMyZi5ekcwq5XN40ECfW8IBou49MVbbgmThAct98/h6d
         3xrHyIuJ0xqrFboNUAseR8p+5nUF9qrIRv9w1rPTXF5svk0oNJ3HGY7eUcK9HGCN3TNJ
         R9w/oaa94qh5DYeb/PRvkH/t9hZMv4IPPCcPLAymzszRKJEosIFR+3wan5JmyIEled70
         2HwBKbb3y4OFavJkR5/n4HinU2fTlsSAuR5H84oL/w0kQZWfBb7sBrNCzXAA2PUgzmAK
         9L/O18kQr1SiahcQWdnYDWkfa2Y6PPJRqfhD7NYoyo5lnhQOOzloiqL/Nyh2A4QJLRGC
         tgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998767; x=1781603567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A73y2Pg16zM1/WvH9t48h/2ALu7N8J70iHXokd8IsZ0=;
        b=iGxqXgM7OS8B5tfvXzlLNMLRG6BGsc/wIHWoVTUFOTp2O+fU+q1VMtOVBudc3g/I8B
         mZX+sNP3v6uvwPWvmkqLC8klENUzh3FKChMQndBWCGF5ZSXBSlQKrpVaKc+zN5OH2rkF
         mWWBoKssrgsxXWL+F7c1aNlpRxe1VXlnokURKhFD++WNOGop/KJ1t/aRTMqgXpGM9SwV
         gX28JedhNIFvu//eLjwpVRbOW/KYY76poXxI07UP52dCsTAazXm6gHwnN+kx81CrOeYK
         sGm2faKB3R5Vq5Gp4GlfJ1gw0rrjtlEU10XOpWvMdPVQBihmaKpsbKNHJ2UlQEi2p3aJ
         RMfw==
X-Forwarded-Encrypted: i=1; AFNElJ80IWiBegkCDkuauTLhQP9/7hVLPlEiNKcKeVtUOpoRltE8Sf6C5CUzsqmL9Mo4uHWJeLkHSezXDAQ335xFg1uIOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfrY60hB+cH//YIenJB6gfwewkSwm6efI+O0AM2YkqUzcDXFZv
	kMBBxrUWHqJvmpNknFyLelFij66IStbDYE4vErLniEMijgDzM0vJlk+gETDTgNPr
X-Gm-Gg: Acq92OEx2J6GgmkdJfYAWhasKP7sTU8b6sn7zTwwXL5hstkB83pLSzV8bAGfkNu0Jd0
	FzU76WTQgSf4tnd7FTXqoTVKskTzHVZAHl4U0cg4yRmOcB+wZQoPEwwoDRSZf9WDieJUR4Vz4qe
	ONWCzi1pvbJY+oDqaDn2RlYPuf0FE2MjT7wvtJv5yEixOfSDcdlo0Tb1cYKDNCTiXQ8Qj7EOL5y
	hrZTdB3jUY6qL4xy2fm0SnqnrvMvYuyK6zRon4cnCEUtXkCrLCVvhJMyzMnD+T9EBClYbk1jMcJ
	/ZAN4rCVU2MUMs0u/J+8b22ZOqKayFUElU7Txr1yL3RVT1BaMhOKDmwf2l//sVWVtmuXgoqubFL
	wdf3DRE3bJLjJslD0aNz3xZUBQWdDpnw40PMHpOEqLl2eddK4CbkaKqArNkUVMTq8ZPaLVBLjTv
	Ch1g8TlM7r+WmYSSuLLMCmo7GZzYALhLH1LCL8rlwKMSnmnrsBK+wgnASkHFEhEP8MKb4wPnxIe
	zfmc2ryY/L6NOXhRuF/fhbz5s1LfXK0sUqRiR90acmqsn1ZYbb4fw==
X-Received: by 2002:a17:90b:5210:b0:36a:1ed8:6fe6 with SMTP id 98e67ed59e1d1-370f0b58cefmr18409046a91.24.1780998767310;
        Tue, 09 Jun 2026 02:52:47 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3713346cd9fsm13185172a91.2.2026.06.09.02.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:52:46 -0700 (PDT)
From: geoffrey <geoffreyhe2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 2/2] soc: samsung: exynos-pmu: refactor PMU regmap lookup helpers
Date: Tue,  9 Jun 2026 19:52:24 +1000
Message-ID: <20260609095224.1706036-3-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609095224.1706036-1-geoffreyhe2@gmail.com>
References: <20260609095224.1706036-1-geoffreyhe2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Weigang He <geoffreyhe2@gmail.com>

With the of_node leak in exynos_get_pmu_regmap() now fixed, the remaining
reference handling is still awkward: exynos_get_pmu_regmap() obtains the
PMU node by passing NULL to exynos_get_pmu_regmap_by_phandle(), which then
treats its np argument as the PMU node directly.

Factor the common PMU-node lookup into a helper,
exynos_get_pmu_regmap_by_node(), which only borrows the node. Each public
function then owns and releases the node it acquired: the node from
of_find_matching_node() in exynos_get_pmu_regmap(), and the node from
of_parse_phandle() in exynos_get_pmu_regmap_by_phandle().

exynos_get_pmu_regmap_by_phandle() now rejects propname == NULL with
-EINVAL. Passing NULL was never a documented use of this interface, which
looks up a PMU node through a phandle property; the only in-tree user of
that form is exynos_get_pmu_regmap(), which no longer needs it. Document
the requirement in the kerneldoc.

No functional change for the supported callers.

Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/soc/samsung/exynos-pmu.c | 57 ++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index a5da2741852b4..ab19ad265aeb1 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -157,6 +157,28 @@ static const struct mfd_cell exynos_pmu_devs[] = {
 	{ .name = "exynos-clkout", },
 };
 
+/*
+ * Look up the regmap of an already-probed exynos-pmu device. The caller
+ * retains ownership of @pmu_np; this helper does not take a reference.
+ */
+static struct regmap *exynos_get_pmu_regmap_by_node(struct device_node *pmu_np)
+{
+	struct device *dev;
+
+	/*
+	 * Determine if exynos-pmu device has probed and therefore regmap
+	 * has been created and can be returned to the caller. Otherwise we
+	 * return -EPROBE_DEFER.
+	 */
+	dev = driver_find_device_by_of_node(&exynos_pmu_driver.driver, pmu_np);
+	if (!dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	put_device(dev);
+
+	return syscon_node_to_regmap(pmu_np);
+}
+
 /**
  * exynos_get_pmu_regmap() - Obtain pmureg regmap
  *
@@ -174,7 +196,7 @@ struct regmap *exynos_get_pmu_regmap(void)
 	if (!np)
 		return ERR_PTR(-ENODEV);
 
-	regmap = exynos_get_pmu_regmap_by_phandle(np, NULL);
+	regmap = exynos_get_pmu_regmap_by_node(np);
 	of_node_put(np);
 
 	return regmap;
@@ -184,44 +206,31 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
 /**
  * exynos_get_pmu_regmap_by_phandle() - Obtain pmureg regmap via phandle
  * @np: Device node holding PMU phandle property
- * @propname: Name of property holding phandle value
+ * @propname: Name of property holding phandle value (must not be NULL)
  *
  * Find the pmureg regmap previously configured in probe() and return regmap
  * pointer.
  *
- * Return: A pointer to regmap if found or ERR_PTR error value.
+ * Return: A pointer to regmap on success or an ERR_PTR() error value;
+ *         -EINVAL if @propname is NULL.
  */
 struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 						const char *propname)
 {
 	struct device_node *pmu_np;
-	struct device *dev;
+	struct regmap *regmap;
 
-	if (propname)
-		pmu_np = of_parse_phandle(np, propname, 0);
-	else
-		pmu_np = np;
+	if (!propname)
+		return ERR_PTR(-EINVAL);
 
+	pmu_np = of_parse_phandle(np, propname, 0);
 	if (!pmu_np)
 		return ERR_PTR(-ENODEV);
 
-	/*
-	 * Determine if exynos-pmu device has probed and therefore regmap
-	 * has been created and can be returned to the caller. Otherwise we
-	 * return -EPROBE_DEFER.
-	 */
-	dev = driver_find_device_by_of_node(&exynos_pmu_driver.driver,
-					    (void *)pmu_np);
+	regmap = exynos_get_pmu_regmap_by_node(pmu_np);
+	of_node_put(pmu_np);
 
-	if (propname)
-		of_node_put(pmu_np);
-
-	if (!dev)
-		return ERR_PTR(-EPROBE_DEFER);
-
-	put_device(dev);
-
-	return syscon_node_to_regmap(pmu_np);
+	return regmap;
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 
-- 
2.43.0

