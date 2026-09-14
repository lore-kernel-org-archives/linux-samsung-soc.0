Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC3B490BEF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 16:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405131; cv=none; b=KNuffqIbc+RU0lbXWlitP52ZI53/HF83EFLanatmRH6kMqAQzNEWMhHAy8ygJGw/nDw1Sw2+vc4xRRExhOvQYP84dP3n0G0SPcEsjZXdMRUjDnXGVNwsw2J3M73zDsE26i5QcbJG0dEyrdBiy+7Tlld+UrgRssT0IKFNVIN0rcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405131; c=relaxed/simple;
	bh=vQZJxL2K323Aqi0Kksky+b29VDXNl7ZpFQVdjp4dKvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y4DjAu7Ru8RrQMnqpqgZDKurqYZmd61e3r6E3CuRM+Ewaaq48u0OnDNFGw6L1oGy3JTmtnhSod/T3SVPi996zbtAfPh4j8gwhYs8w4uvhiRAhUZb0mJb3GexD0ZcX4RKlQjRou0Usr4PDWfAidzRAR20/TbizgX0RNQOHsUMEYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N0Erb8jU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N0Erb8jU"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-486fa798933so1586417f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789405127; x=1790009927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eFndhQmJL2HLUXXHwE0V3+xvGtq4NGEK5ul7Tv7r5I=;
        b=N0Erb8jUYdWjUEi3FT62R+vexD8p65HxHbCIxlEfeWxOOubvsUiKr3O7juwlGMPLav
         dWwLasoiPhJkiQ+peDezDyWdP9bb/SvhXw+PyY9z5BYgLKHFth//AhIJKyhTIX9j+bkD
         JCYxWWNVuIOXKwqW4DOxvHfKmDqyawmD8FSMW7umwzr/NMmMmM6yP2eZ8J/Pu2JaVnpu
         qcR6ebpQm2+Dp0EA4nWo+vCcNCUXDCH03DH5X8EZmXHAHkFPThxjmBMTzF1uwvc7RRyV
         CAr+28nU+Es8bxFR3vt2a2yJgi40wFHZ5OXb1rYzlLdeBe6nz6S1EQY0ED7ZeK544ZVN
         xIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789405127; x=1790009927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eFndhQmJL2HLUXXHwE0V3+xvGtq4NGEK5ul7Tv7r5I=;
        b=eAOM5We5h63B347C4tZHYzJbiWaBYV+HCRa5FJw/C8ev6Nlv+M1YfpLcO9vuMVz51/
         IADoyfbV6mrN+ZE9wivbI1SwRhtBep3bvFOH9Ssfq+0l92X5/sNGv++dQSpRst1Edg8h
         jhuwwXAxTK67i1NCnD2XpQLUGZHQwE/Cdql40E7FhS5HmKpMo4uo1Vkj70ViwaND8FuQ
         ikQYMG6xqso91qdeKBZeoZ8JTdrr/EyepZXDaFhYZYxP9H3i3vQy7H5gKF58JNfkhbaG
         d3o+CSRs+Ydzmz5ctPrn/11bcwFtW89wuWSLO5A3UZLi0I7dWTyUEQb8+/MUsJr62J6V
         Ua1g==
X-Forwarded-Encrypted: i=1; AKwUvBwMiXRBkkuS/5ZHE2P6abEOfk0hcxyJB0EYMTL5WpdUBIKoqWIEfkG9G3eZ4qSqoSgRXnsBNi+tDci5c1SM/9R9vg==@vger.kernel.org
X-Gm-Message-State: AFuF++m/XEJqm+wDq91QgdAIl5QMzvCk/Liw1ryGA6A+gxQdMyltnV8J
	xRbXSSvadFinZX4j4Fijs+Mve8w1ntjsTfW99mhx5wcslezWgxUR8j9MbGpNZrL7Wq8=
X-Gm-Gg: AYBFou0t3BEvLMfWDM0gXHHH/sueUMe5HPvhN9YwQptgR0POO7AkoRZfILRJ0vUot/g
	IJvKVZib+BW617AHVH4Z6Std7QuKM4Se56AKCXtXEb97SxJOczWlDhU7kTbf3yqfpgzto6XMKtW
	XBvzeCgFyxN7CH6xcpnC+d3ItP/rchFoG7FtukmsGJhMHgNq9CogSkQ2pL+nDZ3h9MtKZR4Hd7X
	TQxzbHlw7U2GwAOkNCqXE1klifdblD42Ezwf0TG9RrHSQg6d1tN7IXIfQNnfCOdlcG1/iDk3Gz4
	dqwLgZZhK8fORi4ILFsYFzPHJMXx8HNaBZqrQrcNGAy2rNOiVOMuyx6PUVnNoS6I13CO3CxXprk
	Rk14UNsl3Jq5WSgd9oGr8LvRaNetPTIkjc+A3nbclZRyUOAT2sl28uNhfUorfpPl8C/mw72q5AJ
	Wz7G/7yp6yFumPeUh760cYvJv6/0SfAOT//bAYkbD86fuCQZAx4/SQo9qoOGOMRa1XZR5gv1es1
	flmbav365mzjGHe+Z0rGy+hEAHyNhAaU0tw6CmQFT4xdUhZkw4uNXM2IoDKels=
X-Received: by 2002:a05:6000:471a:b0:486:f506:2fa8 with SMTP id ffacd0b85a97d-48702ac2429mr4455498f8f.18.1789405127590;
        Mon, 14 Sep 2026 09:58:47 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm29636198f8f.7.2026.09.14.09.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:58:47 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 14 Sep 2026 17:58:45 +0100
Subject: [PATCH v4 2/2] arm64: dts: exynos850: Add acpm SRAM node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information and configuration data. Add the SRAM node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 911643008b9f..2128749d7647 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -176,6 +176,11 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
+		apm_sram: sram@2039000 {
+			compatible = "samsung,exynos850-acpm-sram";
+			reg = <0x2039000 0x30000>;
+		};
+
 		chipid@10000000 {
 			compatible = "samsung,exynos850-chipid";
 			reg = <0x10000000 0x100>;

-- 
2.51.0

