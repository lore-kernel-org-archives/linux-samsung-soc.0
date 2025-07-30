Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C406C28EA63;
	Wed, 30 Jul 2025 07:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753861381; cv=none; b=qXkDzlz8qS2o8W9TtGMcG/Pe5BLLwbAZln25ulmgPnXDW6diopVYjburphL9wc/vXuz6CF5Le4yLULr2FAQv/V38NWOBTgUNH75pDZSmvpjT4FEyTDK9kk/zFdlO+AWlw5xv58kpgj912ebp6IhReGPtBmqMaCrCbcy+uQ0DYWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753861381; c=relaxed/simple;
	bh=FmLmE+8nBafxnmHHI4eeweDp/+UEwWij9y8h0gusMGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFOUaGuwMTJE6gWEYr6rgd5OSAWb4m8cvqSlS12WEKNv9kok7b38/wTq0cQmaPk93M/g52BE+h4+QFcE3Z/XWrXE8apaDIZFo1tiCZ0vKpxNPi9a2vv93pnMz/51IVriimrGP5rH10ziKNMagOU+XjIjP6Jioxe5LuAAo3XXkFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T42bk9jb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T42bk9jb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4560cdf235cso30970615e9.1;
        Wed, 30 Jul 2025 00:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753861378; x=1754466178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bb0r5Zm6I8Szf8jWYWHBvZVhi8hKX4btISpujVINzRY=;
        b=T42bk9jbpll8t9dZ8YhJWVGVN4OkJhnsE5uAy7MxBl90/v3cpU72rV9sa3GJnbjv2p
         sXE6SKPiYcUn2XpANs/1zlPPYRLaZ4Ecs3c4dZQ0W2qaMvDL43sJt6Tlp22I2ACNisG/
         RNi2nKABO+QiE8SyST7bMYg3tZ+0x/6xirKOpucu5Tg1wZt+CrRfIv1Bzgte8uLpTsXg
         vl8xSdv3kKCn1Xoim8cWwa8cCmh4qE9W5upTL96QRr1jBX/fcfvTNhZHXwePjG/EuAXm
         IvvRhDbgDeQpKQacTGg2WZ2pm/n7842mXgmbdamMpcPxdA7Z5N5O8qNkyBZ2j8u6hrbI
         ynzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753861378; x=1754466178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bb0r5Zm6I8Szf8jWYWHBvZVhi8hKX4btISpujVINzRY=;
        b=b+otUf91lkcBjd3J9YJpXTVXNZMzcJFiRDPILA0cuZ5uueAOr+lpzV2lG5SzJUk1kE
         1nT/ihArKIgKoDY4+bkNEt1d4zNK5UoEJvy+mw1vepWeMHK1axQbXieolV5ZemHOqhsW
         veGhX+HS3E/R29c3zoywevVcZx2RqpbJGNfXwHeXk0aFKr6DRmnzKpiOxukwD+k5vvQz
         u/tKAILLgceRzue9ExxZMktmwNNFENkURXrKpbvDnNj+tYoVzcgm+LXk2nm3YqDhr1JY
         Ro8JAFDFRuxYAnfYjyd8Wi9KozDldNrPkxlUZ3fqvAfcxmxQ7Qr5eKdcABd91Kh9gaIL
         G41g==
X-Forwarded-Encrypted: i=1; AJvYcCVrJR6SV2twa+SOTBa+k/86SLF0t2k8ICol9k0SB6YYK/lGahyZeKVhZNMS3yRRS4X+F3FhSMZsrvNX@vger.kernel.org, AJvYcCXLjuY0ss+X55btnUquUmOvb9KI+Gx/wU7QAoAjx3bqXN24ZUbLuSN7pWwesdoaTrV4KBSDyTVKbB18h7mx@vger.kernel.org
X-Gm-Message-State: AOJu0YxG5WN5nwsm5pEhkTfMKFcv0g4+7baUHu3xii1TfaL5sH10bDGu
	WvCSayP1JhmFvLjwr04pDPW+yLPo954nAkoL3itwhE8qd0zBEHRaeGv3
X-Gm-Gg: ASbGnctDwydoTArJrgBUg5wt6fVXd2FlRgrkuj0FrJyQaswUlkIb8DqPNLG935wd57F
	Lga/l51dInqnkWdcoJawUMwcVcSZUay5MW8KRFuDbj4TAxOynj9as+U263Df9qIMAMi4VVjhTtw
	L4IeFnuKc/e+IZEhKn4w3HnPbLL7zKrLrvZ9gxCbUPUsUl086ZIeT6L0zmIr6n0l8zxrarrugYE
	0BoLxc0YbOlmJCvkeEL0UuLNKwYmd7+0oMYcVwz1zJJQnKthBpyOJmkc5HUUFPDT0MThbUV9bnB
	PE87tvwZ0UOs/2WoG05ExsqNXa8HrUeRjQ/SYjPAy2AyChibvnLyzEO0QDcn7c+NzVE76rwHqhu
	lMoFLYQ1luEZRG9x5fjWkYYwAQQ/chUnel6ZxXA40oTcdt3A538N9O2FBpzAyEAC3TkK//8kSNw
	==
X-Google-Smtp-Source: AGHT+IGqJ/GyocQNWi7dQb58jVEqhjDpx0UDaUAhSjg7fFMMxHbIpWchP7IlqvbYUsuUv23KBA/2gw==
X-Received: by 2002:a05:600c:6287:b0:456:1a69:94fd with SMTP id 5b1f17b1804b1-4589956fda0mr8295915e9.0.1753861377826;
        Wed, 30 Jul 2025 00:42:57 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eaed4sm14783835e9.27.2025.07.30.00.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 00:42:57 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
Date: Wed, 30 Jul 2025 10:42:49 +0300
Message-ID: <20250730074253.1884111-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
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

