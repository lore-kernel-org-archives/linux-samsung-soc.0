Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2AE1A9F86;
	Tue, 14 Oct 2025 00:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760401992; cv=none; b=Jpi1GIwVydtSPqXh2x91xKv9yUxeyE55ySzlZVhk3YBnFbAWB/6XwkAwbDW5p1KA8Kf696h3QG4wT9lATNu+wGJycpbqqdpL+F8g4s1ztcA56lZmZitZOxEXxEw9kDMEAzNZ5XlbHL8peMRMwocOYdDfH4CidSj5W4U1w1U+MzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760401992; c=relaxed/simple;
	bh=CONMfOkpLR/OR0Vcog2SL4bQ1cVtLbXbZRDLxFGSDjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTR3Y+Roj5ihy6nWdku/e5YAhyQ8H0qcFxsgcgzXmOs585OLHblT5KKUIK+XJ4n3eS5Rw6UgdiNZ7OWUPSwKpV5FphKTgmiRGY1fFu1JYpdF+F/vIVgiccrXMXsJqqsbUQlNvec4W0pfOGWuFyQ3IJnYgVpl5iuTX1ovJc8K1XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uX1qN/6t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uX1qN/6t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41E9C4CEE7;
	Tue, 14 Oct 2025 00:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760401991;
	bh=CONMfOkpLR/OR0Vcog2SL4bQ1cVtLbXbZRDLxFGSDjY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uX1qN/6t8Zx63Cp7nxsMUxh6BMAYZfNzi+SFdtReZPisgOlQluDaf0ovqyKJgt1oW
	 dMw3mT7kIfwEpqXgR8PiXrAG/5mbUapIeyhMAjnineOLuKSH5g7Ef+FaGAwZfWmCVO
	 cnJKxqfMy1sz+deEqI8jOB2RhyjrnvJurrVoOCPiPqs5Lb1lsjVvxQngPBGuWBACJw
	 gzQM9xyInUc6Pp2Lll/8+vTMyEnT9SJDxxSF4v0ZuZzjy/1wql08+WTMfQi+yY5XUe
	 wMtnKtMhxhZ0BZYmbOihLSqP776rZXJ1Kbjr2Rwlw0GR2hYAgydc2svWNOLHdw2WXf
	 B+1vRixraSGPA==
Message-ID: <50eb0743-8b6b-4d6b-bf22-46a428cbe26a@kernel.org>
Date: Tue, 14 Oct 2025 02:33:04 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] arm64: dts: exynos: add initial support for
 exynos8890
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250914150321.2632019-1-ivo.ivanov.ivanov1@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250914150321.2632019-1-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/09/2025 17:03, Ivaylo Ivanov wrote:
> Hey folks,
> 
> Before anything, this patchset depends on the following ones being merged,
> either for dt-bindings for compatibles, and/or device drivers:
> [1] https://lore.kernel.org/all/20250914112942.2604194-2-ivo.ivanov.ivanov1@gmail.com/
> [2] https://lore.kernel.org/all/20250914114457.2610013-2-ivo.ivanov.ivanov1@gmail.com/
> [3] https://lore.kernel.org/all/20250914122116.2616801-2-ivo.ivanov.ivanov1@gmail.com/
> [4] https://lore.kernel.org/all/20250914124227.2619925-2-ivo.ivanov.ivanov1@gmail.com/
> [11] https://lore.kernel.org/all/20250914134458.2624176-2-ivo.ivanov.ivanov1@gmail.com/
> [13] https://lore.kernel.org/all/20250914145555.2631595-2-ivo.ivanov.ivanov1@gmail.com/
> bindings only:
> [5] https://lore.kernel.org/all/20250914131452.2622609-1-ivo.ivanov.ivanov1@gmail.com/
> [6] https://lore.kernel.org/all/20250914131620.2622667-1-ivo.ivanov.ivanov1@gmail.com/
> [7] https://lore.kernel.org/all/20250914131848.2622817-1-ivo.ivanov.ivanov1@gmail.com/
> [8] https://lore.kernel.org/all/20250914132033.2622886-1-ivo.ivanov.ivanov1@gmail.com/
> [9] https://lore.kernel.org/all/20250914132201.2622955-1-ivo.ivanov.ivanov1@gmail.com/
> [10] https://lore.kernel.org/all/20250914132339.2623006-1-ivo.ivanov.ivanov1@gmail.com/
> [12] https://lore.kernel.org/all/20250914135652.2626066-1-ivo.ivanov.ivanov1@gmail.com/

This dependency means I cannot do anything with it. Please list ONLY:
1. Real dependencies. Driver cannot be a dependency for DTS. Dependency
is for building or LOST functionality comparing to mainline kernel.

2. As separate list, the non-applied bindings used in this DTS. Bindings
are not dependencies, but I cannot take DTS before they hit next.

Best regards,
Krzysztof
