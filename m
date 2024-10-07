Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8E5155392;
	Mon,  7 Oct 2024 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728287333; cv=none; b=UNHHeURf6+Jpe7qReC93UHPfUw3bDc15KMDWHQXvVGuWpsrnMsNTU+DVy2AsE150KZQv3LlKo5GVF/KzSWPZYgGnY+5YL6F9xkD13WRS0SrOmO/5bcQG0JhBdHYDJwNdduNlGgG7/0ad5rb2qOcf4mAeL89TOPEu7JF8RFTQRlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728287333; c=relaxed/simple;
	bh=6bq8jsAyAqZhsj6KABKCH5XFXJPmdB5hcbKI9TT2GN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uu6QXvaLFJD9ONfY+nEi4oSgP/J/4rAdfvTsKbuI34s1RoVUrjo5IESD5hUn9TC7jhiBw/s90vIlkicf0JmQBMH1AWvJbeDHW5zer5V2eBSGAaCyBSdP4llC85S/NJdWeyaGZVJx7sNuY6x+SHqLiopSl5JMfl4QxbHY89abBmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9tTRS0A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9tTRS0A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C9CC4CEC7;
	Mon,  7 Oct 2024 07:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728287332;
	bh=6bq8jsAyAqZhsj6KABKCH5XFXJPmdB5hcbKI9TT2GN4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X9tTRS0A0rDXyM+3Qu9HzSYLblsHUxybmhojiFinvOALI4qYpMVC606mJKSUyqoRH
	 N5aAbfBsqmyNLZq5Q+hxVcie3EL4lM0ZLsfFDppQn+g1dAt467OUiix+Ve/9Yc4U0x
	 Xa6v/CAkYioPhhYID9WXC9lOsMwF3bM1xsbjyQBIirR6QM09dwkSqgSigeG8ROV8Ds
	 docniGo+LLKcTderyDA/0ROK0J8AIc8EUHAUa2v7uRJcNYy4MtrGkQuLf5n8dbPO3o
	 VfCv5ZzA2iSsaAsp5Ktjm1DWSW+mJl/aBOWdG3D73jQk0SwWOCNz+8nKdmGfWZnUPX
	 DU2xnMjITgVwg==
Message-ID: <5d90a7a7-1477-4e8e-8e2e-a301d4c25e3d@kernel.org>
Date: Mon, 7 Oct 2024 09:48:45 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] add clocks support for exynosauto v920 SoC
To: "sunyeal.hong" <sunyeal.hong@samsung.com>,
 'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
 'Chanwoo Choi' <cw00.choi@samsung.com>,
 'Alim Akhtar' <alim.akhtar@samsung.com>,
 'Michael Turquette' <mturquette@baylibre.com>,
 'Stephen Boyd' <sboyd@kernel.org>, 'Rob Herring' <robh@kernel.org>,
 'Conor Dooley' <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <CGME20241007071833epcas2p213100b34fd5a8192497a41e2e455947a@epcas2p2.samsung.com>
 <20241007071829.3042094-1-sunyeal.hong@samsung.com>
 <459e2af0-16a1-45aa-93b8-50b84b359854@kernel.org>
 <00a401db188a$cc7a1d30$656e5790$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <00a401db188a$cc7a1d30$656e5790$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/10/2024 09:30, sunyeal.hong wrote:
> Hello Krzyszto,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Monday, October 7, 2024 4:20 PM
>> To: Sunyeal Hong <sunyeal.hong@samsung.com>; Sylwester Nawrocki
>> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>; Alim
>> Akhtar <alim.akhtar@samsung.com>; Michael Turquette
>> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob Herring
>> <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>
>> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org
>> Subject: Re: [PATCH v2 0/3] add clocks support for exynosauto v920 SoC
>>
>> On 07/10/2024 09:18, Sunyeal Hong wrote:
>>> This patchset adds the CMU block below to support exynosauto v920 SoC.
>>> - CMU_PERIC1
>>> - CMU_MISC
>>> - CMU_HSI0/1
>>>
>>> Changes in v2:
>>>  - Rebase the patch to reflect the latest fixes
>>
>> Not much improved. Still blind rebase without addressing the issue I
>> pointed out.
>>
>> Allow people to actually review your patches, instead of sending multiple
>> versions within 5 minutes.
>>
>> One patchset per 24h.
>>
> I apologize for sending you the patch version incorrectly multiple times.
> Could you elaborate a bit more on the "unrelated change" part you mentioned in the comment?
> I don't think I understand your exact intention.

I do not see above "unrelated change" quote. Please respond inline.

Best regards,
Krzysztof

