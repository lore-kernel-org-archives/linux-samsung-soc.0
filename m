Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E2E3A1A48;
	Wed,  4 Mar 2026 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772645227; cv=none; b=kqXfnLLlFNXIlKHysWWGzNhYy1XZdJfi7gi6mbckUXSxfXtQSDNiyxBTkEk8UfZXfy6C5iIqk9MJ94pBJhSFjB1TIz6WVt8J9Iyw0FUWZ1WO06XA+ihGIScE6sP8EOlEfNBikJo67908eH/Sl87O9MlXX0zjVlaewLPbHOcU8a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772645227; c=relaxed/simple;
	bh=7tLoMyeDuZn2+6SCPZy95el7g5GbKi9JN66T+XQCQeg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RJPZdVdPSB1vZDt7ktULCkYnT2GmAMACijicMOO1id0XcvGPRKxMWnYulm8wpGxKyHWtojcL2xdgBRNtQ3WlubEEDVGleamtxP9Xj2YXbA383AFvKRg8H0aWhZLB2HmiAeaCH/g8EpyKY8GR+FVO68LfSBsN+eXKYJpx8Q6UgxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=GYMQKVXq; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="GYMQKVXq"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 29B38267D8;
	Wed,  4 Mar 2026 18:27:00 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-M2zj95RpEZ; Wed,  4 Mar 2026 18:26:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1772645219; bh=7tLoMyeDuZn2+6SCPZy95el7g5GbKi9JN66T+XQCQeg=;
	h=From:Subject:Date:To:Cc;
	b=GYMQKVXqst9CMNo7FOdSD+ezExMorKvnKYus9sRLMQinqvth8k4Nl0wriWaUahUbp
	 TXzfOw893Ks1c9Uu8eVnJz27M/rxsEPv16sG0iCuREjmMNHgcahgXDYsBUqQ7/F6X+
	 3L5s8IwKfjTtfNI73Nr6i7PqLJqviorDX9e56QXgE8oDmRqH8UsjBYEG06pDD/ghH5
	 +jmhGrKc3MkEUF52A0OdqEJCquIVjbVIPOkWQ7/VSZU5jile/b2y6r2e0efFvH3EEL
	 DpNcsN7ohSBBSz5MDK28JfkdOYLI31zKERI5JgGGR09mUavu47CfKiorSg+U8mu5yF
	 R/0HMc17UiBZQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Add exynos7870-j5y17lte
Date: Wed, 04 Mar 2026 22:56:52 +0530
Message-Id: <20260304-exynos7870-j5y17lte-v1-0-eb25902c84c8@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFxrqGkC/x3MQQ5AMBBA0avIrDWZKi2uIhbFYERKWhEi7q6xf
 Iv/HwjkmQLUyQOeTg68uQiZJtDP1k0keIiGDDONCnNB1+22YEqDYiluadaDRJWjRWu17pSEWO6
 eRr7+a9O+7wdQZNvyZQAAAA==
X-Change-ID: 20260304-exynos7870-j5y17lte-940a0aa66b31
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Andras Sebok <sebokandris2009@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>

This series introduces the device tree for a new Samsung Exynos 7870                                                                                                 
device – Samsung Galaxy J5 (2017).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Andras Sebok (1):
      arm64: dts: exynos: add initial support for samsung-j5y17lte

Kaustabh Chakraborty (1):
      dt-bindings: arm: samsung: add compatible for samsung-j5y17lte

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts | 528 +++++++++++++++++++++
 3 files changed, 530 insertions(+)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260304-exynos7870-j5y17lte-940a0aa66b31

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

