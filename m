Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849E72550AD
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Aug 2025 12:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754571228; cv=none; b=m7mgyVazCCLNUBmXFt8G0hHWW4E/ExobghQ+5dgM6QW+1EUNJGFYa1ssDxYBHIiB6WDX+iSrSF4pMcH4BW9j7Ce0KwwZblRkg4dqMQ703CCCYhS2hMIjEZcRX33/6/jbmROIS8wV7Xr4k9WVgcGy85R2v+O7A295BfsoTACQan4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754571228; c=relaxed/simple;
	bh=vDeXb/wWTLJc+GArcSXI4AvbdX5CK+i8acNbQ3jBGQ8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=SDLD47+BXDiMtElP88H8q3ucfND7dTeNCwRGtamcaOzCXbhvhbgDxhJTS2gPxI8epCEeFg+k9CkIuccVGH0vP22WSEGxn5BPkFrmk6QxXYaJ9Q2QIABgi6FYJ2d0+KL55nqpk3dEgG2ezrApVUgKSg5m5tFERBHnjbYkz8FSN50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=E9pOdQfq; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="E9pOdQfq"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250807125343epoutp019eb9f3fb49d6b0ec8210fec47353f880~ZfTtFFsTI2334523345epoutp01Z
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Aug 2025 12:53:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250807125343epoutp019eb9f3fb49d6b0ec8210fec47353f880~ZfTtFFsTI2334523345epoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754571223;
	bh=Y9yyMjJ6Z+ujgBsWuyrsPhhrjWzJPw1UoObDzyEPgL4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=E9pOdQfq4Qa2TdxuASOp5se5gRtcVeNTzuHVeusffcLZYFYKZ35xpBKe+dkW8KY4b
	 gCleL7e6RdpthnFxPvyOLofetQwtL6bb/zX8TGGa3qNXHMJQVw5N4lNZys1ePsuVQG
	 QweD9NdVskdjUHUsAw0OVN8eQdUVW4FQsWRlRYiA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250807125342epcas5p4cdf059b042ae879c14d7be75965eb1e8~ZfTsXP8_y2236622366epcas5p4G;
	Thu,  7 Aug 2025 12:53:42 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4byRtF4R8Cz2SSKX; Thu,  7 Aug
	2025 12:53:41 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250807122107epcas5p3978bf8e0b47f7d228a5c54d5bfe0a243~Ze3PYb-jU2564125641epcas5p3K;
	Thu,  7 Aug 2025 12:21:07 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250807122103epsmtip110f44008e2ef1b2699b700ad35390c96~Ze3MRHzto2980529805epsmtip1D;
	Thu,  7 Aug 2025 12:21:03 +0000 (GMT)
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
In-Reply-To: <20250806234217.GA2030512-robh@kernel.org>
Subject: RE: [PATCH v5 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Thu, 7 Aug 2025 17:51:02 +0530
Message-ID: <000001dc0795$c0432660$40c97320$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ+ZgWj3OwstM5ZbwFL0KmcSzrOlQJdB2aaAjkoxRUCiVKxNbLZYP5A
Content-Language: en-in
X-CMS-MailID: 20250807122107epcas5p3978bf8e0b47f7d228a5c54d5bfe0a243
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250805114306epcas5p37782c02ae0ddc6b77094786c90af247a
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
	<CGME20250805114306epcas5p37782c02ae0ddc6b77094786c90af247a@epcas5p3.samsung.com>
	<20250805115216.3798121-2-pritam.sutar@samsung.com>
	<20250806234217.GA2030512-robh@kernel.org>

Hi Rob, 

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: 07 August 2025 05:12 AM
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
> Subject: Re: [PATCH v5 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
> ExynosAutov920 HS phy compatible
> 
> On Tue, Aug 05, 2025 at 05:22:11PM +0530, Pritam Manohar Sutar wrote:
> > This SoC has USB2.0 phy and supports only UTMI+ interface. This phy
> > requires two clocks, named as "phy" and "ref". The required supplies
> > for this phy are vdd075_usb20(0.75v), vdd18_usb20(1.8v),
> vdd33_usb20(3.3v).
> >
> > Add a dedicated compatible string for USB HS phy found in this SoC.
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
> > index e906403208c0..1932a2272ef9 100644
> > --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-
> phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-
> phy.yaml
> > @@ -34,6 +34,7 @@ properties:
> >        - samsung,exynos7870-usbdrd-phy
> >        - samsung,exynos850-usbdrd-phy
> >        - samsung,exynos990-usbdrd-phy
> > +      - samsung,exynosautov920-usbdrd-phy
> >
> >    clocks:
> >      minItems: 1
> > @@ -110,6 +111,12 @@ properties:
> >    vddh-usbdp-supply:
> >      description: VDDh power supply for the USB DP phy.
> >
> > +  dvdd075-usb20-supply:
> > +    description: 0.75V power supply for the USB 2.0 phy.
> > +
> > +  vdd18-usb20-supply:
> > +    description: 1.8V power supply for the USB 2.0 phy.
> > +
> >  required:
> >    - compatible
> >    - clocks
> > @@ -219,6 +226,7 @@ allOf:
> >                - samsung,exynos7870-usbdrd-phy
> >                - samsung,exynos850-usbdrd-phy
> >                - samsung,exynos990-usbdrd-phy
> > +              - samsung,exynosautov920-usbdrd-phy
> >      then:
> >        properties:
> >          clocks:
> > @@ -235,6 +243,17 @@ allOf:
> >
> >          reg-names:
> >            maxItems: 1
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - samsung,exynosautov920-usbdrd-phy
> > +    then:
> > +      required:
> > +        - dvdd075-usb20-supply
> > +        - vdd18-usb20-supply
> > +        - vdd33-usb20-supply
> 
> Presumably the existing devices don't have these new supplies, so:
> 
> else:
>   properties:
>     dvdd075-usb20-supply: false
>     vdd18-usb20-supply: false

Appreciated for the suggestion. Will add this change in next version (v6) of
the patch-set. 
Snippet will look as mentioned below.

+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-usbdrd-phy
+    then:
+      required:
+        - dvdd075-usb20-supply
+        - vdd18-usb20-supply
+        - vdd33-usb20-supply
+
+    else:
+      properties:
+        dvdd075-usb20-supply: false
+        vdd18-usb20-supply: false

Thank you.

Regards,
Pritam

