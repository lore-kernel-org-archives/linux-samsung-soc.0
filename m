Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6668B2E542C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 11:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763638181; cv=none; b=V+aQdUqZxALRiqSSGgN0jfOvYi0XGHqFNugOkEGVUez5aPLG8zCL2WReW4pEKtl9i95UTHL8T8R2j7Fl/7ldEGES7tGUSFH3Mw+cwLsC6TIOymSCvKqvXspG3bRnRRJ8SdQWRmp4sXqTTdgdZX4gpS6vz3udap1Q4mYc9Ryd3gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763638181; c=relaxed/simple;
	bh=ivjSzEx+CxHtG09V2L9ly4PVIffolvcnC0we/k+cPGc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JLt1EyKJSENopyBqap353c3P983dmPP+kNMApVi8cek4BGwEpasDB/nnV+jUabAWI6hS/HKZJqxkU+VPNAbejbsY9UEcZ05O8VNILOjwxBgVLb7raMObantSnQZKgC4Tnsg8Q/O0u6xwUdC9fOE1qFsr91lSD3Oxsqt6D5e99QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d8kzPR8P; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d8kzPR8P"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso5758205e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 03:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763638178; x=1764242978; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5jsja9fjYhb+NStCyKVmqy2iqD9br8b7PE34hFfWl3s=;
        b=d8kzPR8PXaG/Gjk4zeuLb8cm54h03vqkNI3dwCe1wc0aaRkrkPGIh9hfy1KPnXrb9H
         PkQqYeijjRZZ2/NBqUsqXC3+sJPVJlgctu56RCePCzxfd895sUWR0BKpvZ1XGb8/Al0q
         mULCFtCuXPAoW+E3syTBb0YKWMhpqdL/kOw8NAVcF8Lh0VYlUOKcXTnwqxQDwwG4aaOD
         hX3Jgr4vb/0ZYP6Oh15hO7DiJIP9GzLCO0rQrokbBV4SUqq/lnVrP8c3tSogjoiBUpYp
         b7yGFofnd5K1/VDstBa8G7+hF8eU7ut/Dkc87oQGa0pj5A0Xb0U5YEXqQJu1Z/PKWHY+
         S6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638178; x=1764242978;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jsja9fjYhb+NStCyKVmqy2iqD9br8b7PE34hFfWl3s=;
        b=L7oGBxhdGaZ1N5nhGkguxvKI+ICqCuwTGygb6q0uuYg59E8rg6r1QOxp5gYfR21Beg
         UE4NuGZ6p5S3GFlysEhC26S956p7vf7BHVUB8fJToBRiZmdNr9mmnWaxI1f+p+/uv4Vh
         dj6VRfaMNpv/sh6Wt7xv2+8yyZG6N6e96amtiYf+aFaQisJf28j6xG00I8/igXQcJm60
         9txoI//4nBHo6y+0/LCiEnaL5eMkZAd5LAwn1o40IDzqXyRfetlXBA+WwPPqCqN4yoHM
         ZiTaCXG3VaXOsgzoVJ5qmUOZ8cojKgH8Jv5ki4e6hxHJvxpa1G9hmh2v2ApTDPefH5cc
         FaOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBx7nLpO4CvrdY0fEJuKf6d5tvQNbIUdtmYQM/IE4EU423+1lOO2OxAj8pk/jeQartXK699/XeIIqpivyEFuOFng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGTgjPI5G2mHiP1rIGchX7uEAD7uFxGoCw9Xh3dNTv/PANIYXg
	s3ato1UQNhsLqVH797kbcEcrruzXYC6ti9I5SoQ+WTHv0EkLTm51ny5JZpxfBNhkUU4=
X-Gm-Gg: ASbGnctD6C4NYeZJxB91qoMCNRjrdQTu6CEL16rh2IMeNwtjgNHtZorArvrHoJehrYk
	Me4dZlbTkmfuJ6bmyPysXCAiVYS2D9hDoW0FW7tkHfINl2MmrwfV592MOEqiS8c7nNDMdAunbGH
	gGqT6MH5Mssw7RszP0aZzGZY9cVRmm1EtizubgjlcuAWG0rULKv9ZlRXzK8yDjhHl05LuHq5bct
	0B9RpIOBJOC3SWLEGW+4CxtpsHv1FfmgAj+2lZQd97m/CiXUJGvObpGjhf3e0wFL0EbN7on5qmG
	XYERcrQe8NgtZiFL8dsqUrCjFt0IhhVVJRXpiQbUNad3kfpqxy7QQLkYmw10XBheSjy6bfdyGtO
	EW/uPC/nIL038Ci7iaS6SR4wk3CwqqjevKQbEPDeLXE1KCgK0wigJha4pimBx1qWA2gmJBFWfip
	RP9/EsIWrLqhKO3rSdEaMNsPwJRPKOOfBO8ZCZbJ/wyRPiv/J8GllPXiTGjgMZhJlI+RE=
X-Google-Smtp-Source: AGHT+IHE+l5HsIigBRRfPfTgTns2urZyrt30XqV4zwL6M7ZPA9e1/JP7tH+iQOimE4Sm0ipCDkqCZQ==
X-Received: by 2002:a05:600c:4f53:b0:477:af07:dd17 with SMTP id 5b1f17b1804b1-477b9e377e5mr21242825e9.24.1763638177719;
        Thu, 20 Nov 2025 03:29:37 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm4961040f8f.11.2025.11.20.03.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:29:37 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/6] soc: samsung: exynos-chipid: add gs101 support
Date: Thu, 20 Nov 2025 11:29:34 +0000
Message-Id: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ77HmkC/3XMywrCMBCF4VcpWRuZSW+xK99DXMRm0g5IUxIJS
 um7m3YjCi7Pge9fRKTAFEVXLCJQ4sh+yqM8FKIfzTSQZJu3UKBqhBLlEBFQ9iPPbKWzurJGG2e
 UE5nMgRw/99zlmvfI8eHDa68n3N4/oYQSpG21RWibm0I433kywR99GMRWSuqjEfWPVlnTySG1V
 QNU1l96Xdc3l/x5mucAAAA=
X-Change-ID: 20251031-gs101-chipid-fd84da8afa2f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763638176; l=3081;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ivjSzEx+CxHtG09V2L9ly4PVIffolvcnC0we/k+cPGc=;
 b=ma6axIDODKlP5/fIDbimwj6oH2uwR8BQHYAE8OXcROykBzYDRDaDArsO6/veko/kQ86svfaYU
 Raxm7ROZFqeDPtkHufUH41CBp+bKkWdVzyvCcQ3e+aJ7zFZ7BVlyeeo
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Dependency
==========
Typical dependency of the DT patch depending on the bindings patch,
thus the bindings patch could go via the Samsung SoC tree with
Srinivas's ack.

Description
===========
GS101 is different (but also e850 and autov9 I assume) from the SoCs
that are currently handled by the exynos-chipid driver because the
chip ID info is part of the OTP registers. GS101 OTP has a clock, an
interrupt line, a register space (that contains product and chip ID,
TMU data, ASV, etc) and a 32Kbit memory space that can be
read/program/locked with specific commands. On GS101 the "ChipID block"
is just an abstraction, it's not a physical device. When the power-on
sequence progresses, the OTP chipid values are loaded to the OTP
registers.

Add the GS101 chip ID support. The support is intentionally added in the
exynos-chipid driver, and not in a dedicated Exynos OTP driver, because
we estimate that there will not be any OTP consumers in the kernel other
than the chip ID/SoC interface. The downstream GS101 drivers confirm
this supposition.

Testing
=======
root@google-gs:~# cat /sys/devices/soc0/family
Samsung Exynos
root@google-gs:~# cat /sys/devices/soc0/machine
Oriole
root@google-gs:~# cat /sys/devices/soc0/revision
11
root@google-gs:~# cat /sys/devices/soc0/soc_id
GS101

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v3:
- rebase so that cleanups come before the gs101 support. The inclusion
  of linux/device/devres.h is now done in the devm action patch, as it's
  first needed there.
- update error message: s/failed to read sub revision/failed to read revision
- Link to v2: https://lore.kernel.org/r/20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org

Changes in v2:
- complete rework, treat it as a new patch set please.
- bindings were reviewed at:
  - Link: https://lore.kernel.org/linux-samsung-soc/27a5521cd7ddbed0e870ac416dc829722f1b36a5.camel@linaro.org/T/#me139353334db535806ca6462ae1e86b01ff032a7
  - addressed Andre's s/if of/is of
- part of the cleaning patches are from this trivial series:
  - Link: https://lore.kernel.org/linux-samsung-soc/20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org/
- Link to v1: https://lore.kernel.org/r/20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org

---
Tudor Ambarus (6):
      soc: samsung: exynos-chipid: use devm action to unregister soc device
      soc: samsung: exynos-chipid: use dev_err_probe where appropiate
      soc: samsung: exynos-chipid: rename method
      soc: samsung: exynos-chipid: downgrade dev_info to dev_dbg for soc info
      soc: samsung: exynos-chipid: add google,gs101-otp support
      arm64: dts: exynos: gs101: add OTP node

 arch/arm64/boot/dts/exynos/google/gs101.dtsi |   7 ++
 drivers/soc/samsung/exynos-chipid.c          | 148 +++++++++++++++++++--------
 2 files changed, 112 insertions(+), 43 deletions(-)
---
base-commit: 303dc6bfcd269f141c3de92aad7e25e2afd1dd47
change-id: 20251031-gs101-chipid-fd84da8afa2f

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

