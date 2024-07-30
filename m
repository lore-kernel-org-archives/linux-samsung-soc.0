Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DCE18FC6E;
	Tue, 30 Jul 2024 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722345831; cv=none; b=OEDmB+jPTZjW/V+wcY/QeGJXflkwna3vmir71nt0OdAg3GkJv/OAfWLdBxwtHy98rFy8Z2q91rPi8PUjz0hdzxncXPydvCKDi3jtnBChv7aIMC9s3zMU5vEdOhT938Qn4UYH+t6dzC5gJZm7CKu+ENOoO11b5ha9tnwEiM6VXuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722345831; c=relaxed/simple;
	bh=1NYevBkd4z+RY0RT9VGcYwWAUeaOucmoLi75vIzyIZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxftDEvpFVDZqhdAHVOQWEypgQ7opq5xzdz2/cV6ymz+rFT9lzTuTZhRa1vxxci+u1OtAUHwtYgCsfYJ2N0Gvm5FSeaE2wOLy7ddoYlLEbJIwMPuUzzEDyuvPq1NuzdUcMv9DKk26S5FUBKCF/WEAdbstudIW8EOb8o7oM3XLAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2gs/UqC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2gs/UqC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7C6C32782;
	Tue, 30 Jul 2024 13:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722345830;
	bh=1NYevBkd4z+RY0RT9VGcYwWAUeaOucmoLi75vIzyIZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G2gs/UqCTXg+yP7xRY6DrJq6KjnrnkjeVwAld8DDZQUBw/pnrlS41bNvhXvuzGzcL
	 QliZW7bRbWgghWr9cO1FvIS6Rg/oNgPTrc79gjutkRUbTwHMJyyUI1pOk2J8sC3EJX
	 rQQ3WLDWvuSkPAsSs33yY+ZUG8vPeSs5+N2ahQtl/cUPK1BpolzSZczhp7RMbScjIk
	 o+NjlXOnMfC241V1FlxGWvMz7isOjw2CxcsO0kQm1Kek4a6EuLc455OoBjohU+ycDq
	 6duaC+R3gwLxWnGY3Ss5tvxXOLf+oW7ipETwt0HPweR2jBG6eGxeB9wstjOAYP2hJv
	 kXCdasuxzxEOQ==
Message-ID: <d72d7927-079a-4a82-a298-db9ed70a816f@kernel.org>
Date: Tue, 30 Jul 2024 15:23:46 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ARM: dts: samsung: Add cache information to the
 Exynos542x SoC
To: Anand Moon <linux.amoon@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240730091322.5741-1-linux.amoon@gmail.com>
 <CGME20240730091412eucas1p18feced3968a5f87dc8fe05f78d5c7659@eucas1p1.samsung.com>
 <20240730091322.5741-2-linux.amoon@gmail.com>
 <09e9cf0b-27fd-46b8-8631-87d798afd19e@samsung.com>
 <CANAwSgT_TOFwP80+H8-CdXDLLu+u2XZMr2dnxcsSDe8S5yeYCw@mail.gmail.com>
 <a41a6143-ef2e-4d86-b102-eaf442985173@kernel.org>
 <CANAwSgSbSgXwOQLrVrHD7jpDe0=Bq7r2K8p0JjvZJMPpVNq4XQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CANAwSgSbSgXwOQLrVrHD7jpDe0=Bq7r2K8p0JjvZJMPpVNq4XQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/07/2024 15:20, Anand Moon wrote:
> Hi Krzysztof,
> 
> On Tue, 30 Jul 2024 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 30/07/2024 14:06, Anand Moon wrote:
>>> Hi Marek,
>>>
>>> On Tue, 30 Jul 2024 at 17:14, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>>
>>>>
>>>> On 30.07.2024 11:13, Anand Moon wrote:
>>>>> As per Exynos 5422 user manual add missing cache information to
>>>>> the Exynos542x SoC.
>>>>>
>>>>> - Each Cortex-A7 core has 32 KB of instruction cache and
>>>>>       32 KB of L1 data cache available.
>>>>> - Each Cortex-A15 core has 32 KB of L1 instruction cache and
>>>>>       32 KB of L1 data cache available.
>>>>> - The little (A7) cluster has 512 KB of unified L2 cache available.
>>>>> - The big (A15) cluster has 2 MB of unified L2 cache available.
>>>>>
>>>>> Features:
>>>>> - Exynos 5422 support cache coherency interconnect (CCI) bus with
>>>>>    L2 cache snooping capability. This hardware automatic L2 cache
>>>>>    snooping removes the efforts of synchronizing the contents of the
>>>>>    two L2 caches in core switching event.
>>>>>
>>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>>>
>>>>
>>>> The provided values are not correct. Please refer to commit 5f41f9198f29
>>>> ("ARM: 8864/1: Add workaround for I-Cache line size mismatch between CPU
>>>> cores"), which adds workaround for different l1 icache line size between
>>>> big and little CPUs. This workaround gets enabled on all Exynos542x/5800
>>>> boards.
>>>>
>>> Ok, I have just referred to the Exynos 5422 user manual for this patch,
>>> This patch is just updating the cache size for CPU for big.litle architecture..
>>>
>>
>> Let me get it right. Marek's comment was that you used wrong values.
>> Marek also provided rationale for this. Now your reply is that you
>> update cache size? Sorry, I fail how you address Marek's comment.
>>
>> Do not repeat what the patch is doing. We all can see it. Instead
>> respond to the comment with some sort of arguments.
>>
> 
> Ok, If I am not wrong  icache_size is hard-coded in the above commit.
> 
> +#ifdef CONFIG_CPU_ICACHE_MISMATCH_WORKAROUND
> +.globl icache_size
> +       .data
> +       .align  2
> +icache_size:
> +       .long   64
> +       .text
> +#endif
> 
> In the check_cpu_icache_size function, we read the control reg
> and recalculate the icache_size.
> if there mismatch we re-apply the Icache_size,
> 
> So dts passed values do not apply over here,

So you provide incorrect values in terms of them being ignored? Then do
not provide at all.

Best regards,
Krzysztof

