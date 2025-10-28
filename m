Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C721F158874
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Oct 2025 03:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761621348; cv=none; b=CVitD002c2Ro+V+sJBNQaLLa6Hg3qIenPp5VQWfGpartRpN71vU0smgj9g4Opd8gR8nRUUmu40iIphvBexPSjSuuAhQzRw7atSvjSvvIDGMq3WVLjVn4YNAq64et2JRSDwm+ovnO3+EnmafxTbveaABMb4jux4gyvD7/CFxcvlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761621348; c=relaxed/simple;
	bh=WSsr4NQM/X+04B22IETHzX/8ocEsGUdwUHkdEc1qYYU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nTt8S3fDaXpUjMVJRukFQBSTD4ZiHQBYap63arJ/y4P2w2iaD160gUbhTm803LT/HK9CciPyP40/QB/4xF/5858fp0M6wrCVxjwUZt0Oqx3OT/0vULKa3fdb+VyppW6XiVWCxTVmT/t6uCrgqgOASABHfwu9ZtJIp7Ed87tRpOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWzsOQRt; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWzsOQRt"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7811a02316bso3911809b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Oct 2025 20:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761621346; x=1762226146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwk85JlTUEBI3yJjsshayntPryiTY23zzfTEHf0Um/k=;
        b=LWzsOQRttv7yvjSu9wrVk5l3D6T+jR9/1I9CYLKqUydBp9ZobDKxk15MuVKV/dXg8l
         w8k8zOgahvYxTN+ElQdrvz6v4VbdGeB94/fKRhhgn5a1XnXyL7FdEcgXzOZ00HDo20NZ
         C5f5SFA11xnYq1WeoN55FbpAb+kOmu5XhY6BJzH8t1/HQx/tZu/7ArXftTCA9rVQpojq
         HGVnQD2yQM3ZIQClv+BkLVsOIVV9P19GHR4BetK5QMullRFhLcs1gkxQiI7AFRJKUJlk
         ho1+BVrm3WN1mHqMkQlPTJhastU5Dud/jMZ4MuiWLp7Jlp+2mERSbDRaSp0syC9amybS
         HgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761621346; x=1762226146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iwk85JlTUEBI3yJjsshayntPryiTY23zzfTEHf0Um/k=;
        b=wLd5wJmOS3Z/DsuoRsKwAwzGnaFUKce4sAlxukTEX3ey9Lk/LzoKnsQBGoTrysm5z6
         MykGI6vi0tSrpTNkZtpX4lr09u+/Gm6GLRlH3tI7304ee7LDUJReI3arPy7n6InOMbvs
         88h+EQLkkxcnW1fuo1I3TzlSPGvHw++lYOsG0nnFwcpidSj2pmBVO7zyWUzV78r0rJab
         IA0Ke6ZwnVrj263I6RMvRcLZUInH1xqw2TynmuWOsAtWOKu4n1tkgW5Zd4bbocbMa1T8
         jaAe+mqa4j2zGQh8GHnwCkZw07imbgiKsszzX+I2Bplbans8T4JS47TAF2mCQ0N6JFYL
         kQ8w==
X-Forwarded-Encrypted: i=1; AJvYcCUUg5fozKCwVaG2yzHUiQaxPC5qMFQXPwgilgpfYQ0VZuwd5XNKXjj6omoxKtZhzKZR6nVKtBUdalwswVusHzFZ8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YygyqWYU7xNis8pHazE9wfX6PkjpifrFi6eYa7SuwT1H9n8GL9b
	Chq4P3BmVc/QJSu5RfLQgYqs6uNDG3Vg1qwPubjyOtvdy10r+dIbT2vZ
X-Gm-Gg: ASbGncsWM9LrKaxBREqsmWiEDeSiWSspru0mmQAMwL0i9gi8LIaYC8nj3Ayzteeb3wE
	QjO3atavqQzANjWjSGYsfavM/Lqxyj01Z2lbn3spteUNEF+cS0w1aMkiUcI0kYN6wqIW/m1gJlJ
	qhulO0AblFNjHvvZL4qumeueKjQKwdlHD6oygwqSd6uhrkmfWl+HouDUrD7ZhyZ5LebVeNvyarb
	TU69b5uOuOq6I7SMkgyI/MbeDKgVEmz0uYLT63l+PNXQDBu8Y2EXROk5HSs4+9DrgcZLCNGanpA
	JLcXTnEXlADXdtuZ6koP8fXujWNoS5/LhHKSBfxktpSuepG/BgDTIT8YV7uyP0ioNty9rVvRB91
	xxl65rg0NNfnmsrgM489kEXRySUoXCLhOcHmkhsHcydzyFgYJwxKTe2KRAZ+aRFbCxWk3diZFi0
	5OAFfyT830fO2kXoV/vSOtnA==
X-Google-Smtp-Source: AGHT+IGuxaZzDv7SIXihLd34aYSMzDHA1ChbWY+uD7KdVdbaExQIFl+ZQhnMyiYov0T8YhmH+laVjQ==
X-Received: by 2002:a05:6a20:734c:b0:342:c891:a9c6 with SMTP id adf61e73a8af0-344d1baa8a7mr2317412637.1.1761621345900;
        Mon, 27 Oct 2025 20:15:45 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b71268bdd50sm9123455a12.0.2025.10.27.20.15.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Oct 2025 20:15:45 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] soc: samsung: exynos-pmu: fix reference count leak in exynos_get_pmu_regmap_by_phandle
Date: Tue, 28 Oct 2025 11:15:27 +0800
Message-Id: <20251028031527.43003-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver_find_device_by_of_node() function calls driver_find_device
and returns a device with its reference count incremented.
Add the missing put_device() call to
release this reference after the device is used.

Found via static analysis.

Fixes: 0b7c6075022c ("soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/soc/samsung/exynos-pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 22c50ca2aa79..a53c1f882e1a 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -346,6 +346,7 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 	if (!dev)
 		return ERR_PTR(-EPROBE_DEFER);
 
+	put_device(dev);
 	return syscon_node_to_regmap(pmu_np);
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
-- 
2.39.5 (Apple Git-154)

