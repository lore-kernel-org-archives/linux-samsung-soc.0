Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167D7C433C1
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 27 Mar 2021 20:10:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1460619B1
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 27 Mar 2021 20:10:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbhC0UJd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 27 Mar 2021 16:09:33 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:19273 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhC0UJJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 27 Mar 2021 16:09:09 -0400
Date:   Sat, 27 Mar 2021 20:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1616875747;
        bh=85GoW8qO8yhali/wL8Hzgwf0HB57PCsZmVrXXndAkHY=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=iBj9y6gdg4pKg6IcywkkEqnYFkfZYbaQl5Q89rmQNNXcyjk0O0L+/k5nO/jU3eJ6D
         P+Eww1EXPu7GiIpbgB7QnX5/soWdNjPafX5HLU7JqSwh4XBjR/JxiOgyALdjvVGSfO
         l7rWYlm8JBdad2tn9WLChSC4JaR07xVDy0wYxjKQ=
To:     Krzysztof Kozlowski <krzk@kernel.org>
From:   Timon Baetz <timon.baetz@protonmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Timon Baetz <timon.baetz@protonmail.com>
Reply-To: Timon Baetz <timon.baetz@protonmail.com>
Subject: [PATCH v2] ARM: dts: exynos: Add front camera support to I9100
Message-ID: <20210327200851.777327-1-timon.baetz@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add node for Samsung S5K5BAF CMOS image sensor and
enable the associated MIPI CSI-2 receiver node.

Signed-off-by: Timon Baetz <timon.baetz@protonmail.com>
---
v2: Rename node from s5k5bafx to image-sensor and use GPIO_ACTIVE_LOW

 arch/arm/boot/dts/exynos4210-i9100.dts | 52 ++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-i9100.dts b/arch/arm/boot/dts/exy=
nos4210-i9100.dts
index 228de6d8c9d1..f47b6eaf208f 100644
--- a/arch/arm/boot/dts/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/exynos4210-i9100.dts
@@ -147,6 +147,36 @@ battery@36 {
 =09=09};
 =09};

+=09i2c_s5k5baf: i2c-gpio-1 {
+=09=09compatible =3D "i2c-gpio";
+=09=09#address-cells =3D <1>;
+=09=09#size-cells =3D <0>;
+
+=09=09sda-gpios =3D <&gpc1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+=09=09scl-gpios =3D <&gpc1 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+=09=09i2c-gpio,delay-us =3D <2>;
+
+=09=09image-sensor@2d {
+=09=09=09compatible =3D "samsung,s5k5baf";
+=09=09=09reg =3D <0x2d>;
+=09=09=09vdda-supply =3D <&cam_io_en_reg>;
+=09=09=09vddreg-supply =3D <&vt_core_15v_reg>;
+=09=09=09vddio-supply =3D <&vtcam_reg>;
+=09=09=09clocks =3D <&camera 0>;
+=09=09=09clock-names =3D "mclk";
+=09=09=09stbyn-gpios =3D <&gpl2 0 GPIO_ACTIVE_LOW>;
+=09=09=09rstn-gpios =3D <&gpl2 1 GPIO_ACTIVE_LOW>;
+=09=09=09clock-frequency =3D <24000000>;
+
+=09=09=09port {
+=09=09=09=09s5k5bafx_ep: endpoint {
+=09=09=09=09=09remote-endpoint =3D <&csis1_ep>;
+=09=09=09=09=09data-lanes =3D <1>;
+=09=09=09=09};
+=09=09=09};
+=09=09};
+=09};
+
 =09spi-3 {
 =09=09compatible =3D "spi-gpio";
 =09=09#address-cells =3D <1>;
@@ -220,7 +250,11 @@ pmic_ap_clk: pmic-ap-clk {
 };

 &camera {
+=09pinctrl-0 =3D <&cam_port_a_clk_active>;
+=09pinctrl-names =3D "default";
 =09status =3D "okay";
+=09assigned-clocks =3D <&clock CLK_MOUT_CAM0>, <&clock CLK_MOUT_CAM1>;
+=09assigned-clock-parents =3D <&clock CLK_XUSBXTI>, <&clock CLK_XUSBXTI>;
 };

 &cpu0 {
@@ -794,3 +828,21 @@ &serial_3 {
 &tmu {
 =09status =3D "okay";
 };
+
+&csis_1 {
+=09status =3D "okay";
+=09vddcore-supply =3D <&vusb_reg>;
+=09vddio-supply =3D <&vmipi_reg>;
+=09clock-frequency =3D <160000000>;
+=09#address-cells =3D <1>;
+=09#size-cells =3D <0>;
+
+=09port@4 {
+=09=09reg =3D <4>;
+=09=09csis1_ep: endpoint {
+=09=09=09remote-endpoint =3D <&s5k5bafx_ep>;
+=09=09=09data-lanes =3D <1>;
+=09=09=09samsung,csis-hs-settle =3D <6>;
+=09=09};
+=09};
+};
--
2.25.1


