Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D8B125B9;
	Sat, 13 Jul 2024 18:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720894129; cv=none; b=U8gVE79ztqSDEbBKaY8EMU6o2D8R+Ch97NYppbhrxdtamk6sosw8ZyBsngNhCu/Wrj1WevixbgiPbBwSVA/NmPZHd4Xl5e+Ssjy4ZIKhIARBiauC2YEizqaAlDWPWPRo1p647Tp0iBuTwjHfySUYXf/E77F0MNbYua4iXCQ11xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720894129; c=relaxed/simple;
	bh=2V8gSKhMGv/Q87IrQhksGSaqYxOFKPmaYtWW122A/fE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oGzRrxdVhKbZPuqr5cePzkuWc8OSdeQCowsRueT4Qk+3m+IX77Si5woHf2VwHKXWnr8byMZ0ZVfvYPQmopM/z5M4WKFLTDC5+8Y6wJOMlEAtpRJSfidwJyX4uMrazrm0FRAYUpL9yad8w0QSotWefsYA4BBBuHt4cy4CcOvlx0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Twx7YSeN; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Twx7YSeN"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ea7bdde68so3261212e87.0;
        Sat, 13 Jul 2024 11:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720894126; x=1721498926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UFjXSyeGXyTpNHpjMY4i7H4qzTk6Okib980a8VGzRiA=;
        b=Twx7YSeNw1tJCgtwgcEegiFiuKr8EiQj7vpNjps2SBjlPARWzCVPSyBq96+my5XS7P
         f1UpkmCneYD8CANJY/Ssl+hafmO6e8lT4Ufwb4c7xEb64boOsJ5Uv4QdOYvHrVH4xdOt
         e2GDpudd/G1dURTmewEgYBRuMiUBauJEBFRP7fs9TC1ijalKdDAsIxz1akU2ZbZOiBEU
         DC5B5EMYGiydAayPbSo2zzodg/5d5p5bE8TgTmh5I7PUDwxskxrWw4wr9CbHplRGeXD/
         OxiqjMpgbvTtWVklYQp1giYx4lB0bZyPFjdEpepzrcFE/mQg+FML734qK+bMDw+Uxj/6
         09ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720894126; x=1721498926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UFjXSyeGXyTpNHpjMY4i7H4qzTk6Okib980a8VGzRiA=;
        b=vopvSLkg+naUYEPyOmVvwSPz5qsUJgPfFQXjTvAx2M4kzXgW9PN3MBKqFKOJE0PTs2
         Puc4f/EXjo3BqufOpaP2NfBGlO9WPyTXaFoXlXqt9nJEjuuV652DqhYya66toMS0gz/l
         czV1/c5UMcJGQsNmkbPrn0Hj885S8wGAuT4Uvwwhikt0cT/1IGxzyegY+1zrtXlx73KK
         TERgGAVEj9dXzDF+IheCK5yGve7It+w6kGrlbN+C7hx2r9eIymcbsRzanOAViY3m+fiy
         flfasr+aMEM0+3RZBJcigscyUAkT2rMnzK4EgTr6uXzHSNm5lmwp1fjiNIm5YmUgjenJ
         67sA==
X-Forwarded-Encrypted: i=1; AJvYcCWDS09E7rPWBb7FcGxJlSfqvfMDkV7HWk4w0cAIR8VssJdxuAnh2ETHd0J9SUx0Ges6ArD5b0sDcwk2qKF7Q+pkj7oojz0xftPryqc1GYNUk7CACDJrSu0DqtP/tBBu3lRfc6ADI9vBKrjj/GVSW4vp+1zPTjLmk2RNiDr6uZ08vm3CFDXwjZxDtPdl
X-Gm-Message-State: AOJu0YyA7vBrJFtVxWEr9Aqu2tjzNuPezj4oUKA5qdWCNy4lYZP33lHk
	caSb8wEhOW+JXxdrR5A2NFtyyao9Uu5CalSAQvQ36e8t+WZzvxZ/j7u0ifc7HLs=
X-Google-Smtp-Source: AGHT+IGtqFsPbcL8wxovGZ/CvXNiaBwjE8EXI/CkTr1ogDZuz8GEOo6KcfGrwSd1nQVjw71fGUGs6Q==
X-Received: by 2002:ac2:5102:0:b0:52e:97e1:723b with SMTP id 2adb3069b0e04-52eb9996049mr7468158e87.28.1720894125274;
        Sat, 13 Jul 2024 11:08:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-59b255261c5sm1040572a12.43.2024.07.13.11.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 11:08:44 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: exynos: exynos7885-jackpotlte: Correct RAM amount to 4GB
Date: Sat, 13 Jul 2024 19:58:32 +0200
Message-ID: <20240713180607.147942-3-virag.david003@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All known jackpotlte variants have 4GB of RAM, let's use it all.
RAM was set to 3GB from a mistake in the vendor provided DTS file.

Fixes: 06874015327b ("arm64: dts: exynos: Add initial device tree support for Exynos7885 SoC")
Signed-off-by: David Virag <virag.david003@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
index ed2925b4715f..0d5c26a197d8 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
@@ -57,7 +57,7 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x3da00000>,
 		      <0x0 0xc0000000 0x40000000>,
-		      <0x8 0x80000000 0x40000000>;
+		      <0x8 0x80000000 0x80000000>;
 	};
 
 	gpio-keys {
-- 
2.45.2

