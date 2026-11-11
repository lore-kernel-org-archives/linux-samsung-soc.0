Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367436;
	b=UAKQJW48gPqEiDClksHsxt7zNPsTokyUQ8kGjAwTFLEOA5b0RuTcI/E+w1xL/MkuLlWM
	 N5OPMqx6VilC3TwIkv8xxNxP71t+IEKyBsQdU7sxreEE/QtkrMubalmu7dFkO9L2pR09d
	 S+bLz7kbFWTtQ188Sua+L/ER6e8/ICFqkTNTKKtFH+HPTHEwNsmox6qYsQRy4yeIC86NG
	 63O/g5exmm1kOnaT4CSlxuI86CoNnDqeIBe2vuCGnSmBPWcnkw6t3V0IJfnwo3fNdiAR/
	 ycKEBnE33Vf4FOrok0pQKiyCMian6DOn2aZ3bjr/L7UxxTeYoaEI1d27EvEd4iNRMww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367436;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=kuGszS9Lfrf5RfF4V1hI8Xte0k/ziHqDGXb0U45lOag=;
	b=eRKh60/0294zdA57kDGdAjC77bC5oYPc2qow79KnRo5f3rCrqZ3JC24aqNvTSgZzsJik
	 RhKLMMT35YoAs1dAlXVoizpjbappatRQHzxe38Bl2+R0QiwKK8TOemrqV22QpFm0vyF4F
	 libeQBpyYXGyKpL644e2o1cfET7Aw9Ys6wr5qAm35bka0GCST5sO7gjR1FPKNq33dJN5L
	 W3RnBe0kqc3fdnAlmJRQmB3zvulm9INKbI2ulP5agYUkB/9mZ/2lwViwca0qSgPr5ZSLT
	 LoOu9RTSgPstMMpoEe3J3HQLNerxIMb8roeyHM2geFEfp3wH7Jt0xVLLyXpCQbhULQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=NFsfLl7a;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B4D606A31C;
	Wed, 11 Nov 2026 03:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21B4D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=NFsfLl7a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794367431; x=1794626631;
	bh=kuGszS9Lfrf5RfF4V1hI8Xte0k/ziHqDGXb0U45lOag=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NFsfLl7aVQ4cR5Ieenrw4HvqnfXE158VrpFlHlYih5YhoMb83sjl+FckAyRAStgT7
	 vTaYE9doV4ckhIEa/vzNT5cDyOVTEyYfjNh+Vhg3We1PHtu/1NrWUq5o8FxnP1jDnN
	 K1uxjQUkKj1QwgGOidw5dmczWjWMa/i/cIQCXmdwNu5TWa8tiMykFv1mpAlkDzTZip
	 kX2vEUYcGIJ13BKXx6LSNwbAcIC+7NbLyCgv70LkUS33ACafCs44pPTjFIUO1qSo6e
	 oHsfCI8xVZza5h3rg3nYVxONKh4uCL8lW4d9QRUWaY+2PNWM/cdwpJVv2fsxz/gnl+
	 Y/73vkj4l/ghg==
Date: Wed, 11 Nov 2026 03:23:48 +0000
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
From: Soheyb <soheyb_boulaa@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Soheyb <soheyb_boulaa@proton.me>, Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH v2 2/3] phy: exynos5-usbdrd: return the Exynos2200 high-speed phy init error
Message-ID: <20261111032309.3365794-3-soheyb_boulaa@proton.me>
In-Reply-To: <20261111032309.3365794-1-soheyb_boulaa@proton.me>
References: <20261111032309.3365794-1-soheyb_boulaa@proton.me>
Feedback-ID: 140697376:user:proton
X-Pm-Message-ID: d855c3b8805661db49d988325c6216cccc83caf4
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
Signed-off-by: Soheyb <soheyb_boulaa@proton.me>
---
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


