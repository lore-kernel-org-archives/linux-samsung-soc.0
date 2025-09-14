Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5AF25486D;
	Sun, 14 Sep 2025 19:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757878331; cv=none; b=MSnxf9JCgeAIaQJgZ1il0lmyYHBENQbCwiMDnJoPBEOfiYrrjgczTTQy3uitj+bepl8Wole07MecOj3q0q3RzS0WD4qpG/bscXFJpPT8uD0WW+jIPBggz+fjRbJu+QMwlNu4s9mJhKXDnL6f7qUD7MRZ0iYcB1fU2JUhu+qanT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757878331; c=relaxed/simple;
	bh=SChiRd4Jr6UfFBCrUBWUWxMCt2bUKVsrLzTm4Xw4bZY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IhPvsOK7ByLc/oOiw4LHJP9CchcYmdsqIZ0cR02L5IU2BszCRJ4ukQ1RWG1/ooyadWeOKN0SiF33Ccp5MZ5YGFiksVuFYa1eK+KOURik52pQVrqN2P3mI/elzMwEKH5Kw2CrONjMGSUoFvV+W3238WRhDgPaMeh09gJLRJz+kig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=lUcic0MA; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="lUcic0MA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757878319; x=1758137519;
	bh=w7wnGFxKCc7yHOaz4m/M6wcLNTkWeL7mLpc1eKaDjVc=;
	h=Date:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lUcic0MAVzslDWbkKY/ya0bLz/NhScjQJ1lm5spqT9Sk0pS2q9+Vv3rSNVtCiaNiR
	 gp6kEugW0yVvSwBCCS48vJwUesae5YcZ3IgPzqS2WWfAlLnhlLF7F/W3E0copsamuj
	 9j0a+iTcG6z1IS7LcBxc8xICI1Z9PBvgomUync3sa61o4MKUK9iac3xZuDfw/PpU47
	 xf6ArMqWrN4pjWG2iRgNyMc+P0IbHGV16WdVpman97w5j9IMkK0vnzYAFIoyB/5Tob
	 q/A19Cq98xmMWGpwyjKu2rNwVwTjeWsojENPH13Q7iwxuqR6IDiarOgEXeSvUkiRPd
	 rIlHj56dkQZeQ==
Date: Sun, 14 Sep 2025 19:31:52 +0000
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 0/3] pinctrl: samsung: add Exynos9610 pinctrl support
Message-ID: <20250914-exynos9610-pinctrl-v1-0-5b877e9bc982@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 9116ae75cf6b7b819408403bbf1327d42b3d61ff
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patchset adds support for the pin controller found on Exynos9610.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
Alexandru Chimac (3):
      dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
      pinctrl: samsung: Add Exynos9610 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 109 +++++++++++++++++=
++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 5 files changed, 115 insertions(+)
---
base-commit: 48c4c0b684f394721b7db809e1cc282fccdb33da
change-id: 20250914-exynos9610-pinctrl-b44cdfaeeed1

Best regards,
--=20
Alexandru Chimac <alex@chimac.ro>


