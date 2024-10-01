Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168991CDA02
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Oct 2024 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727811224; cv=none; b=F3Cx3bncHaKgBVoFhOSs5aJHFzix0dMjFdp5Om/Z+Qvc5xG1OLUEdeeIupG7HO8m07spYsxE1rM/qtkySHolYylCaPfwgYqo9GPC6cBu9KcY+Na6L6M8qBXnplkX6XMJZu+IJd3vr5HYpZhxQixCXjEYtOOTiKgr/HUSpcJNyoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727811224; c=relaxed/simple;
	bh=PcfUQw15Fp2R1vnMKp5yfXhMUsDQUDEarFYdUhEOmHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LR7BNf5OPUNI+gCxS80Fph2a4V+b+45m4JVvDMComnoDhpqRm/8Nd+Jp+tFfvhRsZNpAoekpOGxxXzu4wjQlxvE3dv3Z9Y3vSo+WNVIyCtlDITV8qUxR1A72aVI92sclfXotuD/bmBGPpHV/pLR6pWOE/C5kWoKECUa6+3sIuIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tIPvt0oK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tIPvt0oK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249E1C4CEC6;
	Tue,  1 Oct 2024 19:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727811223;
	bh=PcfUQw15Fp2R1vnMKp5yfXhMUsDQUDEarFYdUhEOmHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tIPvt0oKxwVGzrXyTIVsfUSukRvJPSnIFzMuQrL/1keVjzpiEMGq6oyQ+HsAx5Xs2
	 vxhY9CSSjCX58YgphUVt5dRN77ZLHZeYylzu0c1lUWJxL5zZrghvXMQHmQyHfUoah5
	 oK126JHJ498SWC8hm63WXsFmfU3K9jcayMUkmPXPZDcmVmfq3DBg/g1VrO9SrnNPpP
	 vH8W3Zb196l2JCrBfzTzc/QsnNh0jYH6+WQAZnSxgSebjuqj4ySRHj6bPhknMhzElg
	 moC7pUiOSCFS4iSe8G6FXmMbBRTqyR7mkLq1a+5SyjYdgnKoTjCKq4aSrlLNVxRs7/
	 /eZFjSoTSOaeQ==
Message-ID: <0132178d-2698-477a-b899-a22649e15635@kernel.org>
Date: Tue, 1 Oct 2024 21:33:38 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Exynos 9810 and Galaxy S9 (starlte)
To: rbredhat <rbredhat@pm.me>
Cc: Henrik Grimler <henrik@grimler.se>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 alim.akhtar@samsung.com, markuss.broks@gmail.com
References: <ox4aoUGD6zuhCHC7_mLpi2rzRKjicwSSI-S2L3fhvgVT-es-WoXTm2bYukU7QuWqmGjCO6Xn7rDZtafsHu-SW2OHaPhB8Y91gxEkLcK25nk=@pm.me>
 <20241001120130.GA6468@samsung-a5>
 <822f317e-d4f2-41de-a6be-162ab79b87b3@linaro.org>
 <SvziwnUV8woHQyfcdXtUC5VrRm3CRYA70oLsNewuzfe_l8gNKLCIBSnzK7AFyPinT-0lXclz8y7gbmADEKusYChGHan-aHCmJJQZJGKG2tE=@pm.me>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <SvziwnUV8woHQyfcdXtUC5VrRm3CRYA70oLsNewuzfe_l8gNKLCIBSnzK7AFyPinT-0lXclz8y7gbmADEKusYChGHan-aHCmJJQZJGKG2tE=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2024 20:59, rbredhat wrote:
> Krzysztof, Henrik, thank you for the reply.
> 
> First of all thanks to everyone who is working on adding support for older devices to the linux kernel and alternative OS (such as Lineageos and Postmarketos).
> 
>> Just FYI, the original email was sent to me already in private and I
>> responded. Although I am still confused what is actually the question here.
> 
> As an outside observer I see a lot of work has been done over the last 4 years to add support for Exynos9* based SoCs to the kernel. I understand that my question is rather directed to 

I have 100% opposite feeling. I see absolutely 0 (zero) work done over
last 4 years to add support for Exynos9* based SoCs to the kernel.


> Samsung and I was wondering if it is possible that all 

It's very tricky to answer to your emails because of lack of proper
wrapping. :(

> Exynos9* based SoCs will get at least basic support in mainstream anytime soon. 

No, they will not. No one from Samsung works on this. Probably one
person from community, thus with very limited resources, might be
working on it. So outcome is unlikely.

> If the answer is no, as a potential consumer I would like to know if Samsung is going to adopt Qualcomm's practices in mainstreming code for at least its newer SoCs?

Yeah, you should ask Samsung... but to my knowledge Samsung does not
care at all and will not support mainline on anything else than
Exynos850 and few Auto SoCs (there are few awesome folks from Samsung
who cared and still care about mainline). So answer is: Samsung is not
going to adopt Qualcomm practices.

> 
> From a hardware point of view Samsung devices are amazing and very robust. I can tell the old flagship models are still popular especially among the elderly users. But from a software point of view it is not safe to continue using my Galaxy anymore. It makes me sad and a little angry but I think its time to put this smartphone in the drawer and move on.

Well, we all know that :). Want long support, although still not
mainline, buy Google Pixel. For every other Android phone you are on
your own after two years.

Best regards,
Krzysztof

