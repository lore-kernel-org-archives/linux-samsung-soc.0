Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43E719E7F7
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2026 00:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727201; cv=none; b=CSRiRVThGqsiU+W7PFreOVVtk8AFopnmmiRSby6wLVEr7JKpFcT/TpCrdTQ3Z+iyeBsv2o+FXpUErQCbZd3mLK+oMLy+SGnkFuiCGa0fE8h+YEJCDH1uH67mxqmdMvpqKfsNk+EM2oBy9TO+eqXZ82ncUdCNyF5F6WuO0/Vry7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727201; c=relaxed/simple;
	bh=RakvmJw5IkGbBl14MJEb5sEKCKJHoqcetMUQUhf3ra0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sqDhQ5Po6YXxyd8ekS9jUvVm0kHV06fTtRWb2sA3LVgl63Ma1krB4SOA/u8s/V7qAWhu/XJRXlvqyre0nhw+v1m76ZLHXbOmEJuIUtOAwwsjRee2qMuaMTzkOhH5jNnNUArh9KHeh0dWgYs03OQNdQmcM/bpAOPU8FHOzsTpgLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kap0kCJA; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kap0kCJA"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so27018765e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 17:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727195; x=1791331995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awL/I0DSNdektaGl90hrS+nSMvd7q8sCEI8KJnLzrw0=;
        b=kap0kCJAX528IJO+GW6dPvK24rf3SvLfHvjQTdpRLGoqUq1FkQ0sOpgEaYaB00PTMP
         gpB37c4nVU8suJbq/y1pV0NtOiNZjqH6G28/6AmC4xFCjiY1zJSGi6oWBVYW60+NeDfT
         /uMhlYWGNcDoeactWu37gR+pq9A6kFHqBIJD2D7IXMpEC3hwtms64WIECEbYJIi97e5V
         oFo4aMZwHtpaj/cphEJOTEXH9GB6wifbnH0LqnV69rS5vLpL6tCC2ILGWbo4x535HbTe
         gVHx9VOWpenbNXoNqFuC/In+S/HUBdklqeYPLM2LEepNtSOo2wPoah+bkR6YXSWTI6Fo
         MRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727195; x=1791331995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awL/I0DSNdektaGl90hrS+nSMvd7q8sCEI8KJnLzrw0=;
        b=nGOyrR+xN7DOOBCviValTKRLhP2wp8+ECu0nXEqPHhNv2p//GSVTjLqSnDuNJ/IzIU
         zWTYiFXEy7gpo86bE6vuFRF4GewrLFt/KjtYqeBdhJGE+3SeiTVhsuXpcllA8BrZldrr
         zKcaAgnI4q2AITvy7w6LyS5oHT3uROoAtg1VzE4hOTr4yds5/YA9yQCKPL1cEQmLEGR6
         ymC+AD02YXFIU0mLx20VkesP7tig4tEX97lvQDgitXc6ktdhyrWt5qTyDb+41dBkGEfg
         5Pd7V54A/JPzewrhSwCiKYldNcnobGNczBezvxKq2Wyadu27uVp02h6vDlqquqwG/Ne1
         bkPw==
X-Forwarded-Encrypted: i=1; AKwUvBwRyxDHue9pL+vyli2Xfgc4/gS1OuCgmhg4rLAZG3DETRMHk9xonKMNDq+PGbIj3RSr+C5MYS5mMCd2aRRqL+FbBA==@vger.kernel.org
X-Gm-Message-State: AFuF++nyGdl8Qqj3UEO2Cm0BomhVgwAYogNbUNOMuzDSXdkkkULSGOJ/
	hjM9oZSr3UjblDl7GprV45UIDRHSq4la7gTx8Ol5NFUbmZIs92nscO2oPmBP1gXjLuQ=
X-Gm-Gg: AYBFou10kwluFJcqI4SMODba9cW790Kgx07H4lAwbkBD4RqAmc5A3Wmjfswvp+BIC6P
	sf7GYpTQ4dOYlN4bmtGcyC4Y9NFCRcRjB2V1eMJn4eatEuO9zIishc4pmFeMRd5Lf90WTkCDVnf
	aajJRbVN64O0+xyxbPCOaIAg+tmQKsfN9txNquoepGVmWt14j0yoOANnFWsxijvSMNQTzliAqks
	VZ1lu5VeVeGilFAd9JuZi1sR2mkCW3ueoioDm0HG2ORA9VDCLQXZNvUikamz2oGnNlZZtq5clAl
	dbnfqt+yfnDGdMZJw2MuoFHxO+mnioRdG70Zqt7wnZMBzxIW6rVbU9jw8kIeF3nPnvIMhJFwIX3
	ISSUaoSYE1hghLPNf3XvSenaBH9PBJFVIQ2g8EKkvXn5QnRKdx232PPMC9f70nhdqlyXoEtEWy2
	Na75HYzOAws8OAEFT8Tx63pM0SD04gzatJ8bMK+UuxELQrYSz6cmwYKL68kUWOD0Tm++X0w+8I2
	2VBOEW1nbllcbHCEHJjUF20olYCV6F35lh/YPtZZRm2oN7oa3spwS3my4ZWZQ==
X-Received: by 2002:a05:600c:4fc5:b0:49f:f997:7ed7 with SMTP id 5b1f17b1804b1-4a01503ca46mr9945865e9.11.1790727195101;
        Tue, 29 Sep 2026 17:13:15 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:14 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:13:00 +0100
Subject: [PATCH v7 5/6] MAINTAINERS: add Exynos850 PMU entry
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-5-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
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
index 137297bf508b..810111c83478 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24622,6 +24622,13 @@ F:	arch/arm64/boot/dts/exynos/exynos2200*
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

