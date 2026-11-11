Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367443;
	b=BpgB9PvtpVgeckBwmvl4pT3iluO/qNC/mB/TuDHckmXyLAOEhWdcoltgHQ2nX3WPJONZ
	 K9H6fAtf/fZc461ZDl/HJrHTaoBfRZs1SgDP9LSEbAGyIt/9qUuxkLQyyFemuwwYrU8RR
	 KM6EyvqGddMDqdX+rviSwgA/d++x9wND7YQcINHMsEu1xiFJgKXaX16PUv4mWhdQ97JMe
	 8dqXK3BdOLjzzvRLjElzwwnv/ccIENHb4L/OkvLqJddi7Ev6V4a7y4bSkI+I07MsrPd/7
	 sHipiVtW289LviiZzcvgHGSXRVUGyTvLZSJCXoKuir6/VgDiqYyiY/FF3YTL1dp5Jbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367443;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=0P2VV1oALOP/3gmFL87eTvjlTzFKQUaWGHBRZ3suqaQ=;
	b=23N6F/yFsw3lPIznXq95ghOvanSh6RQceiBlLZ4bwfjTdX6uvNUwN9z7D+Bhocy6jID+
	 86K8rpu1vzhnIEAQhf33T8B67BCVtGTWiFmkXdgjzIWxrMs+7HZSpJZ1dMd1im3amdqnI
	 C5/SxlaZ4i9scp4O/c9KPr6GtuKe5k0QCTpGhroi1z/8z6d3rwaSUDR9LAgkhg+0rx6bJ
	 iL5fBtYWDQ1o3XQFQZ3CVKoJrmmeM+MuvTTsYAf6bRaVzZsxPCEzumJVoG0ptzoI5VOED
	 iqZG2X2MQmpn7Qth+eo+skZJs9mj2It0dfdzg1GVX8hvAC4Haehj16ry5IFVe1u1qiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=sXl6Ca3B;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37357606A32A;
	Wed, 11 Nov 2026 03:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37357606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=sXl6Ca3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794367441; x=1794626641;
	bh=0P2VV1oALOP/3gmFL87eTvjlTzFKQUaWGHBRZ3suqaQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=sXl6Ca3BJ9dUwcv9XKERie1ur21D2I+R7/jLiIire0v4jz94N9xKkpmbV1b8lgJ1C
	 CXkNHxXQpSWaMck0+AnNTKXX2uJ9dNj93hmQbOKZOOctAOGpidmgKTcyy+NhArS2s+
	 l7WcDv/b7PkAqjKwj1edYX59Ut1IfAfA3VAvj4lyyTRdSjsgdVgojIcZEGTsrC7L0O
	 aordiuNL98xNSlPVdkfbxOkdxQfcxCA+2jXBtDZgTBaB4AG67UQYty23wcIphIpxhk
	 7ZnIJatD/KMBeeMyuRKiRmMP8QCTsOJ1vlmCO2D7SNFnslld8+Q2EWKBD4cGWwxgNL
	 wCVeTfhhELVeA==
Date: Wed, 11 Nov 2026 03:23:55 +0000
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
From: Soheyb <soheyb_boulaa@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Soheyb <soheyb_boulaa@proton.me>, stable@vger.kernel.org
Subject: [PATCH v2 3/3] phy: exynos5-usbdrd: fix HS phy init count imbalance on Exynos2200
Message-ID: <20261111032309.3365794-4-soheyb_boulaa@proton.me>
In-Reply-To: <20261111032309.3365794-1-soheyb_boulaa@proton.me>
References: <20261111032309.3365794-1-soheyb_boulaa@proton.me>
Feedback-ID: 140697376:user:proton
X-Pm-Message-ID: 5d696f9f01aced19a70b4608e0bcbfc155d0b32a
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

Exit the high-speed phy when the UTMI phy exits, last, once the rest of
the exit has succeeded: the phy core counts a failed exit as no exit,
so the high-speed phy has to stay initialized along with the UTMI phy.

Fixes: cc52a697f87e ("phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm co=
ntroller")
Cc: stable@vger.kernel.org
Signed-off-by: Soheyb <soheyb_boulaa@proton.me>
---
v2: the high-speed phy exits last, once the rest of the exit has
succeeded, after Sashiko's review of v1; v1 exited it first. The comment
is dropped, after Ivaylo's review of v1. His Acked-by of v1 is left
out, since the exit has moved.

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung=
/phy-exynos5-usbdrd.c
index cf0597a..041a555 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1510,8 +1510,15 @@ static int exynos2200_usbdrd_phy_exit(struct phy *ph=
y)
 =09clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
=20
 =09exynos5_usbdrd_phy_isol(inst, true);
-=09return regulator_bulk_disable(phy_drd->drv_data->n_regulators,
-=09=09=09=09      phy_drd->regulators);
+=09ret =3D regulator_bulk_disable(phy_drd->drv_data->n_regulators,
+=09=09=09=09     phy_drd->regulators);
+=09if (ret)
+=09=09return ret;
+
+=09if (inst->phy_cfg->id =3D=3D EXYNOS5_DRDPHY_UTMI)
+=09=09return phy_exit(phy_drd->hs_phy);
+
+=09return 0;
 }
=20
 static const struct phy_ops exynos2200_usbdrd_phy_ops =3D {
--=20
2.56.0


