Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E82225A59
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Feb 2025 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847303; cv=none; b=JBIowY1U5TZ8OsYNVZOhCHnbyVa7rHRjNpg1txfxYKcGyV/+gNMdFu6vZxtH6FXd/JpxcEneMYAQr+HWCoP6y+HuzA2PvT9nH2rIF0OyhUHEKEIk9cR0MGcp7YRVIpjd0Tzrfij3/PlsmcKyzN7AZ0BFcEgJyI2kpMUSnERDgoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847303; c=relaxed/simple;
	bh=XgoQ89NLlToDu6WIUhA5TGdMOBSSYefS3ZZviogfjHo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mqMNv+arAnGz2opdBhGOzDofIMEzBqBKyKFfRWeypUSukfphniKmf4oXddiZNzu9x7bE2OzEaiJrlaWoYCfY/2H3Y3CVC1qsGDtUpCEoVzax5cSLyi/WYX1GQBw5SoeFPxLkLc0UJuGOIq/Nxww/bfIZOILjzxayLy5VfpdFIIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zClau+nW; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zClau+nW"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dcc38c7c6bso1806112a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Feb 2025 05:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738847299; x=1739452099; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CC73hfx/xdEwQzx0mqhvPJwAxj42f8+ghz1yMlEDxZ8=;
        b=zClau+nWlFAcu2o1PC1sLaGRjHtTGcJeaIePsK2uFfnyfe8H9yZ7+MByFVPdOQ+jbY
         NjpraJeZrb/U5svaCi9Qxf0LdatnSyNVURaaPVj7WBNVZqL39pDyXLHmEUynF/ylxBwv
         e1VBMDVq0nOuWmHEr9LhlmC2l79s/ggyarf1ZR4hO4kftDCAFCu7roK2ePtrZO/iLlNn
         VfvbD5PKUhnHR+WBtxlAOo7AeLXibtSy/Jme7wHNm8mhSvDVfrDaVZGkNJF76roWNfHk
         uch7wZBz8p6oFiUU51jzmSX6qwJlSgeHuFdzH3k43oz0A7P3QP2mNXLL9kYU4FKNqsy2
         4jYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847299; x=1739452099;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CC73hfx/xdEwQzx0mqhvPJwAxj42f8+ghz1yMlEDxZ8=;
        b=KdJWxTLCNvCtMVkVHobeF5xtjcUyM7oEcm/fO6xW206EpwMNjclX+FaXw31IJbackC
         1sZJHaLJUTka3ZSm1evcMmH0CarCTAZ8+S+bD9YfFcEROKNmq3cc0M/CjS3uZ5epBMHQ
         TQNiz74bekMXZy1hfStSrEmhxpV8vOpg668TC3p7832tluK+CmAuVlgPHukMVayDq4GM
         oYtppXK+HF+m/0BhVbrI8BI1BZpHNqAlfoz+d2PKSD5BxIPWb8JrxJmgnAi1+ffLf3B9
         HmKQALUzMU1f+LZoMSeue0E0eFb4UhWZdSUJ777QV/kFdwqa7UyyVLXMhCsH1qKM1nt+
         RFwA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Y5Obd7oGXWYTMtSSXfo1x4blOGxKuEojMm62n2xu8bHRrBjjlPNSCNoeyQvjdPbt5g+yU3kzZvN3vyQ+aTn8hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGDkfLmAins6MedBcexEqTrFnvul/KYn2wGoRrNC7BVBc6Edij
	IjyBKFxOrGX1NM4rLoO/Cw4LlNsOG9IH2dn4kkApwYMWvBqR2UqMuf4SyI9H6Uc=
X-Gm-Gg: ASbGnct5/cjSFSCkguLRfLitG7L++3qhUmUMJ2OHEIZl1Ka/aVgK25/VSu/L4SzDH+4
	K+0BhjqnG+IX+89ps/U0i8y7+1IWX2+lHbNkcKaFmndGWFEg4y3UegwjFwy+0LPbRDTjXx/87Rn
	KqVPfJvYy4o0a31ms7tSnHqFus9+tfWy/K6lfCeiaDADBZfz6HwLekFWvYoFbHbgtBuuNDvcbeq
	5p+vQyn4oWmzDV5DFTMVREkWzzbQM5/RulUtCIAdtZ+8Nyq3uG+gBirjaCfigelKo6G0rTaayed
	6n+rrufKxaH7KBJb1TMP2aMl4R0q2Yvo55tHmyVllqdGLwJPTBb4SpDeC45W9L4xquD8PK1PeDc
	=
X-Google-Smtp-Source: AGHT+IGHBChEeQbZZWdB6VUb2tAPzM2QubPuRCkq9llaK78PumUt20gOs9+K10OlU484h2rpI5M7EQ==
X-Received: by 2002:a05:6402:27c8:b0:5d9:f5c4:a227 with SMTP id 4fb4d7f45d1cf-5dcdb778e7emr7219614a12.20.1738847299436;
        Thu, 06 Feb 2025 05:08:19 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b73f8csm830235a12.8.2025.02.06.05.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:08:19 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] gs101 reboot updates (DT)
Date: Thu, 06 Feb 2025 13:08:17 +0000
Message-Id: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEG0pGcC/x3MQQqAIBBA0avErBtQKamuEi00x5qNiRMRRHdPW
 r7F/w8IFSaBqXmg0MXCR6rQbQPr7tJGyKEajDK9MsriJlppLJRyPjGcgqsfnLc+WjN2ULNcKPL
 9L+flfT+SZeZYYgAAAA==
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

These patches update some of gs101's reboot / power off requests to
bring them in line with downstream / bootloader / EL3 monitor
expectations.

In particular:
* an unnecessary property is removed from the DT
* the reboot / shutdown SMC calls are aligned with downstream now
* we now implement the requested boot mode as a notification for the
  boot loader 

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      arm64: dts: exynos: gs101: drop explicit regmap from reboot nodes
      arm64: dts: exynos: gs101: align reboot and poweroff writes with downstream
      arm64: dts: exynos: gs101: add reboot-mode support (SYSIP_DAT0)

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250206-gs101-renppt-dts-cb8ab6bf6294

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

