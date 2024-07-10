Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272C9190670
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720618159; cv=none; b=nFE96ukJ/1G38DQNQsH89csWQBgs0o9eTiF1Bz6aumqcyIipr4naebAR59YYQBzIsj/z97DeZoeQeXufNJn7+Xt6Cne9zlzDQHEfYRvrMlHYrIoqVVv8zdRphWm4Tx9a65XPC7Y5dSGUUXRP+IUxKTpJL1QveXHUGGjGCDOMhbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720618159; c=relaxed/simple;
	bh=hmDdPq+Ml7N5KSGIoFc3upULiXo/C6/HEWo6DoDhM3g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GdK1i6mNBpsegEMYPGg2XF6vRn8k5Aa30W+PvBxCErWi4MuKgRF8sFf5DuhlQ9QvKeYH3Pet+5H+pYzkjveTQCHv6YO2jWpn6n1ImEsN+0EaBPLuUprgoLfTKS+Uc7mG916E29vFWOCfknHYBZFxw9TLBlc+di1x7I7wideRKf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P+eqcgPg; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P+eqcgPg"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a77bf336171so158327166b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 06:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720618155; x=1721222955; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fqkUDQRLOhVOBxGwhtG+94Ov7Hs2ibJxuA1/lSFMk8I=;
        b=P+eqcgPg8DN7B2J1lsAezXzy7DoZV+BbKEvMt5gR570V2VqXnvYylJ+/0zwEt57OAf
         9s51H5Zc5t7r8JWDjuuF4pCJU5hsaTzPxle/5fSm4MV9zRCwYEO51FiBvvpj2nAbTp80
         wQfkp0+2uscnFvcH3MD/wBC7AsoVUgO+vx2L0E/qM+fDkcBIqa8Wi8exYlltqhJOaILC
         eKA3f/z/cVcp8dZlwBdxLb0NniZYevZVC76TOYa51cZ/tibUQO3hxg0+ARZwZEVpz1Zo
         93IY50Mi9JQMwZqqEfBaM7j84sXetO9tTGHShf+HP3Tv+Y1XHuSu6hwgtK/Kw7EmL9Vu
         PFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720618155; x=1721222955;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqkUDQRLOhVOBxGwhtG+94Ov7Hs2ibJxuA1/lSFMk8I=;
        b=OoIovYF3J/Z1nRqQIZLk+ZOUKZnsFqIAXNzLoQ/PgIAg14jPIfbFSY/1hFPLYv+UU6
         Jlq5VgSOWiiTPBqSSNov27xYrpDlXFJ83JF0Goo1d1/Znnn6o1rqu6sSnJxiKtq/U7y9
         qKXOny+r0Ox40I7ZmrF8aSUa18y39gmCpyQ+ff2z4EB3HJwmPoks9s85ssBg3r89AyD5
         fGxSLH5oahWAyJ1+7QrzRLYwunq2OBXs8XDVaQUQKOHOVgJVmAkPlJfy3o7jcZfXHnAr
         ivGc1MIDYodLJOuK4o8NqesR3rpRRgpEwSEu3Y36lMPC/P8+GSBfiHGEs+QjT4Cs1Sc0
         hW0A==
X-Forwarded-Encrypted: i=1; AJvYcCVxqI6btPf9kiRf34JDVyuhmmYddlU5XVG5ZBj3F8yxMLG4d7aPOtIh1S7MjfyRJxCWb1yJrGuIkqbK/KGjZiFwuc9FSzYpf9WLmmhbctFipjI=
X-Gm-Message-State: AOJu0Ywhew1E/kf9DdnORg55wqBGh7LHhrq8TJzaC/gpydtECuWUGPlt
	pqjBetKk21I88Y+IzmbfosFzocZg3oHPu2GppHYHGxl65u1Xgc6VUAb1OAcSM2U=
X-Google-Smtp-Source: AGHT+IHSy01Wy6Dt26CFpsV4fBDVFgMdKfVhr2nI8OmMjxpgSQCjsvn8YeKN5v4jdEUlosAgoIYCfA==
X-Received: by 2002:a17:907:9710:b0:a72:4207:479b with SMTP id a640c23a62f3a-a780d205cc9mr468422466b.5.1720618155461;
        Wed, 10 Jul 2024 06:29:15 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bd45a162sm2204844a12.68.2024.07.10.06.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:29:15 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v3 0/2] gs101 oriole: UART clock fixes
Date: Wed, 10 Jul 2024 14:29:13 +0100
Message-Id: <20240710-gs101-non-essential-clocks-2-v3-0-5dcb8d040d1c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKqMjmYC/0XMwQ6CMAwA0F8xO1uybojoyf8wHioUaMDNtMQYC
 f8u8eLxXd7ijFXY3Hm3OOWXmOS0Ie53rhko9QzSbnbBh9KX0UNv6BFSTsBmnGahCZopN6NBgIp
 iqH1HeOfabcVTuZP3r7/eNneaHzAPyvRPMXp/ijWGAo9ldcAACJRa5aJVso+Ml0kSaS6y9m5dv
 5yNNMCyAAAA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Hi,

This series fixes two issues in the gs101 clocking / uart handling & related
device tree binding:
1) the binding omitted specifying the required number of clocks for the UART
2) an incorrect work-around in the gs101 clock driver

The 2nd point is essentially the last remaining patch [1] with all review
comments addressed, from the series [2] that was sent earlier this year, see
lore links below.

As requested, I'm also documenting (in the binding) the hand-over issue
between earlycon and (real) console driver that we have on gs101, see [3].
While doing that, I noticed the omission mentioned in point 1) above, hence
this series.

To avoid confusion, I'm marking this whole series as v3 because the patch to
clk-gs101.c had been sent as v2 previously, and this supersedes it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

[1] https://lore.kernel.org/all/20240130093812.1746512-6-andre.draszik@linaro.org/
[2] https://lore.kernel.org/all/20240130093812.1746512-1-andre.draszik@linaro.org/
[3] https://lore.kernel.org/all/d45de3b2bb6b48653842cf1f74e58889ed6783ae.camel@linaro.org/

---
André Draszik (2):
      dt-bindings: serial: samsung: fix maxItems for gs101 & document earlycon requirements
      clk: samsung: gs101: don't mark non-essential (UART) clocks critical

 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 14 ++++++++++++++
 drivers/clk/samsung/clk-gs101.c                            |  6 ++----
 2 files changed, 16 insertions(+), 4 deletions(-)
---
base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
change-id: 20240430-gs101-non-essential-clocks-2-6a3280fa1be8

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

