Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F4A81741
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Feb 2025 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191927; cv=none; b=T4pXJuyNTvBI4z/h7ADevweC7LXFhjgUdB2znTpjs6xMs11LZezRk8J+v8/OzxVGj6+2Ide+TcVW0jnoB2wCfUaARJp+5FgcbJFYdT9D/UhFCF6l1t5OGvTzZ9JVCooFDwXi7CfEBujAbf8cLF0pWgdkfLhhhCVTXyVTVpJH+/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191927; c=relaxed/simple;
	bh=XQa/TfZllLbPwu6jv18G9VcuIA3/df1URiLusiD2l3o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f9K7OOnqYyjlZDlkIS8L+3+644wukeQpGWNz2uNrmwgXT6tPwaHOtbLawHZAj+tgyKEB2vu3Y0yLPcED+G15JuKDKY6rx41OcRKBvKxRamJoot4hYoaq0P+YbF2kiMg3Fwmr2+gIgvpc9OmKptbkLc5EmOdU5R7yyceZZs/MqlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LSZpazow; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LSZpazow"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dd93a4e8eso1118110f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Feb 2025 04:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739191923; x=1739796723; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndgp99sk2+qm0AJX1iEOr9hIRvudwvRxmxME0Ub9m/4=;
        b=LSZpazowM2dV73iaK1UOw6IF37AnRhxMN6mW79wcqp4KfecVR/DeDp9mQ4D9/mvbbt
         5O3mrVA0PqiLAFms8BgUssVY/WA0NRqiiClYqzKEAFhhkE3MilWeNJx+QBkqtG6Xlegu
         k4VG1BSakccRTHN7qqSmA2nMeU4A5XLdP/c0XxKHDBx6WQ7tkUx0tYukgLnC9cKwHgT0
         OqF+shbGLCd8Y0Xqebs0TgS+97u2dVTXzvb1oKFeGn0rPN4rHnqUPmkEgzQe4t/TsLzt
         XOA/JkImKzOv9jqIam41psr9RChRXyNDhXHx9Ym1lSPpIT4P+9yLHYdn8mJye8+WBdEW
         W7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191923; x=1739796723;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ndgp99sk2+qm0AJX1iEOr9hIRvudwvRxmxME0Ub9m/4=;
        b=FphugFS4DW9OYosdXIpLo6GFCRJllkkpToCOsIkciWWlmXqf7XlI80InZdBW2W72pd
         vlRiEX/yqmd7nFE5yc2UodB0z8Eokm64TVZmuDH1ZjpXi4xm8M7+YqVGLOokNluBAwrj
         R1gQ3stl6rPASuZOmkyzUMdNQzsaVYrY2zES/Jfj3jcTfC5ueZ84qQaFk1DdT0flAfyN
         LqgunsHDqvZx8I6NffGoguKy7+lEvAJmUUZxK7IXiQxfgmIWD5RkxbIdYYIMp2zhYobz
         JlTFhL00ge73beCQccXOU2HQDb/cWEcr5mqZ1w3RDuSL7NBeOWLkHOsiIsjlCwVYAzuW
         PYIw==
X-Forwarded-Encrypted: i=1; AJvYcCX6wNw/vmPYxIogTskum5eZ7WPudXwK16BIi+REwdVml3vSiKZ/FsKnEaqG6TAeVvNx7QRfWVrSnVH/0kYjUtID3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW4emqZNsZagEKvYIj5qQG5QUWlFBiLz7KFEeANOY+i3Zc/+uW
	5fRHuxq7GfudHx6Jz6PsqbEI050Qqp8DuDbXtSrl5y4HW2n/8FngueGi4TsA9b0=
X-Gm-Gg: ASbGncu1k33SPkXGJ7pzKFn3HKntMw5bDjpMR693SorW2S2QrUE7ZCrF+2562wYXTdC
	km5b/v80bPpQCyNly6tyero+siorxnGAdrdf7qVGDp+JRDWMT81lVv19mXojuiPvXFGfZr6SaiE
	46E29k7r6d9Ws3Y7/aXvvCmPzvjYNXXlsjUMm2Fi3id6nk+QZf3b8ab//BCAuHnCiL7iPqTwAvw
	TcBp1sO8hOGkotr8YLT45Qj2T4UKyjc6W4zv2f7ZmO4r7FNvMVKSBbScU7WHmTtxj9utAfMq9xJ
	YNDJUYNUZvB2W93ZBj/xX6syAUdrvkih6QGunxWRRmURrUSHt8hU+J6CASt/iJMaOFOUeNWEjgM
	=
X-Google-Smtp-Source: AGHT+IGusahsybY44rc6nO4AWzY0imCi+cXnlxDgiDZzKI1dgfuiNW8fncCJWn89N3rzpgZLceWGBg==
X-Received: by 2002:a05:6000:1243:b0:38c:3f12:64be with SMTP id ffacd0b85a97d-38dc9135899mr9939327f8f.35.1739191922884;
        Mon, 10 Feb 2025 04:52:02 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ceae3a3bsm85819266b.129.2025.02.10.04.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:52:02 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/3] gs101 reboot updates (DT)
Date: Mon, 10 Feb 2025 12:52:01 +0000
Message-Id: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHH2qWcC/32NQQqDMBBFryKz7pQkVqldeY/iwsSJDpREJhJax
 Ls39QBdvgf//R0SCVOCR7WDUObEMRQwlwrcMoaZkKfCYJRplFEtzkkrjUJhXTectoTO3kfbWt+
 a7gZltgp5fp/J51B44bRF+ZwPWf/sn1jWqNBNnrqu9rZ2Tf/iMEq8RplhOI7jC2o0bRuxAAAA
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Hi,

These patches update some of gs101's reboot / power off DT nodes to
bring them in line with downstream / bootloader / EL3 monitor
expectations.

In particular:
* an unnecessary property is removed from the DT
* the shutdown SMC call is aligned with downstream now
* we now implement the requested boot mode as a notification for the
  boot loader 

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- keep SYSTEM_CONFIGURATION register unchanged (Peter)
- collect tags
- Link to v1: https://lore.kernel.org/r/20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org

---
André Draszik (3):
      arm64: dts: exynos: gs101: drop explicit regmap from reboot nodes
      arm64: dts: exynos: gs101: align poweroff writes with downstream
      arm64: dts: exynos: gs101: add reboot-mode support (SYSIP_DAT0)

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250206-gs101-renppt-dts-cb8ab6bf6294

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

