Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DC31C54BF;
	Fri, 28 Feb 2025 19:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740772067; cv=none; b=YH7965E8DIRrX6U/DMsN+linxKsFJx67Zb6Nzvx04sYJxTw/h0gGrk1oNrBgTyDcmrVud5ypnyV0qFKAX9yOVfVU9xymyaouTtk/SQr9759EbfoADmAuPeVDkks+L8VNkeCizxYz92DjJ1Mq051WGB0KRK3a2gPbvthEsFDGgpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740772067; c=relaxed/simple;
	bh=dU9rKZWKprX6jBcDruiShwDQmUw8LNa+ul4pwkRanVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=inVSqKlp63/FksEgUkFqkVWO+k+bSHU+nD0oT82L9WwQynOInOrCMuzcOt9QHR2iJP83tvrZvYfrpIP0dU7VZTIwaFNyxQ+i8Z5/QQF6I9q0Tc00qRNfpl2PXKtR4z5Pssw86oQ1AM4FD+RIGjKrA7zPLX9xDwWq803/BK2edj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=B+EO3oCz; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="B+EO3oCz"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0D30E2529F;
	Fri, 28 Feb 2025 20:47:45 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ln3qjrOqJsV5; Fri, 28 Feb 2025 20:47:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740772064; bh=dU9rKZWKprX6jBcDruiShwDQmUw8LNa+ul4pwkRanVQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=B+EO3oCzi15xaiYhQcftMK0yRx0uS213axZpSCoUMztLQBgixmIBWz+qLFshy1KUu
	 XhJirD0JXBbPxeaoV7x+WS8b7Rz2go5LTXq3H93XIeZVB5duyRgIybr9NO4MiHkFFO
	 Q4putn6CQHRrfhFNCmu0DW/Pg0V2hBO0jzncprxMzIHq9kW3qIX3ypH13+Egeb75Y3
	 t8TVtg2QL7zPfEPUQ4EehSmAWF4Fei7V3wlR2VijRXOehPTssxeYfej3L+JAop56g0
	 iiqqGCN1FYvh13bnFVKS959sndmoHTqPrzUpFCjb8do1vjtC0N2n5p4BymlHHQ3LAi
	 GRhsGPQhlEt7A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 01 Mar 2025 01:16:51 +0530
Subject: [PATCH v4 3/7] soc: samsung: exynos-chipid: add support for
 exynos7870
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-exynos7870-v4-3-2925537f9b2a@disroot.org>
References: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
In-Reply-To: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740772038; l=804;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=dU9rKZWKprX6jBcDruiShwDQmUw8LNa+ul4pwkRanVQ=;
 b=texv3HfBqBwnfn8wOyz+zB/PtOL+oe445aSou8XN3LcXoqGyR/V4ktIG7b369GDcCpvJ7zgf0
 iBBFL038AI/A9/lZ8wtOCXMZ+e5WWPIyTff1ryKB+OarmhcZhYPgWXq
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add the product ID of Exynos7870 (S5E7870) to the existing list.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 3f1a654c7e665bcccf6d1b779d2a6b90c8ec5625..345216fd3059ceac56de7b9ed401b5b42bba7ac7 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -55,6 +55,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS5440", 0xE5440000 },
 	{ "EXYNOS5800", 0xE5422000 },
 	{ "EXYNOS7420", 0xE7420000 },
+	{ "EXYNOS7870", 0xE7870000 },
 	/* Compatible with: samsung,exynos850-chipid */
 	{ "EXYNOS2200", 0xE9925000 },
 	{ "EXYNOS7885", 0xE7885000 },

-- 
2.48.1

