Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9A01F5847
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Sep 2025 01:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757468036; cv=none; b=P0cnY3nYKO4okhsQ2WEMU0KR9Oy6FMZWjowWst/F5n4AklZAlbYomh69fjpPmT0XkQHwQq7t9f7T2DUK69Y2/ETfFK5VzkQuHfimIQmOqnjNpptPXLHmEdZhfCs9+CBegtHfcY/xcoPf6i8FnRhABJ/K4ExHCF4T4LEwOIy3FCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757468036; c=relaxed/simple;
	bh=UE1dW2vjyCtvAjqcbpkaQjgaA6fRIygDccPoGm5LG1Q=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=O/9Ddj3oimwt8W18wVtnYr+5m920qvfl/htlC/k4hPsSy+hWfNDYdjeffNXbkka6tkTQBALJt+3eHxVy7eKf1HGqy7P5d2/fzpCiz5O2sqXP46C7mTe3OUZqa4mM4TI3/uXfFLMO4+iyIo0vpFBUJydc0vkCiAd4yPy9NRBy+zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jRGOMphx; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jRGOMphx"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250910013346epoutp02d86eaa6820d7d337f68524064891ce35~jx9vM758Y0421004210epoutp029
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Sep 2025 01:33:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250910013346epoutp02d86eaa6820d7d337f68524064891ce35~jx9vM758Y0421004210epoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757468026;
	bh=B/cQztE6JVsN29H2UCnnOkTaLkGI3st9SaYIAZ0Aj6I=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=jRGOMphxr9OlYaJEH6x1gYZyDvpOgTnngtS/3I3ljide5pEQgBPHPyvfPhpoecHxL
	 MIApyz7+jUfWexphehLhwg6aRsUOj3CAnGERFpgOk5n9bZnwnsZlDyxsipwQ5cWOc5
	 9MerGn9AbIJGYFCRZ9NMOm1pfNQ3IgfUSKGKrM48=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250910013345epcas2p1627ed06365bff0aaf2d6a0810b074777~jx9ui-Lrd2488624886epcas2p1h;
	Wed, 10 Sep 2025 01:33:45 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.70]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cM3B075H5z6B9mD; Wed, 10 Sep
	2025 01:33:44 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250910013344epcas2p265fefabdfed14e90b66cc856c559e561~jx9tOknPz1132511325epcas2p2b;
	Wed, 10 Sep 2025 01:33:44 +0000 (GMT)
Received: from KORCO115296 (unknown [12.36.150.221]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250910013344epsmtip1bcef11072703a7ec40ff187ab78578bf~jx9tKKmwA3018230182epsmtip1Y;
	Wed, 10 Sep 2025 01:33:44 +0000 (GMT)
From: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Bartlomiej Zolnierkiewicz'"
	<bzolnier@gmail.com>, "'Rafael J . Wysocki'" <rafael@kernel.org>, "'Daniel
 Lezcano'" <daniel.lezcano@linaro.org>, "'Zhang Rui'" <rui.zhang@intel.com>,
	"'Lukasz	Luba'" <lukasz.luba@arm.com>, "'Rob Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>
Cc: <linux-pm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <e71e6f3d-af02-4910-91ae-acf41692ac5b@kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: thermal: samsung: Add tmu-name and
 sensor-index-ranges properties
Date: Wed, 10 Sep 2025 10:33:43 +0900
Message-ID: <03a301dc21f2$f2236380$d66a2a80$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQJcDpuT0zWDya8nliyk6vzs/32vBQIURjbqAvLO/ccA7RxvPrNcJnHw
Content-Language: ko
X-CMS-MailID: 20250910013344epcas2p265fefabdfed14e90b66cc856c559e561
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903073653epcas2p4cb25058c97aab9a30c7e68ef5f10fb91
References: <20250903073634.1898865-1-shin.son@samsung.com>
	<CGME20250903073653epcas2p4cb25058c97aab9a30c7e68ef5f10fb91@epcas2p4.samsung.com>
	<20250903073634.1898865-2-shin.son@samsung.com>
	<e71e6f3d-af02-4910-91ae-acf41692ac5b@kernel.org>

Hello, Krzysztof Kozlowski.

> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> Sent: Saturday, September 6, 2025 9:06 PM
> To: Shin Son <shin.son@samsung.com>; Bartlomiej Zolnierkiewicz
> <bzolnier@gmail.com>; Rafael J . Wysocki <rafael@kernel.org>; Daniel
> Lezcano <daniel.lezcano@linaro.org>; Zhang Rui <rui.zhang@intel.com>;
> Lukasz Luba <lukasz.luba@arm.com>; Rob Herring <robh@kernel.org>; Conor
> Dooley <conor+dt@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>
> Cc: linux-pm@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: samsung: Add tmu-name
> and sensor-index-ranges properties
> 
> On 03/09/2025 09:36, Shin Son wrote:
> >  > +  samsung,hw-sensor-indices:
> > +    description: |
> > +      List of hardware sensor indices that are physically present and
> usable
> > +      in this TMU instance. Indices not listed are either unmapped or
> unused.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 16
> > +    uniqueItems: true
> 
> 
> For v3 you also need:
> 
>   items:
>     maximum: 16
> (or whatever values are actually correct)
> 
> 
> 
> Best regards,
> Krzysztof

Ok, I understood. I will add it in the next version
Thank you for your feedback.

Best regards,
Shin Son

