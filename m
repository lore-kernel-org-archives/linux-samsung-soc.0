Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5D73BB40;
	Thu, 18 Dec 2025 07:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766041619; cv=none; b=EjQkvCnmemlntozYSITJV43Hh81OizRotqpp7f6SGcMmOUurNK124Ya1CQf45Y4qXMeh3kWDTtN8MIUdSn1CFE7b87T0WUqquMzdG7deOTxEyWfw8WkgQ+mRg74JYQsE4gPHChTqEBTg0HpQNMatvYlZ4MoH87r1vAmBZ8lemDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766041619; c=relaxed/simple;
	bh=YFYxvtMZpBX6TwONToUJkBc+KEjZD1S1p7Ryp5dzo4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qS5N0kt3uE19qwRuV/3j8psQIynTWkKqXdLvb9S4FM46mn+zBnxIqdt6XxMhYR0Ngp7Yzuz4ksaSsWYJRfrmLuhTtodxRiqEeFWgHf7exOOO66Q8DIQuq5pOahaMgNhk7UcQJn8orK+wWnJhTMqJ6eSYlqlJqOzuuWC/iVU4jLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFSusGx6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFSusGx6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAE2C4CEFB;
	Thu, 18 Dec 2025 07:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766041618;
	bh=YFYxvtMZpBX6TwONToUJkBc+KEjZD1S1p7Ryp5dzo4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WFSusGx6O4HEvKZ26Mlj4SLrZlWjn6yHEd1AWqZHw8uJp6cRIPZACM5s8dGBMTe2t
	 Fztj9FwbcxEZmjpf6G/6ICKo8UpjBmN2R3i1H1m7OMk7l7LJ0DvwDlPn8geNsWFL+G
	 HNHzQssnUnPCYXKKoeQTIVmEtqDBUnMOdz/VdscEkIKXErdPEO/9N2OGhBTTCYWYP+
	 kjVLjc5RanVKOmKSfF/8pGK9WnpVTZ5UmrUUCnfqkAlYuQl8ltIODcM6hscCaubO6t
	 AlSNrzCzr3Oqc2GNFPqYpHgpU8ITqvh3VFf9xftShNeCuEDduFIhiwnZT1K1ofE3Mb
	 f6CdgeuPZNcqw==
Message-ID: <067e0b1f-ffb6-4f38-b4ac-8abdf46518ea@kernel.org>
Date: Thu, 18 Dec 2025 08:06:52 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Roy Luo <royluo@google.com>, Doug Anderson <dianders@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com>
 <2025120553-suffrage-divisive-5890@gregkh>
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>
 <2025121728-reliably-crabgrass-2601@gregkh>
 <CA+zupgxZCyNonfNPbGnFymGGOQuaWR1TsL+hujTbH4DEcfEt9Q@mail.gmail.com>
 <CAD=FV=U63F-wxwKDo9be6_X2P2zp6aTBjNghZRbXX1rn4jFNyg@mail.gmail.com>
 <CA+zupgyG4Nov0=jihSApp_3_0hy6YNZMkfOp6Q4-zmERFm10Ag@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CA+zupgyG4Nov0=jihSApp_3_0hy6YNZMkfOp6Q4-zmERFm10Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/12/2025 02:34, Roy Luo wrote:
> On Wed, Dec 17, 2025 at 12:14 PM Doug Anderson <dianders@google.com> wrote:
>>
>> Hi,
>>
>> On Wed, Dec 17, 2025 at 11:18 AM Roy Luo <royluo@google.com> wrote:
>>>
>>> On Wed, Dec 17, 2025 at 5:24 AM Greg Kroah-Hartman
>>> <gregkh@linuxfoundation.org> wrote:
>>>>
>>>> On Thu, Dec 04, 2025 at 11:14:39PM -0800, Roy Luo wrote:
>>>>> On Thu, Dec 4, 2025 at 10:05 PM Greg Kroah-Hartman
>>>>> <gregkh@linuxfoundation.org> wrote:
>>>>>>
>>>>>> On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
>>>>>>> +config USB_DWC3_GOOGLE
>>>>>>> +     tristate "Google Platform"
>>>>>>> +     depends on ARCH_GOOGLE || COMPILE_TEST
>>>>>>
>>>>>> There is no ARCH_GOOGLE in the tree now, so how is this supposed to
>>>>>> work?  Shouldn't tools that check for "invalid config options" trigger
>>>>>> on this?
>>>>>>
>>>>>> thanks,
>>>>>>
>>>>>> greg k-h
>>>>>
>>>>> Hi Greg,
>>>>>
>>>>> The menuconfig looks like the following and it doesn't complain:
>>>>> | Symbol: ARCH_GOOGLE [=ARCH_GOOGLE]
>>>>> | Type  : unknown
>>>>> |
>>>>> | Symbol: PHY_GOOGLE_USB [=y]
>>>>> | Type  : tristate
>>>>> | Defined at drivers/phy/Kconfig:104
>>>>> |     Prompt: Google Tensor SoC USB PHY driver
>>>>> |     Depends on: ARCH_GOOGLE || COMPILE_TEST [=y]
>>>>>
>>>>> According to Kconfig documentation [1], the unknown symbol
>>>>> would simply be evaluated as an "n", which is what we want.
>>>>> "Convert the symbol into an expression. Boolean and tristate
>>>>> symbols are simply converted into the respective expression
>>>>> values. All other symbol types result in ‘n’."
>>>>>
>>>>> In a different Kconfig documentation, an environment variable
>>>>> "KCONFIG_WARN_UNKNOWN_SYMBOLS" is there to detect
>>>>> undefined symbols in the "config input", but I can't find one that
>>>>> catches undefined symbols in the Kconfig tree itself.
>>>>>
>>>>> That is, the tool seems to allow this.
>>>>> However, if this turns out to be a major problem. I think we
>>>>> can either:
>>>>> - Remove ARCH_GOOGLE and leave COMPILE_TEST as
>>>>>   the only dependency. Then add ARCH_GOOGLE back
>>>>>   later once it's in the tree.
>>>>
>>>> Please do this.  I do not want to take patches that purposfully add
>>>> dependencies on config options that might, or might not, appear in the
>>>> future.  Please just remove all of the dependancies for now, as they are
>>>> not needed, right?
>>>>
>>>> thanks,
>>>>
>>>> greg k-h
>>>
>>> Greg,
>>>
>>> Yes, we can remove ARCH_GOOGLE for now.
>>> To clarify, we're not removing all of the dependencies, we still want
>>> to keep COMPILE_TEST for build tests, right?
>>> Please let me know if you think otherwise.
>>
>> I think you'd just remove all of them. Normally COMPILE_TEST just
>> allows folks to compile stuff even when they don't want the ARCH. We
>> can can add ARCH_GOOGLE back in later once the config exists.
>>
>> -Doug
> 
> Doug,
> 
> Thanks for chiming in. I'm hesitant to remove COMPILE_TEST
> because Greg specifically requested its inclusion in v7 [1].


What? No, that's not what Greg requested. Your COMPILE_TEST in current
form helps nothing in build testing. It makes absolutely no sense at all.

> Also it seems beneficial to get some build coverage before
> ARCH_GOOGLE is officially added to the tree.

And COMPILE_TEST like you wrote it does not give you that. Please first
read how this function works.

> Greg, could you clarify?

Can you first look at Linux kernel sources to see how this is properly
written?

> 
> [1] https://lore.kernel.org/linux-usb/2025112144-claw-recolor-49c3@gregkh/
> 
> Thanks,
> Roy


Best regards,
Krzysztof
