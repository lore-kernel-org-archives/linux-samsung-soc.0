Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9A917ADE0;
	Tue, 10 Feb 2026 10:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770720672; cv=none; b=ssWOk6e3TOGldADRmX9YD/pTlHq7I9kOMiYk69D1cT9BCDPfVx0BDjN8iKYdMICFcqaGrwJPJWhj2GuJx8ZgILh4vU7FPvGMI0HEifgbvGFguxwY4/To2PhFDuI5+YVHWbRKL8vL2ZrPdSLQFeV+wuOWu5nJezjIjAWeneUgjrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770720672; c=relaxed/simple;
	bh=eu+8OBuxQWIHoroErUITLl3I7I6OtXdoYBcNlotAj6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iwb2aSolZacmppGMW2TyjJGIeCYxi1+iB/Ps9b9yM1A8zv4z8/X+hYHjFCJ0/xxjqlyL8Il2gXx9KUp3FkD6KLC1ypclouii+BJheVH2rEXrwmmBzSqttXgLwPgNBRmeFMolPMeV7Xf4QfNkOLXfASyHBNMf+SkEPMoCUIFSwvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1d/Xp/r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1d/Xp/r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46D6C116C6;
	Tue, 10 Feb 2026 10:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770720672;
	bh=eu+8OBuxQWIHoroErUITLl3I7I6OtXdoYBcNlotAj6Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I1d/Xp/rcl4IeTF5fdn9/ygkJvNn2FfYzODBcmIYmvE+j3XJTxofqB+rfeNzNzHUO
	 zjf7EvEwETfs6+zzYPWMzPHcaWhnUXGr3aNnFDtzKAyX4zhu35BT3j4GvjTqnhVBz6
	 Kyt54SY2T3cZV4tsvdhnTT4ZILKqxwcD6JU02ymC3Ag6z3tMfaodfLj2mbhS7Bxyap
	 IrFlab8vGPyf0A2bDVQ9dYb7Cw6JBxMqY8IltTx3MgKLXfgNlb1AZ/TG+TyEYAzXZX
	 1xYrDkt94qelMyQtEZgzYvIAZN7iREfLWL2wCJPnv+rW1P6kAeVGVoqoeFGZ9fkZ1Q
	 k+XpsdGPiejsQ==
Message-ID: <1300929e-7b47-45d2-a863-778fd3012a76@kernel.org>
Date: Tue, 10 Feb 2026 11:51:09 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] regulator: s2mps11: drop redundant sanity checks in
 s2mpg10_of_parse_cb()
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20260209-s2mpg1x-regulators-fixes-v1-0-ead348e64e14@linaro.org>
 <20260209-s2mpg1x-regulators-fixes-v1-1-ead348e64e14@linaro.org>
 <170a820d-b987-4fd7-acca-ac88bab9e243@kernel.org>
 <4f1b1d857c0ee17436cd61e97219f508bd89f917.camel@linaro.org>
 <1e8ee0ae-a74d-418a-80b1-4d2379614548@kernel.org>
 <0ee40d36397bfd4c04aea6ead07e42848203e9d6.camel@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <0ee40d36397bfd4c04aea6ead07e42848203e9d6.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/02/2026 10:37, André Draszik wrote:
> Hi Krzysztof,
> 
> On Tue, 2026-02-10 at 08:28 +0100, Krzysztof Kozlowski wrote:
>> On 10/02/2026 06:59, André Draszik wrote:
>>> Hi Krzysztof,
>>>
>>> On Mon, 2026-02-09 at 17:09 +0100, Krzysztof Kozlowski wrote:
>>>> On 09/02/2026 16:07, André Draszik wrote:
>>>>> The sanity checks being removed in this commit are useless as earlier
>>>>> code checks for out-of-bounds conditions already. They also are
>>>>> incorrect (as they're off-by-one).
>>>>>
>>>>> Simply remove this incorrect code.
>>>>>
>>>>> No functional change.
>>>>
>>>> If they are incorrect then how it could be "no functional change"? To me
>>>> original code looks buggy and this is a fix. Fix must have functional
>>>> change...
>>>
>>> Earlier code already checks for all conditions, including all error cases.
>>> So the code being removed here has no effect, as any potential error it
>>> could catch will already have been caught by earlier code. Removing it
>>> therefore doesn't change behaviour or functionality.
>>>
>>> I can reword to 'incomplete test' instead of 'incorrect code' if you think
>>> that's more clear?
>>
>> Perhaps you should mention which "one" in off-by-one that it has no impact.
> 
> OK.
> 
>> I also wonder why you left the second - ext_control_s2mpg11 - untouched.
> 
> Could you point me to it please? I'm not sure I see what you mean.

There is exact same line, which you touch here, ~20 lines below. At
least in linux-next from 5th Feb.

Best regards,
Krzysztof
