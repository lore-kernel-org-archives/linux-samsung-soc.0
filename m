Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA1A2AEFB
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607063; cv=none; b=qB+E4df5qt+tQhtHEgdTceOZjYtn2UxjB5q6I8LulCNqPJDXlJbxes44rEq/2sW7PI2TNS5ji/USeBaCAHjB7TZh7jkuw+G9Vl1208EF/H+JjFzu7hU0Xmkt9Bjd84LfxmNWG/znHWd6kkacQVMyTwIX9qz36YLuOtRVEifIxns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607063; c=relaxed/simple;
	bh=NyHdU17b3BYKcxSflMYDwmeiHSv8J8KHGYTpcsjLvEc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MvS/mcrMGkpkgOfXjtz+tNN7grl2RnyUpnp2D7+in7/+DY+bU0cIGaQII7v7Nxj2DT2ggkUu+8u5bKVmwgMTmgJA9ELUkUzVDz+YHVWJksMZTrhaU7Ddm3XaSDuX8e9Lto5+mG8lrQEnE0CE57EYXb1o7Wt9rvwCbAPAKFT0Ytg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QwQSPFv3; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QwQSPFv3"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso2045774f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Apr 2025 08:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607058; x=1744211858; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yx2R8pO0Ra3Nc8Y0LIAf122qHZ5vDc7iiej3dPjF8G4=;
        b=QwQSPFv3onTb5O+ZQBcO4g8cTiZjqdVQURhNFiUXFzOIQcCF8pNRoUAfqTmBYUMkUz
         OEaUoMfnvSrLtEXhkiAtPUk4SyTUAV5qJacaS4oLC+cbougR51oRMRrKL+0DdimjP1z2
         Vv2HjPiQRtKsN9FwynTy8HzIzH8igklSs0UCwPylssIJKlNAYFS2fTE/JFBz0ZSoJbp0
         yx8lqy7DDCYEtyji7LhbW8ky0vPanMrDGAPpuXrihHOpYQsBqZnNw4mUOxbyXRRjpxx6
         lDmTD5t+ZZEJPKiot/ki0u9zVNL1i5EjdY3qV4iLp21hfCXC6r0WoibHux6VnY6aTkIm
         r88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607058; x=1744211858;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yx2R8pO0Ra3Nc8Y0LIAf122qHZ5vDc7iiej3dPjF8G4=;
        b=geR+5oZOWfLBj2aVPjcr9p/KKQUXz0KEHGbokTN4KQFINrJzKsyEC6ew2WGajquWu1
         Wc563FyKXuUI/UxVa/A76PM2co3Ml3rBFRUDbo+MzKetqKNRbWi2FAxIvqtAS/BWAM9U
         gDdj4gKu3zl/MeT24A7oraoGENOuD2rydUiCQixkjry2ax8HlT20uj4dkr76LUoXt86t
         bU4nWFvcvVaBYpgwfxO6WKalWm9UNNcooTN7nxGxTh3iKTlHMZqeHTnHCr2lnYyk4sC6
         tPFhkJly5Ox9vt9nVZVo0PrWi8CsL0AsXkjPGyLY7xeixkDifrWQFsONfk5jLPsnegCA
         JUAA==
X-Forwarded-Encrypted: i=1; AJvYcCXOGEeryJhan2rFNohvsZBvmebI/alhQznR6bYWsLIZmXKKOtrEexmJ68EQ3FUNClCIQkIUG2zsMCq198ejQCDeCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7mCnRCYI9Do6Qf7s0RdB9okQdR034CLK4rVvKvfFhvMKX9RSE
	3cKUEWPtvnkIEU98QIdLZXcFka1N4kek2X5GL1RlGOeY4zrZ5p341MGMnLOAdOU=
X-Gm-Gg: ASbGnctgV7fN8NBUHyrcCUDhs5EuaVIwiUe0DbHqkBLH2p42tYMOXGxB4wGxOF+GcC1
	3fVisFrIhTlg1njVDzJ/Ck6ZMic/LSjfidsyLgJrI1xZ9+TRjgPeBeTPEJ30HTyQBr5Iz274C0B
	KP/UuqgTwiotI+fURipvjhqk+jID/eXy8kX0/GdoMtTLFq2b/i2dXRq8UWcHt4PkfcMl7PMy8lO
	xTXeCaKqPfuifUv8P4FNyRdpH0VR5HRNz8HdSbnKhhfiupDgjjUJ2Nxwh/Enm3l2K2tAAPypgnE
	1s3XuRoCA6uJ0JseVcZAb+BFk0ArHDzITm4T1BSFLAD6Infala7tAgrQ2NflGM5Nm01lEUUNfA=
	=
X-Google-Smtp-Source: AGHT+IGtw/YaMynhE0C3M4qaV2783kGrZos1104coVh6+inJZg+GE5x2GivvB2wyhudpC0AEWiHjvQ==
X-Received: by 2002:a5d:6d8d:0:b0:39a:ca04:3dff with SMTP id ffacd0b85a97d-39c1211805dmr13821255f8f.40.1743607057958;
        Wed, 02 Apr 2025 08:17:37 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663860sm17469190f8f.39.2025.04.02.08.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:17:37 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v6 0/4] samsung: pinctrl: Add support for
 eint_fltcon_offset and filter selection on gs101
Date: Wed, 02 Apr 2025 16:17:29 +0100
Message-Id: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAlV7WcC/4XNQW7DIBCF4atErEsFM2OIs+o9qi7AHhIkCyxwr
 VaR716STVNFVpf/k+abq6hcIldxOlxF4TXWmFML83IQw8WlM8s4thagoFMalJxjGpYyyTAtQ06
 yftaZ0ygBEZ1GO9BIoh3PhUP8usPvH60vsS65fN//rPq2/kuuWirJ1vZKeXDHjt6mmFzJr7mcx
 c1c4ddBpXcdaI6zzKH3ngj9k4OPjtl1sDmhd55CMA6Inxx6dOyuQ82B0dqO6WgUmj/Otm0/Ix/
 uwJUBAAA=
X-Change-ID: 20250120-pinctrl-fltcon-suspend-2333a137c4d4
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3882;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=NyHdU17b3BYKcxSflMYDwmeiHSv8J8KHGYTpcsjLvEc=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn7VUOIpQvmKF+MMYf64vqTmU0WTMgiEeFEpShA
 AynK1joXv+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ+1VDgAKCRDO6LjWAjRy
 uoeJD/4+BiSfIgPVMI5fRAx6Coxh8/ggZfvF1RkO524nX45fsdiIaMPS1QR+Y7a9CdVb6L4Q3HX
 V+NY7G4o32bDe69CQ20fjklp3fu/QwxXMMENII1Zebp3Mkwt0wAlkTGNwQ/cjsVvRZSlywJUehF
 r5cdRDOGh94HHVuyQST+GQ9u4oMxyoiBardHYbuCLytcuXeieBnVg96fbn/ETxeMdWAkeiBQCd2
 1AX8VGBu00u9VUf3OB4e4X6fVkrp/7wC3MZ3Ty45olPqDf6NOCnLesQp9An9aqKnDkB1i72Gg/X
 U/WsJcAmOLe+Rzw12qSgWtBRGLhCKv/pzfUKsVGzfPRnafo4WJc5fK74OKQg/gN2qzNAbdQ4hQI
 bv5+mDP+IkAigc1yjYm31kZuUnt0kk8iLq6jzznvbaUWBhbI9ir/Tl++qA2iM5+hf1OBzyfEvGd
 XVLwHGmbavNBjHtKWVUVOwVAyx6XPgr2koESdSNiArZ0hGZNiv9mu5HCZkJoxhbu2zlsTcPp2uJ
 DfvD6979BXD2CWh5UBwUz2o/5jJuzeFUYUZLcVO8l3Zcd2wa54LrTiS15RZoR59InWWGEMnH0sl
 +CMBzDDa2i7TdzdRkTWVqqmNTxoqJBRW+5MFzd3+NP0ZHremI3HWNzMsByood+77Rhz+Yz3R64V
 syq/O8iBenmJoaA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

This series fixes support for correctly saving and restoring fltcon0
and fltcon1 registers on gs101 for non-alive banks where the fltcon
register offset is not at a fixed offset (unlike previous SoCs).
This is done by adding a eint_fltcon_offset and providing GS101
specific pin macros that take an additional parameter (similar to
how exynosautov920 handles it's eint_con_offset).

Additionally the SoC specific suspend and resume callbacks are
re-factored so that each SoC variant has it's own callback containing
the peculiarities for that SoC.

Finally support for filter selection on alive banks is added, this is
currently only enabled for gs101. The code path can be excercised using
`echo mem > /sys/power/state`

regards,

Peter

To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: andre.draszik@linaro.org
Cc: tudor.ambarus@linaro.org
Cc: willmcvicker@google.com
Cc: semen.protsenko@linaro.org
Cc: kernel-team@android.com
Cc: jaewon02.kim@samsung.com

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v6:
- Make drvdata->suspend/resume symmetrically reversed (Krzysztof)
- rebase on linux-next
- Link to v5: https://lore.kernel.org/r/20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org/

Changes in v5:
- Split drvdata suspend & resume callbacks into a dedicated patch (Krzysztof)
- Add comment about stable dependency (Krzysztof)
- Add back in {} braces (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org

Changes in v4:
- save->eint_fltcon1 is an argument to pr_debug(), not readl() change alignment accordingly (Andre)
- Link to v3: https://lore.kernel.org/r/20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org

Changes in v3:
- Ensure EXYNOS_FLTCON_DIGITAL bit is cleared (Andre)
- Make it obvious that exynos_eint_set_filter() is conditional on bank type (Andre)
- Make it obvious exynos_set_wakeup() is conditional on bank type (Andre)
- Align style where the '+' is placed first (Andre)
- Remove unnecessary braces (Andre)
- Link to v2: https://lore.kernel.org/r/20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org

Changes in v2:
- Remove eint_flt_selectable bool as it can be deduced from EINT_TYPE_WKUP (Peter)
- Move filter config register comment to header file (Andre)
- Rename EXYNOS_FLTCON_DELAY to EXYNOS_FLTCON_ANALOG (Andre)
- Remove misleading old comment (Andre)
- Refactor exynos_eint_update_flt_reg() into a loop (Andre)
- Split refactor of suspend/resume callbacks & gs101 parts into separate patches (Andre)
- Link to v1: https://lore.kernel.org/r/20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org

---
Peter Griffin (4):
      pinctrl: samsung: refactor drvdata suspend & resume callbacks
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs101

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |  52 ++---
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 294 +++++++++++++++----------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  28 ++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  21 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   8 +-
 5 files changed, 252 insertions(+), 151 deletions(-)
---
base-commit: cd37a617b4bfb43f84dbbf8058317b487f5203ae
change-id: 20250120-pinctrl-fltcon-suspend-2333a137c4d4

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

