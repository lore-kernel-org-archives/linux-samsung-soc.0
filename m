Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74E12DCC09;
	Fri, 27 Jun 2025 13:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751031862; cv=none; b=a5lHR0NwicV7OpKoU4deVoSAM8xDU+tQemUaq58gQKVp4N4VTWlL57+E4WK4pkgb0nnl53/huU62RHeUmuwQvRSWBgIuY5y3rrxcyA8Bo0Ql7amPGxJilKcfuM/08wpqtgQ/gc1JfQK4vV4UmcD12VRl8UYjGGhibr+jWwLfMws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751031862; c=relaxed/simple;
	bh=cAEs2spaxPueJxKHXKyopePEl3MqlVBkN3UFzTPU8Sk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=N9IM0K+LFo0nEhGXb+eKDy87JedOSYZY1fzuZxM7ZZPXcvkzx1v0PlFQW2NuKaRTkyCKYwCZp7YrtaPwOvZLlmhzWk0zEsfNzm5SQEgv3Dz/PQZe2R99SFbdVswG96pGwQWKZZXT5VicjBXKOz7oWWmvRL/cW6dwSGaca/Y8Rk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=YhQHA0mI; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="YhQHA0mI"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 06D1620F6D;
	Fri, 27 Jun 2025 15:44:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToE2WMaHRbaz; Fri, 27 Jun 2025 15:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751031858; bh=cAEs2spaxPueJxKHXKyopePEl3MqlVBkN3UFzTPU8Sk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YhQHA0mIm10roynyZHJhCDRT7tmozYKY85f/YD9X9oNofLc0mGiDLwqbKW82kVMoh
	 w5iRZqBBZvckSbtJoKcb3DvAZ3wPtUw4J5N3d26C9Q8aRMARha+7wlfa6XofQV96de
	 zNLP2OqqBDOhqi4KZN8CSZjwkeEiOXwxVMyOmtQ6PQeK0xlYEM4Zc4NIDew8n2xNe3
	 Lg6CM3dmImHbDZn5gJ1hkJkjfoSxxjzJORpoLkqybzhVPenPktfkcqXa0OwQ7c3e17
	 JGFgVVGpynhtbga0NcRNbsWvi9m/EWA1gp2YqTYx3F+ua9gG7CHv8waeTpg6JY0Jxt
	 G0l4klyZK8V7w==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Jun 2025 13:44:17 +0000
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
In-Reply-To: <20250627-literate-talented-panda-cbac89@krzk-bin>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
 <20250627-literate-talented-panda-cbac89@krzk-bin>
Message-ID: <85c3658fdfa90636caac3b3fce295915@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-27 07:50, Krzysztof Kozlowski wrote:
> On Fri, Jun 27, 2025 at 12:50:28AM +0530, Kaustabh Chakraborty wrote:
>> Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
>> - May optionally require an IOMMU to initialize a display region.
>> - May require a port connection to another block, say an MIC or a DSI
>>   master.
>> 
>> Document these bindings in the devicetree schema.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  .../bindings/display/samsung/samsung,exynos7-decon.yaml           | 8 
>> ++++++++
>>  1 file changed, 8 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml 
>> b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>> index 
>> 53916e4c95d8c0369138941a556c23f5d42fbd39..1e9500c86590d555cfa6f04790e2b64da291b78b 
>> 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>> @@ -80,6 +80,14 @@ properties:
>>        - const: vsync
>>        - const: lcd_sys
>> 
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description:
>> +      Contains a port which is connected to mic or dsim node.
> 
> You need to list and describe the ports.

-    description:
-      Contains a port which is connected to mic or dsim node.
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port which is connected to either a Mobile Image
+          Compressor (MIC) or a DSI Master device.

I assume you want something like this?
Is the formatting correct? Should there be a space between
ports:$ref and ports:properties?

> 
> Best regards,
> Krzysztof
