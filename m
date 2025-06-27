Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B009CF4ED;
	Fri, 27 Jun 2025 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751036600; cv=none; b=ZCpW+qNUD8eON5U10mDfG6FRZgb0zOfNYfFA5z7uwuJeWVWAspI9EMzzKY5c2e3p2z/mcYLpVN21yXDOo47sJBLYAxzTjPpF24V0FZS/jcoGWLZfqHRLoFwk/DxynxA/CSgzlTUg3+8RCc/gg0Zzs/e7kFo+gFz7iACqMk/HS1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751036600; c=relaxed/simple;
	bh=vHgbqqxav7PLXVzwShebkckuGfsjD85hkjxnlgD60cs=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=khapfZB1ziqTmt7GXX+4uRvsdJdlmnn0WxbQTR+2X8o7ke/Jh6lIp7MwyWA152XTqlldqYeeEbpv/GcWOLVTsdljSQioSYuoZ9AB8GBBu17QsWABiS5ip2GrwlM40dYgI/C6Xb++tY20GQSGoUtm6J8Lo7uBDoOshXFN4XLUi90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=UoRytafx; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="UoRytafx"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8D5D425B9B;
	Fri, 27 Jun 2025 17:03:15 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKBRcaReXqhH; Fri, 27 Jun 2025 17:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751036594; bh=vHgbqqxav7PLXVzwShebkckuGfsjD85hkjxnlgD60cs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UoRytafxH9QzkSuEhGQ2HepLO3UAu131e4BI//9c+8132UHkDbOtLQKy22yrR3Eu+
	 wm6rc9/QwYtwaGKRMf+5wUb0VpG8Bd73pNEuw6KB53JRdiTiNT3nrdu/ocqSBQ/tdG
	 z3XTI9zd5bfUhbHVlIA5qZi/k8I5pYTVMNTcEvyipk1EaMxDglwSEhw+Z8RMdXSsd9
	 qnCfb7/xxNzFYjH6QYZZEqli6Ue6/NLlWgMPN6NPbM63P/9eE0rgh9ucZMJZYLBqnR
	 UrmYwITZxYabuYlJfhV9Twg+Ya3D8l5T8Rk1xedsz4xyRS7Rw2j61VvjNruw+On4XG
	 fuUX2QVvFmKzA==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Jun 2025 15:03:14 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alim Akhtar <alim.akhtar@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Ajay Kumar
 <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
In-Reply-To: <efa167d1-a5f3-47cd-855d-250f41a5e883@kernel.org>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
 <20250627-literate-talented-panda-cbac89@krzk-bin>
 <85c3658fdfa90636caac3b3fce295915@disroot.org>
 <efa167d1-a5f3-47cd-855d-250f41a5e883@kernel.org>
Message-ID: <ab1a39df178b68e2f1d61a537e0d567c@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-27 14:44, Krzysztof Kozlowski wrote:
> On 27/06/2025 15:44, Kaustabh Chakraborty wrote:
>>>> a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>>>> +++
>>>> b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>>>> @@ -80,6 +80,14 @@ properties:
>>>>        - const: vsync
>>>>        - const: lcd_sys
>>>> 
>>>> +  iommus:
>>>> +    maxItems: 1
>>>> +
>>>> +  ports:
>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>> +    description:
>>>> +      Contains a port which is connected to mic or dsim node.
>>> 
>>> You need to list and describe the ports.
>> 
>> -    description:
>> -      Contains a port which is connected to mic or dsim node.
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description:
>> +          Input port which is connected to either a Mobile Image
>> +          Compressor (MIC) or a DSI Master device.
> 
> 
> If this is only one port, then just 'port' property, but I have doubts
> it should be one, because even you mentioned two - MIC could be the
> input and MIPI DSIM would be the output.

DECON is the first device in the pipeline. So it should only have
output.

It's either:
DECON -> DSIM -> panel
or
DECON -> MIC -> DSIM -> panel

Exynos7870 doesn't have MIC, but other SoCs may have one.

> 
> Maybe if the MIC is integral part, it would not have been an input, but
> then only 'port'.
> 
>> 
>> I assume you want something like this?
>> Is the formatting correct? Should there be a space between
>> ports:$ref and ports:properties?
> 
> Look at toshiba,tc358768.yaml or the simple-bridge (except you should
> name the input and output ports).

Okay, thanks!

Therefore this:

-    description:
-      Contains a port which is connected to mic or dsim node.
+
+    properties:
+      port:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port which is connected to either a Mobile Image
+          Compressor (MIC) or a DSI Master device.

> 
> 
> 
> Best regards,
> Krzysztof
