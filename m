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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72DAC43333
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Dec 2020 13:44:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95C2723128
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Dec 2020 13:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgLWNoG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 23 Dec 2020 08:44:06 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:14049 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728754AbgLWNoC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Dec 2020 08:44:02 -0500
Date:   Wed, 23 Dec 2020 13:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608731000;
        bh=yKsd9EiB1lb1beK3a4KefGe56jveojVKszto/Y3gwDs=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Q/9YXEy9EDINUOv+dbnOKoddsN7HsgTnjwNbSyhaZNfziDZ2VsESEv7Pbfr7LyNN1
         IFMU+93ywHMG23huYnRuG73EFb161LK9Cv/xHSCTc7cXv+KRUlLYwjHy4RpAh61olr
         YTP/SsElMVQpoNlLc+YrTNTf1RU5KkqPGbciJri0=
To:     Krzysztof Kozlowski <krzk@kernel.org>
From:   Timon Baetz <timon.baetz@protonmail.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Timon Baetz <timon.baetz@protonmail.com>
Reply-To: Timon Baetz <timon.baetz@protonmail.com>
Subject: [PATCH v4 5/7] ARM: dts: exynos: Added muic and charger nodes for i9100
Message-ID: <20201223134221.804943-5-timon.baetz@protonmail.com>
In-Reply-To: <20201223134221.804943-1-timon.baetz@protonmail.com>
References: <20201223134221.804943-1-timon.baetz@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

muic node is only used for extcon consumers.
charger node is used to specify muic and regulator.

Signed-off-by: Timon Baetz <timon.baetz@protonmail.com>
---
 arch/arm/boot/dts/exynos4210-i9100.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-i9100.dts b/arch/arm/boot/dts/exy=
nos4210-i9100.dts
index 5370ee477186..8fa704babd5e 100644
--- a/arch/arm/boot/dts/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/exynos4210-i9100.dts
@@ -584,6 +584,16 @@ EN32KHZ_CP {
 =09=09=09=09regulator-always-on;
 =09=09=09};
 =09=09};
+
+=09=09muic: max8997-muic {
+=09=09=09compatible =3D "maxim,max8997-muic";
+=09=09};
+
+=09=09charger {
+=09=09=09compatible =3D "maxim,max8997-battery";
+=09=09=09charger-supply =3D <&charger_reg>;
+=09=09=09extcon =3D <&muic>;
+=09=09};
 =09};
 };
=20
--=20
2.25.1


