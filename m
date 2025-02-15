Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB173623;
	Sat, 15 Feb 2025 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739624830; cv=none; b=BBNZJCNTH8rfVl+aVMrwwMkIKA08DV7ooR8FHmNXchC1sC8ItlHEJaIII3uJ0mXA56HSrrdPvGloMFXMaOfoKGCfzRgo1gbcnLUJ5WRwd7pfaL050ok3hTYxYwax96lC8mgihyXmvKdIHQYk5+XDIJS7iQTvviJIFJlYRO4QkZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739624830; c=relaxed/simple;
	bh=m8z38EiprjoO7ULkkH/GZ1Bl/HrTuZMd/gLZv43UgKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cLaMDTTRc6wbvwBq647hmkpF+1GiYEcUbEDhHfzAGNnHlYBIxXPmjZYzxI/42hFdaaVUZ7vIHGOZZVSlxPOHVtlwcf/2OuLBAvqFTCZ3yLwiiwwkENYZqtSZlpl74P1B8StM7GSxt1bmd+K68YrbaB79rIa7ctzUEzEdV8nU5Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTC3kBLS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTC3kBLS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43967004304so11376135e9.2;
        Sat, 15 Feb 2025 05:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739624827; x=1740229627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FaQaynB3KedHnyc+zdw5Lrkx8DsP6cNuMCn8mu2UgNo=;
        b=KTC3kBLS6NbXF6rpyn4RBBT53zs8Ifu+kqeIBNxts1g/PwpNMo6oXkvRQGSqPTonCt
         pHmZQupwWDb69dDlgZWmfoebPkrR2HA8njSyVDuEU4edDCRocddAticWTLhYgzmvfHKq
         lMzeGFhErryYCdKUHm33zdrTxxniKpjZVOtvPW+zDXSm/48i3r4fPbuXQuuFGJK2EZWO
         ACphT6aGo/cNZQBciFqEY2dllcClEmAVGWdqjiy5bc5forHRHvoWzlsQSfm/JtOZ5a6Q
         2AeirmoCAUkXIqvDizhLvDKQRV1pKQSivceNF2sQo46j0RO7AP789ILL/K6oxphfAj+0
         /snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739624827; x=1740229627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaQaynB3KedHnyc+zdw5Lrkx8DsP6cNuMCn8mu2UgNo=;
        b=NWA9HuumrVP0se/7D5ASnMzqfLq2wmEHouSpyFn9Osq8vJedgXoPRcQXwtitndmP7h
         OoJusNZD7vrT/53oQf2rqqrzGa9ZzFmNBe83rKmHwLK1RX5ieQFpLFQMfgRlgjK4qaTW
         4jD0a/e8wgnyH8j2p2vjo+Of7+Ip50aMq86EOa7/3+D/o5ChdhXcRuFP51sdUHCoGEIs
         8V8Nk0tdIAQfGCiqsJSRLPsem1xJwb9j4tqbV4Z2y1NYyIBhhfgRy2kwJELhAKCLPEJz
         +6/eZdbu6NXLAg/Jn4JDUPSrrByrDLV/HOljr6QQFCB2eezUaZ88UlT7z1titK/tUJ8q
         FvQg==
X-Forwarded-Encrypted: i=1; AJvYcCVz2iaBmC21WFdoHMDAj7GYHh6Ku/lGBmdniXlZ7eeojjMqzstQ0TPyvOh9rRqJlwkUcbbrw4t75JtgSlEd@vger.kernel.org, AJvYcCX5FL2QQqdWNnaOA0hpkJPcE/p2nt/DZ04MrtvQ+IY0SCoCPHCNTvNMwO81C4SBSWgxDLs3Bo8uK5jN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9yOHbd37aktJgYQsjSZFREMZQtt6+QxsxxoIxXVwrBgsUNWHA
	pDwTdP13g0+aiiUT8DSFzJmsg9I9dCvQlmdSrrYCoB2Jn893v/2C
X-Gm-Gg: ASbGnctpLIKVGNrOXH3kIgULMzW4CGgD8uJ3mCDtIvLWcI4H/12VptSPsumeC0jLson
	pNHE6Akh+GMVQtVtEq0HUCg8IXWqpV52btX6akefxzE0uLeqYL/8q2JhPosGzTCpUiVlnhv8/E5
	bZMQFU41zFGwmHqhBlM0zuBuXuHRsb1jXfK8ho4Ba64dFdllYHRW5TLJN+nxkSrXuRsJNQtxrxs
	IgGytCKR8lrn8JHIH7zGfDr0H/gpjH5uK2np0mjfgbIFRfFS9ZoPjN8XxiROi/aAvqHfVPwl6Ke
	ohlv+idVtkcX9qM3CJkXkOymfwkmlA3wzaPKAJPTLHsPalQWq2z6pZ7EZQnX5PCE87k=
X-Google-Smtp-Source: AGHT+IFwPAOGPtyRYj1UkSwxPX/68on3y7o8btPwzsLs8+kfSjZ1S4NhhwH3txCrEPKfgYUWyS8/dw==
X-Received: by 2002:a05:600c:5125:b0:439:44eb:2d84 with SMTP id 5b1f17b1804b1-4396e6c9315mr29004675e9.9.1739624826670;
        Sat, 15 Feb 2025 05:07:06 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04ee48sm101718465e9.3.2025.02.15.05.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 05:07:06 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] MAINTAINERS: add entry for Samsung Exynos2200 SoC
Date: Sat, 15 Feb 2025 15:07:02 +0200
Message-ID: <20250215130702.170851-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add maintainers entry for the Samsung Exynos2200 SoC based platforms.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4f5d8f68..6b6c0dc0f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20937,6 +20937,20 @@ B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
+SAMSUNG EXYNOS2200 SoC SUPPORT
+M:	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/samsung,exynos2200-clock.yaml
+F:	Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml
+F:	Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
+F:	arch/arm64/boot/dts/exynos/exynos2200*
+F:	drivers/clk/samsung/clk-exynos2200.c
+F:	drivers/phy/samsung/phy-exynos2200-snps-eusb2.c
+F:	drivers/phy/samsung/phy-exynos2200-usbcon.c
+F:	include/dt-bindings/clock/exynos2200.h
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0

