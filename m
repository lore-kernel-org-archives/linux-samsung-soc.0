Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39AB83A19;
	Wed,  8 May 2024 11:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715166090; cv=none; b=c4nHqfVg5QCPD664t+vyatCsK9pXydZFcMHanggdUfQzQPAmOWIe97ulQ6UMgDJZDuNoEPtlGhrXMtFUG9cjQ4oFy0mU+d2T6Ri0v4xVhqrBo8wnuEM9xMugjVMgXZWPT/iWMpBNfVYsWGNCwlHLLl5xMTFOZdPgKsMn/EE6k9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715166090; c=relaxed/simple;
	bh=UL/4N8rXRM70GUqix5tPsZFEQGhkMZHDmI2ayaFJGlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HnQ9lQPTNHPfwVozZEmSA6tnHc+8j/d2s6NVRcsi4RjL3sgRuYLFydz6ysG3xwZI0ceCKQXq8NfjlFvYA9hDhQHO7DfsGjMxVEiYP+8aOeRrhS2i2HCssAjfywc++uwulEvUwq4ygZb2xHTd1dEEgPU4Lr6NqZnuQaXNG3gKhvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRe9OunH; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRe9OunH"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a59ece5e18bso488475766b.2;
        Wed, 08 May 2024 04:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715166087; x=1715770887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xXdtLXh9Wq/U+DCcvi3Zl9MvXXMxZj9qmUG/1NN6b8=;
        b=BRe9OunHfu6osrKvLgMw+vaWMBo13H44Xd2cp3AaeD7b8wrekagRlsW1jmcgFMD91y
         ELmSkZdwB+zXfuYKledn9ILyTZn6qDfuob6SXZEAb82icDdXmv/PLBiloMpZ2Y4iB6Zy
         QhcKJpoXqi9I0Y33Yd/DmcasltOAop9Ef3Arv7nqf73awcOYb3vhAuk1BS/ursrGgQWA
         7tpk0EXKrfF8keKGSx7uZlf6SUonuox4+dnGklM8avfbCkZkzR52rSneDxLL8vvbmsnn
         W30f7vZjoYZKms7R3IrjNdtuj1+t2dYp31axemOnvLif3TCnbA2dwZiYfSacEK00Zlhh
         sJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166087; x=1715770887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xXdtLXh9Wq/U+DCcvi3Zl9MvXXMxZj9qmUG/1NN6b8=;
        b=g1RNmFc7czmdN4v4bWEGRhv7ZDOsMRR3AKm/ihcam6/RunmgI6Xsxgdu+AfR34TuCy
         b2wHZU9g4BZv7jJgwMBMGK3B1vJN24Pic2Z/MyN6ZYyFuLMtb+9CBBEp8DVUfmLd+iiM
         VJcO8PZ9O+78Ej0Nxhz7ZCktVpi9134abFitusU7+fDC7baGHQlzOFwN+PGzmI93thyM
         97GQ+TIYVcZiIDj4g2Zj6Q7BvhegoX0wRpNQUA3dZWglWduZ5v3vDqzQRSthMCU6jKxW
         RkcQnzwLZFLQlzNDYtuUms0dfW0aVSf8Hw4+9quI71nLegohshzmqxK/6c07psrmwnoo
         1psQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/K9lXeYP9Cvwxocz40wgrZ9Og1C5wkIvHH8OB6MOnHJakbuJl5TbigQAgjdz2B6UB01i88rF1UrDeZV9eIUqj0kfRecpUumq4pJWJiPZFW4nBPoG7wLZQEZVdbtzhI9bw/C/f9zfOi40WW7mjN/X8ng6tLMgifMYcoOiZHxVBTTQaBmZG6ZDtZR7m7hZxVTAEl8wj5/+kRzprk4j3qWqjLrNbxSQ5k4Q=
X-Gm-Message-State: AOJu0Yyu6p64VG9CEZ+JK01OsYWaZWVZj0ncnYvKPVeExWlXnLHBVKft
	cM5ayqQEVyXQYiKwnCwZZ/Y1YJ5kNTmQmAqPfq2800s8accXa8FC
X-Google-Smtp-Source: AGHT+IHSvqngLWudU2mq3sRdhAXsMHPmyVHOgZ0v5JQdfowG5AeyhCGC/cKuo86niykSWYIXOiqDig==
X-Received: by 2002:a50:a699:0:b0:572:664c:83f2 with SMTP id 4fb4d7f45d1cf-5731da68d64mr1873313a12.27.1715166087014;
        Wed, 08 May 2024 04:01:27 -0700 (PDT)
Received: from hex.my.domain (83.8.126.253.ipv4.supernova.orange.pl. [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id m6-20020a056402510600b005726b58a436sm7455793edd.30.2024.05.08.04.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:01:26 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 08 May 2024 12:58:55 +0200
Subject: [PATCH v2 7/7] ARM: dts: samsung: exynos4212-tab3: Fix up wm1811
 codec config
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-midas-wm1811-gpio-jack-v2-7-b4d36cd02c6e@gmail.com>
References: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
In-Reply-To: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166076; l=1054;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=UL/4N8rXRM70GUqix5tPsZFEQGhkMZHDmI2ayaFJGlM=;
 b=7BPWy7GfZUBZ3TTXDAlEmhxr7SnPBBZ9ehQ1CJLgWoE87M699gDN5kcEDVe31eaoWB0oP2YD5
 Aj6UHKKMILGCsBtWyvT/a6q3VshUe0QJDlyqa8bnGA8MeXyc3wPf4XJ
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Drop incorrect interrupt parent and add MCLK2 clock.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Split out wm1811 changes from midas-audio config change patch
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 8dc81112172c..20e5e7ba6b92 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -529,12 +529,11 @@ &i2c_4 {
 	wm1811: audio-codec@1a {
 		compatible = "wlf,wm1811";
 		reg = <0x1a>;
-		clocks = <&pmu_system_controller 0>;
-		clock-names = "MCLK1";
+		clocks = <&pmu_system_controller 0>,
+			 <&s5m8767_osc S2MPS11_CLK_BT>;
+		clock-names = "MCLK1", "MCLK2";
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		interrupt-parent = <&gpx3>;
-		interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
 
 		gpio-controller;
 		#gpio-cells = <2>;

-- 
2.45.0

