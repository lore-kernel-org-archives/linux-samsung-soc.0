Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9821E7676
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733229630; cv=none; b=aIIa7qzGvw5/fEPO30+qayBw1+boIK5TLkj/hAv6lKaQgGl2xWs4mmpquJZs1/Z9mZ89eDtreZlcKISI5dF60nIH51tkQ1G7MSkrqdXOQZYBTQtawPdwJjRiggSIZGY2v44ccJezViY8vv/fJgrZw7p6P9XZmLdghJ/SHe8kFw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733229630; c=relaxed/simple;
	bh=wuW9dlmQHK3i/Jcfb0eJR/IK57A7oEJMFzUPWXw07Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gyw2dvaj5BQ9lSF+N8Mt8Nzz0+JP8aSILPZGBRuRcpwkd4j2NLmf2u/5dfs6AegzClp9vN8BT7mzHofgE18eETExqFQNl7fnl3YaVrMLhMwSXf0AqHairdDexPWFRmLe2lSpWb9oDkyNuWhlVgjmQHIL37Yn0js+FqxW9t9Qz8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yFaBUlMN; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yFaBUlMN"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d0ccd931a3so4404322a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 04:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733229626; x=1733834426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFCCGNoly/ihHw+f0V0Z4F6JNgdV9f0RgxXs1v/pmwo=;
        b=yFaBUlMNnZAAoJ7AVCC17HlfrbiVEJSN4sYdHxbO5CkloLRsoAgm5cD4RrEG5wFuWH
         LjsNolr7AiFOX01F1+/vyUtKayG4+eYeA9nr78j5xNb94SaNahNWyNi7Hdw5pD1TmTu0
         q17eTpcj/Yc2EeK2G5b/QJdsGmjXpND3H3rheMy0YN2bKUHNrbCCRarKmBPr8ltJR0q9
         V1za+CemA03lO0wnTvOa/N5awDnvHFhJIdnZshU1GykHbtRLjHT0VtvkLrOYGJaUvY69
         e1F8SNtk1tDwrsMW5/hUOpmsuOVlWWOmoZh0PuMQr5ntLvkP2CyMnVp2ZntjD9fSold1
         LOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733229626; x=1733834426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFCCGNoly/ihHw+f0V0Z4F6JNgdV9f0RgxXs1v/pmwo=;
        b=pRly1WqkpPK5PliwazjmWhAAsbfNT19I26ji0miaDcxDLRFcAqr0Uzgj0bCZDsVCDD
         9g/0+p4rfOpqG0U24Cjk5pZJEVHoiX5JEpey89EtSWgFhs3OD3lTuRWll81+hbEFQXnJ
         pVl7dyL95vbhuOfkKkvIHKjY8RciL9WXq7pdPappzBCRLXi40c+Ek3YvjDyNPLchXnEG
         5YQ0ghcrsZR7+L29uqthQaki4VY22+IDJCDtSGMOjoXr24tpvT66dxPUhSaAQnZKEUhl
         962b7VjL18WzTrH9T2iwnF0EcUjZzsI8KnGU07ZaDJpQaVTSI/yXl7Ics0JmfvWnmVh1
         qqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9PGVyuQ2GpG6VHMsz72/9TGoN3p3e/EBhphTlT+FgZ90sBgfheBwc9VcXRWudJIYB/fu35hi8ptS03y+1m97TCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBjaqJ9+VBVKawaG+Ovfq8bZqnFIbq5sH0/KCgkWzlr2YZMPlz
	kIl8CtkMG17om2OxsGY8YKpUmkrfwfQyB+Vq9xakuD7kXxt+waZe9Wh8FIHqXAs=
X-Gm-Gg: ASbGncvNYdY7oZ5MFDwZrM7SUnnCDOnIuI8e8dpi299RIt9v8FERTOJlYgifGiyYJec
	36hSq6kNXkIyufLfxxtWe0HvdT88Pqe+dNDD1ncco9t8r3I2NUi5K3gINHjyG0KYTlz9RZg0XYY
	d7/YEXZISm65YLhTSxn3NHZSFAVjeBdkP8Zs8V03i8SUALoAxC+zeKTm36+zUpvIStSgyNaKk4W
	EURfrV6u4TPWVCRcpE8JlaaVgNR/oNvwMVX2X/hBm8yywYmi7/NI7LiMNamUIUzW9wWz2rYrBRJ
	NLaeJhFQGTIfxrdzI/fOi7TozoDShbcrsA==
X-Google-Smtp-Source: AGHT+IHeM2tS5DyKwmkwrU7i8UC/H8zcEneFmZTgM0O6tCH1VZOWSZmfl7YcO9+J0m0pG/15uh5zHQ==
X-Received: by 2002:a17:906:2932:b0:aa5:1ef5:261e with SMTP id a640c23a62f3a-aa5f7d4ed45mr162940566b.17.1733229626589;
        Tue, 03 Dec 2024 04:40:26 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a4csm616809466b.106.2024.12.03.04.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:40:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:40:25 +0000
Subject: [PATCH v2 2/5] arm64: dts: exynos: gs101: phy region for
 exynos5-usbdrd is larger
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-dts-v2-2-1412783a6b01@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Turns out there are some additional registers in the phy region, update
the DT accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 302c5beb224a..18d4e7852a1a 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1267,7 +1267,7 @@ cmu_hsi0: clock-controller@11000000 {
 
 		usbdrd31_phy: phy@11100000 {
 			compatible = "google,gs101-usb31drd-phy";
-			reg = <0x11100000 0x0100>,
+			reg = <0x11100000 0x0200>,
 			      <0x110f0000 0x0800>,
 			      <0x110e0000 0x2800>;
 			reg-names = "phy", "pcs", "pma";

-- 
2.47.0.338.g60cca15819-goog

