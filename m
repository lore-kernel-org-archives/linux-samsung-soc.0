Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8AD15E97;
	Fri,  5 Dec 2025 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764962807; cv=none; b=S6bbDKK0hYKdb/sQ3HLvTgquKsbRMtC2vNyEkvo7pHmef8Of8itW9Plb+GakeScTnn8aptH86u/W8x3gKOsob3ne48kurNl5Y5T7peHjB4L25RCKcQALiy0TTQ13fmzcG0ABL5wd11MUPd2nprERZ+oTlF5YLQuZnOz8SJcfYQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764962807; c=relaxed/simple;
	bh=IawpuH3pGSbbbYOSr3lCOXZQ+MybbjSUI01idbhIkx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dUJoqlXhUxev2Z1yNnc5jXAs52NPZ3+IG8u/ct+zkIZvjicQxLL3eUVywVuvHMTkVBTDEfKrQLZn6SWSQCr/4+E/zZdAxZODBTS1tA5Tu8XOnOxuMAC9LKeSTMRE0A20pQXhPEICs28XNoRabCddDdB1u9xPNRnbGTXq1fyqQe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g25bwwFH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g25bwwFH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CF6C4CEF1;
	Fri,  5 Dec 2025 19:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764962806;
	bh=IawpuH3pGSbbbYOSr3lCOXZQ+MybbjSUI01idbhIkx0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g25bwwFHJWM9maXsbhvmqXnpj8+oVUxS7ZPRpaqHPC9dIv6A0V1UHv3g2wEEnMLky
	 m7OihGCwDAIytalk9cDxif2KXsQosyunNvf3tGf/TalKCfL/khrK9ohXUibg2vv82r
	 DY+mu4YxtW51BVjtYmTVdambsPiFBNw824yc3GQJOijnr6KaR6nJMKzdhJDJo6lIRB
	 lQ8dUdrLQCdSBg+GZukNA8akPsLPWAJlhC/++Ej1PmQk5v0oANSBw2HMotWVeGc4dw
	 XXKInEnqE4kH8DhMyeNm2z+bf9janoEiufNLr+nQHPOHX0IHDZYDdEhp00Zg3y2U/D
	 GUdjY7e86FzpQ==
Message-ID: <988b3fcb-44db-45ca-823b-5ab13206bd04@kernel.org>
Date: Fri, 5 Dec 2025 20:26:41 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB
 PHY
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
References: <20251205-phyb4-v8-0-c59ea80a4458@google.com>
 <20251205-phyb4-v8-1-c59ea80a4458@google.com>
 <18eeb1c5-d21b-4505-b6a4-472f6e191864@kernel.org>
 <CA+zupgwa+m8Pa=+8shORaOA1OO6zoo6zYEojFS2UDuP0doBq7A@mail.gmail.com>
 <f32e0810-56f9-417e-abf6-0cc7b361bd15@kernel.org>
 <CA+zupgyxQisYBnLj9_3DtcN3R1Ugfv+-p-wimFp-hnqkhrrgyA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CA+zupgyxQisYBnLj9_3DtcN3R1Ugfv+-p-wimFp-hnqkhrrgyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/12/2025 20:11, Roy Luo wrote:
> On Fri, Dec 5, 2025 at 10:52 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 05/12/2025 19:47, Roy Luo wrote:
>>> On Fri, Dec 5, 2025 at 9:13 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 05/12/2025 04:54, Roy Luo wrote:
>>>>> Document the device tree bindings for the USB PHY interfaces integrated
>>>>> with the DWC3 controller on Google Tensor SoCs, starting with G5
>>>>> generation (Laguna). The USB PHY on Tensor G5 includes two integrated
>>>>> Synopsys PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo
>>>>> PHY IP.
>>>>>
>>>>> Due to a complete architectural overhaul in the Google Tensor G5, the
>>>>> existing Samsung/Exynos USB PHY binding for older generations of Google
>>>>> silicons such as gs101 are no longer compatible, necessitating this new
>>>>> device tree binding.
>>>>>
>>>>> Signed-off-by: Roy Luo <royluo@google.com>
>>>>
>>>> Why intentionally dropping the tag? How are you handling this patchset?
>>>> Rewrite every time from scratch?
>>>
>>> Hi Krzysztof,
>>>
>>> I dropped the tag because a new file is being modified in this version,
>>> Although it's just MAINTAINER file but I thought you might also want
>>> to take a look. I wasn't sure if modifying a new file qualifies as
>>> "substantial" so I erred on the side of caution. I should've called it
>>> out specifically in the change log. Sorry for the inconvenience.
>>
>> 1. so just squeeze that change into second patch and no need to ask for
>> re-review
> 
> That's a fair point. I will be more mindful of the review overhead
> going forward.
> 
>> 2. You did not read my complain fully, look:
>>
>>>
>>> Regards,
>>> Roy Luo
>>>
>>>>
>>>> <form letter>
>>>> This is a friendly reminder during the review process.
>>>>
>>>> It looks like you received a tag and forgot to add it.
>>>>
>>>> If you do not know the process, here is a short explanation:
>>>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
>>>> of patchset, under or above your Signed-off-by tag, unless patch changed
>>>> significantly (e.g. new properties added to the DT bindings). Tag is
>>>> "received", when provided in a message replied to you on the mailing
>>>> list. Tools like b4 can help here. However, there's no need to repost
>>>> patches *only* to add the tags. The upstream maintainer will do that for
>>>> tags received on the version they apply.
>>>>
>>>> Please read:
>>>> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>>>>
>>>> If a tag was not added on purpose, please state why and what changed.
>>
>> Where did you address this? You dropped the tag silently.
> 
> Why: a new file is being modified.
> What changed: MAINTAINER
> What's not changed:
> Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml

I don't know if you still did not get the problem or you think that I
really need that clear answer. So no, I do not need that clear answer, I
understood with first reply, but you kept explaining instead of
admitting that your changelog needs fixes. So I still do not believe you
understood the problem here and you might repeat the mistake.

I think you need someone in Google to coach in this process, because I
even gave you the exact link describing the process and what was
expected. I even pointed specific paragraph, so you don't need to read
entire file!

I assume you understood what should be done instead in this patchset.
Anyway, my previous tag applies if there were no bindings changes, but I
wasted too much time here to care anymore. The expectation from big
companies is they do not ask community to coach on basic submission
process. It's quite unfair to my spare, personal time after work,
considering how much big company is making. Big company should invest in
this coaching.


Best regards,
Krzysztof
