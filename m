Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D172C2E9EB5;
	Tue, 22 Jul 2025 12:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753187040; cv=none; b=Uod0Jdi7rdEJNh7DDvy6oq+PrBJvDqivXtlwKRmN4y4JDyFEakMGYzCKAumiayYgQ03JuUg+WEBJV+mm1owYCl57ks0pPCcAbl5rIJCAvyt2Y75Pr6A4wy32LkCLzfU32Sk1cr01WMMK1tJDZKC38kmJ1t59KSZvuPRUBa+kF8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753187040; c=relaxed/simple;
	bh=FmLmE+8nBafxnmHHI4eeweDp/+UEwWij9y8h0gusMGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k03XDVUyqst31Jy2wizLM2Nrl/bv2QYB1y/I0UsWIVuiFlyS6flJ+9RzHl84NVEAKTmEhRj+8+WKfqh6o0ppGWN5aHLsUpaxiIXSuTj2Am18p+n3UIX4wrOEXdrtTgTnB1WXLoBdsPO/LZyNAP3nbFQuFcAGwL6nPl6dFlAmVS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsixmWCa; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsixmWCa"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so9667715a12.2;
        Tue, 22 Jul 2025 05:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753187037; x=1753791837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bb0r5Zm6I8Szf8jWYWHBvZVhi8hKX4btISpujVINzRY=;
        b=fsixmWCao+2m1RZnkfmyEx1TgNu7/DdIe+Zw9O1qz0U4Ua/X5OqY7CsFjF/zR29K0L
         NpAYbaxYCCBMSSUtZXcH7ODTxGtYPA2WJ6A4lkyvz6HfdMAM31Nw+FjJtq6V8elQmmVF
         86CJ7CNPplUE/KRBPm2FWEhS19eA9C0s2jkrsi6YVybR0pZkZyCV1Sg3csI2CJ5iraac
         jFXpTXA+FpeUyZxYayTxMzwKzHOsFzqclwXnmfWeKLNRLqBoPc82Wfdfmqe1de3DJtfE
         rREl+wi7jJc4RotG8vHZuo2e8yqBnQY/RKvtrpiwDp+D8VW0Nua/pN0cmXt4xe2HvyTq
         0VkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187037; x=1753791837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bb0r5Zm6I8Szf8jWYWHBvZVhi8hKX4btISpujVINzRY=;
        b=WiXrAXviL+VKMO7Xw84Nh6eeLYC8XoiO3MypRha0/39oTY4/8M64n+8+mbdPAZ50mL
         YjOx9seoHubuPYlN+eb/KbAWRCgcDI/2BnEL7oVz0Iz06rAE40MN/kfTeIYt5y4gZjn5
         HMAqdfzG5xuNuE7cs1W/e8BeoLx5MrLACxSHrFZjd6Wbrwx5Ehj8vUlWwCLVev7jQBnn
         7NeS39N02gW3HRwm49s/B7MrBACNJVu8iJN7/yElY2qBwYcEyHqz5xjazojkRYvsnTl+
         1czK4B0yA7DIA4aji9j9mXGaVV7k16zC+cz6E+FPsYkdCytZIoIxEBpnFTCHt79hIoPU
         WOnA==
X-Forwarded-Encrypted: i=1; AJvYcCWN51hY+Y7+NXR1Cl8924J6zocTzTORsPPnplQampH/I1HLhD+2XZggjQTrpIrcD3+2J1PfBqOUqZZaGljK@vger.kernel.org, AJvYcCX836Q9hC7UH083luGq/EXllly4wSby3dsaAs6fWZYh6R4TCNS0KIpWLBfEcLRlQzuL3IaSjyhNIRHb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw87LkuAa8PG+ZUduU1Dxrm4vMK0X2p2blN5ZMW6UuawlpFKhK5
	KQi+6WMxqDj26+V+Bc1JHoanzwf3454+DrfZ1kfVQ6CMw0WMdY8BZvb2SQJ8WA==
X-Gm-Gg: ASbGncup+LNZVl0/U1WT+dWOZ+XVNaS4zYdgAXhw/WI0ruISXRCadMV6rRoLbiCG/vi
	bPX74Jc3SzdPmW9mhT4FYZZQfGnHvLU7vvRCLhaK8u4rdGMk0q31Ww4V/QqV1CCd3PFL7aIybdp
	WgazKiPr5say0T2pgCLKneJUE+EGhSEXrFq1pKJ/XecD3MI4MVXRdlsUuHpVnfV9/jL0/HnANVg
	PMnNQQHNUf2IJ2hgzDQ8QHsDiC92PhpqUbaNZT+fwH2m7WnFBwlbYPPtDkK+N9Y8A6drVA9aMCR
	IsOnGV63/NW54MHq80YtZ5jXg6Rg1fkMZKCJI0Ikil4BqjV9BfRF8m17kr9FJUxAm6zMYYKUchI
	j5FJO/bhDNGqIliraKGJS/oXbdT/Zmif2rfCdxpjLlpfIC3w9pYyOtnXGN0upXIFf+ycRVgpZ7A
	==
X-Google-Smtp-Source: AGHT+IF+NKTSzIYSgh6nyT2wXOJlD/Wp8WpRnKhaJeDZaSgHyAa7CqtI6ndxuhg7gUyHY3hN1foHLQ==
X-Received: by 2002:a17:906:9f91:b0:ae0:ce90:4b6c with SMTP id a640c23a62f3a-aec6a623c37mr1731618166b.49.1753187036792;
        Tue, 22 Jul 2025 05:23:56 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79a056sm861358466b.14.2025.07.22.05.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:23:56 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
Date: Tue, 22 Jul 2025 15:23:47 +0300
Message-ID: <20250722122350.444019-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The '2' in 'hsi2c23' was missed while making the device tree. Fix that so
we can properly reference the node.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
index f618ff290..5877da7ba 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
@@ -1438,7 +1438,7 @@ i3c11_bus: i3c11-bus-pins {
 		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
 	};
 
-	hsi223_bus: hsi2c23-bus-pins {
+	hsi2c23_bus: hsi2c23-bus-pins {
 		samsung,pins = "gpp11-2", "gpp11-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-- 
2.43.0

