Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957E114A4F0;
	Thu, 16 Jul 2026 05:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784180822; cv=none; b=A5vH0dUBA3wUohrjT1C8eTUnsAXbN1Q/fHQDNKgWU79pT4f1R748Q6nf9YtnrN2EPbB0Lyto+t11XiPFBij/pHgJUydhym4HdInNWKheuxatK9N+VJRWQPL9hbHEAxFa5BEw7GIepuouHHNxvB/pbOpFfzF+GppToRGi9m3cg2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784180822; c=relaxed/simple;
	bh=klyCtiw9BJRz5ve1szfw6sZ+orowoD4bxhScUo9H/yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eOW/TIwsRr9UHGHONgEi9c6uQOVGtbacOy7Omi86qGx15lzYoE4BQ6Pcc1aE3hPSlDQuJzcIYRktaZ/I18nvvzvYwLwE9vzWvaGeAoowhRPn3NaQSIePDXDZNjz51hGxSXMK4HjV/1OfoL833Fgjs3a2Y2C2gXuI4XFDeskYZ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AlMNZLZT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AlMNZLZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4D81F000E9;
	Thu, 16 Jul 2026 05:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784180821;
	bh=D6ELJI/afA3hLpcYoUVARScHqI5khKHQg/6o2iZZYjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AlMNZLZTLtZAYOkt8TqyoNEZkjDaIyMpyb8Fu9q9m9pogq/1flWDmWX8QeIYZsQJl
	 ShgTI0QK4bkcp1JIWeGR9uT5jm3lRqnge4qdbWO25Krm4e5mWW8tyL0kkjmHz4NxVx
	 XiqNxBB7irSJ/HNFTjMAH1ucYjwzEb3m0Qlq1nzJNRBetG1LFlK5WImNai6EFKcK94
	 B11xMwnqobDM2vuKOq69mWEFHu0LQDBKugABXBjgMP/m3MId509Dd5cVhNu0SWrSOV
	 yhktcoVK1Tvfk5sivkypaY8e0GtxoCPqn9TJlKd4aymGyqYJWsgvIYJ8G3kEpfMd/3
	 uS2zkH2pzggWA==
Message-ID: <208b12fb-8f6f-4cc4-9517-bc59180aa094@kernel.org>
Date: Thu, 16 Jul 2026 07:46:54 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox
 bindings
To: Doug Anderson <dianders@chromium.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Joonwon Kang <joonwonkang@google.com>,
 Subhash Jadavani <sjadavani@google.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>,
 Brian Norris <briannorris@chromium.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org>
 <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/07/2026 18:49, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jul 14, 2026 at 9:51 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 15/07/2026 00:21, Douglas Anderson wrote:
>>> Introduce bindings for the MailBox Array IP block present in Laguna
>>> SoCs (AKA "lga", AKA "Google Tensor G5").
>>>
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>>
>>>  .../bindings/mailbox/google,mba.yaml          | 216 ++++++++++++++++++
>>
>> Filename must match compatible.
> 
> Whoops! Will fix in v2.
> 
> 
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - google,lga-mailbox-array
>>> +      - const: google,mailbox-array
>>
>> Don't use generic fallback. Just the SoCs.
> 
> Sure, if you insist.
> 
> In general the "mba" hardware is designed with enough identification
> registers that we should be able to autodetect which variant we're on.
> Thus, my hope is to not ever need to reference the SoC-specific
> variant in the driver itself. It's not the end of the world to use the
> "google,lga-mailbox-array" as the generic, I guess...
> 
> I don't suppose I can change your mind here? If we take
> "google,lga-mailbox-array" as the generic, then going foward a few
> generations we end up with:
> 
> properties:
>   compatible:
>     oneOf:
>       - const: google,lga-mailbox-array
>       - items:
>           - enum:
>               - google,next-mailbox-array
>               - google,nextnext-mailbox-array
>               - google,another-mailbox-array
>           - const: google,lga-mailbox-array

This is the expected appriach.

> 
> If we keep "google,mailbox-array" as the generic, then going forward a
> few generations we end up with this, which seems nicer / less
> confusing:
> 
> properties:
>   compatible:
>     items:
>       - enum:
>           - google,lga-mailbox-array
>           - google,next-mailbox-array
>           - google,nextnext-mailbox-array
>           - google,another-mailbox-array
>       - const: google,mailbox-array

It is the discouraged approach. I already have a few real examples for
Qualcomm when people added such generic mailbox and after some time it
turned out not generic. So people wanted to add an another generic one...

> 
> Sure, it means that if someone unexpectedly makes a new Google
> mailbox-array that's totally incompatible then the
> "google,mailbox-array" sounds too generic, but that doesn't feel like
> the end of the world. You could call the new mailbox array designed in

And there is simple solution, just use SoC compatibles. Everything is
elegant, simple and accurate.

> the year 2037 the "google,2037-mailbox-array" and things would overall
> be less confusing than using the "google,lga-mailbox-array" as the
> generic.
> 
> 
>>> +  reg:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: Host registers (not accessible to client)
>>> +      - description: Global registers (not present on newer IP blocks)
>>
>> You have only one SoC. One SoC has only one IP block, no?
> 
> Nope! There are several instances of the MBA IP block per SoC. I tried
> to explain the situation exhaustively, but there's always the tradeoff
> between explaining thoroughly and providing too much text.

That's ok, the "newer" is confusing.

> 
> To answer this specific question concretely, there is one MBA per
> remote processor. Looking at the downstream DTS, I see at least these
> MBA instances:
> * AOC (Always On Compute)
> * GSA (Google Security Anchor)
> * GDMC (Google Debug Monitor Core)
> * CPM (Central Power Manager)
> 
> Each of these 4 MBA instances has its own "global" registers.
> 
> To provide more context, each MBA instance can support communication
> beyond just the AP (Apps Processor). For instance, the AOC's MBA
> instance could be used to talk between the AOC and AP and also between
> the AOC and CPM. Let's take this as an example. In this case:
> 
> * The AOC is the "host" of this MBA.
> * The AP is a "client" of this MBA.
> * The CPM is another "client" of this MBA.
> 
> The AOC is the only one with access to the "host" registers.
> 
> Everyone (AOC, AP, CPM in this case) has access to the read-only
> "global" registers describing the MBA instance.
> 
> The clients have access to several banks of client registers, one per
> mailbox they can access. The host (AOC in this case) also has access
> to the client register spaces since that's where the shared message
> memory is located.
> 
> The overall MBA instance is best identified by the address of the host
> registers, even if the client (the AP in this case) can't access those
> registers.
> 
> On newer versions of the IP block the "global" register bank was
> removed and the read-only registers that were part of it were simply
> copied to each client instance.
> 
> Does that clarify?

Yeah, just s/on newer/on all/ ?

> 

> 
>>> +
>>> +  ranges: true
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 1
>>> +
>>> +patternProperties:
>>> +  "^mailbox@[0-9a-f]+$":
>>> +    type: object
>>> +    description:
>>> +      Each sub-node is a single-channel mailbox.
>>
>> This does not look like correct representation. You have one mailbox
>> controller with multiple mailboxes, not multiple mailbox controllers of
>> single channel boxes.
> 
> I spent quite a bit of time debating this when rewriting the driver.
> While we could certainly hack things into the existing "mailbox with a
> bunch of channels", IMO it would be a worse representation of the
> hardware.
> 
> I discussed this in the wall of text in this patch series, but
> re-hashing it here:
> 
> Each "mailbox" in the mailbox array is more like a full-fledged
> mailbox than a channel within a mailbox. Each (single-channel)
> mailbox:
> * Has its own client register space.

That's nothing special yet. Many providers of multiple resources have
these resources in dedicated registers. Arguing this, each GPIO in a
GPIO controller as well has its own register space so is basically a
GPIO controller on its own.

> * Has its own interrupt.

Just like GPIOs...

> * Can have a different amount of memory for messages.
> * Can have its own conventions for communication.

Well, this could be. But you still have one child per channel (cells=0)
and all children address space is in parent's space, so that's clear
indication. It's one controller with multiple, although some different,
channels.

> 
> If we tried to represent the mailbox array as a single mailbox with a
> bunch of channels, each instance would have a different number of
> "reg" entries and a different number of interrupts. We would also need

No, you would have only one device node. Very clean solution instead of
100 children for each individual mailbox.

It's the same with clocks (TI) - you do not get device node per clock,
even if TI did it 10 years ago. You do not get here device node per channel.

> an array describing the communication conventions for each channel.
> Can it be done? Yes. Is it ugly? Also, yes.
> 
> Further evidence that the hardware design intended "a bunch of
> mailboxes" rather than "a mailbox with channels" is that the IP block
> is called a "mailbox array". ;-)
Best regards,
Krzysztof
