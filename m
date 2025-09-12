Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BEE3081B8
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 13:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757685296; cv=none; b=G/TnVg/c/jwPmChL9mAwxT4geq/A1I5QWzAcs5yUeMcpWAq1yEjKLpFhHm1E43N3CfQT1vItgp7jzocxffzr8IRx/oddlc9Jc6JzBhaRo9FiShND788EbJbvHWHSCE5lEzq8o63x+AChINiu1v7UQLhcMJ7YGQ5bRyjqqpty4OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757685296; c=relaxed/simple;
	bh=+R3H1ZTHIpjD/7gpvZo0O5OPpiEvSR7fzcYJIZTMjmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FcUBjybB8U8V3NjwhTxabaz83oghGzjMjvMLJMBE6nvSdpPDto9r6S4/LDpOy9ht4GLA06bAjVd5eepihsOZLBhjx80wDKnG4c/oU64owHiKisyVBQazwVFIEtUkcuvtqiq1CUiuWTPcE821uLdCIGTYKKPVX47+1sEui2LxEhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YD8HcLgv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YD8HcLgv"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ce208c7505so286928f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757685292; x=1758290092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3tTGGzjAuGZXQWRu05vrCKimfXwg8uSaYFn3EC8TDkU=;
        b=YD8HcLgvZ0NyJ+QUG1IF7uHyU/W1myDKoVCCBx81zT8Y9ZXfvvQM9tGAEBu8d0NiTb
         Rr+c/xAUU8Ut7tnsHaNq+WSNvCDi0qLjePDPUUIAQONa+11AGBuB+opMl1w6t9Lnm2m6
         hUVDu+KxlEkyohIkkrxiIlCHZ0SWFIm2AKeU2xskdv6roKPZGCcpixxKjFjRL+UNTxwP
         leiE9Zjq3ZlT8zDX8PFRq560WY4CwwFwLUwZJVVf43AChYg9Mn2zvYAG4NYB3MfzrtcE
         +sRfeGiutLwhKZfpfkEwP0glvGZjOx4I+e2nAVIlF1nmPoVcp+Ns8e7pKnYN+INQJAZC
         BylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757685292; x=1758290092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tTGGzjAuGZXQWRu05vrCKimfXwg8uSaYFn3EC8TDkU=;
        b=P8kykgxYNC9BbGQySRaUnxa5gvhkBSpMM5nZ5iuuartmlRsUKC1iQCnzf+p3vZ7nre
         8nQs3YqrFfUzg9eSn4N0wRDp2OD12lTFNle2Sr4vb7P82XVlTSbej2B/judDtOZsPzE1
         A4gThfThP0JfMYmAqzWqbYEK2s9rKmwS2OvsO0Kog6gujhV099e2UI20Ii/Q0q7760UC
         Q1keHpeKhpCuDvkLOouaCPq/Rjy94BM79w3JGdw8lOMcFDwAzErfaoYQ8L/K2zScZGBZ
         Y8Eb/nikWT5XcVI1HoC065CFQ1urw+K1sec3uZZXITEhTSQI9GD6kjoFzPX2BSovJIJ3
         trEg==
X-Forwarded-Encrypted: i=1; AJvYcCVfOgDtm98ZNdoC27ffvMOdoGEQpgnroXDSjGmNLK/Zfxe8Fv2kW6nMzg6S7V7QjcshAwgT+7dgtkhRS4zlJCizHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg3c8XMIQuSppjOYMC8n9a9b5rhPTkeW9rJ3LT0Cgsp+wh5jT8
	fVteXhCcXepjJf0lcD0e8BDjFdIimBtPuNBGTxMGzsj6ss9s1LVGWlF1UmGj3SMR2Gg=
X-Gm-Gg: ASbGncvGFRdU+LpWD3LiENZqce+TFjWwFPMeApfCtDE1OCk57NcHbmTEtjf2xaWcuT0
	rmcdfgLor1ZRqxpHTkQNl/njDtsDpDOCI19v9WzJms37O2UnBHsKN+ox2YVP5gMnBlWO9h/65Fk
	pnac+tkBIJQVxb66y7atSjQzPL7rL9itAoQ/J6jj6SPTdURwQBwUgmVhwgpmmQvO0Aid2xdw8TJ
	91+oXeMwDraYrkMNiD8wwgWbjlZNiJHXhU5ulG+RFxzVEmK9AqT8hJXRh6VzONVxI9l+x8fkNWv
	kqtEfGN/esxSeIx1mxhdGAb4ak9o3WpkyVQqwpkDWx5OV4Ilx8hmASNkGrEqYBCL1XN4GXT5b7P
	YHRK89QPD/boMisNWABaLUAbtaw/pEaBznklaHSL5boaM
X-Google-Smtp-Source: AGHT+IHa2d6N+I2Uzmdt0WNUESJkvL2LyjiN5VutHgQP0qs3PTN9Sv+qvKSGg2es7vfBpKw/dNOTtQ==
X-Received: by 2002:a05:6000:230c:b0:3dc:1473:1a8d with SMTP id ffacd0b85a97d-3e76553700amr1475966f8f.0.1757685291885;
        Fri, 12 Sep 2025 06:54:51 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd329sm6749615f8f.31.2025.09.12.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 06:54:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] samsung: drivers for v6.18
Date: Fri, 12 Sep 2025 15:54:48 +0200
Message-ID: <20250912135448.203678-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=+R3H1ZTHIpjD/7gpvZo0O5OPpiEvSR7fzcYJIZTMjmk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoxCYo+Pv5PhFkoqL+D2aJfApilJiP0CroSyKj8
 yHoC5S2/9KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMQmKAAKCRDBN2bmhouD
 119+D/wNTh8XCX0eJ1D+00tjKjvAUyIG70Ce8hwuspf2+Y/ZmUzzUZi3xCB2ExpCgMZ1SEHF0bS
 LJmEYKHjPexn37YqQs/O7V84sqOYJoCisxXUk5Gp9JM0SzUJ6yqZ9M4KoeJuq4PVd4x0cCl2DDv
 oFV+r6qKgwWyh/EVqokjUXqABdJhpGz9M2Wn1sSWRF5n3gujv3K/Sx1TGsbZgvbXxQWIQ58CxrS
 m/Tey1RNtLzTnrkorRlHcxbEDYt5fojnUgci4ebJIlG7c08f6N7vW+D+LTJYHK/FPy603PsxjwS
 XMmGu9EzyvflPL0r9IZfExuXIl+cv0FZ/ZWgHcnC8HGYwGOVG1ryDfcfRLo4GBcvx8vUGjBYFzL
 TU59zS2BkyaxpD6Cqh0Y6vTQdBb1eMjknAhDzouj27ZEETVsl637qEXAsFns6XigH6VVhJ4Nxfv
 FKTYKG6wNttNaCrQMdChdPHCJGrJhGwZ5gWFmeg9YoubQfFiqFLHASrdVyOSW0Jeu4OaZXO2NM1
 LHVnFaiNFHCP0JicZ51wIUqzoZCIUzVQwapxAfZaTrzhOurAdWWSSQQlJcijQTd42DZHnWaB2jN
 ZTImPN0hxyAK5KV3rExKxZoyfMhdIbnw73yrMA8atLu/Fg2x9IQLgmljorXpmViDqRq3698QMod iaNGtFLV2DD+xAQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

Samsung SoC driver sfor v6.18. This should be my last Samsung pull for this
merge window.

Best regards,
Krzysztof


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.18

for you to fetch changes up to 1da4cbefed4a2e69ebad81fc9b356cd9b807f380:

  firmware: exynos-acpm: fix PMIC returned errno (2025-09-11 11:27:05 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v6.18

1. Google GS101:
   Enable CPU Idle, which needs programming C2 idle hints
   via ACPM firmware (Alive Clock and Power Manager).  The patch
   introducing this depends on 'local-timer-stop' Devicetree property,
   which was merged in v6.17.

   Fix handling error codes in ACPM firmware driver when talking to
   PMIC.

2. Exynos2200: Add dedicated compatible for serial engines (USI).

----------------------------------------------------------------
Ivaylo Ivanov (1):
      dt-bindings: soc: samsung: usi: add samsung,exynos2200-usi compatible

Peter Griffin (1):
      soc: samsung: exynos-pmu: Enable CPU Idle for gs101

Tudor Ambarus (1):
      firmware: exynos-acpm: fix PMIC returned errno

 .../bindings/soc/samsung/exynos-usi.yaml           |   1 +
 drivers/firmware/samsung/exynos-acpm-pmic.c        |  25 +-
 drivers/soc/samsung/exynos-pmu.c                   | 276 +++++++++++++++++++--
 3 files changed, 275 insertions(+), 27 deletions(-)
