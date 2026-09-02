Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70DC35201C
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Sep 2026 04:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321959; cv=none; b=jiPPKItrebhtVifKwfSOwYxBUCbylw2bMvz9b0RsOcBDZWVmfgacqaLPgbhcX0PAryDlk0eITqgbBVWDtpPk87GZgKYxicqsfkpsCo/xtJAvLlO6j284Y+XjbnW0ef6cF5dQGrG3HeYsHGOqDG6zby07ujP7oDlnkBWwVSbQI+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321959; c=relaxed/simple;
	bh=U02rSKyzUzmCOmMCAOGr7JPyboEYq2F7JqSsroq7C50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cc717+8rKtfOIDi3umeGFtGigzZ5CjUe2DqVcz69oBUlhbTqXJQ6xkUrQviH8wUcGiejcjt31JeKq8QfaQ1hxbLBRv6ENGkJgjSMkdEbesiOVjwdseq1BfrSCTXHF5m2kFDjfNKchl5g+7S8ZEB5ny3JbfwHkhS4djwqaKjWbD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3ea2ono; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3ea2ono"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso3427385e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Sep 2026 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788321953; x=1788926753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFvygFZGUjQBUvyTV1K8zmfQ8M+g/wd4Pqbb8y8IqXE=;
        b=W3ea2onoKooBqbCDJnvgzlYoAdt89GyN7/iCwdILcLjgDl58tiZscDh6UiWXXkOLky
         Zk3t5/PQv/4jFRXE52e2kSU6lAQwjAp4A5kCcSQ5mtgYk0RlMp790g+RRNY+m4PPkUrO
         b51K7NZhFuNaJyVutDfkVUgF0CbWCvl1JIDtZCxxoJ9m3sOAD/J2IeHi/dajyrqw57fF
         xX/JxScysSEPM6xZkpOEENiPdO/94OUX0W5oOGOCHVHsoTN1AdcaNpNtzMKkuhtNlx+f
         fqJ4GHaSdAt63/SQvDGg0vdBqPKcHrCt+7HyTPXDePWnSbVK8nwkagwsZjkPnQwaOGoC
         x5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321953; x=1788926753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFvygFZGUjQBUvyTV1K8zmfQ8M+g/wd4Pqbb8y8IqXE=;
        b=iAySk5YnOK4uDSinNeLynkJF1L3SkCy6x/mW7cmH22keKbraBjnu1ji67pi8ORHgfU
         8UB0xBSiVf/dCAkogyjONY05wmpyzjDht2Zmq4aVx8DGDL9QjH88eTd5M1F85LTlHnjn
         UsBFA0z0KrRHMtq7+XiKWKICg5czFatXB+PsQED/H+PQLSJzCXywIwVEJ2NAismwKk/p
         yFZ8FBNnPQ24J+XVj5iBDrbWxwPsDO9M7fCiVIub9AZAc0lxZgqaBxuBW95sW2a6yi6D
         bg7WoQAcz6x7qyMJjMqft+mimHTaiMkmPQahM+6zoaJFMgD6MXlg5aV4lN1pLRvCdhT6
         L1HQ==
X-Gm-Message-State: AFuF++lZm1+UV50A5kUQW4wt6h5pkorYXp5It/LvHY9E2xVhTnWzuAC2
	gGXQjLWWWxfdukC3FTk6Xya8HJnPRKNSTGwVVW5pTTdW6JB+nlUavsVDEwmCPSjZuv0=
X-Gm-Gg: AR+sD10D09mxVAwxSPQHYrNxDR+7fV5C7Ra/vIrEJ1e+3Sc2Wj58Z5fTYbuUGSEWDxd
	tOxaBrBETukx9CxU/Slw0GWe9x48NhJ+A5Ne1jd5nxBOxLnlZSeFHwHeLkhFzpW60v7hgprrLqj
	nZpbbupuOHZL3Qf37YwXg3klxpX13Kb1kf/36LuoyAJNIrP3833SDoKkE+BTyiwFP/cRX1MqRtV
	/Ug2RoD7UxgM4wnP5r+IwdbXL0gbYHrO0m/f/HnYOnE7SQyGn7/CWffNLk4XHSMYPBDsVPDxjAS
	jPhJ4m8+TqMdTQiJVNbxjAYhLgw8Ev4nYTiEhLgj5Ai7JQJmmrpR8hZiZeSz31CPPTbwBfBZr5X
	6bRsHKaRS6QFCWDYchOJfU4wJMZ0hqWKP8G+UqDIMfnJeCabohnJXcLdY7IJdz0R+qdRMcIHFol
	UZXOeZrnIOkXp8ox/IQJzLJ80J4/rFhsYwhHhNRcaUJYWkIu56KzSzy57UIGghSPXB4n27zveAB
	/lIwug9i5y+x+SzOkajyPvykr1p0mUsYzQcgiGxEc+uE7MwyaGm9tFGHIR1aRU=
X-Received: by 2002:a05:600c:1f92:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49ce5816440mr28643995e9.2.1788321953089;
        Tue, 01 Sep 2026 21:05:53 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm42979395e9.0.2026.09.01.21.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:52 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 02 Sep 2026 05:05:42 +0100
Subject: [PATCH v6 5/6] MAINTAINERS: add Exynos850 PMU entry
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-exynos850-cpuhotplug-v6-5-a85bb55bb118@linaro.org>
References: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
In-Reply-To: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add Exynos850 PMU entry describing new file
drivers/soc/samsung/exynos850-pmu.c.
Add myself as M there since I contributed Exynos850
PMU support and intend to maintain that.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 554246ef6d91..44986153183d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24290,6 +24290,13 @@ F:	arch/arm64/boot/dts/exynos/exynos2200*
 F:	drivers/clk/samsung/clk-exynos2200.c
 F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
 
+SAMSUNG EXYNOS850 PMU SUPPORT
+M:	Alexey Klimov <alexey.klimov@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	drivers/soc/samsung/exynos850-pmu.c
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.51.0

