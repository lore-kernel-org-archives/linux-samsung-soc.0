Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81814384CF5;
	Thu, 10 Sep 2026 06:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789020980; cv=none; b=hvYld4Est4E5lUQ+qEyCx18o0lCcLKuOrrfo4/UZ7c7fEsiSQXi+U4FpdD0Z77sFVtB8OjfEdV9Khj2ODKJbYnGOYY84f3aT1puFhASlt/ZNvIWJMb4A3cE5EMl2Tp7PiYuW6cLzkMBfGnDB86wwvXcC98LGzl2Q/Pdd6fxXDZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789020980; c=relaxed/simple;
	bh=dy8JF2HPHqpbKppZPV0XvOy0C89bNiEmcRH7MGBdAB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1SFaZuXKeQ/oPZItLXOuA51YmZgvVQRxvWLuIp0ClT1VPLZSt2r8xronyIwqr4CF9hBTXNSEgBbYx7HJ9uSjXH2Km2lnVN2oxy3CN2dAIdMA7IzAo8drRmiSynYwpwB+I1j9tEySATiIYxJ2vnVkGMstIvJ69izOFljeMMKOWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRb6JNW/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRb6JNW/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D258E1F00893;
	Thu, 10 Sep 2026 06:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789020968;
	bh=h6Exf0e8vILsYNXuRufIR8cElvccbDJONMs+KKdJ0hs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iRb6JNW/uIyBGIC+b02KqPdx2+r9VaLnKuR5wE17VK6k56okkHiUb3tZWT2mP6RDu
	 3KIqIiuykcum2z8JXcgpRDEPk3OjwwkXTLr53LzeIwYNsfPU/TF3cXn8RR2+ZvFOPq
	 3xytP6LFyl3pexeKCqNUCI6ZY40w9QnNLCQIOWGThgbsW6qYyRYeXtVoeCd1wZGkPN
	 fV2DGDzhEne76CL5cYsKPtSdeCNOa9SZsUWyPaN51ckRr+rbrg1kV6VhTXLw2mFSFm
	 a0xbUkWBrV1wvJd4jdc0LeeU7kxILnh2f8xH1mxubodQJwwJQocaC+IPZPiVtF+NpW
	 jeuXxAlItUFXw==
Message-ID: <a05c4086-1681-44f4-88c6-de1073b0f5a6@kernel.org>
Date: Thu, 10 Sep 2026 08:16:02 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: fix typos in comments
To: Lee Jones <lee@kernel.org>
Cc: Botsz HUANG <huang.botsz@gmail.com>,
 Hemanth Selam <hemanth.selam@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org
References: <20260904122834.33723-1-hemanth.selam@gmail.com>
 <apwFlV97bLVlvsOJ@botszhome>
 <59747ea8-bd89-4dff-ba13-ff9c66318e8c@kernel.org>
 <20260909161454.GF2133376@google.com> <20260909161710.GG2133376@google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260909161710.GG2133376@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2026 18:17, Lee Jones wrote:
> On Wed, 09 Sep 2026, Lee Jones wrote:
> 
>> On Tue, 08 Sep 2026, Krzysztof Kozlowski wrote:
>>
>>> On 05/09/2026 14:05, Botsz HUANG wrote:
>>>> On Fri, Sep 04, 2026 at 05:58:28PM +0530, Hemanth Selam wrote:
>>>>> 2.48.1
>>>>>
>>>>
>>>> good job~
>>>> Acked-by: Botsz HUANG <huang.botsz@gmail.com>
>>>
>>> I don't think this is real identity. It always comes with other
>>> LLM-generated content - as in this case as well - from Nick Huang
>>> <sef1548@gmail.com>.
>>
>> sef1548@gmail.com is Googleable and appears to be legit.
>>
>> They also have commits dating back to May last year.
> 
> Botsz Huang is also a real name [0].
> 
> Now, whether they should be Acked-by:ing patches is another issue entirely!

But:
1. The questionable account only acks when sef1548 acks
2. Even the style is exactly the same repeating the same mistake of not
removing quoted text:
 - big wall of text
> LGTM
> Acked-by: Nick Huang <sef1548@gmail.com>

 - big wall of text
> good job~
> Acked-by: Botsz HUANG <huang.botsz@gmail.com>


Best regards,
Krzysztof
