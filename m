Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708B931E840
	for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Sep 2026 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311624; cv=none; b=uOnTareCHPjj0JIT1lytu2/l3O2fE8BxTP3zdrLo0+GB1b+W+8HdjtFLCC7pe2fqmxLg9XEWobU0H/w0kp5yjsFpESl6Jq0qnOncPA0eCi3ynSZF0e78LLFqIfvArYa3PTsUT8ImrtU7ebxWjUnrsKE8e831fVf6kjA21c5bAhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311624; c=relaxed/simple;
	bh=Ac9hJRO3+NqcDPgpt7ObfLuM8SaCLFN2CkiLPShmu74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmetSbFaTo8C+vFeKrPYIbfIMS5L83o3JteJbU8ezhJjSXX5hCNWEUjJpKoEOyXlbalWmyMU/5aF/3dY39iAEipvG4/hQgDGl8lP2+lkeS4m/ICoGKaTOwb+MHEXXUHfeESjEtyWORxMBrFoaml5/Yu7ujEAkewsA3CPrwfuhcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJBOmB/K; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJBOmB/K"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso1156715a91.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Sep 2026 08:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311623; x=1789916423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UlzyvIo8nOadqp8jqeYyZiaPQY3f0wl+9I9FZEmerIU=;
        b=IJBOmB/Kn7/c019Mg0ADIEO9taMZF0g7ND3p7qANTwKtsYuY8WusCiQUmZaefASkI8
         BOxCf3NXFGjnTD32F7tiDlqHohWaGa8zTk/wKJ0xTYaKGs9BpOn/SlNUKfNJEiLfMn+3
         XNsGw+rYQcT9fj4oT+5nodhggni2xyuQywSzxLN0i9jptPNu5xuBf2qR6yPJ+HztZKCl
         04myXS3E3HakHot0gzbGCS0klOcXBFYOCfUNCITZClO/1MrfuARJ8h8yeyfrBtgMwCUr
         swO865Ki5mcgJVPAJR/c3lg2I9dc2AkKo0mu1BKZs3pJ0eKiplpbEVySf7EwWOYY1HFM
         tc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311623; x=1789916423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UlzyvIo8nOadqp8jqeYyZiaPQY3f0wl+9I9FZEmerIU=;
        b=iyIy2kZUtuCDRVFBAswnzXnG4AJePViSjU3lprALXuUNq/Aw1JJgIz9tU94Rv7dLDN
         X+GuyswRKdNJJclBsLe6LpHV/OLE6X8jcdZreZxTDrtjiJMrhRzNsVYGNvoPaiyLMWWD
         9ViMwdc7ULEM/gD+3p3RZqBSL1JtF4Kc6xLdDghjKDII2kejvMAyI+uH1luPe9zN5F2V
         InQvNh1dvCRWkqN/dR/zTUJPTUsSeH/+sAiXOLzGuh52Q7NSBR9VA1C2gpogZ59f7v4s
         V0bXQ1fuTNugfWtYPlyNb1SrXmcqJ0yNkjazlmAvdSJUYJmHLi52qXzYT/Njy6lemGRh
         STfQ==
X-Forwarded-Encrypted: i=1; AKwUvBywA1r8MjqhP6VSlPH0mNws4ZEvpmWT3h+kIzlzWp4gDOQ2olTKZnMreq3exWz57QzkSPhKYfiNXLhAr8O6btl8Ag==@vger.kernel.org
X-Gm-Message-State: AFuF++kDeBNsLhnVcVP2vS8zg+n8kvn58l6bYmUudFIqW5BfzgfzW3c+
	BUcjwu3Pg4tmKFqsgdsrInhigqf9rpdiN7OUK7V4WPfR1TN/W2nuLMOK
X-Gm-Gg: AYBFou0aQJZ9gOJrURXj1r+92wVwfxJvsLOYlQvDBmtYsTkkr3kAS/5dtEG+uky0MxA
	CxyZb3JIggmS/JGmcsupLKOyg5WiUvxUg3zxd4VEOjq8S0yZFFc9gwl2NbZchK3CatBV8gu8Pc9
	GU9VNFPYPDu72QBPTQSdSNF5NiFZUJsvm1I9aGxYHrHuTZe2uhUp4T0gx4VS8e6V8w3aJyDCvdn
	+kI6S1dzc6mt8A8z7LIdXP0075+aiTGogwLGNWlPi6ZJPGAOodR0nuzNGz2eqYjS39gJMbgvDo0
	ri0tK1kJDPFBjkkfqEERc8Blua8F8hnWhvNRGRiHpdWTv51dGU+dzITmtP/bVp1qec8V1Ef5SsG
	UqDADjpaAEl+kA8nPjkcKGWFWRLSJky1ggsSKM8uhK1s07Q5ASVt+xZ6wZ83WZyPm1Dt1cDjtri
	2bu0w4iJYSv+/ZhmejiMe05Vkf8xY5XF5GAecsS7x9HSvP5U93v7BunD68denyFyAK4+G0XpLqt
	qxzRKrqACI=
X-Received: by 2002:a17:90b:580e:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39d9bbe47a7mr25597954a91.3.1789311622706;
        Sun, 13 Sep 2026 08:00:22 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.08.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 08:00:21 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v9 9/9] thermal/drivers/exynos: Select thermal emulation support
Date: Sun, 13 Sep 2026 20:28:37 +0530
Message-ID: <20260913145905.9404-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select THERMAL_EMULATION when EXYNOS_THERMAL is enabled, as the Exynos
TMU driver provides thermal emulation support.

This ensures the thermal emulation framework is enabled whenever the
Exynos TMU driver is built.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
index e1e8035d24fb..7d5590f78185 100644
--- a/drivers/thermal/samsung/Kconfig
+++ b/drivers/thermal/samsung/Kconfig
@@ -4,6 +4,7 @@ config EXYNOS_THERMAL
 	depends on THERMAL_OF
 	depends on HAS_IOMEM
 	default ARCH_EXYNOS
+	select THERMAL_EMULATION
 	help
 	  If you say yes here you get support for the TMU (Thermal Management
 	  Unit) driver for Samsung Exynos series of SoCs. This driver initialises
-- 
2.55.0

