Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0E627AC57
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Sep 2025 11:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196195; cv=none; b=NoZRC/mW4y1hIwQMZLr/YC4pqHwfdCFrN3vk67R9zQnd8B66C0upaOK5e7S1L684jlrw/UZNkGf8FbCyNAAUq1oQMCjN93IM0RWA1CPrtPnZMLN5EPAw+AOh2UOj1hF/KS/6tkThmdXpM05hoWB/MZN9etHa/CfPVB5VJW/hRCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196195; c=relaxed/simple;
	bh=+gk5KKF36ujB7nycJnCCTzw/u4iBDBaYYBO8dxVw9JE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=rkhXIlXDDKEu9ZekG2c3LKIZKYo7QlkxcweR8zoeN3heE++HP3nUS8bkoN0wQsnlFYKcnQorsXMNxi/IqAk03HkybKXP2ZP+GQn20lxbn5KNktgMpsaih9PbwCe9YPROPGBpc+3q/7PVWmrcKplffkPfa87lsNPVAwZtJ7//Qd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TGWkFV+v; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TGWkFV+v"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250918114950epoutp017a30a8ae51020de8ab88ab70080e3bbf~mXh674ekt2919129191epoutp01O
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Sep 2025 11:49:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250918114950epoutp017a30a8ae51020de8ab88ab70080e3bbf~mXh674ekt2919129191epoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758196190;
	bh=FuCxKZOC5gMCxjvUIfysdvbKbIwAjaMklqaPwT6Cdlc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=TGWkFV+vyXk3M6D6IuqlvEcybwVaHrnNnW9UTGangKu78Dxid6hGC6Jp6+GP/8M4/
	 K07WT+sAL/a7T+T93OpNKuIMJJCdbO2Vd0njOwz4MQ3Hb+pRUh8J12oYOcOwokCEJ2
	 +M5oqwcj6WkE/+sf8JWveeiB8lg96xueIVHg6boM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250918114949epcas5p4219721d84eadeb39ff7750e82a05c84f~mXh6Ld_2n0579905799epcas5p4a;
	Thu, 18 Sep 2025 11:49:49 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cSDT863xpz6B9m9; Thu, 18 Sep
	2025 11:49:48 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250918114947epcas5p1851912aadf4466cda635681b1a9fa798~mXh4OkerZ1378713787epcas5p1m;
	Thu, 18 Sep 2025 11:49:47 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918114943epsmtip210861e859c25dd4fcf3ce0fb14a9bf45~mXh0dCmTB3083330833epsmtip2O;
	Thu, 18 Sep 2025 11:49:43 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <67c2b5c6-7559-4ae9-b2af-e839b6b8f4d5@kernel.org>
Subject: RE: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Thu, 18 Sep 2025 17:19:41 +0530
Message-ID: <007701dc2892$553aded0$ffb09c70$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgGabj6EAmTXuDcB8lF0oAGjtHpaA19Hw4UBhGAZeAGHPhyts76/S3A=
Content-Language: en-in
X-CMS-MailID: 20250918114947epcas5p1851912aadf4466cda635681b1a9fa798
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e@epcas5p4.samsung.com>
	<20250903073827.3015662-2-pritam.sutar@samsung.com>
	<20250904-interesting-lovely-ringtail-38bbef@kuoka>
	<000001dc1d70$aebf7d80$0c3e7880$@samsung.com>
	<87857202-b436-4476-9384-67566126d844@kernel.org>
	<001001dc1d85$c0d56a60$42803f20$@samsung.com>
	<67c2b5c6-7559-4ae9-b2af-e839b6b8f4d5@kernel.org>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 18 September 2025 08:13 AM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; kauschluss=40disr=
oot.org;
> ivo.ivanov.ivanov1=40gmail.com; igor.belwon=40mentallysanemainliners.org;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 HS phy compatible
>=20
> On 04/09/2025 19:21, Pritam Manohar Sutar wrote:
> > Hi Krzysztof,
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: 04 September 2025 03:12 PM
> >> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> >> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com=
;
> >> andre.draszik=40linaro.org; peter.griffin=40linaro.org;
> >> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> >> igor.belwon=40mentallysanemainliners.org;
> >> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> >> phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> >> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> >> linux-samsung- soc=40vger.kernel.org; rosa.pila=40samsung.com;
> >> dev.tailor=40samsung.com; faraz.ata=40samsung.com;
> >> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> >> Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy=
:
> >> add
> >> ExynosAutov920 HS phy compatible
> >>
> >> On 04/09/2025 09:51, Pritam Manohar Sutar wrote:
> >>> Hi Krzysztof,
> >>>
> >>>> -----Original Message-----
> >>>> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >>>> Sent: 04 September 2025 12:18 PM
> >>>> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >>>> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> >>>> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.c=
om;
> >>>> andre.draszik=40linaro.org; peter.griffin=40linaro.org;
> >>>> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> >>>> igor.belwon=40mentallysanemainliners.org;
> >>>> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> >>>> phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> >>>> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> >>>> linux-samsung- soc=40vger.kernel.org; rosa.pila=40samsung.com;
> >>>> dev.tailor=40samsung.com; faraz.ata=40samsung.com;
> >>>> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> >>>> Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-p=
hy:
> >>>> add
> >>>> ExynosAutov920 HS phy compatible
> >>>>
> >>>> On Wed, Sep 03, 2025 at 01:08:22PM +0530, Pritam Manohar Sutar wrote=
:
> >>>>> Document support for the USB20 phy found on the ExynosAutov920 SoC.
> >>>>> The
> >>>>> USB20 phy is functionally identical to that on the Exynos850 SoC,
> >>>>> so no driver changes are needed to support this phy. However, add
> >>>>> a dedicated compatible string for USB20 phy found in this SoC.
> >>>>>
> >>>>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >>>>
> >>>> You just dropped all tags without explaining why.
> >>>
> >>> Regretted inconvenience.
> >>>
> >>> There were significant changes in supplies' names in driver and
> >>> schemas (patch-set v8). This led to make changes in patch no 5.  And
> >>> review for these changes is needed.  Hence, removed RB tag in this pa=
tch-
> set.
> >>>
> >>> There was a ask for the same https://lore.kernel.org/linux-
> >>
> phy/000401dc18cd=24ec02a1b0=24c407e510=24=40samsung.com/=23:=7E:text=3DLe=
t%20me%
> >>
> 20know%2C%20because%20of%20above%20changes%2C%20should%20be%20
> >>
> removing%20your%20%0A%27reviewed%2Dby%27%20tag%20from%20patch%
> >> 201%20and%203.
> >>>
> >>
> >>
> >> Where in the changelog you explained why you dropped the tags?
> >
> > Along with supplies' names, there were similar commit messages for
> > patch no 1, 3 as patch no 5 (v7). (though, they were explaining schema
> > more than h/w). Changed commit messages of the patch no 1, 3, 5 (v7)
> > as per reference commits and would like to get them reviewed again, so
> > did not add RB for patch 1 and 3, which you had given RB (in v7).
>=20
> I do not have time to review the same second time and I find such request=
 quite
> a waste of my time. It's v8 so I am surprised to see it getting changed e=
ven after
> review.=09
>=20

OK, those were only commit message changes, so I am going to retain your=20
RB tags for patch 1 and 3. Sorry about noise.

However, do you want me to send v9 by retaining RB tags in respective patch=
es?

>=20
> Best regards,
> Krzysztof

Thank you,

Regards,
Pritam

