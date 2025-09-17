Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BFD286D6B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 21:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143067; cv=none; b=QwU8SuF08MU7cUDXaRE/0iAoylc6t2frKDBGnQFlVROaGKgyIO/7lOmOufX1x+rQISyl3flXMm6CZh4ZBtiMSKAloAajI1kN1vRRHZJAAFGH64JpOJfkiimpnV2gn+4jw30bwpCqR93M3peCdzZXbeBtfONaxXXs4LiTCb5CqPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143067; c=relaxed/simple;
	bh=yHu4BWyc9HYj0iZyDR9twQCdVLE01QwMnBaBNhjZ670=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=apjJUvP770wClwG01GJ89mzzXSpvrH5rmjNUYEdPgQoNuRhDbLYLShG+bQkRci2JrBI10MtVB6fxj04kKghbaQ8tSJi5Y9oi09wKv9sfcVL2f7Qwt4EGbmgSQ866NCVC5Mb2NrbU9j/2PfcoFpMOi9NvPOF02/L5nA8R5ApJzE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hurrQ2MH; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hurrQ2MH"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-7748879b06aso2352046d6.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 14:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758143063; x=1758747863; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xzsfBuCTTaW8xn6XXMC6wEsOLDhpMxnwzj4356j3YjM=;
        b=hurrQ2MHcSLbhuEylLGCXryPVJr6bWQ7OfoVbwsHEu6/jtRiKOO5ckpvMtY70L+CHX
         gPg9nUX1majHe5+mcM6t1pe1P8XkEE7H0zn51ciL4zaeOQtv97eE9MVTnu3PFxTj8CdD
         VbvRi3AqLnmq9Il7XuxJQVXVgU2ck8mFxdNpPDd4KKUP+gavkfwGBfDJwFLG3Kb9feLS
         cHGDQS4wi7i6IMhK1RKjyQeTaL803g7fIgtuj0CIVbVrnCG1Yo5W9v+kfPioWgzplBqN
         Tj+AVee1WEdPXtMLg6On72fhuHYNbTlvakWT+F4usPOh3YZ/TqVrfscE9vC7KojYuANy
         9wtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758143063; x=1758747863;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzsfBuCTTaW8xn6XXMC6wEsOLDhpMxnwzj4356j3YjM=;
        b=fiwZXYgT6BGTcRxY1hxaRH6XG0kavcH2JL1sl2uYmr0D3ANR7HCEyTUlld23isjVMb
         ooOXHvdjgw8ylzmJizoENOdx+jORVyErFalvXoFO7Uc2WfD8D4X0/Goanh6dAr8JkGTo
         ueuUOxecP5CK4yRY9pTDOonqZsjHz14/7/ie0rdcpOv/KUJht0Trwoxy3UWrqOuC9pkW
         Z5NUX611RHqeVxmCfk1bNWOId8P4Nv/6vy9JO66p/3JvLh/eZqf4pYdM/Cz1aMd+2R54
         l8P1iLxXCdpikwneBo8M2FKjypeF4TSM1wgWheZ2E0buK2WbztzbTtCSdZMRtqAjybxt
         FhYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHdst3Jw7xwA3R7UNk1DI7m2JjmfoIImvaxN9zjtdcH31leECqzC0pi49fk+H6BobXv/A9taBseQofSoGuo70cxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxppu7ag85txFGzJAY5T3ImobR37EScRk76By5eiP9bZpTe1r4a
	z67eB62CMz9QEi81H4Hem8XPAJuWoQjc2jiC9SoAW34MygnKxcoAeROP
X-Gm-Gg: ASbGncsFFuC/56JUmemAVNopy77tMGgT0qyi41GljpkZTHrw463pl2vOn8S0PMyPXrE
	9LlbxAKm1+5vKN9KoLojuSLCXyIDu3V58Ub8octBZJpY1hjBBdg43Lz0EnYpWasaFGu/unAGLsD
	lzsKBJN4i8KjbLgycVIZiN1CH8S/v1juabZwuhi/ilNfM9s97Fn6Q+39lU15NarGbQy5FE3ywWm
	phPokoLkAt3JRaylJnR/pH4x1uHbE1UC3k3O+DgJJZ4iSszjv1tQ2NyALccLm8PPwia8kr2+MLp
	4zIQ37NobJywXeXrLfGzCgpXKEVgn0uA2U2STseTIlh7FxmFLqIxP1fSY0vwBJKxGtdHP1k8lwF
	oBZlemR9kOLc142gHF4Vc2kqgXFLuiutvclYZuM3Doxmf
X-Google-Smtp-Source: AGHT+IHnv8inMvR0MGYLXV31f4OfeVWLDpebkI2MOQJt/N/3XFYgiGfLh+fLfc8OxfXxmx24x5Cz4Q==
X-Received: by 2002:a05:6214:301c:b0:783:cc80:1770 with SMTP id 6a1803df08f44-78eccf0315bmr41285266d6.25.1758143063400;
        Wed, 17 Sep 2025 14:04:23 -0700 (PDT)
Received: from [127.0.0.1] ([51.8.152.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793543ffae5sm1897226d6.53.2025.09.17.14.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 14:04:22 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v3 0/7] arm64: dts: exynos990: Add PERIC0/1 USI, UART and
 HSI2C support
Date: Wed, 17 Sep 2025 21:04:20 +0000
Message-Id: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQiy2gC/43NwQ7CIAyA4VdZOIsBBkM8+R7GAxnd1sSNhSrRL
 Ht32U6ejMe/ab8ujCAhEDtXC0uQkTBOJepDxdrBTz1wDKWZEsoIJyyfy35L3IfAn4RTDEDcACj
 jtNASalYu5wQdvnb1eis9ID1ieu9Pstymv70sueAebCOEdtLb7tKPHu/HNo5s87L6w1DFMKdOS
 +uaoEL9bazr+gFSZ37b+gAAAA==
X-Change-ID: 20250907-perics-add-usinodes-5ee2594041e3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758143062; l=1502;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=yHu4BWyc9HYj0iZyDR9twQCdVLE01QwMnBaBNhjZ670=;
 b=im0qQZJ8AKGgXuNpTZxbO1fV8vN+QksxCGdSj1+fa4lhBFH6jgpJF5rbT4cPHaiRoXCBhJikE
 9D0TnXZWEGfBswCkVxsXExcCfpjpXAHtau1UtSXUsuMjRQk1l9W/36a
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Hi,

This series adds device tree support for PERIC0/1 blocks:

- Add sysreg nodes required for peripheral configuration
- Add USI, UART and HSI2C controller nodes
- Update bindings with Exynos990 compatibles

These changes enable serial communication interfaces
(I2C, UART) for Exynos990 SoC.

Changes in v2:
- Remove unnecessary blank lines in HSI2C nodes.

Changes in v3:
- Add sintaxis ";" for parsing error parsing input tree.

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (7):
      dt-bindings: soc: samsung: exynos-sysreg: Add Exynos990 PERIC0/1 compatibles
      arm64: dts: exynos990: Add sysreg nodes for PERIC0 and PERIC1
      dt-bindings: soc: samsung: Add Exynos990 USI compatible
      arm64: dts: exynos990: Add USI nodes for PERIC0 and PERIC1
      dt-bindings: serial: samsung: Add Exynos990 UART compatible
      arm64: dts: exynos990: Add UART nodes for PERIC0/1
      arm64: dts: exynos990: Add HSI2C nodes for PERIC0/1

 .../devicetree/bindings/serial/samsung_uart.yaml   |    1 +
 .../bindings/soc/samsung/exynos-usi.yaml           |    1 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |    4 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          | 1419 ++++++++++++++++++++
 4 files changed, 1425 insertions(+)
---
base-commit: 98ee0e036cfedf543c4728a604fd7870d0000efd
change-id: 20250907-perics-add-usinodes-5ee2594041e3

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>

