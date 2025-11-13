Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F96035CB78;
	Thu, 13 Nov 2025 16:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051660; cv=none; b=OcUJ33r01/CSH4oxNOXnR7MNFTJxBVVQA5HOMZ/O8PcD2glPgLnqimXkXT4ASEQh62L41EGEjvgbQNHeViFttG0V70HKfnnlnBEzFFOIkVQvQlDEfrKWWz5LSmWP9DJWHyHa7aST7984vOt9dqo1DNxkFlC15U2HYqw19UM3PP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051660; c=relaxed/simple;
	bh=qN6vkdRA+SD3osdiT+bql8/nbfPL5qfu0t44p2AElEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KWyyhcaXUtoCLeTOovv4vZsf9jOOI3sM22xmNbD/z3OyaxADN4VZ4DwrdRWDtBvzdYIIU4/+yGm+F1E2UgWB9TCFz61R+ShjTQ2RKRD1aSDDGHximdiwZzHGywS24D31V+lIkKvEzHQHo9TPFruE0hzazv1V70AbO/iISgoXwJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQKMGcvW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQKMGcvW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4A4C4CEF7;
	Thu, 13 Nov 2025 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763051659;
	bh=qN6vkdRA+SD3osdiT+bql8/nbfPL5qfu0t44p2AElEU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CQKMGcvW1owOb8kmjPFGLgUOupZ3TVEvmZc5tLkJE7HljUGcexPhg9cxvMhFTPk7p
	 6GfpSTvMleUxXNL9kt37fdgfezrp7xQ0DS5MwJPNi49WgIbe4QcM69xfwPGYA6ze5W
	 12KQRDjQ9WIua/7NQ/s+1ByaWpxedcoYMYaBV+++TxEiac6NliLtRPnLQ935WrBjg2
	 7naUVuCCaiPTTzp9DxfWOmU9zEZTKzkmWHj0hKFCyjpJt7kSF2PrXrq+ocgw46rcRz
	 iXjlqfsmCIqsO4TBkBrFf/tbr8t9qEgw8Aw2vM9fG9pkNYVoiqyvm+c8GT6sLqw8vP
	 Zuv9OeCZd/ngw==
Message-ID: <6490f20a-2492-4ee0-8f34-d529e0df0bad@kernel.org>
Date: Thu, 13 Nov 2025 17:34:14 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for
 frankel/blazer/mustang
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Roy Luo <royluo@google.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>,
 William McVicker <willmcvicker@google.com>, linux-kernel@vger.kernel.org
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
 <05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org>
 <CAD=FV=XXWK9pmZQvNk6gjkqe6kgLXaVENgz0pBii6Gai7BdL-A@mail.gmail.com>
 <00ea821c-5252-42cb-8f6f-da01453947bd@kernel.org>
 <CAD=FV=VSxeKgGcsRb9qiXq7nsbOWZjPvzmGEOhFA+pmABWdknQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAD=FV=VSxeKgGcsRb9qiXq7nsbOWZjPvzmGEOhFA+pmABWdknQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/11/2025 17:23, Doug Anderson wrote:
> Hi,
> 
> On Wed, Nov 12, 2025 at 11:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>>>>> +      # Google Tensor G5 AKA lga (laguna) SoC and boards
>>>>> +      - description: Tensor G5 SoC (laguna)
>>>>> +        items:
>>>>> +          - enum:
>>>>> +              - google,soc-id-0005-rev-00  # A0
>>>>> +              - google,soc-id-0005-rev-10  # B0
>>>>
>>>> SoCs cannot be final compatibles.
>>>
>>> Right. I talked about this at length "after the cut" in my patch. See
>>> above. I wish to relitigate this policy and wish to know more details
>>> about where it is documented, the reasons for decision, and where the
>>> boundary exactly lies between something that's allowed to be a final
>>> compatible and something that's not. I made several arguments above
>>> for why I think the SoC should be allowed as a final compatible, so it
>>
>> Because this represents a actual device users run. It is electronically,
>> physically impossible to run the SoC alone.
> 
> I'm not convinced that this definition is as clear as you're making it
> out to be. It's physically impossible to run many "boards" alone.
> 
> Want to boot up a Raspberry Pi? Provide it with power. Hook up a
> display to it. Hook up a keyboard to it. Plug in an Ethernet cable.
> Plug an SD card in it. Without those things it doesn't run.

But I can plug them...

> 
> Want to boot up a lga-B0 SoC? Hook up power to the power pins. Connect
> a MIPI panel to the MIPI pins. Connect a UFS chip to the UFS pins.
> Without those things it doesn't run.

These I cannot plug, it's impossible for me.

My clumsy fingers are too big for these pins.

And following your logic, we should have the compatible for the
transistors, because that's basically what SoC is made of.

> 
> Yes, the complexity of just "hooking up" the components on an SoC is
> an order of magnitude harder than a Raspberry Pi, but it's still just
> hooking it up to external components. In both cases, we are modeling
> the core "brains" (the part that contains the processor) as the DTB
> and everything else just "hooks up" to interfaces.

You mix the topics, so I don't follow. I speak here about bindings - you
cannot have the that compatible alone, because it is incomplete, just
like compatible for "transistor" is not correct in that context. You
speak what could or could be DTB, different topic.

> 
> If I had to make a definition for what the base DTB should be it
> should be the component with the boot CPU. _Why_ is that the wrong
> definition?
> 
> 
>> There are few - one or two - exceptions for the SoMs, but never for SoC.
> 
> OK, but the big question: _WHY???_
> 
> Where does it say that a DTB has to be something that can run "alone"

We don't discuss DTB here, but the top-level compatibles.

Why? Because DT spec says so.

"Specifies a list of platform architectures with which this platform is
compatible. "

And when you combine it with the standard definition of the
"compatible", it is not *a* "platform architecture" but *list* of
platform architectures describing this device as a whole.


Best regards,
Krzysztof
