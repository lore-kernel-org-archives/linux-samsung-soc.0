Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF2723E25B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 07:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752132904; cv=none; b=nHwls6dRHoh9Lv4NzkeNZeduF7r9YE025faJnCO5L1AqK09kzZnajDVm/Xjgdt1ncXGFK59033vdFWJbc+2SSSSBYAV1/E4Nw944BxJNbbT0xMxTosY8l+MSN7YMGNVSBw/44BnVJg7I+W2lFGAvoxBnu1W6FANwvWIenWbcjpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752132904; c=relaxed/simple;
	bh=d39nBvEBYdC3uHEcBXf7x3j1kWB+ksaAnGiURALeQcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=idJHqSsFE4kNr8BCTcmwYs6VacTAuwgyKtVtkZcT4GOHERlcwpfCgYdrFQdzxhqgZm7b5PU3YyRlIOKcHOQVnHPK0Yl47WsWpVJ+c1DnOu7WrAyesGmX6F5ZfdK9QFxpelENq29jRk4zmZcmlfIgVKItZlRmRz6qE3BfSLJz/Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGCtWr6F; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGCtWr6F"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b39c46e1cfso96110f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 00:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752132899; x=1752737699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eKH+aO2rjY7GmUAztpIfNiK4qIgC0rzf6T7b5auiuAo=;
        b=EGCtWr6FR0wUEJsfGnkfdT3y+Fa2R0ZliRYN7dZf6OEN6+Jn1DGuIOqPZYsnv1Pjx7
         YLDZk/NY/nkerSMvxGGSh0FExzUwms7oX7VACfT/xVxOEw3txcfQY6S7Xp2UoDj5RnCw
         u0uC+O26WPdzLnAV86/YLqk0lnG1oJ31o8HDmMFB4NOWqMI7eh9m3K1GA/9liKshfFnm
         dpWTaRpxwYvuHn6XEmVYLvyQ7HuQknDGDZaI6haOyirxSqeYKEQDY72ErgWZNFIgDnaq
         S4cn7Qh5s+NJHvKMXFVUtL9a0JKAvMFYWVVnSdIKPQU12TTmrXwkiYTkKdqhVKc5HsaH
         Vr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752132899; x=1752737699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKH+aO2rjY7GmUAztpIfNiK4qIgC0rzf6T7b5auiuAo=;
        b=Ewy1s4mx9TibIVjK950WeRucLpWMUXjZ0j56w4ePxDprmn+dmqCjeMalLjiOfzLENZ
         SpW8+7n+H9YqYJYBoihWaFElVSBnGqNBhClI8jHnpUkBav4S6pnKOuQwzpN+HGUf/weJ
         K7dVuN/IEk+akdh/xedYyQfaxfOXhL9LNHe4wprpujZQiQzYr3dtou9kooM0IxjVzte8
         ldMGs4i/16BUrQe5qk3VCrrVUaGap6Wb5IJhCEJzHHFPx6sHTJuAwkZHF+zztVjzu+W8
         l2XGo+MvNEoeF/b/OdgOwfsgXQUR4D/N2lxmiZREvbZtSgeulYsDRgGo4nMBW45aunR1
         3Mpg==
X-Forwarded-Encrypted: i=1; AJvYcCWU6V80w8iDtYcD4ef4177pbhPZCrZ9x4niVXDdVBtOojTwXT7hUoVkor507U/EOWZQCW986ZdZgO7WYHdYVIUEmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU9s0PWX4ErpE/besloHI1rjFx+om+EdIgd9g3Cvzur6nU7N3W
	9oHLyVb241iZHLvkQi8Fqq5C8VxocRbiSVx7zZD7mJkAzXF2wB6PZzMKVnzJUCpt8M4=
X-Gm-Gg: ASbGnctCnjM56+OtRuykWlQvtkioaiAQFu4UTLvDOTgwzjAZ6PjGaPKSzA9bm8SWGZM
	6YOn0ACx3O4NcpaqRClLt4zywB1BCDV+n6pBtPh3qB5efRNfCHfAWAWvOZKPHblOtJrbp7RYo0b
	WeL/mzc0zaWQhF2ajOo5ztc25JDrdkFbW+EqCUjWBgjCDj5zIcpxNF6slBt/ghUrw5kVdtgwY3K
	QaBoQyOSPGQkW25cFb5MCsQkId9181TqMYjOFoQEzhLEGJfdkA4bPTdnmyOzx5Ca877XzFECeBC
	Or99VlZaQ7hdgCKJnLjX6/xlEXJTTpkltvrqdW20IibWRr10Jm3svzd9boib1osCRPqPrMxwswU
	=
X-Google-Smtp-Source: AGHT+IEABgTHpJuOVHfeR0LW6JPSlCNNGz0kLe9NhwWkBaf3MGsAU8IXDfncPgdRLsTmveiPVUe0Kw==
X-Received: by 2002:a05:600c:4503:b0:451:df07:cd00 with SMTP id 5b1f17b1804b1-454d54022a5mr18146195e9.7.1752132899555;
        Thu, 10 Jul 2025 00:34:59 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd466154sm10826555e9.12.2025.07.10.00.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 00:34:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: tesla/google: MAINTAINERS: Reference "SoC clean" maintainer profile
Date: Thu, 10 Jul 2025 09:34:44 +0200
Message-ID: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=d39nBvEBYdC3uHEcBXf7x3j1kWB+ksaAnGiURALeQcc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBob20TKRivgecVWAUhUenDgNDULB4gEgAPU26Mz
 5fZljgJzDeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG9tEwAKCRDBN2bmhouD
 10KdD/0aQJmtgD0v956KA9gKqa8XetCl7cuwD54IaMQfP1htmD57xwa2jvS8tZdCHn7HLEBj+tK
 MpkP2fLJMyLrSMrKHi1NG/5AlVFrnOyAwsXaMXm+m4r7vyREzl+B9ta1AmqbDUQIqwWJNwym/u0
 +Y/zAIXcNAl7zoI1/Iv+a1WSlMQpopcv7FU2HHlvQq7P9vT6GUzfZDWdL937RaC/e+x3k2Y75IY
 XO+oS4rRB5fREV8x50kbsSWcvTXUK2r8W8N3ozpCUtgYo2n+SVMTKfknG5zlLyzntbcShhtip+7
 3X5cEwDCwoFvPIS1Y2rYEj7kru9V5pbLCi2/fzD5WEcDafEXHcAr/IxLYJ5kNGVH8gAiqGlOA9s
 wEtTLSiy12iadzaj7wUr0PYydrId/41LlgSyIKe/KBIl/bBqxr4FFDPUsDiYyk/qjhrtE7sgvhT
 tcn332YxguO9xtOYJyAmw9qA62ioQTJ/bT7a0d+FOfDFIpMm3RUI0KNrfjIjTgfPii2M+c2BGao
 xmQaJnZOMstXfwTYVZMYeAidtlltrahVqY+aWe6++rXM+9i6aQkoH37HLsqt6ou4rMRokUyxJ4m
 UTjduzAq0FxJNxJE3UDy5AP0I1VrIl+WpqStqgE0nZX0lE+NL/eaLkFhA3APnjbbPg2ek0+xIDx oH0QHIARAWGWjLQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Effectively all Tesla FSD and Google GS101 DTS patches go via Samsung
SoC maintainer, who applies the same rules as for Samsung SoC: DTS must
be fully DT bindings compliant (`dtbs_check W=1`).  Existing sources
already are compliant, so just document that implicit rule by mentioning
respective maintainer profile in their entries.

Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: André Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efba8922744a..4073f7ac978f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3392,6 +3392,7 @@ M:	linux-fsd@tesla.com
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
+P:	Documentation/process/maintainer-soc-clean-dts.rst
 F:	arch/arm64/boot/dts/tesla/
 
 ARM/TEXAS INSTRUMENT AEMIF/EMIF DRIVERS
@@ -10317,6 +10318,7 @@ R:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
+P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
-- 
2.43.0

