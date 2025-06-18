Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A341E260A;
	Wed, 18 Jun 2025 16:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750262841; cv=none; b=Lq9jtd0D65pJQ0l39+55AeQHJLlw6nIKYVhn9pfsGRm0ni9RiZeyMBraGNivbmF926YyJ1i66QohovK7//WzIQhu8HTXWVT+FJn6XX+ty2Lw80e5AdzeZjNvbGgoWdAv7vq1nPLudCitl+ZTAVmwYO4IGH6WQ/kUbIZVYo2nhfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750262841; c=relaxed/simple;
	bh=mOfi1Z9zb0xi4+yWHJom5fdfrVrQ0ZgGdPDqz11C0bE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=sTceuu+D1X5qB8FCkSy/1FPwD4Oa9Oak8tTnv2rLsvXr2XH0fjI3+eq5DAiD4IfMjjlg8R/pfxMC9EvLCvmgHPkjVtNvosbOfpm9pQiyiwiaOZ5oOTwS+9rB8ofWdzDxv//o6u2epBhILL53RHpPgk8VjTxNxQvKgWjQy5p8Gxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=MzPjn4GP; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="MzPjn4GP"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B6B6425DF5;
	Wed, 18 Jun 2025 18:07:17 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLu9mRvZczgM; Wed, 18 Jun 2025 18:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750262836; bh=mOfi1Z9zb0xi4+yWHJom5fdfrVrQ0ZgGdPDqz11C0bE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MzPjn4GPf8UxiaROLuhGP3cvuGFlQT10Pm/ub+0dQDuqam1PSRskQuZg0f1vkG4gU
	 0OwmZ/iSlylV2kJpSaJxuA3Wq361aFMdvVo18AWXSTfNqIzn4VMcJQzD1M8VtRLfft
	 +f7+kiFEEgxWoCmjrz41cOveafc9JOCbg57a3Nx+5sB2jmiEeh89/Akx3+q/edjHKx
	 oKpMTEMavM+x2F/NnJv6pHWNAi+/YkLasUEJDjCc7z3FWCdvwtDfJG7nr7ZBA9WnIR
	 8M3dbML5gDmlJJWbLu+7PmwNNpU9BfDI+GLxbkxNMqMogTJ/i9Pgeo4aiSNbF1Uh0R
	 LCuSvZqwUQWrw==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 16:07:16 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: samsung: exynos-sysreg: add exynos7870
 sysregs
In-Reply-To: <00e28a4a-78d6-4452-b28f-29d2e201f6d9@kernel.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
 <20250612-exynos7870-drm-dts-v1-1-88c0779af6cb@disroot.org>
 <7bb375c8-1a43-40e2-891c-8815c9cc94ff@kernel.org>
 <76df5b2d6b2c8de73519e1862e105c67@disroot.org>
 <97a54a9f-8719-4bbd-a1d5-dd398f42ab0c@kernel.org>
 <cd0f942a3752053e7569040f9e508b2d@disroot.org>
 <00e28a4a-78d6-4452-b28f-29d2e201f6d9@kernel.org>
Message-ID: <119675e462ce53a05acf55bb3d9fe91f@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-18 15:40, Krzysztof Kozlowski wrote:
> On 18/06/2025 16:49, Kaustabh Chakraborty wrote:
>> On 2025-06-18 14:37, Krzysztof Kozlowski wrote:
>>> On 18/06/2025 16:32, Kaustabh Chakraborty wrote:
>>>> On 2025-06-18 09:46, Krzysztof Kozlowski wrote:
>>>>> On 12/06/2025 17:23, Kaustabh Chakraborty wrote:
>>>>>> Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs
>>>>>> are
>>>>>> added, used for the SoC MIPI PHY's CSIS and DSIM blocks.
>>>>>> 
>>>>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>>>>> ---
>>>>>>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>>>> | 6 ++++++
>>>>>>  1 file changed, 6 insertions(+)
>>>>>> 
>>>>>> diff --git
>>>>>> a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>>>> b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>>>> index
>>>>>> d27ed6c9d61ea9db77229eca60b6b9a0abc5d305..174bdb8ee932ff965de6fc17aef004a3cedffeb3
>>>>>> 100644
>>>>>> ---
>>>>>> a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>>>> +++
>>>>>> b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>>>> @@ -52,6 +52,12 @@ properties:
>>>>>>                - samsung,exynosautov9-sysreg
>>>>>>            - const: syscon
>>>>>>          deprecated: true
>>>>>> +      - items:
>>>>>> +          - enum:
>>>>>> +              - samsung,exynos7870-cam-sysreg
>>>>>> +              - samsung,exynos7870-disp-sysreg
>>>>>> +          - const: samsung,exynos7870-sysreg
>>>>> 
>>>>> 
>>>>> Drop. These are not really compatible or your commit msg is
>>>>> incomplete.
>>>>> Don't use deprecated syntax and backwards compatible solutions for
>>>>> new
>>>>> hardware.
>>>> 
>>>> Are you sure? The deprecated one is actually the item above. From 
>>>> what
>>>> I
>>> 
>>> Yes. Think why were they added.
>>> 
>>>> understand, those are generic sysregs and don't mention their
>>>> functions.
>>> 
>>> And what is a generic sysreg?
>> 
>> What I meant is, usually compatibles go like this (in order):
> 
> No, they don't. So you checked why they were added?

Checked it, understood. It's meant to be:
"samsung,exynos<soc>-<function>-sysreg", "syscon"

> 
> Best regards,
> Krzysztof
