Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663EB20E302;
	Mon,  3 Feb 2025 20:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614776; cv=none; b=Wk9zwlS/4v47qe+RyENVU2iwxNEkeZGKZvuz1IgP3P5ydhdaCcWBKtAvIL5Ou84Q8JCWafAqGKyoFINZN7EAyQxHelJm9WQ1nsgof92N7CFt6UGYbGyaUz9LDRDcYZ0s16SCNgOHQTGreRsYTofOWurp8Rh3/EbZtZibXSoMalA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614776; c=relaxed/simple;
	bh=NudPmupCZnC9mmHSDb+mQPgPttYtv9oaHlFss2VQSE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NkcnlbklebWxxOcNTS/VIN2ycVGheD0HsNkxJNkkAxIoCcPFd4YvOQg4e8QXB3uPuNT993VsswKPIaIdHr8L0ox1fNbw28x6Etjx2KSVLm2pGAWPbjtLU5ivnuADyBn0r1+tdaseXM3izShadCUv+AM0BEyDMkvWqJWULSvLyJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=QWDeDRds; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="QWDeDRds"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D3423259FE;
	Mon,  3 Feb 2025 21:32:53 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1vY3mYxwqqr; Mon,  3 Feb 2025 21:32:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614766; bh=NudPmupCZnC9mmHSDb+mQPgPttYtv9oaHlFss2VQSE0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QWDeDRdsAfPyknkRd21EprJX+ifussKj0bTCt9dUrx7AZjLjHmoh6WD33Ma7Is3ry
	 dDleT6oqZYZT7tEp8xrK5aEPy16YssFZg2ijGrNNCgoJvUcDMS+ceWJW0irI4lRuen
	 nWJbZ0ez9IeelPn3vt0MAPScp6mfPlnXVXV8xWzDTvOopV5hhUIIqSyqMDDyyAW+cn
	 lBZeVWM0GIR1WcjLfC45MGwpOPASZJEaJx1GShAh3UJ8oTxfWtdGinoJb6eAtR1FPZ
	 zEud4jvUmtH0VFVYKJdLehYxyFH/H2RYF8C6zxo/dmvh+nNdFNafTXMZvUyeyecN07
	 jFy5A9V14NFMw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:02:20 +0530
Subject: [PATCH 2/2] soc: samsung: exynos-chipid: add support for
 exynos7870
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-chipid-v1-2-0bf2db08e621@disroot.org>
References: <20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org>
In-Reply-To: <20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614748; l=803;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=NudPmupCZnC9mmHSDb+mQPgPttYtv9oaHlFss2VQSE0=;
 b=GPlzXth4lETRLGNpEqUWPwr5IT8WZqANFiLVMpjAkqvHEVayusoAxcyx3iNO3AKa/0vu3OWas
 Z3NAjcWoJuLB8GH4mTNazCWZljHWKlkjdQyNSBD1DA3bPiJV9v5GiJj
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add the product ID of Exynos7870 (S5E7870) to the existing list.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index e37dde1fb588ec61d4e6b7cfe156161a62e035af..db0529fe13ae8e2ff96f055562c0a70e1ef74cb7 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -55,6 +55,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS5440", 0xE5440000 },
 	{ "EXYNOS5800", 0xE5422000 },
 	{ "EXYNOS7420", 0xE7420000 },
+	{ "EXYNOS7870", 0xE7870000 },
 	/* Compatible with: samsung,exynos850-chipid */
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },

-- 
2.48.1

