Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADC1194A68;
	Fri,  8 Nov 2024 14:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731076426; cv=none; b=UtryVqe0bKoDmPgQln+9RbpzIqWsLwYTxwZRRpOw6X/OZSyDTjWjLN6XL1QYtvO10LjTVJRFAK0INsTmHYVYT4yn5wAUs1zBwytsmAMFjwtwRf3c5Vg2oZ6Ey6EwfUtWbUu20gZdX+sVzm0j8mgYWfLXJo7+3RJFb/e55MAAqIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731076426; c=relaxed/simple;
	bh=97VT2DpNh3+UjSJ0MGwXqfZnMxcm0+Evgw7fLLdx8ZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtfwqhKvOJaCC5yhTEcZMg69MfWcr6qCb+RlL8kDrG56Cp7JuQ2ZPpi1iGWPf4+iaalbJXJvisWHaJ3JpXW8voVI498whlFdzeNRYlnQMgxXXXvQQUgsUBisDt4EofH194Q4Uo3i11QxTSEkMGE2jcWXS+P3sP/BeiizHp6/hwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5803339;
	Fri,  8 Nov 2024 06:34:12 -0800 (PST)
Received: from [10.1.38.24] (e122027.cambridge.arm.com [10.1.38.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F09053F528;
	Fri,  8 Nov 2024 06:33:40 -0800 (PST)
Message-ID: <e23ecbab-66ba-478c-b720-fb045a08bc9c@arm.com>
Date: Fri, 8 Nov 2024 14:33:38 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells
 handling
To: Rob Herring <robh@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
References: <20241106171028.3830266-1-robh@kernel.org>
 <CGME20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d@eucas1p2.samsung.com>
 <3706d174-fadd-485f-be7b-f7ef4b11cf84@samsung.com>
 <73eacca6-b6cd-4689-8ccd-f7e2e8b716f3@arm.com>
 <CAL_JsqLyFV85w1kf397AcvZ7+Oewpe3vYeZdz_uvQrYwb1B8ag@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CAL_JsqLyFV85w1kf397AcvZ7+Oewpe3vYeZdz_uvQrYwb1B8ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/11/2024 14:04, Rob Herring wrote:
> On Fri, Nov 8, 2024 at 7:26 AM Steven Price <steven.price@arm.com> wrote:
>>
>> On 08/11/2024 11:04, Marek Szyprowski wrote:
>>> Hi Rob,
>>>
>>> On 06.11.2024 18:10, Rob Herring (Arm) wrote:
>>>> While OpenFirmware originally allowed walking parent nodes and default
>>>> root values for #address-cells and #size-cells, FDT has long required
>>>> explicit values. It's been a warning in dtc for the root node since the
>>>> beginning (2005) and for any parent node since 2007. Of course, not all
>>>> FDT uses dtc, but that should be the majority by far. The various
>>>> extracted OF devicetrees I have dating back to the 1990s (various
>>>> PowerMac, OLPC, PASemi Nemo) all have explicit root node properties. The
>>>> warning is disabled for Sparc as there are known systems relying on
>>>> default root node values.
>>>>
>>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>>> ---
>>>> v2:
>>>>   - Add a define for excluded platforms to help clarify the intent
>>>>     is to have an exclude list and make adding platforms easier.
>>>>   - Also warn when walking parent nodes.
>>>> ---
>>>>   drivers/of/base.c | 28 ++++++++++++++++++++++------
>>>>   drivers/of/fdt.c  |  4 ++--
>>>>   2 files changed, 24 insertions(+), 8 deletions(-)
>>>
>>> This patch landed in today's linux-next as commit 4b28a0dec185 ("of:
>>> WARN on deprecated #address-cells/#size-cells handling"). In my tests I
>>> found that it introduces warnings on almost all of my test systems. I
>>> took a look at the first one I got in my logs (Samsung Exynos Rinato
>>> board: arch/arm/boot/dts/samsung/exynos3250-rinato.dts):
>>
>> Just a "me too" for rk3288-firefly.dtb:
>>
>> [    0.138735] WARNING: CPU: 0 PID: 1 at drivers/of/base.c:106 of_bus_n_addr_cells+0x9c/0xd8
>> [    0.138776] Missing '#address-cells' in /power-management@ff730000
>>
>> I'm sure it's easy to fix up the DTB, but we shouldn't be breaking long existing DTBs.
> 
> What broke?

Nothing 'broke' as such (the board continued booting) but the WARN
shouldn't be happening. My CI treats the WARN as a failure as these
shouldn't occur unless there's a programming error.

> The intent here is to exclude any platforms/arch which actually need
> the deprecated behavior, not change DTBs. That's spelled out at the
> WARN which I assume people would read before fixing "Missing
> '#address-cells' in /power-management@ff730000". I tried to make the
> warn message indicate that on v1 with:
> 
> WARN_ONCE(!IS_ENABLED(CONFIG_SPARC), "Only listed platforms should
> rely on default '#address-cells'\n");

So one possibility is to include this platform in the exclusion list -
but I'm not sure how to do that, I assume including CONFIG_ARM in the
list would rather defeat the point of the patch. But my feeling is that
it would involve a lot of playing whack-a-mole to identify individual
platforms.

One obvious idea would be to look at the DTBs in the kernel tree and see
which are affected by this currently, that might be a good place to
start with an exclusion list.

You could also downgrade the warning to a pr_warn() or similar.

> But Conor thought that wasn't clear. So I'm open to suggestions...

I don't have any particular suggestions other than above, I just wanted
to report an existing DTB that triggers this WARN. We need to resolve
this one way or another before this patch can progress. For now I've
simply reverted this patch for my CI.

Steve

