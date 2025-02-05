Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDD42139C9;
	Wed,  5 Feb 2025 07:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738741745; cv=none; b=SbZ9V8gb38p7YJX+HopX7UCVfyubaZH1Lt1WnVZ7hfvzTf2wzbcGwkKmIasQTQvzyWxS1enMqrUy3nWLi70dzB+Ft8G9S93cG7WUIXYnq4gfxLjUH4aD5BOaDCrdfYqM9knzpemjzdEOtv30FB9Cp7uwtlcs9fL/kBeCjszBPiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738741745; c=relaxed/simple;
	bh=Qw/0yWcANrMoXnTl4P+9ue7UVDNlxb5psQJThBWBFaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IL6TpJlZ1PeoMbHj0qG746StMhMGmIgafA40DW6ABUM3ivuVeYX2f8luTmF2xMBYfyD4iDf4yXhtCi5LlD3ioHyUu/y4LIs5cIam5wlFxmPdep2hoIiuc64nElRJmZ4LN6urhT2LtyE4i72lYibOKQ4+qamHQvJU8ssI6Mie3Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sv8ZJzTz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sv8ZJzTz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26362C4CED1;
	Wed,  5 Feb 2025 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738741745;
	bh=Qw/0yWcANrMoXnTl4P+9ue7UVDNlxb5psQJThBWBFaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sv8ZJzTzRjZTGo1UGH6BRpLl2PRniI9Qe4x+s6+Zlo1H5J9yw0Kdc+EXoRtY0uz/d
	 XTEkAmsOeeSKLCC2d++dlrDZL3ngiyb/MH876EyUphTTeP1TARB5wNgjq0QrrJndwg
	 wK11/k0cD+f4kOYzTfAw7Tnz8Bx+z0yyt7cNudHrME8v3t33l8Av+NuEMH9Gbr7jJf
	 HAcQYosTtABgjDcZWPHXirP2YKmhxPSBRJiN0KH0J2NLPLlwzoiZlbzcD0XFU+hItp
	 48KdV9iviHmWhQoOn9ETIuvQ6FVt90Y7HfWhJomxc3ReU9RttWoA1DMYk5A5CtPNOE
	 yqsenCxZ0+KZw==
Message-ID: <53511b7c-aec3-4846-ab68-05958d585516@kernel.org>
Date: Wed, 5 Feb 2025 08:48:59 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add chip ID for Exynos7870 SoC
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Sergey Lisov <sleirsgoevy@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org>
 <339ea40f-6bc7-42ad-a5c2-f57b3be8cc39@kernel.org>
 <e9d9388d0adacd5599c6c6f5b7f33f87@disroot.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <e9d9388d0adacd5599c6c6f5b7f33f87@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/02/2025 20:29, Kaustabh Chakraborty wrote:
> On 2025-02-04 07:53, Krzysztof Kozlowski wrote:
>> On 03/02/2025 21:32, Kaustabh Chakraborty wrote:
>>> This patch series is a part of Exynos7870 upstreaming.
>>>
>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>> ---
>>> Kaustabh Chakraborty (2):
>>>       dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid compatible
>>>       soc: samsung: exynos-chipid: add support for exynos7870
>>>
>>>  Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
>>>  drivers/soc/samsung/exynos-chipid.c                                 | 1 +
>>>  2 files changed, 2 insertions(+)
>>
>> When I asked to split, I said per subsystem. Soc is one subsystem.
>> Everything targeting SoC should be in one patchset. get_maintainers.pl
>> tells the name of the subsystem and its maintainers.
>>
>> If there is going to be resend/new version, combine patchsets for soc
>> into one patchset (just like the example I gave last time).
> 
> Alright, so I'll move these patches to the one which has the devicetrees.
> 
> There's also a Documentation/devicetree/bindings/soc/ patch in
> exynos7870-pmu-clocks [1]. The CLKOUT driver uses the compatible declared
> in there, i.e., the CLKOUT driver depends on that commit. So, should it
> stay there? Or...?

The binding stays with the driver.




Best regards,
Krzysztof
