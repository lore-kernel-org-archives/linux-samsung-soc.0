Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34F3C8300F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 21:09:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C64422201
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 21:09:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729335AbgLBVI7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Dec 2020 16:08:59 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:37102 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728577AbgLBVI7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Dec 2020 16:08:59 -0500
Date:   Wed, 02 Dec 2020 21:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1606943256;
        bh=UxIXfy7yzIBGClJfjrUrEr/6UyV7CvCqxVp+zAnt65M=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=qLxOcyoQZShYEjyxbA+afDIuabHe7L6ZkX/FofFwQLVs0ibhNENVOKDaFwBtSlVnz
         9huSz7IY8P7spm/PTs2BuLPOKirs16NdbQ9Tb5CDqYhc+0y53lR2Z+F8RavPJnSsT8
         kSkQqyPZ5aXLSF81EP7umQD5pVsjmnRXTMG7D07g=
To:     Sebastian Reichel <sre@kernel.org>
From:   Timon Baetz <timon.baetz@protonmail.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Timon Baetz <timon.baetz@protonmail.com>
Reply-To: Timon Baetz <timon.baetz@protonmail.com>
Subject: [PATCH 3/3] ARM: dts: exynos: Fix charging regulator voltage and current for i9100
Message-ID: <20201202203516.43053-3-timon.baetz@protonmail.com>
In-Reply-To: <20201202203516.43053-1-timon.baetz@protonmail.com>
References: <20201202203516.43053-1-timon.baetz@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Set CHARGER current and CHARGER_CV voltage according to Galaxy S2 kernel
fork.

Signed-off-by: Timon Baetz <timon.baetz@protonmail.com>
---
 arch/arm/boot/dts/exynos4210-i9100.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-i9100.dts b/arch/arm/boot/dts/exy=
nos4210-i9100.dts
index 9f8d927e0d21..2700d53ea01b 100644
--- a/arch/arm/boot/dts/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/exynos4210-i9100.dts
@@ -558,14 +558,14 @@ safe2_sreg: ESAFEOUT2 {
=20
 =09=09=09charger_reg: CHARGER {
 =09=09=09=09regulator-name =3D "CHARGER";
-=09=09=09=09regulator-min-microamp =3D <60000>;
-=09=09=09=09regulator-max-microamp =3D <2580000>;
+=09=09=09=09regulator-min-microamp =3D <200000>;
+=09=09=09=09regulator-max-microamp =3D <950000>;
 =09=09=09};
=20
 =09=09=09chargercv_reg: CHARGER_CV {
 =09=09=09=09regulator-name =3D "CHARGER_CV";
-=09=09=09=09regulator-min-microvolt =3D <3800000>;
-=09=09=09=09regulator-max-microvolt =3D <4100000>;
+=09=09=09=09regulator-min-microvolt =3D <4200000>;
+=09=09=09=09regulator-max-microvolt =3D <4200000>;
 =09=09=09=09regulator-always-on;
 =09=09=09};
 =09=09};
--=20
2.25.1


