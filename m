Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD37226FA77;
	Tue, 18 Feb 2025 19:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905443; cv=none; b=e4ar2wROaoaq3tNhP+LvisGBSu0JpkMJed0wUYgSx2ZCVyxhE2kcCrNWsT0mKyY3LupfP3jwtEs86Oq+ui+Ukh0gylWKUofksdwxU/AjJ/RxoAa8ghrzD1NeqO/2avNOHMuYfIHm4l5hejCs8NbC+dpI8FalYFt/Z/wm7Mi1A08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905443; c=relaxed/simple;
	bh=gRa4BGEIswwEsGXvPWhdz3Z3M6ubWO9JJBcgXyWQLWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gCoaNW1wPvFw81eux3LC0+KOcMumiJo665MPxjUeSneaosR6I7dbO57TFjTa2nRK97cWPCKxuzkltNaLRUFIt/MoAT5dTMEvJN0I1AsBH18za8sQNk5L8UYLlfkpL9lSvhV0YELoYfZA6nSyjovSvZVISmXd8ys029XurCELkrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=WLxBCxAo; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="WLxBCxAo"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 42CFE25D64;
	Tue, 18 Feb 2025 20:04:00 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gTCgDbQS4Qo; Tue, 18 Feb 2025 20:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739905436; bh=gRa4BGEIswwEsGXvPWhdz3Z3M6ubWO9JJBcgXyWQLWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WLxBCxAoQV0OPtz8bw0dySYBDsiEFQ0WFUH0qS27DDO5BIkXWqAujA5/5X9c7ZeG3
	 1OIrnDKegMKOENWI9eCRsI4XW8cujyHqg2L/GLYvrzMCioS/NSicil2XG79tQbrBEo
	 aFhGa6vxUPsU32A503ejQfOVQlCnSVdv0m2X8ox4BlwJHJ92G7JuHgM/Vjiq91YIgt
	 j0+aBwEcuxQKyxzR+I4GJE2piTxs7U4+rkcdu4Zv1KVO+14lUXFOb7E+vW1d5t31br
	 BLNO7u+Iv91l0hzsQqn6tRBEdI70oGOSmarO4ABEVfVtWivQhgchZZmz9M0it7FB7i
	 eaHq1ssxViOBQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:33:13 +0530
Subject: [PATCH v3 3/7] soc: samsung: exynos-chipid: add support for
 exynos7870
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-v3-3-e384fb610cad@disroot.org>
References: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
In-Reply-To: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739905418; l=803;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=gRa4BGEIswwEsGXvPWhdz3Z3M6ubWO9JJBcgXyWQLWc=;
 b=XOHjxr0b49Dt1Rd3h/NsPWA1sn23LwExP5oocNbm6XcjieQeR4TSs1j6oB6UBEHgUR21emrRq
 DRXJsBt0t0kDhQLrAUy1CnOfpcOWHhNNj99NpcDeKR27KQWMzPjp/XK
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add the product ID of Exynos7870 (S5E7870) to the existing list.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 95294462ff21130951bd3c940d979af182423789..fd9aeacd01a8ad016156729659178ea1b9b0c56a 100644
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

