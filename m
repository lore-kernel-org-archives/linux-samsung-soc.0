Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D163D79FD
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 19:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181723; cv=none; b=WWd/u0L5VPvVMcLV0sYevgGKOcWabnbYMmguo9PmZouJt60C9mFYChkqoEJgcOTsg/216nZ4auebksFswBk79+PHGtrN9zFgpOtiJ3bSliPm61QbK4luGs13kLbugR3jyw7W40nH5Wiqw1mcojFPwnm2W4mozyP5N9p25c7gY44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181723; c=relaxed/simple;
	bh=g92HLocdRA/w3YM68miWwLxYb3rDVNqg12i6lFPfJgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BnBDylSzqHnXCtEdEV1xQcmpq8vXsrhqNqf+5DageGX7v1XfvcC29dWVsOtjrRk8M0Z0fvhsbJH0N1T9ERD8S+O9Uo+ccQu2/jfs35REUPlKjaPjDazdeliZ3v51AsrK/pX2t6P/Mnhb/c5D6sMUD7Ht2UejsaqdfywYYaVmvoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGe/SxxX; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGe/SxxX"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dcbade417so3298730a91.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785181721; x=1785786521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ph9MOB90x8/rsIoED4kDLbacmQxfQ83Asvuv4fsdn60=;
        b=bGe/SxxXJ6vAWNQ0UV5Dp/OvdyOSqYbucNlPMaClKCQpqzRvsEkxch2DHp0nLc+ZYu
         MScl1RAnV2PRnwBxMEXYPmF8HOwNau3Hl7u+zEGuFQ3ykCP7MvgOm8U9WWfalDZpXEWQ
         dcAv1IvWBeJoKMfqgaFSDrFkMtb3YY0xGZW1tIMapdf1+L7NTMkZ4GmtfRoX+3TU/d2c
         qOt82tCk5x6PUGDBmoMttY5a4N7Xx1jOo+E+6mdDvTpbjIyEUlYvkil2lnxz+UKVt+ta
         nnFn/CPfOhvmkSURe1NpqXYhDKWIvMWOLEXKkmwy6ouS6ytvSvwXNy8K+PoHst4CfOlN
         mwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785181721; x=1785786521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ph9MOB90x8/rsIoED4kDLbacmQxfQ83Asvuv4fsdn60=;
        b=RAg8tFRmdE1kvfG8W6nlHHaEJ5aIeYOZR6/xAO060/epKdoXxreTax6Ft2v7VF45KH
         eQ6cQBliH6NBAC6eeChPVtWgd/J1KLqA4QXjjxVrHfhGWDUMeuF8wxyspnH14bCqpjYt
         3rda/ruXtwsO+LgqkFMF6nUNbsYfp2cEcVx3gr3OSilSbFsPO5txIJHA+oq9I317sIl8
         Dk1YOeMkHceXW29ZvDySYrlwO9ccrjsIsCzeZqfwWk6G9LMFc940eKN4uYO6vszFvj1N
         Rzr3rr134TqPlwYOqpeQVsoFL9uW4omsHlhCCooJPBkO4wQrV3ruyfCjp+7cSSfJ95+a
         cTaQ==
X-Gm-Message-State: AOJu0Yw3TjZv6+c+bOkEq0kTAwpUsO8IXUVBFiwuicE6ePrrSqh3si2K
	nFkU0n047e42cgctozEUHWtDpXpQdFXFSfdctDKt9bTyMVndT02Efc/6ACOtcjeh
X-Gm-Gg: AR+sD10CHQJnqTgIICL4Ol8SOnJaoXgk+0qpcxNqcTgiAntddDQdMZvOSzpwgeiSbWf
	OXNccOnRYgTS4eOtkM4EOAWsQDt7Td+cuN/LvNlG4BPwLcWFO053lg6/7MOOW26h6VdgtlSFn7N
	gZTMmNxoyD+eBSTg9H+Piw7UeEwhqwbDcXZHoTXYBQKvCVhiDo65/gvIxDEkZF8Ayh/Ndfb46yN
	w6zJhwXbA3rWBGAmarwfs1BvENn4/PMRXAOsbLSFjhCqQ4u75UVhC3vy6o/t7BjU3VFkbEaMCGv
	pD7BzM+SyTdj8UYqvqkAXgqo001/bOd+HTMxcYnQzPxxf8sCEr2qB1pLgm2MwdA7gSBP65jxPWl
	r8I3Vfvh9j7c7ocBEzbazUl+PUP8Yq7yDcxaHP9VT6MPDipQiIDW0jJpFuoVTPAfKhcWo0Vog8U
	elZSFdh9D+AI4z+lbqkfk/ZWwOpAb/a/sceTko/n1R8+3S1IySoL+48BMw+9oPHdcrYnIe97cEE
	N1qSgW//Jx4OVW5T1YWDnglk/AVF6S5yiDqVlDp8Ij/KxqFnDAS0m020BZevUwPrd5C+96rsQcC
	kprlvvYkLmVAleV6rzEAlnx6rgBHOG+7bw31cA==
X-Received: by 2002:a17:90b:1c8e:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-38f6480d1demr780368a91.7.1785181721391;
        Mon, 27 Jul 2026 12:48:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642bfc71sm270847a91.11.2026.07.27.12.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:48:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:PIN CONTROLLER - SAMSUNG),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] pinctrl: samsung: exynos: replace irq_of_parse_and_map with modern APIs
Date: Mon, 27 Jul 2026 12:48:35 -0700
Message-ID: <20260727194836.11689-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace irq_of_parse_and_map() with fwnode_irq_get() for per-pin IRQ
lookup and of_irq_get() for the muxed EINT IRQ. The fwnode-based API
works with both OF and ACPI fwnodes and follows modern conventions.

For the muxed EINT path, change the error handling to propagate the
error code rather than silently returning 0.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 81fe0b08a9af..5bef230f5bed 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -824,8 +824,8 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 			return -ENOMEM;
 
 		for (idx = 0; idx < bank->nr_pins; ++idx) {
-			irq = irq_of_parse_and_map(to_of_node(bank->fwnode), idx);
-			if (!irq) {
+			irq = fwnode_irq_get(bank->fwnode, idx);
+			if (irq < 0) {
 				dev_err(dev, "irq number for eint-%s-%d not found\n",
 							bank->name, idx);
 				continue;
@@ -841,11 +841,9 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 	if (!muxed_banks)
 		return 0;
 
-	irq = irq_of_parse_and_map(wkup_np, 0);
-	if (!irq) {
-		dev_err(dev, "irq number for muxed EINTs not found\n");
-		return 0;
-	}
+	irq = of_irq_get(wkup_np, 0);
+	if (irq < 0)
+		return irq;
 
 	muxed_data = devm_kzalloc(dev, sizeof(*muxed_data)
 		+ muxed_banks*sizeof(struct samsung_pin_bank *), GFP_KERNEL);
-- 
2.55.0

