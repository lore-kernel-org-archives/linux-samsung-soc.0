Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262568;
	b=nrhoMNbItfKH13HF8EmTbpOJqxtR0DQHw1whGDlefbnKulDXFbna3dW0Kre6RPtUXUWk
	 8sxL8kj8hxQfv0B0ialRlwDcib6FzuFlv+Pb/Wq7aqzbweb8aqHPvmDWLtZavZCuV9AU5
	 /Xom9KZ2oHad5OVHWtFdlz6AEan1yeEHUkgyYyaVNMIzienulNXyaEMtX6TBx3Fwko6aq
	 bbaEdcCb6jdANN4oKOKeceQe5P7/pxyDPZRNdgVdpmhPWl5GsShHRc9cj9T2JX33vsoW+
	 0d4QaT8Pp/2Tg/POHMeFpAR3VJhcZMz3Llur+zwh/XoiHERB3btKw9T1qHQBHCAAemg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262568;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kE4syZx4j/5qX4L+2YVxHbOJsxFk3bQcYDZtlzgC2zA=;
	b=V8papV6Ol9Q//wHBPMkoDSh6+8B9918cXkur9IJT4vX4G0d3P37mrZEzq7L46GRC0WFn
	 AlVUNP8CAPYdUKPSlf4qlRkInJQCHd21Q79zjWCQUfOO7ryP+VyMBs1rehYPUX78ztyUF
	 cSr7fhzJMynn9DJp4P0MIM9+/iW3iajD4AYdEPX+1VJ47J3RqWyac2a2KBjmr2P0Cy8o8
	 CW9pI2D+V0hcV9qtQUJTtl9lTSDx2XMjecEKhQzSnTrOSM7y7jEVPrqdqWFrqZKFP5XlU
	 mEIY2oPKFC4QCKxoFQxiKp6QVDH6rd1WdASUBh8Fm2Zl1m3s2Pz5a7HNEna2v7AYKew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=nLWFZvSY;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD0F60A2608
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2026 22:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD0F60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=nLWFZvSY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794262565; x=1794521765;
	bh=kE4syZx4j/5qX4L+2YVxHbOJsxFk3bQcYDZtlzgC2zA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nLWFZvSYE9lR2C9K/r8k0MTD19qXnddoMFxZKLIOatwKpWURP0sLdOB38Pow89wpS
	 UA4tJjDcc+9FZBvm5oGkRwLPrL5Zlb0uWg1Snqp53csXFY8tHH9PxfGfWzBZSFINW6
	 YdPF9X2TsTcQbIjQB81Q81+4K+89p780GR0Vi9kA4BSHzhDWCrXTxnxo3BhNNdQHVP
	 3QSSMdAdM6ccd1CYfytwB+k3qROci7ZZMVDabBn+cf7Q5zje2xisB/VuW72oxLXwrV
	 ogz08D4DKyNxlC0GXxF2NJObnVdO+/aZmZsZlasJS/c10IpI7Gt7NQzq7qJUsq7AZr
	 a1aZPYQaobvUw==
Date: Mon, 09 Nov 2026 22:15:59 +0000
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
From: Soheyb <soheyb_boulaa@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Soheyb <soheyb_boulaa@proton.me>, stable@vger.kernel.org
Subject: [PATCH] phy: exynos5-usbdrd: fix HS phy init count imbalance on Exynos2200
Message-ID: <20261109221522.2796426-1-soheyb_boulaa@proton.me>
Feedback-ID: 140697376:user:proton
X-Pm-Message-ID: 5ec8a07a4fff850a81f2eff5aebc5744ac5da29e
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

exynos2200_usbdrd_utmi_init() calls phy_init() on the high-speed phy,
but exynos2200_usbdrd_phy_exit() never calls phy_exit() on it. The init
count of the high-speed phy therefore never drops back to zero: after
the first init, every later phy_init() of it returns early, and its
clocks and supplies stay enabled across an exit of the UTMI phy.

When the high-speed phy loses power while the controller is suspended,
it is thus not set up again on resume, and the DWC3 core soft reset
times out:

  dwc3 11210000.usb: DWC3 controller soft reset failed

Exit the high-speed phy when the UTMI phy exits, first, in the reverse
order of the init.

Fixes: cc52a697f87e ("phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm co=
ntroller")
Cc: stable@vger.kernel.org
Signed-off-by: Soheyb <soheyb_boulaa@proton.me>
---
Tested on a Google Pixel 9 (Tensor G4) with an out-of-tree port that
uses the Exynos2200 phy ops and powers the USB block off in system
sleep: without this change the soft reset failed on the first resume;
with it, USB came back after each of two system sleeps. Not tested on
Exynos2200 hardware.

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung=
/phy-exynos5-usbdrd.c
index 087d552..0bee928 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1486,6 +1486,13 @@ static int exynos2200_usbdrd_phy_exit(struct phy *ph=
y)
 =09u32 reg;
 =09int ret;
=20
+=09/*
+=09 * The UTMI init initializes the high-speed phy; exit it in turn, so
+=09 * that the next init sets it up again after it lost power.
+=09 */
+=09if (inst->phy_cfg->id =3D=3D EXYNOS5_DRDPHY_UTMI)
+=09=09phy_exit(phy_drd->hs_phy);
+
 =09ret =3D clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clk=
s);
 =09if (ret)
 =09=09return ret;
--=20
2.56.0


