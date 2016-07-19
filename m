From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: Odroid U2 Kernel 4.7rc7+ Hang on reboot
Date: Tue, 19 Jul 2016 13:29:44 +0200
Message-ID: <578E0F28.6010600@samsung.com>
References: <1468525055.4843.4.camel@ndufresne.ca>
 <1468525558.4843.6.camel@ndufresne.ca>
 <5787EF8E.2010401@math.uni-bielefeld.de>
 <1468528408.4843.9.camel@ndufresne.ca> <578896DB.7060708@samsung.com>
 <5788CA67.5090200@samsung.com> <5788E1EB.4030003@math.uni-bielefeld.de>
 <5788E31D.6010606@samsung.com> <5788E3CB.5080103@math.uni-bielefeld.de>
 <5788E457.6060202@samsung.com> <5788F449.6060202@math.uni-bielefeld.de>
 <1468598213.3819.2.camel@ndufresne.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:48732 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752965AbcGSL3s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jul 2016 07:29:48 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OAK0027I7XLWWA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2016 12:29:45 +0100 (BST)
In-reply-to: <1468598213.3819.2.camel@ndufresne.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: nicolas@ndufresne.ca, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>

On 07/15/2016 05:56 PM, Nicolas Dufresne wrote:
> Le vendredi 15 juillet 2016 =C3=A0 16:33 +0200, Tobias Jakobi a =C3=A9=
crit :
>> I can confirm that this indeed doesn't work.
>>
>> chidori ~ # echo 1 > /proc/sys/kernel/sysrq
>> chidori ~ # echo s > /proc/sysrq-trigger
>> chidori ~ # echo u > /proc/sysrq-trigger
>> chidori ~ # echo b > /proc/sysrq-trigger
>> <board hangs, only red power LED on>
>>
>> I guess Nicolas is seeing a different or another problem here though=
=2E
>=20
> Well for me both method hangs. On an extra note, reset inside Uboot
> works, but reboot in Linux hang. I tried adding a trace
> in syscon_restart_handle(), but the trace is never displayed. I'm
> wondering if that handler is ever called, or if it's just that the
> serial console was shut down already.
>=20
> Any idea what else should I trace ?

This is weird... reboot should work. Just to confirm it - can you test
following patch in both scenarios (this should fix both of them... at
least on Odroid U3 but your board might have different SPL/BL1):

-- >8 --
diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 58ad48e7b8f7..7d963d36e96d 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -423,7 +423,8 @@

                        buck2_reg: BUCK2 {
                                regulator-name =3D "vdd_arm";
-                               regulator-min-microvolt =3D <900000>;
+                               //regulator-min-microvolt =3D <900000>;
+                               regulator-min-microvolt =3D <1000000>;
                                regulator-max-microvolt =3D <1350000>;
                                regulator-always-on;
                                regulator-boot-on;
