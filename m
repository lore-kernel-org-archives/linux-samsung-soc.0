Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945E98633C;
	Tue, 10 Dec 2024 18:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733853744; cv=none; b=BoKrhzWN5q9xmi4/7XNX9uPZNKsrey+RhieZEm4AEznt8sT9mJT1Rw1ZC58YPuw0u4LLAZqlLe354JigfW/cp45k2YH0Jjd6ay5HALszFpDoriF+g5w4V9oHgtQdp2ffhNyloES47JGwhMVjbbnMgeIjRLrlv52bDt0KCaAel20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733853744; c=relaxed/simple;
	bh=Wn8dvmhpbqifczjq1ws+Q7oM4cr83bwHC/c4lzlzkrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y91Dt07+04ud8hKGiTDmh+Nl0c5R83M7RdSB5qqssE8fkUoWpK4cqpf9VA5NrkspGIwNNwEiXBHaQMC5j4nqiBFzbMNDpWVmSWt9iLjKqEkLKeYuU5+12fasG0yPgWUDsQ7bU6sAyDhDi6tkwmVK5WOfSaMqPWNfOzPU+KIU5tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cr52aB73; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cr52aB73"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa68b513abcso424358866b.0;
        Tue, 10 Dec 2024 10:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733853741; x=1734458541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BCY2cGBNnositKDICf7Efd3URLuqM088tDb4fIyX/u8=;
        b=cr52aB73cyzr+dWE291LQtGWqZi6SJw3+UNDqfjvj1lI4XxzydjdytUKKD2NF0DPZm
         MUaKquxW4idkeoGqz9DYFm0B69fSQ2Kju3q7fiyRDqZt8vrGVKl0TeEiLHE0dgpxfQDh
         6NQX332j80Dk2y719puKpK8l9H3xjPX3xubdIdg8F/id1+nYqcKHRrAvfG/yFwsCH482
         eSOfpJILBHg18uaarJ2da/gCxTf5Avgi+qfHHHi1J9qcwLWhYTfJyLtpgR79h26/UmpK
         Ev719fDqoGyjlY9UU1FJMPzpUOe6CSdeyQItFO783xFwSYkh0WUgh7AxxQlbiOiUCsFM
         fCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733853741; x=1734458541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCY2cGBNnositKDICf7Efd3URLuqM088tDb4fIyX/u8=;
        b=Koz1nChlkySIE7gd6QE3Q4B34Fjx7DkDj6UUiKuslbw/T/RIpehSc7zlUI8mn3pn4X
         /GwGb65ivDLFdZVkxZOIp+rYcusjQEhjEbOMnLH8Ra3VCZI0kMTC7295Uk6sgj7XYxyD
         SV7JfgtI2RE84Uj3eWJxTe4WQvu/wDOCYN13BiLlVYI7EmTGDklOlIIvn4MpZD0VSxOf
         8fT2xTw0UBSNB2EEuLfR5EWg+fEZwsOCduNuDnljMxDy1LalA9iHlInOaUS3ebT5WKwb
         k/9aGXRHtSLVJsyUbnJtRV0FALzmvLP6eqZ0Yrb3O0g/R5F3R+v5JKUNcu2Ky0sIVaWH
         dl2A==
X-Forwarded-Encrypted: i=1; AJvYcCV81QFcX9Ju6ewZE+QDORURlnAgrzXbwZ1+0iWP75XoJIx34mgFjfJM1/mQjeKyj/x9N5EV23ckwv1H@vger.kernel.org, AJvYcCWjbE7mFEzz1sSx3Fig+clmRekVMl3NDCsDjyM/Fy0m/dt7WxhC1OH72/VxDuuKzFO/XUSDpmeX5C/BnazZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzRgoMAgjkp91Os1j/+SXkyulkk9UZYo9yIgczfUuYh7BIrbPHc
	w9fDmKu48PAWLXVZPjUfGUEFkX5GTKyjot1DPeqNuyYvo7k7+DNb
X-Gm-Gg: ASbGncsRf2O2QDfXr/jUbQ1xCmuUC+Ja4+8fN5YvmjB7AIFWnI9FoSO56mU0GV9c9Z9
	xaz41gYJbxQZL7sOrITv6y3t8Xefhntbja/0LH0wGD7FZlPqpO8durmwrENjIwlnigTAeLWu3Zr
	bUs+qAat0HUeEiNF7P2BLy06pZMeVFuRHnXFXzu3JpSNHDu3QiHmDPo8BanB5athTw57UkePeVC
	m+kNpqa6trdBxJ6UsclLDsCzYU8JQKw5iVtMiRZ58iFL6cFjYWMYcEjToEe7+XYfppStIJQSIBR
	Sf7ocTyI23LMzzhcT2lxCqw4kX5pjA==
X-Google-Smtp-Source: AGHT+IFXTKqLN7rVjG4MT816P3sDPA226Vptf61aO0FKpDWfT8usup+FPSpJd+BDFWR01cmVkV/mUA==
X-Received: by 2002:a17:906:cc2:b0:aa5:27d4:980a with SMTP id a640c23a62f3a-aa63a242b13mr1598856266b.49.1733853740403;
        Tue, 10 Dec 2024 10:02:20 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69448304asm276347066b.45.2024.12.10.10.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 10:02:19 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: exynos8895: Add m2-pmu, poweroff and reboot
Date: Tue, 10 Dec 2024 20:02:14 +0200
Message-ID: <20241210180216.398165-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This series adds support for syscon-reboot and syscon-poweroff to
exynos8895, as well as support for the mongoose cluster PMU in DT hence
a compatible for that was recently added.

The new syscon nodes have been tested with reboot and poweroff commands
respectively.

Kind regards,
Ivo

Ivaylo Ivanov (2):
  arm64: dts: exynos8895: Add a PMU node for the second cluster
  arm64: dts: exynos8895: Add syscon-poweroff and syscon-reboot nodes

 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 27 +++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

-- 
2.43.0

