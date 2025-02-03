Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF1020E6F7;
	Mon,  3 Feb 2025 20:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615191; cv=none; b=TTl5ZkGGEmWU6DRlerlpisVGWK3QR2mgwUTcAE24LHYUBEMr/DYWsGKqIDMDlg66hltwtqtKEjz7NEXO71ZzKvII8wclosyBNkT8XVMTtI2JdEeU8vCLdpGNR3tRcToQebT+vZ8QL1uFBK5rwSYzL9H/xufNuDUyq7HZSlUHcpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615191; c=relaxed/simple;
	bh=Q5dvsGVyVYjLFQFk5Tp4NzwOjCvA7qPj0qDvfI9KBAo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HlrQGGA/p8WHNhS9beN6qwvJHjwBMFODJ0qn7a6VehAsXU+15cvSJWebxHHGIXUB9PowxZy97zDjBFiDJoePDoh/9c0mQAHxGGscjSk9VPNWd7xkiC79iUpjJ2BHcUlyov+Vd+U5sQ0nscyoG6dz3nDp9nDJ84+Gm7u0QNAZRwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=jqPfvaTb; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="jqPfvaTb"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C890325BFC;
	Mon,  3 Feb 2025 21:39:48 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5x2maqIU6AcS; Mon,  3 Feb 2025 21:39:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615188; bh=Q5dvsGVyVYjLFQFk5Tp4NzwOjCvA7qPj0qDvfI9KBAo=;
	h=From:Subject:Date:To:Cc;
	b=jqPfvaTbfUKWxbnJmw2OCiI6VMufRPTCOcY6pa+2ZzLBB5Tj/KaMk28Vxd4mjSbQh
	 v/HjO8cxMBSOgXfTtjFoKDwTFvgDCZxhSW3DYWLq2FGg3Nu8kIH2yg3lWVA5CV1s4p
	 Vg1GSRax9kiGOA8v3beADA93hFwZUedg/qm0U98EykQLUo4YziPenVIiVTH07Eg7D+
	 /NgQ5Y/hnM22zrh2Ov1cf4/Mo0I7HNjS4dYnv/GuPJoIlI4D4jGckU3SzuSoYrW5y8
	 k+/sygL3OqKiFTb26dbp6LwGkehO1YRNqDlj0uEaXrmaVMAYhGIKUhXMOvh7nj6htj
	 TAqc9xWiF7x+Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Introduce DWC3 support for Exynos7870
Date: Tue, 04 Feb 2025 02:09:28 +0530
Message-Id: <20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIApoWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNj3dSKyrz8YnMLcwPd0uIkXcs040TT1BTz1FRLUyWgpoKi1LTMCrC
 B0bG1tQCrdWzcYAAAAA==
X-Change-ID: 20250203-exynos7870-usb-9f3a5ed7ee95
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615179; l=652;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=Q5dvsGVyVYjLFQFk5Tp4NzwOjCvA7qPj0qDvfI9KBAo=;
 b=EAMigpAaLM74IXHgCBAjFWa6fu1CYDvTLcGCrnI+TUqV/pylIX3Oh1bGGpoCc1ZzyZrW2qxtK
 G5JQwsn7ARbD9F6m5opCXr0ZND+O2fl70PrleiFy8l8pm1LdGb1jaaG
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (2):
      dt-bindings: usb: samsung,exynos-dwc3: add exynos7870 support
      usb: dwc3: exynos: add support for exynos7870

 .../bindings/usb/samsung,exynos-dwc3.yaml          | 34 ++++++++++++++++++++--
 drivers/usb/dwc3/dwc3-exynos.c                     |  9 ++++++
 2 files changed, 41 insertions(+), 2 deletions(-)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-usb-9f3a5ed7ee95

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

