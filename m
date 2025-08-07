Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2237254848
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Aug 2025 12:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754571251; cv=none; b=q04nMr/tf7OnXSuMhldQLES6kmw7Hhfk+Omx3lkqpyoozc8Xd3iwjCkoxyie8Rr07dlsewfWxWwp8HTZT+kezUsOsijpg0r1erq+lf3FoyAc6wiI0wY6JGXegT8ys9tjNfoAA9uVGUvndL06bPjrI+0rrpQRxKe1h6UblZXCPQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754571251; c=relaxed/simple;
	bh=LjldSkJQMPE8uHzTH3tzxcJpt8WEj+V3/bsFC4+mGW4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=dG1UBcQRWqas7wC9Aa7VwSGmQbF8jT2k3RjdOA2Uk0+oexR0Ys1UqtJN5MW/UL5rQQMi3hymC0P4agPFf3cdcFPcqpwM3O6KIng1/Mw2LY7OFLkEobGQl0aploxMllualz9FebFdqRE+oOmmJKLW8rdZGgxr/fGqlt1oe5zrBfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=riD+zuYP; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="riD+zuYP"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250807125408epoutp02601a59fadcaf82f577752f4cf6199589~ZfUELWJZM3098330983epoutp02C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Aug 2025 12:54:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250807125408epoutp02601a59fadcaf82f577752f4cf6199589~ZfUELWJZM3098330983epoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754571248;
	bh=I7mb2jIbUh0JiJnEyqZvPWnQq89a45lYPc+Vw9PnUkQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=riD+zuYPQ8FMAYHqyVWVoIVckw9fUxPWmsqyJwBu/tNFxfbZREjBb53BTrmH+zd7+
	 EYcYJGpUCHNTJwHb4vptQSPFciJ0cQNSHHwCLhm8xrUcoA8gizupYYN6K3niUNa2aU
	 8iL/ZXvA6Rg9huEgoHaxiUpuC8Lj0ufXAsbvvMQ8=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250807125407epcas5p35e4cd40e01599ed1499d270c002fba5e~ZfUDKUl9m0574505745epcas5p3v;
	Thu,  7 Aug 2025 12:54:07 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4byRtj5Pnyz6B9m4; Thu,  7 Aug
	2025 12:54:05 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250807123301epcas5p1a3fbda824228f6723950c0207141e282~ZfBoRl6Kc1848318483epcas5p1q;
	Thu,  7 Aug 2025 12:33:01 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250807123258epsmtip17d549f336ff5d3b7aad36c60d56f06ae~ZfBleqNA-0496104961epsmtip1Q;
	Thu,  7 Aug 2025 12:32:58 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Rob Herring'" <robh@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250806234309.GA2032999-robh@kernel.org>
Subject: RE: [PATCH v5 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Date: Thu, 7 Aug 2025 18:02:57 +0530
Message-ID: <000101dc0797$69cb0080$3d610180$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ+ZgWj3OwstM5ZbwFL0KmcSzrOlQD+pBMSAdNyF8MCWOIs27LpCJrA
Content-Language: en-in
X-CMS-MailID: 20250807123301epcas5p1a3fbda824228f6723950c0207141e282
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250805114320epcas5p3968288f8d01944d3d730b3094a7befe4
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
	<CGME20250805114320epcas5p3968288f8d01944d3d730b3094a7befe4@epcas5p3.samsung.com>
	<20250805115216.3798121-6-pritam.sutar@samsung.com>
	<20250806234309.GA2032999-robh@kernel.org>

Hi Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: 07 August 2025 05:13 AM
> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Cc: vkoul@kernel.org; kishon@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; alim.akhtar@samsung.com; andre.draszik@linaro.org;
> peter.griffin@linaro.org; kauschluss@disroot.org;
> ivo.ivanov.ivanov1@gmail.com; igor.belwon@mentallysanemainliners.org;
> m.szyprowski@samsung.com; s.nawrocki@samsung.com; linux-
> phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; rosa.pila@samsung.com;
> dev.tailor@samsung.com; faraz.ata@samsung.com;
> muhammed.ali@samsung.com; selvarasu.g@samsung.com
> Subject: Re: [PATCH v5 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
> ExynosAutov920 combo ssphy
> 
> On Tue, Aug 05, 2025 at 05:22:15PM +0530, Pritam Manohar Sutar wrote:
> > This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
> > compatible to the USB3.0 SS(5Gbps). It requires two clocks, named
> > "phy" and "ref". The required supplies for USB3.1 are named as
> > vdd075_usb30(0.75v), vdd18_usb30(1.8v).
> >
> > Add schemas for combo ssphy found on this SoC.
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> > ---
> >  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 19
> +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > index 4a84b5405cd2..7a71cff10fb5 100644
> > --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-
> phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-
> phy.yaml
> > @@ -34,6 +34,7 @@ properties:
> >        - samsung,exynos7870-usbdrd-phy
> >        - samsung,exynos850-usbdrd-phy
> >        - samsung,exynos990-usbdrd-phy
> > +      - samsung,exynosautov920-usb31drd-combo-ssphy
> >        - samsung,exynosautov920-usbdrd-combo-hsphy
> >        - samsung,exynosautov920-usbdrd-phy
> >
> > @@ -118,6 +119,12 @@ properties:
> >    vdd18-usb20-supply:
> >      description: 1.8V power supply for the USB 2.0 phy.
> >
> > +  dvdd075-usb30-supply:
> > +    description: 0.75V power supply for the USB 3.0 phy.
> > +
> > +  vdd18-usb30-supply:
> > +    description: 1.8V power supply for the USB 3.0 phy.
> > +
> >  required:
> >    - compatible
> >    - clocks
> > @@ -227,6 +234,7 @@ allOf:
> >                - samsung,exynos7870-usbdrd-phy
> >                - samsung,exynos850-usbdrd-phy
> >                - samsung,exynos990-usbdrd-phy
> > +              - samsung,exynosautov920-usb31drd-combo-ssphy
> >                - samsung,exynosautov920-usbdrd-combo-hsphy
> >                - samsung,exynosautov920-usbdrd-phy
> >      then:
> > @@ -258,6 +266,17 @@ allOf:
> >          - vdd18-usb20-supply
> >          - vdd33-usb20-supply
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - samsung,exynosautov920-usb31drd-combo-ssphy
> > +    then:
> > +      required:
> > +        - dvdd075-usb30-supply
> > +        - vdd18-usb30-supply
> 
> Similar issue here.

Will the suggested lines of the code in next version of the patch-set.
Snippet will look as below.

+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-usb31drd-combo-ssphy
+    then:
+      required:
+        - dvdd075-usb30-supply
+        - vdd18-usb30-supply
+
+    else:
+      properties:
+        dvdd075-usb30-supply: false
+        vdd18-usb30-supply: false

Thank you.

Regards,
Pritam

