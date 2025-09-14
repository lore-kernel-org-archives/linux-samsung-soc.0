Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EF02E62C6
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 19:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757879446; cv=none; b=jqq6wprJLaJWhm66MHRXuwotwDoikJRtqdyDhnPxa5Wf2xetiUXV3QDuYQwksQS99iWTszZOof1fJlnxXG5+9WdYFTppummAr/3o8OfuOM8FYy7QOyf20uzubOaNrgWvptvWGPrj+QPhrka9m8fP3RvYoz5NErFAAIPyTxLTmI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757879446; c=relaxed/simple;
	bh=XlOCRdQpg4y/WfDOvcboU58+3w8eZWJ1gkNu4mFoDA4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RGmnxFIQVMFgwrCgW4wnmuepskNMo4pQ7+u7PsRxH8EgSHkJ55eikIWWmogS0jAOCJ2EQn7Hp2vHujZgZ954LNVJ75Dsra9I8wvfyUckiESOPHfl1oSnVcLqDnPgnyJtu+xU8MZVs9b4tuSjY5TtghusMTKwdFhRi6/q00TTE4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=K3wGXptB; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="K3wGXptB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757879442; x=1758138642;
	bh=XlOCRdQpg4y/WfDOvcboU58+3w8eZWJ1gkNu4mFoDA4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=K3wGXptBWtMzFp/UbUC16n1uVm1afU8VGDDs9saBSXUOU8T4L5Ixczr/8jLW2CWEZ
	 puzjxiww8Lr5EHULvC38QUZOERJ4DxPZlMwL/nMbaY/QYS/TWpRCMreDvl6FFF0iiw
	 3M3iqOXzmbWbfYTKm8b1gD5mwnpD6NBCuWo1wE6A/DC8JiJcaPPt14saxiWWw0SkmN
	 17i+f8KZwCsNV47yXulfQrUxoCpymBSZYfFgTC58zsX8qjLOrZUjrj0n/GdX4/x7EJ
	 Ny46TmlUL37WwUbEXBDAk30GoWTWG+xwadQ0Bzc00j0PyRz6P02Yd1MuwfoBbY27G0
	 YwcnjfDpp1ISw==
Date: Sun, 14 Sep 2025 19:50:38 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 2/2] soc: samsung: exynos-chipid: Add exynos9610 SoC support
Message-ID: <20250914-exynos9610-chipid-v1-2-ade99e09a23c@chimac.ro>
In-Reply-To: <20250914-exynos9610-chipid-v1-0-ade99e09a23c@chimac.ro>
References: <20250914-exynos9610-chipid-v1-0-ade99e09a23c@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 4c5e4e61f8d64a8418c7619da4b6ed8a851907ad
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Exynos9610's product ID is "0xE9610000". Add this ID to the IDs
table along with the name of the SoC.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exyn=
os-chipid.c
index c86f1058ceed7c40f89cf65cb7027382cae38829..a5ed1c105b8f5d08c7ea71515e0=
778ea17bec75f 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -62,6 +62,7 @@ static const struct exynos_soc_id {
 =09{ "EXYNOS7885", 0xE7885000 },
 =09{ "EXYNOS850", 0xE3830000 },
 =09{ "EXYNOS8895", 0xE8895000 },
+=09{ "EXYNOS9610", 0xE9610000 },
 =09{ "EXYNOS9810", 0xE9810000 },
 =09{ "EXYNOS990", 0xE9830000 },
 =09{ "EXYNOSAUTOV9", 0xAAA80000 },

--=20
2.47.3


