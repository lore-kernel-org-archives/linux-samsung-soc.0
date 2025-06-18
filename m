Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFDAF9CB;
	Wed, 18 Jun 2025 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750258180; cv=none; b=ZVM/zs0Oi4Ab2T9ZqHyakoPnaRldzkKVc81IXN43k5zGmVarfAvocUyeG52E/ImMTKBt++LyBQah3dkikOMDSle9AFKqNBDldZEEsyNtZE3c8LcFLbVdoWUZJeBDdUysIUF8TVIkEBeg5q+8GsuTPRyNAFfJS9uqKMmyUVShIuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750258180; c=relaxed/simple;
	bh=xCwjGQRZNk8k1ts776Y9Hh6Gp2YJ+EK67MoT9GdAkfU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=mZWo9b9wiPtAKbxU4PCM8QnUyQoh43aBx1QGmibWaZ+ASclF0TbkoU/97V97YXD2rIXxgXQ1B/24PpWM5YI2Zr/gpWkLn0KYbb2g2ypIeymnH0VzxWwSVf6ha/DVF+vcQ0Urjpc5kIk1CfX1eVK/GKmjo5pbvIuEBQxNkJVEJWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=XUp3Gvb1; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="XUp3Gvb1"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4F65825F28;
	Wed, 18 Jun 2025 16:49:37 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrkJ_d0x0XTh; Wed, 18 Jun 2025 16:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750258176; bh=xCwjGQRZNk8k1ts776Y9Hh6Gp2YJ+EK67MoT9GdAkfU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XUp3Gvb1PUc1QieRkDW5TcBwRN/wmT41FC2rHOVMvtJTJoUJTAzzUlrIJ+MEPjKIq
	 +L9UZ5T3rqMAZBAShOGWAQxtLAeGhe+dNcOldXBfomoyTSdaqmap2vwuYfzyf9WAGb
	 6zcc5T8JI9ZbR5QoHXLuqQolGnccDjsXt8xEga3zwBrJG1XFy0+dAD1cSNSAdHhIYb
	 138DtbvYL/9F/QhUKON/3vOoyLsOHf4lQIrrko92mFeaVCBKl6cSYzV+HpYVphmkVJ
	 M6CAhEsB5LZD7IBqDlw/9PjJQQyrkn4aECO/Izcw3Jfs8X4jh4LjE+/5iTSYYopOKN
	 Cy9iyx/5NEjbw==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 14:49:36 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: samsung: exynos-sysreg: add exynos7870
 sysregs
In-Reply-To: <97a54a9f-8719-4bbd-a1d5-dd398f42ab0c@kernel.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
 <20250612-exynos7870-drm-dts-v1-1-88c0779af6cb@disroot.org>
 <7bb375c8-1a43-40e2-891c-8815c9cc94ff@kernel.org>
 <76df5b2d6b2c8de73519e1862e105c67@disroot.org>
 <97a54a9f-8719-4bbd-a1d5-dd398f42ab0c@kernel.org>
Message-ID: <cd0f942a3752053e7569040f9e508b2d@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-18 14:37, Krzysztof Kozlowski wrote:
> On 18/06/2025 16:32, Kaustabh Chakraborty wrote:
>> On 2025-06-18 09:46, Krzysztof Kozlowski wrote:
>>> On 12/06/2025 17:23, Kaustabh Chakraborty wrote:
>>>> Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs 
>>>> are
>>>> added, used for the SoC MIPI PHY's CSIS and DSIM blocks.
>>>> 
>>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>>> ---
>>>>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml      
>>>> | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>> 
>>>> diff --git 
>>>> a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml 
>>>> b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>> index 
>>>> d27ed6c9d61ea9db77229eca60b6b9a0abc5d305..174bdb8ee932ff965de6fc17aef004a3cedffeb3 
>>>> 100644
>>>> --- 
>>>> a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>> +++ 
>>>> b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>> @@ -52,6 +52,12 @@ properties:
>>>>                - samsung,exynosautov9-sysreg
>>>>            - const: syscon
>>>>          deprecated: true
>>>> +      - items:
>>>> +          - enum:
>>>> +              - samsung,exynos7870-cam-sysreg
>>>> +              - samsung,exynos7870-disp-sysreg
>>>> +          - const: samsung,exynos7870-sysreg
>>> 
>>> 
>>> Drop. These are not really compatible or your commit msg is 
>>> incomplete.
>>> Don't use deprecated syntax and backwards compatible solutions for 
>>> new
>>> hardware.
>> 
>> Are you sure? The deprecated one is actually the item above. From what 
>> I
> 
> Yes. Think why were they added.
> 
>> understand, those are generic sysregs and don't mention their 
>> functions.
> 
> And what is a generic sysreg?

What I meant is, usually compatibles go like this (in order):

"samsung,exynos<soc>-<function>-sysreg", "samsung,exynos<soc>-sysreg", 
"syscon"

But the deprecated item had its compatibles like this:

"samsung,exynos<soc>-sysreg", "syscon"

That is what I meant by "generic". It doesn't mention <function>.

And my additions adhere to the former. So does [1], [2], and [3]. None 
are
deprecated.

[1] 
https://elixir.bootlin.com/linux/v6.15.2/source/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml#L40
[2] 
https://elixir.bootlin.com/linux/v6.15.2/source/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml#L55
[3] 
https://elixir.bootlin.com/linux/v6.15.2/source/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml#L61

> 
> Best regards,
> Krzysztof
