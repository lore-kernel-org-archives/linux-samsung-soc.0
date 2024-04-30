Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412691272AB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714470591; cv=none; b=U+en3qMnBfC+aV9tY25+Lc8k/6PQZu1Vnx3RB/0zAylew0YkuceOPaeqzokfpraiuAWMb/ei4jIc0JHevmfosWm2dyue57GqqPdwnHyQf/QnBBoQhq1v4iQfcAFZqo/e8/rvknrFcdDlYv8wG8+CO9O+R7smmxXgPGIpIzHzU+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714470591; c=relaxed/simple;
	bh=+Yl5WcLATDY6Hk/ADA/oOADRGUb1ZKc09PdetCkIgLI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EtPrYLk5Iz2swiq0xWMw4YYMXnrkyKgu6P+Hzb9W8t+XkLETdVLDS7ckDvCdtKBUJTklk7nKjQSZNUlLEVkW3vuEk4KO2UPKuYq8/Y2b08j2mNh4nySflqUUpszdZxvUJnk9xvKVQ6h9Tb44ZOHVQDwIzO3l4IJPBzvjojidKX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G6h27Eav; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G6h27Eav"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a58ebdd8b64so301965066b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714470587; x=1715075387; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jpoZkA6m6TkJgLTdGIIOPYxXqE9n34qTSSRnWAeB8zo=;
        b=G6h27EavxCd0nD8Jwo0EGr/TQNTWTCL7KTruEOiurK0xOOL6knKCcgHQTaIlBjCNQH
         4tF8ozsZiL1dTmHjOuuhMIAXulcm2L4hFCLF0Y/zOQaCPJKi/Kx2Pc//r4iVOUx5Xesf
         lh/vbjJaSg3JlEuMONL9eweP34IzuwVnn9Q4smnw66F9J68VN5tIlV9he3ktk6n6Nrlc
         /JrF2URTnzPnC+F6rspgTgJqBzgHsdvG08bp+0ckB1gU0YEbnEnBYiLHjc7Cz7HBgTgy
         zirhl1zngd7yB6fYNNqktL/2R4EePY9W3iwERfDWxGbo9ko6+y101Px5uDybVvZ+6PGw
         jQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714470587; x=1715075387;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpoZkA6m6TkJgLTdGIIOPYxXqE9n34qTSSRnWAeB8zo=;
        b=WbFLcgD4AoQHmkIo4rr7T6n1zaFAJltCYqfSlkuGxXWJfFG8yqh/rQCLtbs7PqAYo4
         TtDg0+gRwPD4yKWP18lEPkdMZl5pXiZD/fS2WWCeRsJ9WL96SC6XRi4OZVWnp4lNz4ly
         qpHZnCJV1rXREs0zeTyeqWWGa3vC551IvXOt29MKf6/a6GL7BgHqnHtSonfG7rIjUSok
         zp8BXL6SpsH6CnLkhBBPgDJJmw+ea/ZXUR0V62lG347FqlIK2xuoc94Wh8jEsHjoHN+T
         ml4Xl8R+5GFFs4hH/Q9emfIBTKY9m7/VDNDPFphkHuB4knRoVYfro9hzxcbdqP15Kxcu
         waGg==
X-Forwarded-Encrypted: i=1; AJvYcCUF+XzGZGoEqQcImEmj4KAAT2NRnwoX30qaV2VBqmprCjzORXBnLza1BhNRnvrtkSOqzbDs9XuzuaNcCIV2yJ2sE0+eBp17cOLE2TjXu0J4xPc=
X-Gm-Message-State: AOJu0YxHGIATC6DgcxaLfYpqP/4TV+PMiqjjF/0kuQT+L6Gzg+PzHmIR
	0IL7UvWFyJXZ6UoZD9eWyiwIWm5h9LD619pwtKiXurwJiZe4hR8SoJa+z7k58LMVVqhA+Ox+eNy
	ywBw=
X-Google-Smtp-Source: AGHT+IEHj1s1mj6uPULOTCJsma5iVRNovhYpwjfGLJb26YwhziqJe4wRQdYRirn6ZwiRD+j/sdL+jg==
X-Received: by 2002:a17:906:fa1a:b0:a52:1e53:febf with SMTP id lo26-20020a170906fa1a00b00a521e53febfmr7416379ejb.69.1714470587603;
        Tue, 30 Apr 2024 02:49:47 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id dk21-20020a170907941500b00a55aee4bf74sm10981024ejc.79.2024.04.30.02.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 02:49:47 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/4] hook up pin controller clocks on Google Tensor
 gs101
Date: Tue, 30 Apr 2024 10:49:45 +0100
Message-Id: <20240430-samsung-pinctrl-busclock-dts-v2-0-14fc988139dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALq+MGYC/43NQQ6CMBCF4auYWTuGliLBlfcwLEopMBFbMgNEQ
 7i7lRO4/N7ifxuIZ/ICt9MG7FcSiiFBn0/gBht6j9Qmg860yYyuUOxLltDjRMHNPGKziBuje2I
 7C5pro3VuSlUYBSkxse/ofeQfdfJAMkf+HG+r+q1/hleFGRa+ygtVVl3u7H2kYDleIvdQ7/v+B
 Y/CVTHJAAAA
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

This series hooks up the individual clocks for each pin controller in the
gs101 DTS.

On Google Tensor gs101 there are separate bus clocks / gates each for each
pinctrl instance. To be able to access each pinctrl instance's registers,
this bus clock needs to be running, otherwise register access will hang.

The driver update to support this extra clock has been proposed in
https://lore.kernel.org/r/20240426-samsung-pinctrl-busclock-v3-0-adb8664b8a7e@linaro.org

This series depends on:
* hsi2 series:
  https://lore.kernel.org/r/20240429-hsi0-gs101-v3-0-f233be0a2455@linaro.org
* pin controller clock support:
  https://lore.kernel.org/r/20240426-samsung-pinctrl-busclock-v3-0-adb8664b8a7e@linaro.org

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- use <0> instead of a placeholder clock (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20240429-samsung-pinctrl-busclock-dts-v1-0-5e935179f3ca@linaro.org

---
André Draszik (4):
      arm64: dts: exynos: gs101: specify bus clock for pinctrl (far) alive
      arm64: dts: exynos: gs101: specify bus clock for pinctrl_peric[01]
      arm64: dts: exynos: gs101: specify bus clock for pinctrl_hsi2
      arm64: dts: exynos: gs101: specify empty clocks for remaining pinctrl

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
---
base-commit: d04466706db5e241ee026f17b5f920e50dee26b5
change-id: 20240429-samsung-pinctrl-busclock-dts-46b223471541

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

