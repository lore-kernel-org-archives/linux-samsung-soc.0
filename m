Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0C62CCC0;
	Sun,  6 Jul 2025 16:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751817669; cv=none; b=XIDRgxlNewBJ4TSsU5X1sfGJxQ+GNVK5erwML3G3u9usyntjbAEIVJAcGfx0kbmR8sAgXVmq6vXUCSAw9FgqRq/bWmrh7O5ARF9hbhX0iZDmyEXrqW3C9tza/fBXAwpq1IKGfE3PlWz9PKCo+ArRUjIPPmJotT57QNoeVEN3kn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751817669; c=relaxed/simple;
	bh=QqDi1RStgwI7SrzAhimWgxfHUwpuVvnky+gt8gc+YsE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=uVUQud3wKy4JXlYPSM4SOYUZq4rxhzNWjcMy/hioiUT12rWzk3IJeGLwhpTX4xM0bLMwG+9klCsFqEXaJ5K/yTrVkP/vZDSpCfcUKdZ2wXBa8qlqwl3aTR96zXOTxJ+26Uo+owe4JPeMOvODsRIOBgjygiVIVe4NBT/va3UHOUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=OwY2RPG9; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="OwY2RPG9"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4490925D87;
	Sun,  6 Jul 2025 18:00:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfGpzETI8X29; Sun,  6 Jul 2025 18:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751817655; bh=QqDi1RStgwI7SrzAhimWgxfHUwpuVvnky+gt8gc+YsE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=OwY2RPG9td5uiPFxBjZ4I7dlIVsvfT4FKxJEKKMLY9Z+m/dF55l9G1/ltHlJIv7Vx
	 c6g+UOgwLX2x/REBm/MFuXNRzyWTEF6oZ8tmMO9QbkoXNMsgDQSRgQHnacHqUOtj0n
	 l4lu9kEgQ9qE0fS4WieBLDKfXayTvuZPDLWRP03G8udZ4B7qa2bgh++A7aOenCOGqf
	 BuaGy4MMTKgQlPgyyM83CR6d6mWOzW3RQfKy3hn8zFUfGJlCrMRHmNFIxY/HivfRCC
	 QPzDRGnRVvlu1buMJ4atFs5K9mBjp1Or8wxfBYQ7bN8Z3TsEKQOztQr8xT5BcX2f9L
	 gEUk6WXymRf+A==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 06 Jul 2025 16:00:55 +0000
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
In-Reply-To: <32924ee3-2dcd-43bf-8dec-51f85675bee0@kernel.org>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
 <32924ee3-2dcd-43bf-8dec-51f85675bee0@kernel.org>
Message-ID: <4e5d50807f1ae86aaf0e3c351b230b1b@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-06 07:33, Krzysztof Kozlowski wrote:
> On 26/06/2025 21:20, Kaustabh Chakraborty wrote:
>> @@ -80,6 +80,14 @@ properties:
>>        - const: vsync
>>        - const: lcd_sys
>> 
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  ports:
> 
> This was supposed to be port, no?

Yes. You have reviewed this patch though, I didn't send a new rev
yet.

Either way, yes this should be port (since it has a single output
port).

> 
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description:
>> +      Contains a port which is connected to mic or dsim node.
> If you are using ports, then you need to list the ports.
> 
> Best regards,
> Krzysztof
