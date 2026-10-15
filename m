Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765933F58F0
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Oct 2026 04:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037166; cv=none; b=diu2ouGX92mzlysFXFdTFX6OegvC+HhMSFuMsHn0ZY7YFCYP2k659lz2C4iiSsdz5oL+SGrC0PiHuI7htqMF/o+RfjbrxI5cAdF0UBWOQUyy8PjnjtvZ7CDUO1mGD+tYQwt6iA+tnzOv1Ooc0UkIfrbjLowVQxwttFBytTIpTYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037166; c=relaxed/simple;
	bh=6bQ5FDzc9O5c0hTZjbwjMUSaQKlVAenIoEbVopWDjow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SmwXjkH8tXkvfkBP4Pqz4bIYccOoVO1BcCPNIJ1K9LLW/H7TI4Np4Y6Ungedzs2TAjrxu/YEwNZbPkPW58fiETYvArJYfX5g0hpEp2i5F9X2fAPkE3KRVbBAZD14we5EtxXA0qUNR5ebWEt0xsOnlLdLBanbw+zlCBt52DYFH70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zhsZdRGZ; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zhsZdRGZ"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-48e9476e26aso1502709fac.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Oct 2026 21:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792037164; x=1792641964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cygSHUA7YEh2Fllf4fUKnrZPET1t8vbMRMige3In1Uc=;
        b=zhsZdRGZNOgwfM9WcrTl+wWggmeb/q8oEz+QLLCWV5qirrj06qVrj+cYUOYEggyDao
         wTd+jaSOhswg62DUY22A6V+GlFnLZU2SFqSZ49gkeTPtWRo5UFiWjYsCtMPjuNqziYoM
         MF7KQSFIaSndRgNy+0LRNcG770n3l01jZTcOl1hEFVbsW2+m1xmTiev6gUeHQJ7MHn07
         URDfb3/kh74wHlk9j/rtO1RzntAB5Uk63UQu068JBUYIZazq7EVig0YZLugfs0Yp7EiZ
         pjHTVkTi2fvGyOutcrNvnPJ6Qtzweh/OyJ9hJ+BP7eDORWvlLeLa/2PoNaTNtR40cWSu
         04pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792037164; x=1792641964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cygSHUA7YEh2Fllf4fUKnrZPET1t8vbMRMige3In1Uc=;
        b=l4FtxXWOXvg2jaOntRuEcwyA9gznxaUtgr+RJV9DO+WHhNRSgcQR5kpoWlFkbBOWeJ
         jIcCr6jCNsiPfGoo2wRn7kE7JbbBJsfhNMmrnUR4zfFtLNE/ME5BIuMXDVE8hSLg4A78
         UPoa+pLnv7Mn5/h2CzXsLdZ1NnGZR/mkikh3QKPu6LKuNCjbQZsMTkbWSsdbXu0P40sK
         WNPvDUjFKipSkAyIvzMJ0tBiUMKuPo7lKiYLxJQ0RYqkx9vHqkLsolju0BvtW21dALAg
         LLFiDZe9CtdG14O9yjPlryochryVYRb35vIO+u2NS2jjQZSug9lSZc5eRUSbjvfQJVvo
         NPww==
X-Forwarded-Encrypted: i=1; AKwUvBxuD4XvJfHWKc8kdGozLdeW6i1I6/z7qAZOP9Fyb3YogTW4GHioI86Cu06X3A76G+rP8H2xDUsgXnHEJiRHc82zFA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK8ZpRt7ncJItPVpyYICJkRHojqMScyNoM2nRbKw1brOjEfE8++
	pHJ1rV+u1AS/dgZypQELRB5F1hvpHLgvFV+bqzdvLjeg1PVX9WKTHZAqt1I6QZDbCfA=
X-Gm-Gg: AYBFou3EIUZA94HNoIJYvOfhLiO+mdlCs9GrEaWUU++i+5QqAN/A5XC85Sqprxjqj/u
	ZAZhWfhqFMeTUk8i74bAS6WTZIwVsW8cdd0OeSY1Hg4qPsNpO8v+5vY+kFtMFBMtRNT+9Kz5wC6
	cqNeOd/pkZ8brQxDILfW9mDGf5nL4Wx86hZ/EIe37rk7Tqh87MnWthMHfCGyzsvRdGJXwZ46EcR
	JKilqhd1ZJSrAHbwS2KvSvO/0sjvoDXiqGoM3lpFe+5Bm//QbCaF1YmSEc4DdVUEJlVnIZwort4
	0DMy85yJR2dT8QsRWbqy6qqKl7+VfWKB6iRinTUEOwDszs4uzmG+tQUUG1Vh59El1qdKRbGIRbW
	4i3xzZh97VGWROFlPNqOSf/7VPMgXpWX1ZKz8WG5U7lnu9JzkKvBv/KCt1dTkBsomdgHBmlVm6x
	bYR6PWKeiWppKcsg0yOkVPoBltpUpJNDpWXgrZeBquRj5GYY58DoVhd2HWSd8FRophYzg2P7TIW
	KyhD/U=
X-Received: by 2002:a05:6870:7095:b0:49c:8cd1:d293 with SMTP id 586e51a60fabf-4a2a850ae9emr14476118fac.1.1792037164109;
        Wed, 14 Oct 2026 21:06:04 -0700 (PDT)
Received: from localhost ([2605:a601:1514:4f00:264b:feff:fe59:d7f7])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-4a6dfb4e92asm3570643fac.6.2026.10.14.21.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:06:03 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: exynos: Drop deprecated regmap from reboot node
Date: Wed, 14 Oct 2026 23:06:01 -0500
Message-ID: <20261015040601.30049-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'regmap' property was deprecated in "syscon-reboot" compatible and
not needed. Remove it to keep the device tree clean.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 911643008b9f..30ae952083cc 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -236,7 +236,6 @@ poweroff: syscon-poweroff {
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
-				regmap = <&pmu_system_controller>;
 				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
 				mask = <0x2>; /* SWRESET_SYSTEM */
 				value = <0x2>; /* reset value */

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.47.3

