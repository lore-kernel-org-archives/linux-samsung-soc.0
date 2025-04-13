Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E467BAEC;
	Sun, 13 Apr 2025 16:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744562282; cv=none; b=Tbw5NRAxY2ogHwJuNNr33246q5+sJCxipXthkhcbRItzGYdKtkN4uaJ1sXqJg3f2Y9IDsbZIqdqkgRSVpODJwlQ7iU/UawrcoFh+fovvYOAab/xQwJe2Cxinw+NSgzEO5/KmDND6kB6i/NrU8vQ2n+FkubK0NFfi0EbM275Jzhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744562282; c=relaxed/simple;
	bh=7DlJV8tOAZo87ABvIk51jkGWVfIUC2F0UrGIz+A3Flk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=InDDtP+L8oiuN5NYGFfyT49Yw0GTcKJMK74tL3zeYUrWeCXltygInSw184bYNSdP7MG9D1JsefTOSJ2ahXbvZsGmuw+cXw3NleNIa55IYryXFq9FcxxDfj3n5e7Bx1Tzv7IkNPMmSQa/u3e9U3m4vvironFJPri0u5XqDJlIcrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddxfOWgk; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddxfOWgk"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-391342fc0b5so2775467f8f.3;
        Sun, 13 Apr 2025 09:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744562278; x=1745167078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2A9Dcjes/+32sERoSUov+ch9amtIj6eI646E87CQPts=;
        b=ddxfOWgkWgbU7y50pPv9N+6xU/nh2xjVDdA/SUy8JR3zD4NtrlIPrHCq9hCRaW2T1G
         tQzCX97u9CAWZSXPPX5sL6q9hS2I8Y+g6ruU2q1H/Za+E0AiaU7YF9BGjA1b4/G6nqus
         3JqR1BPmCYKUpS/jkZPwibkL38xMzVhEwFm6ym7GA0GvRmL+md7g4FAB6ftf8OtVU/ZX
         e3BqdKEx3r+5P4vHrAznbG9O4WoO60gtX/rEusplCDc+E5m3G6OKIvZIGh1pJ9zqfxwC
         k4A2VmqbOTE3ddJ2aG+uGlsA8KXrnOa1yLE7YgfgJrlzgjijY6LtCMR3Rr4NQPCdGfOq
         wHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744562278; x=1745167078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2A9Dcjes/+32sERoSUov+ch9amtIj6eI646E87CQPts=;
        b=Vdovn2Bjzl8c05H17BloXYjWs1D4MY2HpozdqLnaMCpvnPMUyYjEXSZXQuY/ZVXc44
         QWFVxpbfQOvOnT59ADrbJDKUHCznt7f595yVHikGqEZez0c8rzOiOFVTCn1T1eJEoL22
         CYXiUbxBHCVNSSvy4S7yNf4FacQbRy5hStEJFWHj4UtEIaINYPeCN/UOFi5jiBlfaic7
         lMn8r/ra9ZC7REcBy+d0ah7G62MZaHSDvKbywIt7Y3+u2AbQL8HY5HF9YiGRjISIo/bD
         JjJPdjpuRkzXlZtKbqjQRnX29jYuY18bHurtxkJY94fJcneI4bDP1Cd+eBwHYBlMYb6D
         b21Q==
X-Forwarded-Encrypted: i=1; AJvYcCUouV+bvP2RC/1G/7CbtWH4Rla9ee51V3IHtil3qKQh4+B0P7d7ndqfp/sBMyoOz2S7Z0+ivzKcFx+0lrg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/5WKosvNRe7At0gGPWmBtg+cupS/W3xzJQ/79V4IQRDaInap5
	Ze36M5++YqSNba+859XS9zcp27fBHqkjK0JjIl3iBRKgS1+NpUMI
X-Gm-Gg: ASbGncuPzy+PXjJilZqU3s+Ww7HuvlPaZjdm3ia76N5HwBu1F0YnOkPW5JZ9PZZeoY5
	9ppEAV01+6E4QPZ2XlxpoXQx1WDWI0O6jMAioTvxA2aawVRCagnQHfpqnRqgFO9FzuoDt0wW0mG
	pnJNuau55EHyElWp9h02Snm1sm/+1nfH/Pbj7db0Qsj2+NB3Mr2aH3gb7B7MKkqhEp2FmeVjF5x
	Gdjcq3rdClO03cewVZS2WENk8QZ0av4ZZKoYOxbwogV+offzTImNbgLq9r0JYa9GUnaxjQDTVGq
	FrOrV5BPof8OwJsQ74xbMN+wOPaelswDbaW9hh/TCfQYmMyd6xiSRTA/es5XbL21SCN0Z6xQlCT
	45YPv5eFuBnEwbhmg
X-Google-Smtp-Source: AGHT+IFhCxopziJZlWQ179r6LZuAG9+1Kj/1Hh1QH+FwbKfdGfTQzhiAIMLXVWuSTeTyxw0yzNXQqQ==
X-Received: by 2002:a5d:588a:0:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-39ea634bf9amr6390646f8f.29.1744562278315;
        Sun, 13 Apr 2025 09:37:58 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c49f7sm147450895e9.17.2025.04.13.09.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:37:57 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] soc: samsung: usi: prevent wrong bits inversion during unconfiguring
Date: Sun, 13 Apr 2025 19:37:55 +0300
Message-ID: <20250413163755.788907-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of setting bit 1 (USI_OPTION_CLKSTOP_ON) during USI unconfiguring,
all the other bits in the USI_OPTION register get inverted, which
should not happen as that means the clock will keep getting provided
to the USI IP. Remove the unnecessary tilde.

Fixes: 11e77776b58a ("soc: samsung: usi: add a routine for unconfiguring the ip")
Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-usi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index c5661ac19..5f7bdf3ba 100644
--- a/drivers/soc/samsung/exynos-usi.c
+++ b/drivers/soc/samsung/exynos-usi.c
@@ -233,7 +233,7 @@ static void exynos_usi_unconfigure(void *data)
 	/* Make sure that we've stopped providing the clock to USI IP */
 	val = readl(usi->regs + USI_OPTION);
 	val &= ~USI_OPTION_CLKREQ_ON;
-	val |= ~USI_OPTION_CLKSTOP_ON;
+	val |= USI_OPTION_CLKSTOP_ON;
 	writel(val, usi->regs + USI_OPTION);
 
 	/* Set USI block state to reset */
-- 
2.43.0

