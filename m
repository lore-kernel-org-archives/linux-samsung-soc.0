Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AD13A7F7A;
	Tue, 28 Jul 2026 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241495; cv=none; b=sJMbKt3LzSePvC251TvcqrOPgWA67gYJGm0TAS5CukMyaoufLqP1BAxVXn5yNUfZIRCxMcwBBTco/dZKctGNod36uoPwzDFmjM7376or8CtPsUrmFfOzkZEOQ5jSGSgAbU+MAcgSk0yiL4xCLKa7Z9MGgfsxnzwrYz9c+HVtFAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241495; c=relaxed/simple;
	bh=UCd5cokHiiYJVOeQC5o7+U65ZDmjsaeZqacWsGylHys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVgTJsSmDq+BFhYU4rtgigU9/NSQRbUR5AGxNK3Nyvix5oyhu3j+8QduvOQwyB+wryailPTRhH/FPdng/FLYn4TtbqmGtSFKSfQishgum0h8t+z3Jcg2+HO7RD+4zyLLGaANzGyRgUXSZ7YoxnJEd6B20CKmC/2RjtxtC0XC1is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lW5Ox6Ty; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lW5Ox6Ty"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F6B1F000E9;
	Tue, 28 Jul 2026 12:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785241494;
	bh=4CcJVu2HdCBodSbf+UYAAHPLgckCVCAk6z1RWhwvCPA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lW5Ox6TynyS1zZbYlvpYlxo3hjcEY3zLDeJ+k2NqEQ5ub6Y0ym1PCqvx0LV8uYlGG
	 YSg67AQ30dmNYsNQIyErdCfVJWSq/TVkZ/VWTgLvOd63S0L86PAOVWAYWtDgfbkSoQ
	 1bs3t/585rA3pQnAMk30OeBU6yOvFagKWn/pYJBwBpgg9ycSTKLUqcuEDQqcWO/gc0
	 XpuqrI5TNQ18k9VQRBwT/u/OSRi6pXp+uBQzb/WDryUjOw3zo+p+d6lV+zB9uhaIH1
	 /oD9fGt19zuUhONvLuiluTMUYJtvdl78t57Or88Yf4LTtxj7n0utc3r3gooSqJichB
	 FJV7aO+yzE+oA==
Message-ID: <0c948180-3112-4e92-b752-0015c55fb26c@kernel.org>
Date: Tue, 28 Jul 2026 14:24:44 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] arm64: dts: exynos8855: add cmu_top & cmu_peric
 clock DT nodes
To: Alim Akhtar <alim.akhtar@samsung.com>, "'raghav.s'"
 <raghav.s@samsung.com>, s.nawrocki@samsung.com, cw00.choi@samsung.com,
 peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, hajun.sung@samsung.com, is.gandhi@samsung.com,
 ts.amit@samsung.com, pokala.reddy@samsung.com
References: <20260728121111.2077860-1-raghav.s@samsung.com>
 <CGME20260728115256epcas5p38cbcfe68218d08301d237705388e6e62@epcas5p3.samsung.com>
 <20260728121111.2077860-5-raghav.s@samsung.com>
 <8582d4f9-1a78-4f47-bab9-c52393dffbd1@kernel.org>
 <079201dd1e8b$eca22680$c5e67380$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <079201dd1e8b$eca22680$c5e67380$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/07/2026 14:23, Alim Akhtar wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Tuesday, July 28, 2026 5:30 PM
>> To: raghav.s <raghav.s@samsung.com>; s.nawrocki@samsung.com;
>> cw00.choi@samsung.com; peter.griffin@linaro.org;
>> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
>> bmasney@redhat.com; robh@kernel.org; conor+dt@kernel.org
>> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; hajun.sung@samsung.com;
>> is.gandhi@samsung.com; ts.amit@samsung.com;
>> pokala.reddy@samsung.com
>> Subject: Re: [PATCH 04/13] arm64: dts: exynos8855: add cmu_top &
>> cmu_peric clock DT nodes
>>
>> On 28/07/2026 14:11, raghav.s wrote:
>>> Add required dt node for cmu_top & cmu_peric block
>>>
>>> Signed-off-by: raghav.s <raghav.s@samsung.com>
>>> ---
>>>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 24
>>> ++++++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>
>> Please organize your patches in reasonable order. DTS is never in the middle,
>> see submitting patches (both documents) and maintainer-soc profile.
>>
> The thought was to add clks block wise and hence we see DTS coming in between but for the other blocks. 
> e.g. patch-2 and 3 adds binding and driver for TOP and PERIC and this patch-4 adds DTS. 
> And patch-5 and 6 adds binding and driver for PERIS and patch-7 adds DTS and so on.
> 
> Cover-letter should have explained this. 
> 
> Are you suggesting to re-order all the binding first followed by all blocks driver and then add a single DTS for all clock controller? 
> 
> Does current approach helps in review? 

If you ask this, you did not read the docs.

Best regards,
Krzysztof
