Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217EB1EE022;
	Fri,  8 Nov 2024 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072390; cv=none; b=Ukt/JRedC9wFZHWfzfrIrdAJbm6r+unsV/Frawy26XQ3zcfKBv0bPr3xZicV3pLbZPmwNGKXcKCV4N/qeImD8VpQ7Cfpq4NKWRWg1YNEqFrnoXKdjqgJad9GT3rI5IYoWLgpuMhjL9KssC/Uut13Olsesb5S9qsR+3b9rDvjMZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072390; c=relaxed/simple;
	bh=S96fuz0VgAfN94TOyJ8HhG78xLZAJuZ52sWSC8Aa35c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3OAM3TlhT0hEOcVFN8zUr0ftI2Zj3ki6jGqiKRQqhZr6AtKuIEXsOmFYLqROyI6CYh84u4vN2yQWgX1JfnENFeevP1PVuUnpQ44bFOYe//F+V5ToxQXClcv330+z81t5hccHloRCAorWTqUijwf/UZk7HeSLyf/Ly13YhxT9vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E6D1339;
	Fri,  8 Nov 2024 05:26:57 -0800 (PST)
Received: from [10.1.38.24] (e122027.cambridge.arm.com [10.1.38.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C8793F528;
	Fri,  8 Nov 2024 05:26:24 -0800 (PST)
Message-ID: <73eacca6-b6cd-4689-8ccd-f7e2e8b716f3@arm.com>
Date: Fri, 8 Nov 2024 13:26:23 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells
 handling
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 "Rob Herring (Arm)" <robh@kernel.org>, Saravana Kannan
 <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
References: <20241106171028.3830266-1-robh@kernel.org>
 <CGME20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d@eucas1p2.samsung.com>
 <3706d174-fadd-485f-be7b-f7ef4b11cf84@samsung.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <3706d174-fadd-485f-be7b-f7ef4b11cf84@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/11/2024 11:04, Marek Szyprowski wrote:
> Hi Rob,
> 
> On 06.11.2024 18:10, Rob Herring (Arm) wrote:
>> While OpenFirmware originally allowed walking parent nodes and default
>> root values for #address-cells and #size-cells, FDT has long required
>> explicit values. It's been a warning in dtc for the root node since the
>> beginning (2005) and for any parent node since 2007. Of course, not all
>> FDT uses dtc, but that should be the majority by far. The various
>> extracted OF devicetrees I have dating back to the 1990s (various
>> PowerMac, OLPC, PASemi Nemo) all have explicit root node properties. The
>> warning is disabled for Sparc as there are known systems relying on
>> default root node values.
>>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>> v2:
>>   - Add a define for excluded platforms to help clarify the intent
>>     is to have an exclude list and make adding platforms easier.
>>   - Also warn when walking parent nodes.
>> ---
>>   drivers/of/base.c | 28 ++++++++++++++++++++++------
>>   drivers/of/fdt.c  |  4 ++--
>>   2 files changed, 24 insertions(+), 8 deletions(-)
> 
> This patch landed in today's linux-next as commit 4b28a0dec185 ("of: 
> WARN on deprecated #address-cells/#size-cells handling"). In my tests I 
> found that it introduces warnings on almost all of my test systems. I 
> took a look at the first one I got in my logs (Samsung Exynos Rinato 
> board: arch/arm/boot/dts/samsung/exynos3250-rinato.dts):

Just a "me too" for rk3288-firefly.dtb:

[    0.138735] WARNING: CPU: 0 PID: 1 at drivers/of/base.c:106 of_bus_n_addr_cells+0x9c/0xd8
[    0.138776] Missing '#address-cells' in /power-management@ff730000

I'm sure it's easy to fix up the DTB, but we shouldn't be breaking long existing DTBs.

Steve

