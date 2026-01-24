Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4185123BD17;
	Sat, 24 Jan 2026 20:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769285255; cv=none; b=bknEjOu/tgjpjp4LQORjxk9xKcZbrgxOeNe0DokAErEyqk5sVrY+ERJmVJolY/EXh86OR5Nkxc0SHbUDfI41HlOYZVaaGrUQBUX1sKqW8KW9IpsndQ41NPe/QYy3EdnLQ1tve4tHyo1BiiVK+EmcQx9zcDOtXqy4NH24Jj3WSD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769285255; c=relaxed/simple;
	bh=Yr5xNK0ZgmkOiDQM7wC1rXrKDc/tR8QPckZsm1KNIno=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q+OPA2n7aIIvcrlgv1Jw4FJ1dY6YrQHesJFnBqhVWSqx7zWykaAXHfzJuGdxC9kKo8OOGVSEvTgQD81AzVg4ffdAIk/UihTJm+7W6/JnCDAoeHJLNZuf95eox+HTM/LHgbsxJzVREWUmbkIx7D8zsAH2kq6ZD5oBq1J16fsHets=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=grI4do/g; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="grI4do/g"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4822227D14;
	Sat, 24 Jan 2026 21:07:30 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opSmFgaHfVSO; Sat, 24 Jan 2026 21:07:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1769285249; bh=Yr5xNK0ZgmkOiDQM7wC1rXrKDc/tR8QPckZsm1KNIno=;
	h=From:Subject:Date:To:Cc;
	b=grI4do/g79jcoEyadKxUXYWIPkMn0jDuLNmq+XQfV08kb1LEdHwAbUBngQFNI7l/l
	 hY912b3B7gROSWPYz8Xqnx3K7hCtyl3B1ee6RemBSvXsqnyj3juy4XwDiO/hcuDvG7
	 DCiNaEcQtbz7G9DvSBFM9T0sBRP3dop5UP+d8zzd4vqHZxXmiifvUTjzaSoUzjJHsz
	 limPVoN9BiXPsCB9E1opQ82XZ/GCoXmZ5GUnGpPOjOpNtxxpWDTrr3CUHCUQ3Nhoyi
	 quXg1w/o9DXgf2qUGntxFQRNjhET1k4Vj7lU+rLs8RQL/Golm5pIZ797793+YadhcP
	 hz81iSioyfRTw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Add device tree for Samsung Galaxy J7 (2016)
Date: Sun, 25 Jan 2026 01:35:25 +0530
Message-Id: <20260125-exynos7870-j7xelte-v1-0-5cacc3042c42@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAUmdWkC/x3MQQqAIBBA0avErBOmAdO6SrSQmmoiLDTCiO6et
 HyL/x+IHIQjtMUDgS+JsvuMqixgWJyfWcmYDYRUY0Vacbr9Ho01qFaTeDtZ1a5BGrW1iA3k8Ag
 8SfqnXf++HzvCNBtkAAAA
X-Change-ID: 20260125-exynos7870-j7xelte-6a902d588009
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Rayan Marzouk <rayanmarzouk743@gmail.com>, 
 bluebunny <kalorin.bok084@passinbox.com>

This series introduces the device tree for a new Samsung Exynos 7870
device – Samsung Galaxy J7 (2016).

I have acquired permission from the authors of this patch to upstream
this on their behalf.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (1):
      dt-bindings: arm: samsung: add compatible for samsung-j7xelte

Rayan Marzouk (1):
      arm64: dts: exynos: add initial support for Samsung Galaxy J7 (2016)

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  | 497 +++++++++++++++++++++
 3 files changed, 499 insertions(+)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260125-exynos7870-j7xelte-6a902d588009

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

