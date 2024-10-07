Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E0C18732B;
	Mon,  7 Oct 2024 08:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728288418; cv=none; b=LCDx9nAwFx1isVpiePlglc/RKHcMcD2N18isa/2hMJAIcgKomItX36mGBpp/2ZJXujIsOq09287NfZXJNH0Htr/T4iGgkWe6p0xCv+thaesYWgGLB42t8VxYkcoeZg3GAK71DBnPCMAvwylQ9rTWVcAEIE5K+BFL1BNrqGFOqEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728288418; c=relaxed/simple;
	bh=BpejRmLyKdAMAzWqH63+BEQhESgQZp8DekKdmmrkFcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=raUdyxdTVA7UzNcQNL4P2aXN92rZTBP5E8y4JvYhy4tEJTC6ms/UiKWnwwZa6YiNNYkisgaOGwiyyG7ERGHHTHTCplT3RSxuAhr8ZkICGUjeUbtR9ZVKh73CIdX2ihH+oc2Cv0M/n0yqS801OqAr6MLLuo2UYvJha+WC53yKvgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0vbDj8M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0vbDj8M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B66C4CEC6;
	Mon,  7 Oct 2024 08:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728288417;
	bh=BpejRmLyKdAMAzWqH63+BEQhESgQZp8DekKdmmrkFcw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U0vbDj8MjzuPnSyDD5h7jo8rckO9Q3LQf+nUwR++yCx9YhzoZuM33efYwOToLjRl8
	 RqIFR6TcEdfUtkKzaBxQQfVV+pOpZP9uL4Wz1qDo1suhJVbcuaRGghVge+bDjsvAsb
	 xztosqDvNvodHcvRxZgY5psMfWwlW9caYETvk75c9UP6p9MPBf8U8DKfqaudUR5ciM
	 Mp7mIduylmwdxYl4c/x+fYtGqkh7GMeB9Z8tD+3sizgxXYlEBjf5wK7PM6MfT4Jb6R
	 NHSO2LR0G6Kf+6RGa8cgRQjmBi79XoBRGGtkTEWjXxlu2dcTvxPpBbUPP27ncl3g36
	 ywCOrPODzFmHA==
Message-ID: <06fd4e7e-d401-49bb-81f1-47fcea2dbbee@kernel.org>
Date: Mon, 7 Oct 2024 10:06:50 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: samsung: exynosautov920: add peric1, misc and
 hsi0/1 clock support
To: "sunyeal.hong" <sunyeal.hong@samsung.com>,
 'Krzysztof Kozlowski' <krzk+dt@kernel.org>, 'Rob Herring' <robh@kernel.org>,
 'Conor Dooley' <conor+dt@kernel.org>, 'Alim Akhtar'
 <alim.akhtar@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
 'Chanwoo Choi' <cw00.choi@samsung.com>,
 'Michael Turquette' <mturquette@baylibre.com>,
 'Stephen Boyd' <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20240912103856.3330631-1-sunyeal.hong@samsung.com>
 <CGME20240912103903epcas2p4fb9aaeafb223b63c57c2f0cac7f37c3d@epcas2p4.samsung.com>
 <20240912103856.3330631-3-sunyeal.hong@samsung.com>
 <db9dc2ef-2c24-4f1b-82c8-316c347daf60@kernel.org>
 <00a501db188f$8a7142b0$9f53c810$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <00a501db188f$8a7142b0$9f53c810$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/10/2024 10:04, sunyeal.hong wrote:
> Hello Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Monday, September 30, 2024 8:36 PM
>> To: Sunyeal Hong <sunyeal.hong@samsung.com>; Krzysztof Kozlowski
>> <krzk+dt@kernel.org>; Rob Herring <robh@kernel.org>; Conor Dooley
>> <conor+dt@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>; Sylwester
>> Nawrocki <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>;
>> Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
>> <sboyd@kernel.org>
>> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> clk@vger.kernel.org
>> Subject: Re: [PATCH 2/3] clk: samsung: exynosautov920: add peric1, misc
>> and hsi0/1 clock support
>>
>> On 12/09/2024 12:38, Sunyeal Hong wrote:
>>> Like CMU_PERIC1, this provides clocks for USI09 ~ USI17, USI_I2C and
>> USI_I3C.
>>> Like CMU_MISC, this provides clocks for MISC, GIC and OTP.
>>> Like CMU_HSI0, this provides clocks for PCIE.
>>> Like CMU_HSI1, this provides clocks for USB and MMC.
>>>
>>> Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
>>> ---
>>
>> ...
>>
>>> +
>>>  static int __init exynosautov920_cmu_probe(struct platform_device
>>> *pdev)  {
>>>  	const struct samsung_cmu_info *info; @@ -1154,6 +1431,19 @@ static
>>> const struct of_device_id exynosautov920_cmu_of_match[] = {
>>>  	{
>>>  		.compatible = "samsung,exynosautov920-cmu-peric0",
>>>  		.data = &peric0_cmu_info,
>>> +	}, {
>>> +		 .compatible = "samsung,exynosautov920-cmu-peric1",
>>> +		 .data = &peric1_cmu_info,
>>> +	}, {
>>> +		 .compatible = "samsung,exynosautov920-cmu-misc",
>>> +		 .data = &misc_cmu_info,
>>> +	}, {
>>> +		.compatible = "samsung,exynosautov920-cmu-hsi0",
>>> +		.data = &hsi0_cmu_info,
>>> +	}, {
>>> +		.compatible = "samsung,exynosautov920-cmu-hsi1",
>>> +		.data = &hsi1_cmu_info,
>>> +	}, {
>>
>> This is unrelated change. Please rebase.
>>
> Could you please explain in more detail the comment mentioned above?

You were growing this list, didn't you? Then adding sentinel is unrelated.


Best regards,
Krzysztof

