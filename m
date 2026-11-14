Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794638680;
	b=Pfzc8N2OfSWyAZpPGJpRzsLi/cWJWQJSEYX9nFJBRe0pglc2QkiF9UCQtT7dJ5o8cUfK
	 L2gIRbHjcaSdP7iDCJ+RvU7SUFfTbB35eKILYGGQEaSPar5EKaG5hwcYkNQkhQdh2WzB/
	 zC1KH+ePdIgHnNI4E86LEs2LrEmyMmD2n32s7WcOSppIKfgMlEa4Sctc8S7HmLYeEyUNT
	 qVg5dco+nW4DwmS3HHd4e8Xd0130gqBSWQYrQlPtuPS1Dq+iTHTt/RCzqwnPFvQljMRrF
	 0fL4aofkw/tt+eiEiZAIIPTViXt1mh/PPCjkI09oFe2gBMTd9v7QnHDzgbTwnQmgDnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794638680;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZpIIK3dqxKsFZUnNSQhKVfovtKH1SOLlQ24EdB4Z7pw=;
	b=vl+3hNYHr/BYTx+MDHiOMsB/yYf/8bc7PCu4zCIlhtUNumTRPz6ubSBiEElTWk03oc+T
	 hVKJ4OaKtsm5ROj0sNgHANGoMlpSOLKDelKOzc8boY7oBmT9GjJHqXakaGo5E6DwXD6/I
	 Ok4BxQT4S2BdmsySNi9UpEtQS1sNYjKm/00s+42JrLDDc1R3FQMTXQ1Odebzvmug+7kIh
	 xWmbRNuDrgqYFcnQgx81OB1qfyRWZiQvBHG9fl5drF7hgI/GU6XNEwvJTZ1thUerSlB9H
	 qfOmT7lUqSXLTTrG1JTZqjwjUSPsaDKmSJZOgc0n0OoN9CS0KkxA4BYoCxAxzhJAEJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=yS6dwJEU;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AC8606A327;
	Sat, 14 Nov 2026 06:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61AC8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=yS6dwJEU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794638677; x=1794897877;
	bh=ZpIIK3dqxKsFZUnNSQhKVfovtKH1SOLlQ24EdB4Z7pw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=yS6dwJEUnYBic0svj0PG82ZGSOpm/4MnUh5DLYoDnroUVgjOHcNFE1hA1ffxsE/Pi
	 qTub8YWh7t0NVDVU2Lt9WnZci2oBPbvX3H/KuPnS2OSxLL0/BloiGRDtNkx93HgvLq
	 1uK/287WZrNakicQttKOEamInSUG5tYLqBhh5TSjZetASO4ulJ2BdrHF+7kcu22d9U
	 708eK6hQFMQI9PtqjuWR1YSrrnL5ocEa7BWU1/hqT0l80gtr7iBagItuB102EbLRvp
	 PWvcpsYyt1fJuL9lQr8J2/BJvce62QYRyfeBQkyuH7ZEgE5iz4gXtLyhpkChflC6Uk
	 uiaT4/XEATDEw==
Date: Sat, 14 Nov 2026 06:44:33 +0000
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
From: Soheyb Boulaa <soheyb_boulaa@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Soheyb Boulaa <soheyb_boulaa@proton.me>, Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH v3 2/3] phy: exynos5-usbdrd: return the Exynos2200 high-speed phy init error
Message-ID: <20261114064400.45572-3-soheyb_boulaa@proton.me>
In-Reply-To: <20261114064400.45572-1-soheyb_boulaa@proton.me>
References: <20261114064400.45572-1-soheyb_boulaa@proton.me>
Feedback-ID: 140697376:user:proton
X-Pm-Message-ID: edf1f5acecabee915d33b18b7ffcd701489f56d5
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

exynos2200_usbdrd_utmi_init() ignores the result of phy_init() on the
high-speed phy and returns 0. When the high-speed phy fails to
initialize, the UTMI phy thus counts as initialized, and the controller
goes on with a high-speed phy that is not set up.

Return the result of phy_init(), so that a failed init of the
high-speed phy fails the init of the UTMI phy. The next patch, which
exits the high-speed phy with the UTMI phy, relies on it: an exit after
a failed init would otherwise take the init count of the high-speed
phy below zero.

Fixes: cc52a697f87e ("phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm co=
ntroller")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/sashiko-outbox-205724@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Soheyb Boulaa <soheyb_boulaa@proton.me>
---
v3: full name in From and Signed-off-by.
v2: new patch, after Sashiko's review of v1.

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung=
/phy-exynos5-usbdrd.c
index a6fe779..cf0597a 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1369,9 +1369,7 @@ static const struct phy_ops exynos7870_usbdrd_phy_ops=
 =3D {
 static int exynos2200_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 {
 =09/* Configure non-Samsung IP PHY, responsible for UTMI */
-=09phy_init(phy_drd->hs_phy);
-
-=09return 0;
+=09return phy_init(phy_drd->hs_phy);
 }
=20
 static void exynos2200_usbdrd_link_init(struct exynos5_usbdrd_phy *phy_drd=
)
--=20
2.56.0


