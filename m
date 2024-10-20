Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024EF8BEA;
	Sun, 20 Oct 2024 17:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729446653; cv=none; b=QzPpZw6c0c6rPkgHb1PiMXhsS+UpM/2Qe9uA2GN/7wP24RRpUAs2HmlghWH26VUCZjeUlDMoasboZ0ibU65iTmH+AM7BwpVJP27GuyV09FxbQngRBBBLjRRwI6qvyNQ/KMQxk1JeXGP0rqVtjABKUDhxBTYBuQZ+LmLTkc3mVQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729446653; c=relaxed/simple;
	bh=XRp8JwDmWuX0VsGnElmC+XnG7mOJvK9hWCzyIU+jzzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DDuHX71Dh/dG+EySwQgEi2420sNNFPCLrmZmFM+yJBZXDJarPTZJ9BDTEZA5Q9YgP6FN3nDChdLxdK2e/AKZUOjAPWkbBBCGTPB0QRyNodSgZ8fxe7mVMTtYTnYq55ZH9CkTBZoRo51D2bicZL/ATsMxhrSZsor6IbpXSG6NYww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNstbvLN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNstbvLN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so35216745e9.0;
        Sun, 20 Oct 2024 10:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729446649; x=1730051449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M62jfxi1/9OSd11CVvekWORq0dxwJnAAWeLnlPRvCHk=;
        b=KNstbvLNP0lLQ1SEHxHsr8wZGI8VLf7rqPHIqxqAxv3yY1Zh8DKw1QohxzSJSzEqV6
         shnfAHJLtjBp4pzWyGV55pxuujD/RNWkWuPG3nZvBZQFeX+/OrifVRJPOxOCfGp8UGHM
         Ra8Z9M2nEFgtvKDMJG0Uewp+ALOt+5URkC9ssvisQumDvMOFeiLvdNaYZj2iBc3ajRYf
         Jfo8vB2Q4/mBUxSpgBUl84Yj5eI8XXQdipK/FD4mFl6CYAkCdulvGqdUFFbNLEljbO/q
         2s76wmT7Dzhn0wHYmDPVqVqsatP8baQ1CfzFaBF77KWISfDkSXZMK2MDa1LpWWnzGuTF
         /exw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729446649; x=1730051449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M62jfxi1/9OSd11CVvekWORq0dxwJnAAWeLnlPRvCHk=;
        b=WU0KXg+Xyf0EU5nEX0xOrWSIh+2uzTDnnVKTHxnVtwaYhnhmJwUfEdR6fq4ybRxnvL
         l0K5lElZocshipV0zV8OQmNxXrphKPOlLrLtbjD+g/vmCLgAvuLRXp9iNKYiATjoYg5C
         PZtAu90jAZrXUJD5rppaLhy05c45cJd+jTwfdyeQXZeT3lY+QF9QB5UhOFVffvSdP5Sd
         lOzfg4yLqs/aAonhx7DFDKVokyhenztd7MvqkZZjSt7lbfAb/KtGhygNehVOjK+AzaQH
         otsssmyFAaX17TpJ0Y5NOHDkDoa9A+8azp5ikJ2VjZkTBRdPYLK70+yrisztghIEBuea
         W72w==
X-Forwarded-Encrypted: i=1; AJvYcCUjrRyQg5Rs1K0cL2sR+509cPKetlzRwAly/8wTy0v7AfIas3EVAFEeTU/5KP/PnUjp0cowsU7TBzBq9m4M@vger.kernel.org, AJvYcCXF11+dIS68tbEG10Sn2pVAN+Q5RbD/9Szg/Bs8nbydtYIbkZq+LOFjVStN/NotsdkQ1/ZGAysrhu9k@vger.kernel.org, AJvYcCXpn3NTEWuiNBJmAtZN2FY/zPseXaOiytFaCT5uqQWt8es+tcPJwmVAhMCDAx7s7P/LGPI9Mu1XOutB@vger.kernel.org
X-Gm-Message-State: AOJu0YwezOcYckPKgdAXvTi8TT6cOnPvOkFIonxm51xkReLmiug3Mudm
	0+DmamwFqmash83Mffnk7uNce2cxW+CtB5T1/X9+PUv4NIGAYvoj
X-Google-Smtp-Source: AGHT+IEfpyD+bBD1yaSzmk0e/TbOZjLN84lzKxeKom0Ae8oK20xYwynFxAiswtVOF4C8n0oKO7SBpw==
X-Received: by 2002:a05:600c:3b0a:b0:430:582f:3a9d with SMTP id 5b1f17b1804b1-431616859bdmr74359615e9.26.1729446649026;
        Sun, 20 Oct 2024 10:50:49 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57f89fsm29794305e9.16.2024.10.20.10.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 10:50:48 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] clk: samsung: Introduce Exynos8895 clock driver
Date: Sun, 20 Oct 2024 20:48:22 +0300
Message-ID: <20241020174825.375096-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds initial clock driver support for Exynos8895 SoC,
which allows clocking peripherals like MCT, serial buses, MMC, UFS and
PCIE. As platform support grows in the future, other blocks like APM
will be added.

Support for the following clock management unit blocks is implemented
in this patchset:
 - CMU_TOP
 - CMU_FSYS0/1
 - CMU_PERIC0/1
 - CMU_PERIS

Ivaylo Ivanov (3):
  dt-bindings: clock: Add Exynos8895 SoC CMU bindings
  clk: samsung: clk-pll: Add support for pll_{1051x,1052x}
  clk: samsung: Introduce Exynos8895 clock driver

 .../clock/samsung,exynos8895-clock.yaml       |  243 ++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos8895.c          | 2803 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |    2 +
 drivers/clk/samsung/clk-pll.h                 |    2 +
 .../dt-bindings/clock/samsung,exynos8895.h    |  535 ++++
 6 files changed, 3586 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8895-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8895.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8895.h

-- 
2.43.0

