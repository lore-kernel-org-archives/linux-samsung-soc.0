Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F08C271449
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2025 12:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752582175; cv=none; b=oWL2xJ4L8BIiH1ETrFmW6V8p8ak8BmBQ/P+UYK572JQkeDepqqK/dDx3Oc4GQfYKOzQh0rnGXm3MhOTTsNfAzY5Y9/YuxN/AVcLLh4UHoH+PkA4TZmos+Tc/UYpbmhgjgXw1EtFIiaJe+PYbhC6tJcRgAIPjp0g4SOafwm57MG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752582175; c=relaxed/simple;
	bh=00RUuzCKLbIW7xtJn4iVj55UNl8kTPANyqdSPOKAAY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEB4Iygp2b7dcJxkHZf15oy2fwLCZ7GQWODTyd4cqaGw8E9BoULGr5X3Zwl95dMIk9BU1IKJFKODH/h56Eu2h3YNf2rjJZ4RjdMRerGkQaBpqoUvh3eVp7zlJF/4nO+AUmqRAWLP1QyWgipW5MhqSuF1BsGK7o234Wn/JV82114=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YR/YZDrC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YR/YZDrC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45617887276so17916695e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2025 05:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752582170; x=1753186970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmd/8SBDrA1Gb0C+zRAmJUhYPy6kVSRJonEW9B5eq80=;
        b=YR/YZDrCfcd7Quykeb0WJ/8zbaNm6Lp9CLxANb9ywOP/QHzw9Pq/yY+7wWWCMr7oVj
         OCPFnIJoAYb+aMQoCFoYWQKa2rcEJhwaDU2KVk5WIXkAu58cwtr1p/x+Hu1xTqrZoA7D
         7EZ1yyEJ+8SHbIn63wDgyMYZVWUcRQHm0LnX4MDFjgDirwhqvV2FwQa0JChbbGyKmO3h
         5n83JTCrJ653kAHV5S30jAzaimxizFYtFm1kSsiiAS4TnuyE8QdfT+/8Jy9GRAFSq6cO
         zQWjR/N3qP7XCpETYaEfVWH5tMVJPfy3kjn3rtHELPB1KRJoxH/uXpUDoHO8N7LJW4eH
         DwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752582170; x=1753186970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmd/8SBDrA1Gb0C+zRAmJUhYPy6kVSRJonEW9B5eq80=;
        b=wMndpynTv5VZwpoGcbjVK/di1t/5u77tVdcRTLWLpkLnOJXUFmb/wiQrucJ6raCDYI
         CormRx9PeHYitKRDC/nmB0NpTnTJY+ylOn2uq59WWgboizUywuL3Xd/QocyoFW00kz9c
         44zHR8JH+2PCZkhHb5h/A1vbyaQp1tK8LstdEzVb64D2VrFh4QtIKDI+AUPd4pe9d8Ui
         UIYpmT1DmPxjTiCylzkQSyI8JRzem9g013bKhsYYV2vKWZ0T1jTLWFgaQ/efDhWT+bhf
         UUzkJoWOJQ1wNwb8hkOZxsTRRMU4cQmuuK5+CGkIOdVGfLAo6+wC+aZkNOJmwLKEg1AX
         Rw1w==
X-Forwarded-Encrypted: i=1; AJvYcCUYNFbYtd8s1dDzUuNzjHURYgHgx6Zj9uBItyqwQGKXX/JumNoBvqIIBQtMakifrLYE/ya4vgmiIUDcbYZeZUlLJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyl1t/HnhfEXAuzXKbMBnzlCN8C7ztp8gGG579Dydianb4RIZm
	H9Mz8wb+Od+YBaiTx/Rg0Kg9WQdjsImZ0j6vEQvZ8D6O0cj5PvAefkHMiSWbh8i2ny0=
X-Gm-Gg: ASbGncsZav60xTjyUx29EtafQ+W37YmYpycnAgXcTupzWNmoJiomxlHpL3QEg9FUDWa
	HEpWoObAcIB1aieYv+XMaXLFtnFd9j0eWlbAzl2YJsCJ+Dlj5fhW9mMa8XxiSleA9GW9yl+Mvkz
	HGm1TVeSWLgq27a3SYQGtW+PtU77YV4LbKzkOKlL7/cYkeXwBrYoGuaM968qwm66k6HmEH90TTT
	g6tDH0yDD1QHZJv9dph/12Hznpk9Fbniet3Y00GaM003/EvZbqbQguXm/vx0z5i0FIzZOKMTzMz
	4lRBRo4WKh6V3MmE1DIBVr+cJKzCB1VHpcSL/CuDkHcHRlqyDpeCHGiCWeoYz0kNnFs+VV/lVXd
	oLzPVrGUEYklcN8Z5ETjFzPqoFjNsIRgwAXN2/A0ABEDXH6G35N5vnQki5n0=
X-Google-Smtp-Source: AGHT+IGMRtiWeYVCYMElfz61z1ti+Ou58MocKqgLTppI7XTuQyjsyQV8LFvTq6sg4P0VQ4QxNtmmjw==
X-Received: by 2002:a05:600c:4f52:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-454ec14677bmr165238895e9.9.1752582170249;
        Tue, 15 Jul 2025 05:22:50 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd537785sm162850685e9.23.2025.07.15.05.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 05:22:49 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	willmcvicker@google.com
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH] clocksource/drivers/exynos_mct: Fix section mismatch from the module conversion
Date: Tue, 15 Jul 2025 14:18:33 +0200
Message-ID: <20250715121834.2059191-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620181719.1399856-6-willmcvicker@google.com>
References: <20250620181719.1399856-6-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function register_current_timer_delay() when compiling on ARM32
fails with a section mismatch. That is resulting from the module
conversion where the function exynos4_clocksource_init() is called
from mct_init_dt(). This one had its __init annotation removed to for
the module loading.

Fix this by adding the __init_or_module annotation for the functions:
 - mct_init_dt()
 - mct_init_spi()
 - mct_init_dt()

Compiled on ARM32 + MODULES=no, ARM64 + MODULES=yes, ARM64 +
MODULES=no

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/exynos_mct.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 5075ebe052a7..80d263ee046d 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -657,7 +657,7 @@ static int exynos4_timer_interrupts(struct device_node *np,
 	return err;
 }
 
-static int mct_init_dt(struct device_node *np, unsigned int int_type)
+static __init_or_module int mct_init_dt(struct device_node *np, unsigned int int_type)
 {
 	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
 	u32 local_idx[MCT_NR_LOCAL] = {0};
@@ -705,12 +705,12 @@ static int mct_init_dt(struct device_node *np, unsigned int int_type)
 	return exynos4_clockevent_init();
 }
 
-static int mct_init_spi(struct device_node *np)
+static __init_or_module int mct_init_spi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_SPI);
 }
 
-static int mct_init_ppi(struct device_node *np)
+static __init_or_module int mct_init_ppi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_PPI);
 }
-- 
2.43.0

