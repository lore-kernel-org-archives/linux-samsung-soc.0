Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32619925A;
	Thu, 25 Jul 2024 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721904053; cv=none; b=Riyh0inLWWv7yJTyr0UoIqWsySbnJYTKUEs2sni3GjIPqIyJRJcZiMjjXr0u1ShPgcXDAgUlQFxgR7hg2zkE68pdP6PheZC+bSl9yD3sPNi7qFsGbqZumEv9ngOwH1AR70dS3F2Fp90p2aAbW8jOxt/wWx/z4QRkoIjgem3h9d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721904053; c=relaxed/simple;
	bh=roUKo7CFEIQkN7A/oDyigzzuh8PFW77vS/znRSNpqcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=opxPH+OcOI6VLJfVboTE8GQdcqdOctklS9IdTj8C/iJgiGR4ek3cQK79QFim6a7PQY8+AsT2lsAPWMtEkqdb6bfRFIXfN0DSr9Qh+R65dxnSStJgcG9oR2cQ6WHqy6zP9F2u+DhLWJTCgWjI3i2qjTFXvQbArZ6bbUArU70tH0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czzxg8O6; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czzxg8O6"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7a81bd549eso34566966b.3;
        Thu, 25 Jul 2024 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721904050; x=1722508850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJECV00aSZJvcUel7cdkOHAoSvIhtNZxcjf7hQkKcCw=;
        b=czzxg8O6WlboPN0FkI928eErt9Dxd9XY8aVa72yny6Hzg9vOEbXaP0mYxBan7Q2W9P
         weYoX+L/GeOrw+CyOIFdhnDfLYNaabn01e0eRHheKGBjggV7BlgBROrtGNQEFvrkXcLB
         8jvM0AC1N74yvHOFewUpUfG5t524DBzjCvotZMCfDKTslJYrow8ln+ePe4lFedwgYBR+
         rw9kJNl3yLe1Ugln5KdMznGGmxbxby1g595yhSTSFjBYnFhkYTb4LcJ62SrI7pw5VqCe
         7woz9ehpOaKXGhvc93b9kDMMikmDgggxPIfG2phkt0xUVbIGn08trRO8xLBt8uJUgt6K
         CyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721904050; x=1722508850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJECV00aSZJvcUel7cdkOHAoSvIhtNZxcjf7hQkKcCw=;
        b=q0YIUxgGOpnnN3aGb1WZyze+RJ5eK4DmBeOYSkclCPBjS71dRVgqv5gv0Q2FcCj1TR
         SXGL624EU+t5IyQ17p9HU0spqMax6zFUICljK12UbzGlcx5EwPXv0fOqd056fqpf5K8+
         gDVtiALmq+fXNjt9VjQBZUFAXPLv/jAVaBt1cFR7oISk2XeDNzLt3f0O8//cgXATqnZi
         eO6OJE2g+OqnVgmweds32Cyb6ADM9ma7vz2iY42U3JN4xFOpjjqLdWmnpZJJSrATekG0
         eeGshS1la5f7Itlijya6E2uaxRn25dw5c109GUnsFpUvZlqGTY5mV6fepTIrQhhJApxq
         UYaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4rLitF5NDFfWeswXG+Pp7sT98QqYaqBBjelOgToSFZUU3pFbXYiuFod1+V0jf1+XS1wkREjY9cSRlYUq0dUZgQHnUEO+uhUv5/NuKbfUSaw7a8TzsyooidyeJZIRwQAUU7MkOJkItjA6c0hywEFdODjJWqDlY2O0T6yCqEkNXxTNUaLKIQkVEy0duww==
X-Gm-Message-State: AOJu0Yw8LRz7IxEJgDLcfcTMQUcQK583r7XS+4MIqZwpvlAUH5GTrGIn
	UGMVQWXR//vfE4l4dOpoFApEZiYrxn2Hzw5YBUHqrqsf2JmY0Hab
X-Google-Smtp-Source: AGHT+IEikXKg04ARhssW/AiIZZ8R+Aawhsoiu6JlzbB2M604sKuPaZz7gj0BaIJjX9DPfSg/iy3gQg==
X-Received: by 2002:a17:907:2da0:b0:a7a:b43e:86cf with SMTP id a640c23a62f3a-a7ac4f2ab39mr183502066b.27.1721904049824;
        Thu, 25 Jul 2024 03:40:49 -0700 (PDT)
Received: from tablet.my.domain (83.25.114.69.ipv4.supernova.orange.pl. [83.25.114.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab23d56sm58342066b.38.2024.07.25.03.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 03:40:49 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 25 Jul 2024 12:40:39 +0200
Subject: [PATCH v2 5/6] ARM: dts: samsung: exynos4212-tab3: Drop interrupt
 from WM1811 codec
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-midas-audio-tab3-v2-5-dbc055c27879@gmail.com>
References: <20240725-midas-audio-tab3-v2-0-dbc055c27879@gmail.com>
In-Reply-To: <20240725-midas-audio-tab3-v2-0-dbc055c27879@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=roUKo7CFEIQkN7A/oDyigzzuh8PFW77vS/znRSNpqcY=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmoiuoBrt7EUoGhEmOO8WCtfUWJBFniV6o+8yE6
 vbj8W7rcDmJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZqIrqAAKCRCzu/ihE6BR
 aBRfEACHwk02sNzZBwZL27qnehvZU1Yr3TFZM3stZBQtbXYCvaZOQcanMkSbrEXmhE2UqoewjjL
 mt7agvyDUS5t4vKOkBebEYId0cwbRjxAGyUedp3W6Gr20KcKj9aLu0RY4MhwTIWjGWB4hCS8fzG
 dqW6VI1UbjknCPN8Jewz23CvEzfPNCX1zn4nSbn8SVnlFJMSskcHz483SayDq1bMXewIwezVVOn
 6TnIbQ3QHhvQO3sYLTzx9yq343Fw65KIID4TQ4v8DQ9wNpTE+f1paYrmtMdgAwl6iTMr3+mnyiF
 lGO0qyVuaxsfH+yk4jqDM0LeOJJmPd7NRVKuJeIDzDxe8EgznXNmSQmX5mMwTa11X9nctd6Sfvs
 hZFniRjJXTkGWFct22DAGwQs5D6imFAESRSzgCYLXZQlVnb/68OwBPeQpTLSjxD/FrMnyYjPcry
 T+Z3g8dqOIJ4VXkZs25RNUjioKEv/LlBasIbtzjH9LECs7s64uhuZTwISccP9jRSRpkCbiB5v6a
 OSSZ1eR+LjRVUznq/kFpAMG+3Di1ugIlj/1br8t8fNd1gDQN9PeS2B0mHKkXx/SSl1pVa8z82Xl
 Q+5b5Ia1IHl3AhxVLLMYr1v5dnxih6uwXbVkTCMk3mty2Ax8JKuk4TnPQvM3gIrntdLhraH/0h9
 w6jy4bw3fPm9gew==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

This was initially copied from the Midas DTSI, but there is no
proof that the same interrupt is also used on the Tab 3. The pin
listed as the interrupt here is GPIO_HDMI_CEC on the Midas,
but for the Tab 3 it is the headset button GPIO - GPIO_EAR_SEND_END.

Drop the interrupt, since there is no proof that it is used.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 5106bb752b7d..70e3091062f9 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -540,8 +540,6 @@ wm1811: audio-codec@1a {
 		clock-names = "MCLK1", "MCLK2";
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		interrupt-parent = <&gpx3>;
-		interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
 
 		gpio-controller;
 		#gpio-cells = <2>;

-- 
2.45.2

