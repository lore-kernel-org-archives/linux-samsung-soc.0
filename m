Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C38434EEFC
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763548952; cv=none; b=IiRkvvNZHZ3h9tomsY01rh75jJq2cmt0Qg4s5bm3hFoQqaPA6pU6y/In/3vPoPVPDmCgKTelqujlrco3Lfff0cS8tQ76ouNztB6FVOqQpH3thHo2f20/4BbxUoEDo8R2NtWkNDi/GEhn9cMh4JiLLI/OCr/jrfO0m12VsqRR0bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763548952; c=relaxed/simple;
	bh=tPH5sVCs6QMOtimQOjeT/OtXIujo29L9jjA9xeA0rns=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=ge6+S/cyDwrthyvrOYI3O3rDGuArrqAktkZoE/FdqqUIC33Ln+3vUHg2jCZtf+TS/PAJ0VDw/Rg86u/viRLB3u4ZSkCD6cX1zbXoQQYgjjOhOuKKwN30+2PI4EpHd1FK2u1U8kB6NBLZeCWldwhFZfyXHXCy5lSpQ5kLBvmJVTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=haNrnOiQ; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="haNrnOiQ"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251119104221epoutp037ff0edd23ee3a5bf0914d61d54a8d0a1~5Ymsob3gA2913129131epoutp03f
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 10:42:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251119104221epoutp037ff0edd23ee3a5bf0914d61d54a8d0a1~5Ymsob3gA2913129131epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763548941;
	bh=edyiLhffrjDmxouTCAPrQxXoyB9PDyfuoY79KoaDp90=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=haNrnOiQ4V7Fr5ZIoiGyFT6KoXHIU3/RWJQZVRgpiUXsCMqLyOsy24JoEttFRA8t1
	 /awzIs/i1dLTGzNe9F+tloxuWB1ERjODzDCYfQdUQmAqKKXpoBolFfjPSTXFJO9zdC
	 PG3ZkPRTann91Dzyw4A5GMXmIGtawKlBU6dHq4gQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251119104220epcas5p3068401481bc669cf58b26a3d81c03fd7~5YmsJEg3J0088800888epcas5p30;
	Wed, 19 Nov 2025 10:42:20 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dBJ2g6jWhz6B9m6; Wed, 19 Nov
	2025 10:42:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251119104219epcas5p1af08ada3ad3862babfee44db4e7e0a63~5YmqqMOCJ2752127521epcas5p1C;
	Wed, 19 Nov 2025 10:42:19 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251119104212epsmtip180710ee8b1ab478ebd52dab3cadc90c3~5Ymkats650041000410epsmtip1J;
	Wed, 19 Nov 2025 10:42:12 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <johan@kernel.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: 
Subject: RE: [PATCH v9 0/6] initial usbdrd phy support for Exynosautov920
 soc
Date: Wed, 19 Nov 2025 16:12:00 +0530
Message-ID: <071301dc5941$2dc39150$894ab3f0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF7oV+n5BMArQ7/Kr7NJhFkLim/CAId6djPtYFw0bCAKN5YoA==
Content-Language: en-in
X-CMS-MailID: 20251119104219epcas5p1af08ada3ad3862babfee44db4e7e0a63
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251010070037epcas5p312b0463a6a757e9b0c03aed6adc48595
References: <CGME20251010070037epcas5p312b0463a6a757e9b0c03aed6adc48595@epcas5p3.samsung.com>
	<20251010070912.3758334-1-pritam.sutar@samsung.com> 

Hi,=20

Gentle reminder.

> -----Original Message-----
> From: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Sent: 24 October 2025 04:09 PM
> To: 'vkoul=40kernel.org' <vkoul=40kernel.org>; 'kishon=40kernel.org'
> <kishon=40kernel.org>; 'robh=40kernel.org' <robh=40kernel.org>;
> 'krzk+dt=40kernel.org' <krzk+dt=40kernel.org>; 'conor+dt=40kernel.org'
> <conor+dt=40kernel.org>; 'alim.akhtar=40samsung.com'
> <alim.akhtar=40samsung.com>; 'andre.draszik=40linaro.org'
> <andre.draszik=40linaro.org>; 'peter.griffin=40linaro.org'
> <peter.griffin=40linaro.org>; 'kauschluss=40disroot.org' <kauschluss=40di=
sroot.org>;
> 'johan=40kernel.org' <johan=40kernel.org>; 'ivo.ivanov.ivanov1=40gmail.co=
m'
> <ivo.ivanov.ivanov1=40gmail.com>; 'm.szyprowski=40samsung.com'
> <m.szyprowski=40samsung.com>; 's.nawrocki=40samsung.com'
> <s.nawrocki=40samsung.com>
> Cc: 'linux-phy=40lists.infradead.org' <linux-phy=40lists.infradead.org>;
> 'devicetree=40vger.kernel.org' <devicetree=40vger.kernel.org>; 'linux-
> kernel=40vger.kernel.org' <linux-kernel=40vger.kernel.org>; 'linux-arm-
> kernel=40lists.infradead.org' <linux-arm-kernel=40lists.infradead.org>; '=
linux-
> samsung-soc=40vger.kernel.org' <linux-samsung-soc=40vger.kernel.org>;
> 'rosa.pila=40samsung.com' <rosa.pila=40samsung.com>;
> 'dev.tailor=40samsung.com' <dev.tailor=40samsung.com>;
> 'faraz.ata=40samsung.com' <faraz.ata=40samsung.com>;
> 'muhammed.ali=40samsung.com' <muhammed.ali=40samsung.com>;
> 'selvarasu.g=40samsung.com' <selvarasu.g=40samsung.com>
> Subject: RE: =5BPATCH v9 0/6=5D initial usbdrd phy support for Exynosauto=
v920 soc
>=20
> Hi Vinod,
>=20
> Gentle reminder. Can you please take this to your tree and let me know if=
 any
> comments?
>=20
> > -----Original Message-----
> > From: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > Sent: 10 October 2025 12:39 PM
> > To: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> > krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> > andre.draszik=40linaro.org; peter.griffin=40linaro.org;
> > kauschluss=40disroot.org; johan=40kernel.org;
> > ivo.ivanov.ivanov1=40gmail.com; m.szyprowski=40samsung.com;
> > s.nawrocki=40samsung.com; pritam.sutar=40samsung.com
> > Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linu=
x-
> > kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> > linux-samsung- soc=40vger.kernel.org; rosa.pila=40samsung.com;
> > dev.tailor=40samsung.com; faraz.ata=40samsung.com;
> > muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> > Subject: =5BPATCH v9 0/6=5D initial usbdrd phy support for Exynosautov9=
20
> > soc
> >
> > This SoC has a single USB 3.1 DRD combo phy and three USB2.0 only DRD
> > phy controllers as mentined below
> >
> >   * Combo phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
> >     compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is added
> >     to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rate=
s.
> >     These two phys are combined to form a combo phy as mentioned below.
> >
> >
> >    USB30DRD_0 port
> >
> >  +------------------------------------------------------------+
> >  =7C                                                            =7C
> >  =7C                (combo) USB phy controller                  =7C
> >  =7C      +----------------------------------------------+      =7C
> >  =7C      =7C                  USB HSPHY                   =7C      =7C
> >  =7C      =7C  (samsung,exynosautov920-usbdrd-combo-hsphy) =7C      =7C
> >  =7C      +----------------------------------------------+      =7C
> >  =7C                                                            =7C
> >  =7C    +--------------------------------------------------+    =7C
> >  =7C    =7C                   USB SSPHY                      =7C    =7C
> >  =7C    =7C   (samsung,exynosautov920-usb31drd-combo-ssphy)  =7C    =7C
> >  =7C    +--------------------------------------------------+-   =7C
> >  =7C                                                            =7C
> >  +------------------------------------------------------------+
> >  =7C                                                            =7C
> >  =7C                     USBDRD30 Link                          =7C
> >  =7C                       Controller                           =7C
> >  +------------------------------------------------------------+
> >
> >   * USB2.0 phy supports only UTMI+ interface. USB2.0DRD phy
> >     is very similar to the existing Exynos850 support in this driver.
> >
> >     USB20DRD_0/1/2 ports
> >
> >       +---------------------------------------------------+
> >       =7C                                                   =7C
> >       =7C                USB PHY controller                 =7C
> >       =7C    +-----------------------------------------+    =7C
> >       =7C    =7C              USB HSPHY                  =7C    =7C
> >       =7C    =7C  (samsung,exynosautov920-usbdrd-phy)    =7C    =7C
> >       =7C    +-----------------------------------------+    =7C
> >       =7C                                                   =7C
> >       +---------------------------------------------------+
> >       =7C                                                   =7C
> >       =7C             USBDRD20_* Link                       =7C
> >       =7C                Controller                         =7C
> >       =7C                                                   =7C
> >       +---------------------------------------------------+
> >
> > The =22USB20 phy output isolation=22 is shared across the USB20 phys.
> > We have to bypass isolation when any one of the USBs is configured and
> > enable it when all are turned off. The =22USB31 phy isolation=22
> > is seperate for USB31 phy.
> >
> > This patchset only supports device mode and same is verified with as
> > NCM device
> >
> > changelog
> > ----------
> > Changes in v9:
> > - added RB tags those were given in v7 =5B1=5D and v8.
> > - updated commit message in patch no.1 by adding supplies'
> >   names those are taken from phy User Manual =5B2=5D
> >   link for v8:
> > https://lore.kernel.org/linux-phy/20250903073827.3015662-1-
> > pritam.sutar=40samsung.com/
> > =5B1=5D: https://lore.kernel.org/linux-phy/20250824-mustang-of-glorious=
-
> > sufficiency-b55bf4=40kuoka/
> > =5B2=5D: https://lore.kernel.org/linux-phy/02ef5180-ad56-45f0-a56f-
> > 87f442bf6793=40kernel.org/
> >
> > Changes in v8:
> > - modified supplies' names in schema and driver.
> > - Since supplies' names are changed, modified patch no 5. to
> >   fix warnings in dtbs_check dt_binding_check.
> > - updated commit message for patch no. 1, 3 and 5 to describe
> >   hardware details.
> >   link for v7:
> > https://lore.kernel.org/linux-phy/20250822093845.1179395-1-
> > pritam.sutar=40samsung.com/
> >
> > Changes in v7:
> > - added fixes for driver build warnings
> >   link for v6:
> > https://lore.kernel.org/linux-phy/20250821073703.2498302-1-
> > pritam.sutar=40samsung.com/
> >
> > Changes in v6:
> > - added else part for new supplies in schemas those are only
> >   supported for exynosautov920.
> > - addressed comments for driver given in v5.
> >   link for v5:
> > https://lore.kernel.org/linux-phy/20250805115216.3798121-1-
> > pritam.sutar=40samsung.com/
> >
> > Changes in v5:
> >
> > - addressed comments from v4 patchset.
> >   - patch (1/6)
> >     - DTS style is corrected and added required supplies in code/schema=
.
> >     - schema block added to resolve below failure during 'dtbs_check'.
> >       Unevaluated properties are not allowed ('dvdd075-usb-supply',
> > 'vdd18- usb20-supply', 'vdd33-usb20-supply' were unexpected.
> >   - patch (2/6)
> >     - removed usage_counter(take this later in subsequent patch-sets)
> >   - patch (3/6)
> >     - There are 3 types of the phys in this SoC.
> >       - one is simmilar with exynos850 as mentioned in patch no.1.
> >       - second supports only USB3.1 SSP+ and denoted in patch no 5
> >       - third supports only USB2.0 HS as in patch3.
> >     - hs phy in combo phy is =22NOT=22 same as phy. (in patch no. 1)
> >     - These three phys(usbdrd-phy, combo-hsphy, combo-ssphy) are totall=
y
> >       deferent, =22NOT=22 same, hence added three compatible for three =
phys.
> >   - patch (5/6)
> >     - Since there are two phys in combo phy, explaination is given
> >       in each patch.
> >   link for v4:
> > https://lore.kernel.org/linux-phy/20250701120706.2219355-1-
> > pritam.sutar=40samsung.com/
> >
> > Changes in v4:
> > - addressed comments from v3 patchset
> >   - removed dts related patches, to be posted in new patchset.
> >   - added regulator, pmu and power sequences.
> >   - phy isol is shared across USBs, added usage counter to bypass or
> >     enable phy isolation.
> >   - modified schemas with hs and combo phy compatible names
> >     (used =22combo=22 to denote combo phy) and regulators
> > - modified code to work with binding and unbinding devices/drivers
> > - added =22Reviewed-by=22 tag.
> >   link for v3:
> > https://lore.kernel.org/linux-phy/20250613055613.866909-1-
> > pritam.sutar=40samsung.com/
> >
> > Changes in v3:
> > - Updated dt-bindings for USB2.0 only.
> > - Added dt-bindings for combo phy.
> > - Added implementation for combo phy (SS and HS phy).
> > - Added added DTS nodes for all the phys
> >   link for v2:
> > https://lore.kernel.org/linux-phy/20250516102650.2144487-1-
> > pritam.sutar=40samsung.com/
> >
> > Changes in v2:
> > - Used standard GENMASK() and FIELD_GET() to get the major version
> >   from controller version register.
> >   link for v1:
> > https://lore.kernel.org/linux-phy/20250514134813.380807-1-
> > pritam.sutar=40samsung.com/
> >
> > Pritam Manohar Sutar (6):
> >   dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 HS phy
> >     compatible
> >   phy: exynos5-usbdrd: support HS phy for ExynosAutov920
> >   dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo hsph=
y
> >   phy: exynos5-usbdrd: support HS combo phy for ExynosAutov920
> >   dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo ssph=
y
> >   phy: exynos5-usbdrd: support SS combo phy for ExynosAutov920
> >
> >  .../bindings/phy/samsung,usb3-drd-phy.yaml    =7C  48 ++
> >  drivers/phy/samsung/phy-exynos5-usbdrd.c      =7C 651 ++++++++++++++++=
++
> >  include/linux/soc/samsung/exynos-regs-pmu.h   =7C   3 +
> >  3 files changed, 702 insertions(+)
> >
> > --
> > 2.34.1
>=20
> Thank you,
>=20
> Regards,
> Pritam

Thank you.

Regards,
Pritam

