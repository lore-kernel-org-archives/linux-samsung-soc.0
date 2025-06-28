Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA23F13633F;
	Sat, 28 Jun 2025 07:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751095179; cv=none; b=XNTvncS+aJJHE8Dvgc+vazF8+DDaQp9QR62SkskuGloudGo492w24zBj3HlgXKdocY2S6IeDHLPKDQ8I7U0JCsrD4l245p7mJ9kkdDoIhN7VzCQTzttdGpuo0yAoE3Zfm3XgCpKb2SyqamviBdhynUoa6fZMhuRoSvjbYpoyaPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751095179; c=relaxed/simple;
	bh=pKfvDVcRcDhp3Z+v2Y4AKpYYPrwP+zM1RXX1clGD2PA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=nTRE/BXNsj92A2ENCEi4NzUSJBfqDGTROwPJCbqJZ1hvJ6BTb2tgZY49Cbo+ABxYyq7K8QQOxxe3DV5vMSYO6NTFQi+IyAguKsXRmyj5wyHj5Ikv9sr4/wa3zObzKI25lghnDq37jaqWAL3KMi4FN6VJJVSlzUUgH3gFOKX/TvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=AHra/kG8; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="AHra/kG8"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A586022FBD;
	Sat, 28 Jun 2025 09:19:33 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2MsP83fmh9-E; Sat, 28 Jun 2025 09:19:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751095172; bh=pKfvDVcRcDhp3Z+v2Y4AKpYYPrwP+zM1RXX1clGD2PA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AHra/kG8lut6uMn824OiAVCfnpcGcfiwN1zUENBkuttxyKLbi17bOjzAFlRGysU/f
	 GrdMxS4Wu80qL8PMjDpUYie6Ywj/GIL4cJ35JzMQRPPOJC3uphQdv9SROGbPYUIuvb
	 TCaZalOFImycAldXu4ObbHJR4Lqrw5XzTiiPqHytVYfjEDQkgUuUNoJbk8JWgMjtYX
	 wcQ4Zxv2FQ60w/5GNyp9sXm53vK1u1t+BSg05+0uXZv/ZoxUwa3Y6rPL/MSW8HVNEq
	 yAV74Ar8TucIuJ4ouuTNi0VU7u0MyAzr8St595cFuzfax309WRIr0pvk80g695kZTQ
	 nQHr+5NfHceqg==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 28 Jun 2025 07:19:32 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: soc: samsung: exynos-pmu: allow
 mipi-phy subnode
In-Reply-To: <20250627214258.GA189284-robh@kernel.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
 <20250627-exynos7870-drm-dts-v2-2-d4a59207390d@disroot.org>
 <20250627214258.GA189284-robh@kernel.org>
Message-ID: <6151f833d5a06369cd3dce5d2b2aca9f@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-27 21:42, Rob Herring wrote:
> On Fri, Jun 27, 2025 at 01:43:25AM +0530, Kaustabh Chakraborty wrote:
>> Add Exynos7870's PMU compatible to the list of nodes which allow a 
>> MIPI
>> PHY driver.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml 
>> b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> index 
>> f0fb24156da9b8980dcfd5339ae75f12a71cf6d6..45acd6a03d761a833cec435302e5190fb50f7a23 
>> 100644
>> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> @@ -172,6 +172,7 @@ allOf:
>>                - samsung,exynos5250-pmu
>>                - samsung,exynos5420-pmu
>>                - samsung,exynos5433-pmu
>> +              - samsung,exynos7870-pmu
> 
> Don't you need to add this to 'compatible' and under 'select'?

compatible: [1]

samsung,exynos7-pmu is under select. 7870 has a fallback on 7.
Do you think samsung,exynos7-pmu should've been added in this patch
instead?

[1] 
https://elixir.bootlin.com/linux/v6.16-rc3/source/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml#L56

> 
>>      then:
>>        properties:
>>          mipi-phy: true
>> 
>> --
>> 2.49.0
>> 
