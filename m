Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0511A3146
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Mar 2025 19:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741290137; cv=none; b=D6wRUzlSPtWZPaJ1muges0eGEqiLXpbw8rMtBUo9NoVhWkI4YAdLuwNNFJEXAzMA1Lt/Jx0Zs3OBXsLRhHWG11bhyiQCdICr8rzJt8PzbjvGkmzd4L7/q8OdfNdfTH1Cf/HdOcnCozxOJxzzgRl+fxNMCYp2F/Y297KzVdr6IaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741290137; c=relaxed/simple;
	bh=Z77xBBrUfH5ZPRljobWVKHffHWydKur5O6jls5w/Alg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XU9mWlxcIP8d78VGvyc7YJ9D80uMXSIeRf7ThD9SprNfLNOP1F690bcmH+xwvPGliBUgMEvFeukOjJ2Vxo/lXkbEml4SqA4Is/coXM0K+e+quCXjwzQ/D1cQYlRTJtd5CNZJxc0hkwUZSKp33Zl/ZkbO5bYU/ZlB1o3xl6oRcHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULrBsknf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULrBsknf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5916BC4CEE0;
	Thu,  6 Mar 2025 19:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741290135;
	bh=Z77xBBrUfH5ZPRljobWVKHffHWydKur5O6jls5w/Alg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ULrBsknfP4yE/U2ctm3grW0ne1Lj6Ngm5LQrYUbjUz8gkXUJUOa77IWvbhUI/PIjo
	 dY+XyqeAEMwtkbIZdX6TonLzTNFZP2uJOPeYdacQ6SzIV4HItAZbUT4sfHygx3sqkz
	 AxDEeT6qaTRoLjM0dTlY5xoIR3YD22Q6vK0uMXkiBXk9zNzacN7mbm22sFSpA3FSGg
	 qD9FgsmhT49538Pwk79g+MtYqOrzo2My74PnAO2wubPCEkVLDXEudoIOrJ2rr1Q0zk
	 39BAthEhEpWQ+cp5F6bZuaS4ujv6Qa4YUseU2+keL6UHco+2LYpu1mIezEJ0DlKzDj
	 cwHOfQ5KEcJZw==
Message-ID: <9020d114-1f6b-4e2b-be3f-76608ad14a8d@kernel.org>
Date: Thu, 6 Mar 2025 20:42:09 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Any pending patches on me for Samsung SoC? Closing applying cycle
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Denzeel Oliva <wachiturroxd150@gmail.com>
References: <56288828-c767-4198-8f5c-a891d169b6cd@kernel.org>
 <55501e08b586c9bb1178be658299207b@disroot.org>
 <10311a34-7774-42dd-92d5-37da57d8bfcb@kernel.org>
 <b1a18ae129de8515435b3adbb14bd0d2@disroot.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <b1a18ae129de8515435b3adbb14bd0d2@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/03/2025 19:37, Kaustabh Chakraborty wrote:
> On 2025-03-06 18:07, Krzysztof Kozlowski wrote:
>> On 06/03/2025 15:03, Kaustabh Chakraborty wrote:
>>> On 2025-03-05 19:45, Krzysztof Kozlowski wrote:
>>>> Hey,
>>>>
>>>> I went through my inbox and cleared my queue because I am approaching
>>>> end of applying cycle. I think I dealt with everything and pending
>>>> things are:
>>>>
>>>> 1. Exynos7870 SoC: waits for bindings,
>>>
>>> Is this possible to be merged? [1]
>>> It's over a month old at this point, seemingly left untouched.
>>
>> I don't have it in my inbox for some reason. Regardless, you want it to
>> be a binding, so is it going to be used also by U-Boot?
> 
> Don't have any plans with u-boot at the moment, though I'll likely consider
> it later. The macros are used with syscon-reboot-mode which helps switching
> modes from userland.

Exynos Auto added first binding for that, but I am not sure if we need
to keep going. Binding describes the interface, so for whom do you
describe it here? I can imagine downstream bootloader, but that is I
don't believe it is worth adding bindings for downstream.

If you it is not for downstream then it has to be for some other
upstream project. Which one?


> 
>>
>>>
>>> This one's also a build dependency for [2], as mentioned in its cover
>>> letter.
>>>
>>> [1] https://lore.kernel.org/all/20250204-exynos7870-bootmode-v1-1-0f17b3033c2d@disroot.org/
>>> [2] https://lore.kernel.org/all/174100756283.1496281.12555971793250210333.robh@kernel.org/
>>
>> Then it should not have been sent separately. Patchset should be split
>> by subsystem, so this belongs to soc with the rest.
> 
> Hmm, getmaintainer didn't report it as part of the soc subsystem, although
> the file path does have 'soc' in it. And thus I decided to kept it
> separate.
Yes, that's a missing path.

Best regards,
Krzysztof
