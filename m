Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D7189F43;
	Mon,  3 Feb 2025 20:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614758; cv=none; b=Qs5DF7prrP2VrhG0fZlgb5fm2A7gpJx8vxsIUm6UgEeMLljQiuuZZxD6B2bzaIWMs8nxgFOb8d7+y4mFQ++2h/tSBNu+hmEaBmBAQDuld/GJsbMtO32YHSHd1ElJdpxhctYg5mzphFFJJ2oDH+6Sw15GctdmWqSzIp4/GenoGKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614758; c=relaxed/simple;
	bh=NeQcw5rrhoA9bA5UTKSw3syXrmeuhQwUW7S3N0b3KQU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Es38Ie3l0Z4D2sCDDK1OXV9/FVNkFm8jkaPVUPaQlaryuJmPzvSsSYLe/jNl1r7hAav432NT+qPBqWagqhCzpDGxP2K117xrqkd3/WkzltQe0UQ6DwCZ8HRuI4gP7f9thxsC/NbOlKwJD0TNhJbqoPdMp3utSxVWCVD1l5hFG78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=c2vTYrym; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="c2vTYrym"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 62A4825BB1;
	Mon,  3 Feb 2025 21:32:35 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvAOHOSqMBCO; Mon,  3 Feb 2025 21:32:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614754; bh=NeQcw5rrhoA9bA5UTKSw3syXrmeuhQwUW7S3N0b3KQU=;
	h=From:Subject:Date:To:Cc;
	b=c2vTYrymOaujh4T/+OU36Wex/6DpyinJUMXrQdJrlb3eBEZXznX/U9L7WyEtTmfCK
	 lXXi1JNw1DXwcZyNGdZlC0BUSjymliMR5zBQnYclB60oyL5ulFwmyy13+txrHwYgzq
	 LRC3VGSaSUA5U5bZDT/R1T8h5xEFOn3lZlhFhGaK5fcRlwZPPUCtL1Gn1i3xA/59xN
	 zVL9DlhvD9mDrkLHrZn31kyTLTEt72Ze4xaknkyrMpO5vaLwf9rJiSKZuED2dtS4HR
	 bMGNk1o9ml6amOkO2n3GgEGUJCPR4UPkG1nvG44AUEoIm2Z+zrLTiMyXdInV2VTRVt
	 AnHZDiJkNta+A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Add chip ID for Exynos7870 SoC
Date: Tue, 04 Feb 2025 02:02:18 +0530
Message-Id: <20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANInoWcC/x3MQQqAIBBA0avIrBPMLKurRAvRqWajohCFePek5
 Vv8XyBjIsywsgIJb8oUfEPfMbCX8Sdycs0ghRyFFAPH5/Uh61kLbi+K5LidDqnMYuZeOWhdTHj
 Q8z+3vdYP3D/ueWMAAAA=
X-Change-ID: 20250203-exynos7870-chipid-c6f24a9a814d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614748; l=669;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=NeQcw5rrhoA9bA5UTKSw3syXrmeuhQwUW7S3N0b3KQU=;
 b=4fi2GlMBwPdxvLlv0ut4beRiUG8bQwm7b+MzOCl95ltxb58PjnrGf4Obu0Voao6rKyLMtzzPS
 myowzHHGdGtDd7V22l+Uek37yEL8AgeK9vMgDwGTDxH/1eVMpQdJyEl
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid compatible
      soc: samsung: exynos-chipid: add support for exynos7870

 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 drivers/soc/samsung/exynos-chipid.c                                 | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-chipid-c6f24a9a814d

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

