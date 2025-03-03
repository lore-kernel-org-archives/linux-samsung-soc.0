Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347A6283C9C
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=160.75.25.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741109512; cv=fail; b=oG8EDwveSA5d4QbqFnvDjnaEzx8C/VvM9axF/umhwSmbjc9jXEy+1buLxDFBPsOSo7VqJqsh2qucTY3c4xCjA0Nj7GQNPqvTc3q/LzHx0WGy96X6uQqUvMrmt8NWIqbAOzfVu2fYPK3l5SNN9XoCf6pU1l1prHEVxNTBCn0EfQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741109512; c=relaxed/simple;
	bh=7wYFbAlzdadoiEVNDbiWOtlXTrasaU1w7A4OaUFOngQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=H8CU6G9pWs5iV97KhMlnOqUJggGc8MwGed852CKRTLxeIXMND0LxLQ9RivLhMAneNST29U6w7xfLd47SYSIViXxXlHUhfvbXc7+K2GKCt1aSw/uF/rzo6cqlGZOfmwoJlahzB3C/Yng0sTSz4regNOpAPCNbBwrAR9NQ7GYHsnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=fail (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAIT05GX reason="signature verification failed"; arc=none smtp.client-ip=10.30.226.201; arc=fail smtp.client-ip=160.75.25.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAIT05GX"
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 4A13040CFB8A
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 20:31:48 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jAIT05GX
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6hMh59hkzG436
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 19:43:44 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id ED09F42766; Tue,  4 Mar 2025 19:43:35 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAIT05GX
X-Envelope-From: <linux-kernel+bounces-541777-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAIT05GX
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id EC87341CAA
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:14:59 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw2.itu.edu.tr (Postfix) with SMTP id C2A272DCE0
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:14:59 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86C25188DD4B
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066CD212D6B;
	Mon,  3 Mar 2025 13:14:27 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6002B9AA;
	Mon,  3 Mar 2025 13:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007663; cv=none; b=IdOvCffhexAzcR0qqhxlASIpA6B3VkVZm2vJAKnGzBizkGCZ8G+ut81vjz6qt+JEeQm8OakfYIk2wgkm16kHEPHPYJf4T2wo1jr/qq4qjctnmp+IiQl8T0IB/Jt8L4h5whVijGI07UgZwKLeqXznIUBWka+hLENYejUyVMWTcEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007663; c=relaxed/simple;
	bh=G1uZpetOhbHY9bpzj+SkAW4l9OHZnpwWUgprbajQf+4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GezSRKV+CdCZyPlX+A5uzcd9+3cpb8TvPrK4nz2FqERc6CdFSQs1JtbZt60Hj62wCwLd7XZsYVluzrRYB7CEGs2KT/rz67r1cA37YLV9RLenPSKtTyywL0RrzGnnJy6lsS18A3+sF8j9PsozvukOLh7tBwhVmeyO3FIdkArS+fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAIT05GX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C876C4CED6;
	Mon,  3 Mar 2025 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741007662;
	bh=G1uZpetOhbHY9bpzj+SkAW4l9OHZnpwWUgprbajQf+4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jAIT05GXn7yxRhRLvLdFqbZwM88rIEzp9VkwLrCcLRGjM+RJsPJhHB9unwTNOhfXs
	 kAyzTLYIn2MbD86d34TTk+hzLP1LKaWVL5huvpQUBbNPxKWA8cTtYoULDt6oA0eKI9
	 xExWzr2DXx6ajZBNho2wyZxZrWEol3jLutehR2lghiZA975diAfjB8ll7wt/wcHsV7
	 RF/Z8A3L2Z2/4ATFrxuyDPY3xCq+IKq1LJXDzk0XKRffU5JwJZ+5wos15nu5bKLZkG
	 g4c/sGJqZ47An5cSxCunJFXQtLkJEilcoJ2FlO4jGQrCFJY/EFsi1A/ioU3HbGpYjl
	 yRKnFFRgbu5AQ==
Date: Mon, 03 Mar 2025 07:14:20 -0600
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Tony Luck <tony.luck@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-kernel@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-hardening@vger.kernel.org
To: Kaustabh Chakraborty <kauschluss@disroot.org>
In-Reply-To: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
References: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
Message-ID: <174100756283.1496281.12555971793250210333.robh@kernel.org>
Subject: Re: [PATCH v4 0/7] Add support for the Exynos7870 SoC, along with
 three devices
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6hMh59hkzG436
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741714188.72042@f6FHoUPvrCAfAVT8iC1P3Q
X-ITU-MailScanner-SpamCheck: not spam
Message-ID: <20250303131420.1DIWQzGBzVhv0uQZeDmITbUkFxpi8OZkzdZf07g1w2Q@z>


On Sat, 01 Mar 2025 01:16:48 +0530, Kaustabh Chakraborty wrote:
> Samsung Exynos 7870 (codename: Joshua) is an ARM-v8 system-on-chip that=
 was
> announced in 2016. The chipset was found in several popular mid-range t=
o
> low-end Samsung phones, released within 2016 to 2019.
>=20
> This patch series aims to add support for Exynos 7870, starting with th=
e
> most basic yet essential components such as CPU, GPU, clock controllers=
,
> PMIC, pin controllers, etc.
>=20
> Moreover, the series also adds support for three Exynos 7870 devices vi=
a
> devicetree. The devices are:
>  * Samsung Galaxy J7 Prime	- released 2016, codename on7xelte
>  * Samsung Galaxy J6		- released 2018, codename j6lte
>  * Samsung Galaxy A2 Core	- released 2019, codename a2corelte
>=20
> Additional features implemented in this series include:
>  * I2C	- touchscreen, IIO sensors, etc.
>  * UART	- bluetooth and serial debugging
>  * MMC	- eMMC, Wi-Fi SDIO, SDCard
>  * USB	- micro-USB 2.0 interface
>=20
> Build dependencies are in these sub-series:
>  * bootmode	  	- https://lore.kernel.org/all/20250204-exynos7870-bootmo=
de-v1-1-0f17b3033c2d@disroot.org/
>  * pmu-clocks		- https://lore.kernel.org/all/20250301-exynos7870-pmu-cl=
ocks-v4-0-0f3e73b10db7@disroot.org/
>=20
> Other related sub-series:
>  * gpu			R https://lore.kernel.org/all/20250204-exynos7870-gpu-v1-1-0db=
4c163a030@disroot.org/
>  * i2c	      		A https://lore.kernel.org/all/20250204-exynos7870-i2c-v1=
-0-63d67871ab7e@disroot.org/
>  * mmc			- https://lore.kernel.org/all/20250219-exynos7870-mmc-v2-0-b42=
55a3e39ed@disroot.org/
>  * pinctrl	  	- https://lore.kernel.org/all/20250301-exynos7870-pinctrl=
-v3-0-ba1da9d3cd2f@disroot.org/
>  * pmic-regulators	- https://lore.kernel.org/all/20250301-exynos7870-pm=
ic-regulators-v3-0-808d0b47a564@disroot.org/
>  * uart			R https://lore.kernel.org/all/20250219-exynos7870-uart-v2-1-c=
8c67f3a936c@disroot.org/
>  * usb			- https://lore.kernel.org/all/20250301-exynos7870-usb-v3-0-f01=
697165d19@disroot.org/
>  * usbphy		- https://lore.kernel.org/all/20250219-exynos7870-usbphy-v2-=
0-b8ba4e7a72e9@disroot.org/
> (Legend: [R]eviewed, [A]pplied)
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v4:
> - Drop merged [PATCH v3 1/7].
> - Explicitly mention sub-series having build dependencies.
> - Include the following patch from the pmu-clocks series:
>   - dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatibl=
e
> - Adjust clock header file name to match changes in pmu-clocks.
> - Change regulator node names to match changes in pmic-regulators.
> - Remove non-removable flag for the SDCard's mmc node.
> - Link to v3: https://lore.kernel.org/r/20250219-exynos7870-v3-0-e384fb=
610cad@disroot.org
>=20
> Changes in v3:
> - Added patches from https://lore.kernel.org/all/20250204-exynos7870-ch=
ipid-v1-0-0bf2db08e621@disroot.org/
> - Fix devicetree formatting according to the devicetree style guide.
> - Take over ownership of patches by the co-author, upon their request.
> - Link to v2: https://lore.kernel.org/r/20250204-exynos7870-v2-0-563131=
65ef0c@disroot.org
>=20
> Changes in v2:
> - Redo a few commit descriptions.
> - Split patchsets into multiple sub-series, subsystem-wise.
> - Link to v1: https://lore.kernel.org/r/20250203-exynos7870-v1-0-2b6df4=
76a3f0@disroot.org
>=20
> ---
> Kaustabh Chakraborty (7):
>       dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compati=
ble
>       dt-bindings: arm: samsung: add compatibles for exynos7870 devices
>       soc: samsung: exynos-chipid: add support for exynos7870
>       arm64: dts: exynos: add initial devicetree support for exynos7870
>       arm64: dts: exynos: add initial support for Samsung Galaxy J7 Pri=
me
>       arm64: dts: exynos: add initial support for Samsung Galaxy A2 Cor=
e
>       arm64: dts: exynos: add initial support for Samsung Galaxy J6
>=20
>  .../bindings/arm/samsung/samsung-boards.yaml       |    8 +
>  .../bindings/soc/samsung/exynos-pmu.yaml           |    1 +
>  arch/arm64/boot/dts/exynos/Makefile                |    3 +
>  .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  628 ++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  616 ++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  664 ++++++++++++=
+
>  arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1022 ++++++++++++=
++++++++
>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  714 ++++++++++++=
++
>  drivers/soc/samsung/exynos-chipid.c                |    1 +
>  9 files changed, 3657 insertions(+)
> ---
> base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
> change-id: 20250201-exynos7870-049587e4b7df
>=20
> Best regards,
> --
> Kaustabh Chakraborty <kauschluss@disroot.org>
>=20
>=20
>=20


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/exynos/=
' for 20250301-exynos7870-v4-0-2925537f9b2a@disroot.org:

In file included from arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts:=
10:
arch/arm64/boot/dts/exynos/exynos7870.dtsi:9:10: fatal error: dt-bindings=
/clock/samsung,exynos7870-cmu.h: No such file or directory
    9 | #include <dt-bindings/clock/samsung,exynos7870-cmu.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exyno=
s7870-on7xelte.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/exynos] Err=
or 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb' not =
remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1462: exynos/exyno=
s7870-on7xelte.dtb] Error 2
In file included from arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts=
:10:
arch/arm64/boot/dts/exynos/exynos7870.dtsi:9:10: fatal error: dt-bindings=
/clock/samsung,exynos7870-cmu.h: No such file or directory
    9 | #include <dt-bindings/clock/samsung,exynos7870-cmu.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exyno=
s7870-a2corelte.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/exynos] Err=
or 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb' not=
 remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1462: exynos/exyno=
s7870-a2corelte.dtb] Error 2
In file included from arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts:10:
arch/arm64/boot/dts/exynos/exynos7870.dtsi:9:10: fatal error: dt-bindings=
/clock/samsung,exynos7870-cmu.h: No such file or directory
    9 | #include <dt-bindings/clock/samsung,exynos7870-cmu.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exyno=
s7870-j6lte.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/exynos] Err=
or 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb' not rem=
ade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1462: exynos/exyno=
s7870-j6lte.dtb] Error 2
make: *** [Makefile:251: __sub-make] Error 2
make: Target 'exynos/exynos8895-dreamlte.dtb' not remade because of error=
s.
make: Target 'exynos/exynos850-e850-96.dtb' not remade because of errors.
make: Target 'exynos/exynos7870-on7xelte.dtb' not remade because of error=
s.
make: Target 'exynos/exynos7885-jackpotlte.dtb' not remade because of err=
ors.
make: Target 'exynos/exynos990-x1slte.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2.dtb' not remade because of errors.
make: Target 'exynos/exynos990-r8s.dtb' not remade because of errors.
make: Target 'exynos/exynos7-espresso.dtb' not remade because of errors.
make: Target 'exynos/google/gs101-oriole.dtb' not remade because of error=
s.
make: Target 'exynos/google/gs101-raven.dtb' not remade because of errors=
