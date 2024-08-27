Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3AB1A2540
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Aug 2024 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761009; cv=none; b=H2LMAFWpNkiiasiOJ37y8wD3Hz5HHIzVVQgPP/ZTb2BJoDbuAcRnvxoS0irFChthLaUVTn7XKKujUXJwytJDDGYzCh3nnLMJtsbJNMTl9m+NnxKfiA0l07KwJZz2DGo7C8Ig1ty8fGqCBbjOKpS0jwO7CVbDsmpx09fy0Yjzu3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761009; c=relaxed/simple;
	bh=fh++pr6DseDriPGw/XL6T3D4J5hVJAqGwUEf6s/87qA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D+4+sPARPNSkEl5LPAik/D/HDh7dYKdWYvPFDWHv7VGHHQvGXKH8saqqQW0nOitLWZ5jNJstlcWbJTiTXRgpJXSD2cY4uzhsCEuahPrPCASnyGmWyJ/pKpnRl2SrD18aOcH6C9Y/t8o/s+NsZLw/LVNeAHH9AUl8OySJaqnFXvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mm8esafK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mm8esafK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42808a69a93so7821725e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Aug 2024 05:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724761006; x=1725365806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWeHlEO/WuzCnmFaEcHTY/lmEdw14txMtMS79yRBfng=;
        b=mm8esafKyKQdKBD6NrpiEtmOFSox0kuhwBuwUYIAVJ63J5ZUcj8chEYF56m7WioW9z
         5QHA26NbgIaV4Bg1hGrJsC9sWo8IVguBEh50HogJgo8uoQIOH5OxZf35Ef+nVxsaXcQW
         K+7pDG0spsXnPKHHM7snqRheLwqF08GI9EZ9M/rm36cbZxLQ82rE0UjmmDDIf3pJjJIr
         v7GLbEy4riGvpfy3BOSWLTXelfnZD8dRBpU6S5rEw3j4KG5hqc0EarFm7ygwSILCjasL
         CbMhApJgwb6evOUUBnGNuAvKEMK/GpSoDmG4BK8C3jzg3fJcX2WIBSEs11NKQo827eN7
         nT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724761006; x=1725365806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWeHlEO/WuzCnmFaEcHTY/lmEdw14txMtMS79yRBfng=;
        b=WBjguqReAMmqMjzQ6YCVnAmRrGL4odvoLTMcyvezzJ+CswhN7041QUnLmiMOMbgKuL
         GWp7gtSELsZfYUceVPEChyyyIpzwKeFDpmCFI2lBLxtvir4IfUDgWgi9WMHkMiJ/qv1f
         Suu+Tq13J108Ss+FfEmu+NzYwXQi837dXHgf7TzDfnCgdV7oP0w1XAFsQKaQ5OQq8WEb
         KHqqfd+whWzEgdNnxJTgr7+bhIbLsbRTsGBmKErl7eAz0DAu7zxw+MMUzXNJ1Oom87U3
         cx2sjHrDAz8LHLwNWv+Wqc16HDnPkV/anxFdyVEvmAtpBDGYtda4EPIoCjpnnNSQwdrO
         MwxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU67SLwHv/M1Vgpr9CnfyHJhJWVvJVB6m0L61o3rA/eeins4gaJK/Ctu/lGrtCyUxGYQ+gYOj2VgxIEH9Cg8SN5jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwULb7r0PqDj2rDErDMIFbCvEJGiWQwealYA+yRd5SjavMcXSUZ
	f7jHxEOWo4jVM7h215QIwtyN0f33ZMBk+cb1mO7nmV+4374wEnu198vUnVXfJSg=
X-Google-Smtp-Source: AGHT+IGs50FU1NZeLXeQdejwqyPEjAYGIdxGh4vlRpAAy2j8iphQ1MPOJ8W0ne050IZOs+MAWd4N9Q==
X-Received: by 2002:a05:6000:154f:b0:371:730c:b0 with SMTP id ffacd0b85a97d-373118b5e0amr5517784f8f.5.1724761005990;
        Tue, 27 Aug 2024 05:16:45 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730815b7e3sm12998658f8f.53.2024.08.27.05.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 05:16:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] ARM: samsung: soc/mach for v6.12
Date: Tue, 27 Aug 2024 14:16:35 +0200
Message-ID: <20240827121638.29707-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827121638.29707-1-krzysztof.kozlowski@linaro.org>
References: <20240827121638.29707-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-6.12

for you to fetch changes up to 3c8966403dae49d3402011441f3c813787a40b4e:

  ARM: s3c: remove unused s3c2410_cpu_suspend() declaration (2024-08-19 21:54:23 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v6.12

1. Few ARM32 machine code cleanups,
2. Add dedicated maintainer entry for ARM64 Exynos850 DTS and driver
   code.

----------------------------------------------------------------
Gaosheng Cui (3):
      ARM: s3c: Remove unused s3c_init_uart_irqs() declaration
      ARM: s3c: remove unused declarations for s3c6400
      ARM: s3c: remove unused s3c2410_cpu_suspend() declaration

Sam Protsenko (1):
      MAINTAINERS: Add entry for Samsung Exynos850 SoC

Uwe Kleine-König (1):
      ARM: s3c: Drop explicit initialization of struct i2c_device_id::driver_data to 0

 MAINTAINERS                              | 10 ++++++++++
 arch/arm/mach-s3c/irq-uart-s3c64xx.h     |  2 --
 arch/arm/mach-s3c/mach-crag6410-module.c |  2 +-
 arch/arm/mach-s3c/pm.h                   |  2 --
 arch/arm/mach-s3c/s3c64xx.h              | 11 -----------
 5 files changed, 11 insertions(+), 16 deletions(-)
