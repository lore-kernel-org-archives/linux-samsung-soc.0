Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4AA226CF7
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2025 07:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859703; cv=none; b=N/1tgVQafUBQeQ4HeSBqZsr6hsQe0oqPFXgMpcod5ND/AC4JU+uA/q9zrqXpySN5HE5osf7r9Ei6JHJgbm3bLbTe87bZEfgVqGx4lRNpUHKdURIkQvYU0tyOcn42o+JAs9rwTZLYBBE/UxbZFN5iQ9o6VVzds3oCP1qTWy6OCz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859703; c=relaxed/simple;
	bh=Jl96Chu7SMvNDn8DRT0lGln0Wby6eyTfgII4vTzTBJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XgtP7uW1KZXC+cjvswah+1lUfM1sqClgSfX3GFRD14Hw1RTux/i2QjlkjVqyFae0uH6hOjIBInQe+wjVaEpi+6F126kmfHr9l2jVQAWCSGDF8R2VzPcL4VHpl1SrcPUJ76Fjg99OeLPxl+HJTUnTJu2tTwyN1LRyLnnO1I8zB/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wUSH2U8E; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wUSH2U8E"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4561607166aso3464045e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2025 00:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753859699; x=1754464499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TZFPYlDdJ0rVu0VNavE3SZOZbmVPr53MAqWXB77UPjc=;
        b=wUSH2U8EPGCQ2lMwnLOrVxFsIuFACO50urbgtau4e8PO5WYDzUdiv4JPpaIS6Uqyy3
         Rz03LYPML9Re6IaQ/IjxE5njLXaL0A5Ac6ZitCoP/B8P4uPhaG6L4EpFKwkUM9Hou7lQ
         YZMVmlhDWNkiWHfRDcqs3RlcBgEqDLfRabZ3zbIUoMxPzA6wLDQLhhzepmtLeECG7cVF
         uSIDa+AH2SlyyG/2FI6NtSqlBQuIm/X6sL/pMxVQv6AbbB/jKL65IGl2wvQy0xvAy6nI
         QKPy0eN/9Q1+vyzL1BIx6eOnYeTeSaG6WKS7PeSB3n6wcRViU4APOwo+4D6TTtk04Kyq
         GkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753859699; x=1754464499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZFPYlDdJ0rVu0VNavE3SZOZbmVPr53MAqWXB77UPjc=;
        b=tv3L2AVeyIhDfReyMNIlPZ8mAK1p+gMj2B7e8OfvJl5mhPB9Dcht08dYf8Fop9IIUF
         W0up24/lAXn5Q0o3OcDt4ApLUKdNuQvgUw5Nh/HPA0LefeKf5M2GOiKvikz794KTbF2t
         U/MZkjjmQtvCH2I8CT2Yl6L8rQpvDfQfViOcRux7IPvmwlsvEF/bhpQa0/99Oa4p2+9F
         frdwEmpFRNWNSy88tLCasQHIA3Zy5f5NKOGgaPSjkKvP0dhyYar8URKV3t3xPU+yZZ+K
         IRR1cPsmQjIjxPj3FSiig4rJillFySu9+0t5/ZHlI1x1+ZyBdXWu4TIRsyzjzTbuFoLG
         6cUg==
X-Forwarded-Encrypted: i=1; AJvYcCVvbbMkHN0MoWSNOhVJSnVv39orGei5n0QBfHmcR6HfqC4Mf+Uin4cQa0jOAdVZBZC6998iPE1OLnJTcrq7yGvFow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoNKQ/EjSNMhZ7OX2Hv2EYgnE3uFzKX6D10TdOVKb8UQZpeNFj
	qDDt9vnPvfYlKrLHV9yDl1eJ5p+ykv+L7U2SaEj1AsUUTs/Z4esyGZwZZQG/tbP9XAg=
X-Gm-Gg: ASbGnctldUrpzc3304zmqsXHU7J9QTq+o28zhU0McnZ4A4Gxh5948Ic3JdVFIjkrwB2
	AeFkFuI7T7w6CD0ZnyWqzw5ceBlEA73eRCuXE5PN1KWuGHAUpyGjjvGmmCchIiICP4ICnW2N+jZ
	kngkiZJCOMgRfbxuH8hO9wbmuY4r0UK6a0RNCHFfQiAOiI8U44Lnz4H4TpnaGSGwjCgwRJwLA6S
	Pg73MXkQkLpxkYoAE4lmfBe90ogPJzLE6B1kpr39l/avzM0frs4QyQuZKKpC7pjYeAyIbOmOEWq
	0RWIKG3tSXKmVRHumPyPSau+RBhKXNaI5oJE/cpKMQHAJ3uYYLZ28on3+xXVI1fJYee5TWW50+z
	DrpWBOvSX5SqXcw0tYJJC0n7M
X-Google-Smtp-Source: AGHT+IHNb3WqBOl3BcnyoTf2mFnsCMBFsTDjTJbP6rodUQ7rplDyO6pwXBZDtxJ0tWuM+n35yFd+5Q==
X-Received: by 2002:a05:600c:3d8a:b0:458:6733:fb59 with SMTP id 5b1f17b1804b1-45892bc5895mr18567715e9.19.1753859699078;
        Wed, 30 Jul 2025 00:14:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e75d:6dc4:a638:ae8e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eb284fsm15118926f8f.12.2025.07.30.00.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 00:14:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] ARM: s3c/gpio: complete the conversion to new GPIO value setters
Date: Wed, 30 Jul 2025 09:14:43 +0200
Message-ID: <20250730071443.8758-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Commit fb52f3226cab ("ARM: s3c/gpio: use new line value setter
callbacks") correctly changed the assignment of the callback but missed
the check one liner higher. Change it now too to using the recommended
callback as the legacy one is going away soon.

Fixes: fb52f3226cab ("ARM: s3c/gpio: use new line value setter callbacks")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Autobuilders pointed out only now that I missed the other line that
needs changing in my previous patch. I'd like to still queue this for
v6.17. Either through the SoC tree if it's not too late or through the
GPIO tree together with my second PR for this merge window. Please
kindly ack it.

 arch/arm/mach-s3c/gpio-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/gpio-samsung.c b/arch/arm/mach-s3c/gpio-samsung.c
index 206a492fbaf5..3ee4ad969cc2 100644
--- a/arch/arm/mach-s3c/gpio-samsung.c
+++ b/arch/arm/mach-s3c/gpio-samsung.c
@@ -516,7 +516,7 @@ static void __init samsung_gpiolib_add(struct samsung_gpio_chip *chip)
 		gc->direction_input = samsung_gpiolib_2bit_input;
 	if (!gc->direction_output)
 		gc->direction_output = samsung_gpiolib_2bit_output;
-	if (!gc->set)
+	if (!gc->set_rv)
 		gc->set_rv = samsung_gpiolib_set;
 	if (!gc->get)
 		gc->get = samsung_gpiolib_get;
-- 
2.48.1

