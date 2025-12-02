Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5966821770B;
	Tue,  2 Dec 2025 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764668000; cv=none; b=SupQnXw4g8St+ZOMHZBTYb6cVyMXI9iia60M+0tzXc27ep3Xyj7uS8G/TuPsijyJi4UFByHDEwMXRClzQt/okV1rZpVnTJTF+TNu9H/Ww3Hc/MLaTMMO7N7Y2wNWttZBrnE1iLMLmF+cLc3wcEW/f+de1VFV4ZF0GKY9tVterew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764668000; c=relaxed/simple;
	bh=dXfXeRsOG1QiTIFUVAKiTF7MiYxReRFI6R5EL1w+Ewg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmZvFt4Qjy+riKFESjD6DdymuFObbkqBIWMy9z/xUNYTILcf3CGsoliOPX1MYfqnjhZPY8HtAjvvjFLLA9Oq7DIS3u6V22u8LxzmAifjkWyx1JDsXtHF0fLgpeZGJij1yMV5LaA5RfqPCX4iGHfBPWqY1sLBT52y+JDiMhILLK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMQQL9xZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMQQL9xZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4E7C4CEF1;
	Tue,  2 Dec 2025 09:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764668000;
	bh=dXfXeRsOG1QiTIFUVAKiTF7MiYxReRFI6R5EL1w+Ewg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HMQQL9xZNndEwCpW4y87WifwHAuErY3n4QQ419K057sf/inoQxhLE3AssmG9PMDcJ
	 oSeB+ARU95wHO5Hsqutkc6gdriVYD3jGYSbrqUHZtKDTpIKFwrGNMSrhF2Oc8ZH6ET
	 4D75qxMDY0Mk2FbnkwF8Sf1aA4l0nSoHrC/0L88zxx4T1cPFfeIrNe8wGOXOefhXui
	 WKPETgHHc0aTqrSfteLjeyXXqOVQAQxufD7DGzQjIzOHry/OWIqzMTAvsZbzExCIVH
	 ByZsGzwEZ48X0TXDVIVxL3rdh+MLfuNw4XYXMO7s6iu4UVo3oMfKgDGyrzB0vPwNjL
	 VLv8e/vhCqBuw==
Message-ID: <0039d36f-dfca-44e7-9898-11f9e3eb9b9d@kernel.org>
Date: Tue, 2 Dec 2025 10:33:14 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Roy Luo <royluo@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com>
 <2025112226-heave-refrain-53e6@gregkh>
 <CA+zupgwzQ5r=-_L79D74=9VRqRO94N0yTApHChM+Nu0cn1ss3w@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CA+zupgwzQ5r=-_L79D74=9VRqRO94N0yTApHChM+Nu0cn1ss3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/12/2025 10:01, Roy Luo wrote:
> On Sat, Nov 22, 2025 at 8:59 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Sat, Nov 22, 2025 at 09:32:06AM +0000, Roy Luo wrote:
>>> Add support for the DWC3 USB controller found on Google Tensor G5
>>> (codename: laguna). The controller features dual-role functionality
>>> and hibernation.
>>>
>>> The primary focus is implementing hibernation support in host mode,
>>> enabling the controller to enter a low-power state (D3). This is
>>> particularly relevant during system power state transition and
>>> runtime power management for power efficiency.
>>> Highlights:
>>> - Align suspend callback with dwc3_suspend_common() for deciding
>>>   between a full teardown and hibernation in host mode.
>>> - Integration with `psw` (power switchable) and `top` power domains,
>>>   managing their states and device links to support hibernation.
>>> - A notifier callback dwc3_google_usb_psw_pd_notifier() for
>>>   `psw` power domain events to manage controller state
>>>   transitions to/from D3.
>>> - Coordination of the `non_sticky` reset during power state
>>>   transitions, asserting it on D3 entry and deasserting on D0 entry
>>>   in hibernation scenario.
>>> - Handling of high-speed and super-speed PME interrupts
>>>   that are generated by remote wakeup during hibernation.
>>>
>>> Co-developed-by: Joy Chakraborty <joychakr@google.com>
>>> Signed-off-by: Joy Chakraborty <joychakr@google.com>
>>> Co-developed-by: Naveen Kumar <mnkumar@google.com>
>>> Signed-off-by: Naveen Kumar <mnkumar@google.com>
>>> Signed-off-by: Roy Luo <royluo@google.com>
>>> ---
>>>  drivers/usb/dwc3/Kconfig       |  13 +
>>>  drivers/usb/dwc3/Makefile      |   1 +
>>>  drivers/usb/dwc3/dwc3-google.c | 628 +++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 642 insertions(+)
>>>
>>> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
>>> index 4925d15084f816d3ff92059b476ebcc799b56b51..f58c70dabf108878cbefe0abea88572d9ae81e26 100644
>>> --- a/drivers/usb/dwc3/Kconfig
>>> +++ b/drivers/usb/dwc3/Kconfig
>>> @@ -200,4 +200,17 @@ config USB_DWC3_GENERIC_PLAT
>>>         the dwc3 child node in the device tree.
>>>         Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
>>>
>>> +config USB_DWC3_GOOGLE
>>> +     tristate "Google Platform"
>>> +     depends on COMPILE_TEST
>>> +     depends on OF && COMMON_CLK && RESET_CONTROLLER
>>
>> Shouldn't this be:
>>         depends on (OF && COMMON_CLK && RESET_CONTROLLER) || COMPILE_TEST
>>
>> I shouldn't have to enable those options to just get a build test here,
>> the apis should be properly stubbed out if those options are not
>> enabled, right?
>>
>> thanks,
>>
>> greg k-h
> 
> Hi Greg,
> 
> I agree with your interpretation of COMPILE_TEST but it doesn't
> seem to align with upstream convention. I found the following pattern

The problem is not in Greg's solution but your code:
	depends on COMPILE_TEST

which makes absolutely no sense because it means this cannot be used
anywhere (in reasonable terms).


> in several device driver Kconfig files (including but not limited to usb,
> pinctrl and phy).
> 
>     depends on COMPILE_TEST || ARCH_XXX
>     depends on CONFIG_A && CONFIG_B...
> 
> For this patch, the APIs exposed by OF, COMMON_CLK
> and RESET_CONTROLLER are properly stubbed out so
> I'm all good to go with your suggestion, but I'd like to make
> sure this approach is conventional.
> 
> I plan to add ARCH_GOOGLE as a dependency in the next
> version per [1], so the "depends on" would probably look like
> the following per your suggestion:
> 
>     depends on (OF && COMMON_CLK && RESET_CONTROLLER && ARCH_GOOGLE)
> || COMPILE_TEST
> 


No, instead depends ARCH_foo || COMPILE_TEST

and drop all other dependencies. You don't need them.


Best regards,
Krzysztof
