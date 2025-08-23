Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA271E9B3A
	for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Aug 2025 01:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755914110; cv=none; b=JbR3PG6W2SWl96/XPATzLUKPiNMOdNGdhYrtdBJLQe0841HHPJnZOo3Lbrtz1GUpRiJuz1HFf6p2gygVnTm7yG0JzSSSvjtaURP/6WF6eStmHnig9oXkPl6CPfkLIWHSlukpsvZ39EVOzMwadC5HqqZlTTs1lcCYYxACbsJm2/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755914110; c=relaxed/simple;
	bh=Oilq80xlpQKrMrP3dOuNaR+z1TjFVmKmhc+hfCqlbXc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=RqlPqcDFHTZUxzXEaBBI9lYl5GGhxZcVgxmlhooVAJhwpzyeskv8vK+7SmzohIy2v6tlXkvrWhurCIxOPnBjEH4co9npMWM5VIVXEez2twXnWNbKTNCp+7tY9MGJi/7Spo9D9h+pOm5/QzO+ok+TuGcyyHnvRuz5bIdoN38Yq/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uc7Egc9k; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uc7Egc9k"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250823015505epoutp02dd87f509f8055883b93cfc3d4e170196~eQpNXqbHy0384603846epoutp02L
	for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Aug 2025 01:55:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250823015505epoutp02dd87f509f8055883b93cfc3d4e170196~eQpNXqbHy0384603846epoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755914105;
	bh=asCGKjBvcLIXcXUvTDB/pRmft2VEgqJkRU+ozd+V3kw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=uc7Egc9knMcegX8j9Ul8mLWHa6t1jfGt6qQY2GMWWC/IRukYxrJk0iO9lvX26z0X7
	 d2yWSk23ksCEUfCloabZ9I/u0ESTMG9ld+hUsO50JW2D5rV+7ceQy1InglVFew1i6L
	 hTp3o5jIkBoIs2K8XljStzZIPU2NFdcHVoz9Sx0o=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250823015503epcas5p4f37cf633ec897cf5cab6117f191d17a5~eQpLZM0vF1982919829epcas5p4q;
	Sat, 23 Aug 2025 01:55:03 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.86]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c80Vt1xfPz6B9m6; Sat, 23 Aug
	2025 01:55:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250823015501epcas5p2edc67128fded208772b700d6b811c948~eQpJfftO53272832728epcas5p2D;
	Sat, 23 Aug 2025 01:55:01 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250823015457epsmtip1ec063c01134a62dda47169229eba2da7~eQpFx0Y6c0879208792epsmtip17;
	Sat, 23 Aug 2025 01:54:57 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <s.hauer@pengutronix.de>,
	<shawnguo@kernel.org>, <cw00.choi@samsung.com>, <rmfrfs@gmail.com>,
	<laurent.pinchart@ideasonboard.com>, <martink@posteo.de>,
	<mchehab@kernel.org>, <linux-fsd@tesla.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <pankaj.dubey@samsung.com>,
	<shradha.t@samsung.com>, <ravi.patel@samsung.com>
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@puri.sm>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <67199625-13d2-4510-bbbd-3dd2f61c62fd@kernel.org>
Subject: RE: [PATCH v2 10/12] dt-bindings: media: fsd: Document CSIS DMA
 controller
Date: Sat, 23 Aug 2025 07:24:55 +0530
Message-ID: <00d301dc13d0$efb4ef90$cf1eceb0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQIMxZSZAiExi2YBbREwJ7KHhpcw
Content-Language: en-in
X-CMS-MailID: 20250823015501epcas5p2edc67128fded208772b700d6b811c948
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141051epcas5p14dccee388087372973988aeebcb872cf
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141051epcas5p14dccee388087372973988aeebcb872cf@epcas5p1.samsung.com>
	<20250814140943.22531-11-inbaraj.e@samsung.com>
	<67199625-13d2-4510-bbbd-3dd2f61c62fd@kernel.org>

Hi Krzysztof,

Thanks for the review.

> 
> On 14/08/2025 16:09, Inbaraj E wrote:
> > Document bindings for the FSD CSIS DMA controller.
> >
> > Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> > ---
> >  .../bindings/media/tesla,fsd-csis-media.yaml  | 74
> > +++++++++++++++++++
> 
> Your patchset is organized in total mess. First clock, then media bindings,
> then arm64,  then media drivers, then media bindings, then arm64... Please
> organize it in standard way - about independent subsystems I mentioned, so
> within media first bindings, then driver. Not intermixed.

I'll update in next patchset.

> 
> 
> 
> >  1 file changed, 74 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
> > b/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
> > new file mode 100644
> > index 000000000000..ce6c2e58ed4e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/tesla,fsd-csis-
> media.yam
> > +++ l
> > @@ -0,0 +1,74 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://protect2.fireeye.com/v1/url?k=21cb70d9-4129ed84-21cafb96-
> 000b
> > +abd9f1ba-63c99c5193b8964e&q=1&e=f7087d49-8d33-4468-9323-
> 67fa9fa72e40&
> >
> +u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fmedia%2Ftesla%2Cfsd-
> csis-me
> > +dia.yaml%23
> > +$schema:
> > +https://protect2.fireeye.com/v1/url?k=4db8909d-2d5a0dc0-4db91bd2-
> 000b
> > +abd9f1ba-be3588ecc45596c1&q=1&e=f7087d49-8d33-4468-9323-
> 67fa9fa72e40&
> > +u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
> > +
> > +title: Tesla FSD SoC MIPI CSI-2 DMA (Bridge device) receiver
> > +
> > +maintainers:
> > +  - Inbaraj E <inbaraj.e@samsung.com>
> > +
> > +description: |-
> 
> Drop |-
> 
> > +  The FSD MIPI CSI-2 (Camera Serial Interface 2) have internal DMA
> > + engine to  capture frames originating from the sensor.
> > +
> > +properties:
> > +  compatible:
> > +    const: tesla,fsd-csis-media
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: pclk
> > +      - const: pll
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> 
> Don't you need second port to CSIS block?

No, one port is sufficient.
This port represent CSIS DMA and connected to CSIS (imx-mipi-csis node)

 I guess this one is input from the
> sensor?

No, it is input from CSIS(imx-mipi-csis).

Regards,
Inbaraj E

