Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B161F94C;
	Wed, 25 Sep 2024 20:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727294707; cv=none; b=aCLyO+QlmDTUrwA9p9oiDWFL9SFQseNh4tcAQIquzbOiVOMycmf8ypyP7H80OIrapdsh767K71Lx5xG/bLIKPEfcUrQY9tYeeU1tk//dTpBee92IbKL0RaayjJe0VNFGlMRN4/3gynnXv8HSPOCp6cPSH3biqF9E591ZGYhAubE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727294707; c=relaxed/simple;
	bh=rxEvAK/GRkVetb0C5ec3bgN3bKf21B0o3rbeuLq6tOc=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Fc4uKd1HRUWCTqyNDY7JA+dr4RlHBwoq4Nbe17VYxL3OvTmlR54bkKUEyOKcy3ob2Uq1shf1htiKl1fyFPF2AuezuDGvJ1m8WZLpz2nOHbviqNTBgNJh1Yz61X5bDJLjFYR6cF9rTjpBNjJS12xsvmDr47vfa4GlplrJAhRXT1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=EYrvypxs; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="EYrvypxs"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5A4FD20F7F;
	Wed, 25 Sep 2024 22:05:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trsbTqBmpoLE; Wed, 25 Sep 2024 22:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1727294702; bh=rxEvAK/GRkVetb0C5ec3bgN3bKf21B0o3rbeuLq6tOc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EYrvypxsASewCrHk/GsjVA2OgV7opGfHcjvLR06YTr8Kj6XSvb5AOB8heJgG2vFnH
	 yJwHCdNwX6WHcUZfm0RveZG8JMctTDAorkr3j4NQ0nVHJcCIvDmwVp+2/VPyanwRvb
	 +uV+gN0Jh2ht4lWMpg3KpYIb8rb2OI8gq0RK4nFwpdbyVjjI3syRGXipskR78sFutf
	 jXJXapfeZtZavzalN/GfDohOwSD7YUxBOJRcqLXD1MKWcvjKvkLkHGM1HRZVl+yfNW
	 wcBa1IfAzOLiYaTeeobXLrOVq0fUPd4aof4jUgTax1go9dAO+5O0d05sWZYRToEUcU
	 BHGL0l/VGtd2w==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 25 Sep 2024 20:05:02 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, alim.akhtar@samsung.com, conor@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 inki.dae@samsung.com, kyungmin.park@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch,
 sw0312.kim@samsung.com, tzimmermann@suse.de, kauschluss@disroot.org
Subject: Re: [PATCH 6/6] dt-bindings: display: samsung,exynos7-decon: add
 exynos7870 compatible
In-Reply-To: <ef786b8b-32c0-457a-9e14-ed7bd9f04172@kernel.org>
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
 <20240919-exynosdrm-decon-v1-6-8c3e3ccffad5@disroot.org>
 <32ae1188-196d-4fe8-8719-968e5149a771@kernel.org>
 <7e5caaea80390e8cf87ba0a74d9719f0@disroot.org>
 <1bc0ad48-03c0-4cf6-afb1-2296d1c259b9@kernel.org>
 <8e0672ad3fd72f69d2bdb5687e778c86@disroot.org>
 <ef786b8b-32c0-457a-9e14-ed7bd9f04172@kernel.org>
Message-ID: <d8f5999921a31d7723e0aa9b12bb9eaf@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2024-09-25 19:56, Krzysztof Kozlowski wrote:
> On 25/09/2024 21:36, Kaustabh Chakraborty wrote:
>> On 2024-09-25 19:25, Krzysztof Kozlowski wrote:
>>> On 25/09/2024 20:42, Kaustabh Chakraborty wrote:
>>>> On 2024-09-20 12:39, Krzysztof Kozlowski wrote:
>>>>> On 19/09/2024 17:20, Kaustabh Chakraborty wrote:
>>>>>> Add the compatible string of Exynos7870 to the existing list.
>>>>>>
>>>>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>>>>
>>>>> ... and the DTS is <please provide lore ink in changelog>?
>>>>
>>>> Didn't quite understand. The patch adds the compatible string
>>>> for Exynos7870 DECON in documentation. There's no DTS involved
>>>> in here, right?
>>>
>>> Provide lore link to the DTS submission.
>> 
>> There aren't any DTS submissions *yet* which use the compatible.
>> Is that an issue?
>> 
> 
> Yeah, users are supposed to be upstream. Not downstream.

I understand that. I had plans to submit it in the future.
If that's how it's meant to be done, I'll have to revisit this
submission at a later date then.

> 
> Best regards,
> Krzysztof
