Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B2E8287D;
	Tue, 22 Oct 2024 04:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729571929; cv=none; b=cGzG2hBxUPaQi+WE7doAOrUqEgjQND7Auy+zqyMUtDIgOVP7HN8dK5YfYWhZyQM+o3rVnf8lqi0kg0FuiYfEUXisTUuRSsvCq89P5JdjpouT8VoT3/jCQnNBwgNa5CVuYgLSkjC9NY3KdETqysngLPnVAUdB9mjMDofceD6HHf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729571929; c=relaxed/simple;
	bh=m9fJ30g4KbC4QgiV6lQeIX8I4OnF2LLRv6lk2aevZEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SyiG/qXC3E9PycFV65ya7/JHKHpaPSdLfHYVmwNtRdKNH6VChYc15h7RAbYmqfG4qeDA9x7ELktsQZi2KKpjSqTgDeyCM8duhiMJnisRV5IDIdRal+g6kIJdRF+IPB7xtu7vgsOIfB8Ia/CIBcpDxOSpN8YPVeZKAdFZy/Qjlkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMXCdV+n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMXCdV+n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B05CC4CEC7;
	Tue, 22 Oct 2024 04:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729571928;
	bh=m9fJ30g4KbC4QgiV6lQeIX8I4OnF2LLRv6lk2aevZEo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YMXCdV+nKwwGxrU6GUhY75NJ5LDAaMpF40nlln/NAHV4JELevfSCzHiSyqGlNLj/i
	 P0yUEk4fJtlH0VgEwOhHdCmuBbunUTrkFU54AturWbLWk1Yqiyk3Z3m79WLmEdu3Qq
	 FL7r4ZpbYjmNZzPXuFcKZyKuf0VrwtTdTeaOqG0e+RU4oQeNTEiiN44aMyq/dXoZ2/
	 DWDlNR1Po9jKHjOiSBsMIEo/eCRm7M9t9W/IFFxOzSbG44a2kKgYrLiB6ysj6GlG4o
	 dN0OmWknTa/qsIPxiIjgOSSIPtjCb78wF5/gk87tC3pYkOwIaEm0QIMnh+MPES7LrJ
	 dKmsHOsiGEUhw==
Message-ID: <1ece02e6-bf78-443a-8143-a54e94dd744c@kernel.org>
Date: Tue, 22 Oct 2024 06:38:39 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: add exynos acpm driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>, jassisinghbrar@gmail.com
Cc: alim.akhtar@samsung.com, mst@redhat.com, javierm@redhat.com,
 tzimmermann@suse.de, bartosz.golaszewski@linaro.org,
 luzmaximilian@gmail.com, sudeep.holla@arm.com, conor.dooley@microchip.com,
 bjorn@rivosinc.com, ulf.hansson@linaro.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, marcan@marcan.st, neal@gompa.dev,
 alyssa@rosenzweig.io, broonie@kernel.org, andre.draszik@linaro.org,
 willmcvicker@google.com, peter.griffin@linaro.org, kernel-team@android.com,
 vincent.guittot@linaro.org, daniel.lezcano@linaro.org
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-3-tudor.ambarus@linaro.org>
 <955530a5-ef88-4ed1-94cf-fcd48fd248b2@kernel.org>
 <d41ee8f6-9a2c-4e33-844a-e71224692133@linaro.org>
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
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <d41ee8f6-9a2c-4e33-844a-e71224692133@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/10/2024 16:12, Tudor Ambarus wrote:
> Hi, Krzysztof,
> 
> On 10/21/24 12:52 PM, Krzysztof Kozlowski wrote:
>> On 17/10/2024 18:36, Tudor Ambarus wrote:
>>> ACPM (Alive Clock and Power Manager) is a firmware that operates on the
>>> APM (Active Power Management) module that handles overall power management
>>> activities. ACPM and masters regard each other as independent
>>> hardware component and communicate with each other using mailbox messages
>>> and shared memory.
>>>
>>> The mailbox channels are initialized based on the configuration data
>>> found at a specific offset into the shared memory (mmio-sram). The
>>> configuration data consists of channel id, message and queue lengths,
>>> pointers to the RX and TX queues which are also part of the SRAM, and
>>> whether RX works by polling or interrupts. All known clients of this
>>> driver are using polling channels, thus the driver implements for now
>>> just polling mode.
>>>
>>> Add support for the exynos acpm core driver. Helper drivers will follow.
>>> These will construct the mailbox messages in the format expected by the
>>> firmware.
>>
>> I skimmed through the driver and I do not understand why this is
>> firmware. You are implementing a mailbox provider/controller.
> 
> In my case the mailbox hardware is used just to raise the interrupt to
> the other side. Then there's the SRAM which contains the channels
> configuration data and the TX/RX queues. The enqueue/deque is done
> in/from SRAM. This resembles a lot with drivers/firmware/arm_scmi/, see:
> 
> drivers/firmware/arm_scmi/shmem.c
> drivers/firmware/arm_scmi/transports/mailbox.c

Wait, SCMI is an interface. Not the case here.

> 
> After the SRAM and mailbox/transport code I'll come up with two helper
> drivers that construct the mailbox messages in the format expected by
> the firmware. There are 2 types of messages recognized by the ACPM
> firmware: PMIC and DVFS. The client drivers will use these helper
> drivers to prepare a specific message. Then they will use the mailbox
> core to send the message and they'll wait for the answer.
> 
> This layered structure and the use of SRAM resembles with arm_scmi and
> made me think that the ACPM driver it's better suited for
> drivers/firmware. I'm opened for suggestions though.

Sure, but then this driver cannot perform mbox_controller_register().
Only mailbox providers, so drivers in mailbox, use it.

> 
>>
>> I did not perform full review yet, just skimmed over the code. I will
>> take a look a bit later.
>>
> 
> No worries, thanks for doing it. I agree with all the suggestions from
> below and I'll address them after we get an agreement with Jassi on how
> to extend the mailbox core.
> 
> More answers below.
> 
>>>
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>> ---
>>>  drivers/firmware/Kconfig                    |   1 +
>>>  drivers/firmware/Makefile                   |   1 +
>>>  drivers/firmware/samsung/Kconfig            |  11 +
>>>  drivers/firmware/samsung/Makefile           |   3 +
>>>  drivers/firmware/samsung/exynos-acpm.c      | 703 ++++++++++++++++++++
>>
>> Please add directory to the Samsung Exynos SoC maintainer entry. I also
>> encourage adding separate entry for the driver where you would be listed
>> as maintainer.
> 
> ok
> 
>>
>> There is no firmware tree, so this will be going via Samsung SoC.
> 
> I noticed afterwards, thanks.
> 
>>
>>>  include/linux/mailbox/exynos-acpm-message.h |  21 +
>>>  6 files changed, 740 insertions(+)
>>>  create mode 100644 drivers/firmware/samsung/Kconfig
>>>  create mode 100644 drivers/firmware/samsung/Makefile
>>>  create mode 100644 drivers/firmware/samsung/exynos-acpm.c
>>>  create mode 100644 include/linux/mailbox/exynos-acpm-message.h
>>>
>>> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
>>> index 71d8b26c4103..24edb956831b 100644
>>> --- a/drivers/firmware/Kconfig
>>> +++ b/drivers/firmware/Kconfig
>>> @@ -267,6 +267,7 @@ source "drivers/firmware/meson/Kconfig"
>>>  source "drivers/firmware/microchip/Kconfig"
>>>  source "drivers/firmware/psci/Kconfig"
>>>  source "drivers/firmware/qcom/Kconfig"
>>> +source "drivers/firmware/samsung/Kconfig"
>>>  source "drivers/firmware/smccc/Kconfig"
>>>  source "drivers/firmware/tegra/Kconfig"
>>>  source "drivers/firmware/xilinx/Kconfig"
>>> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
>>> index 7a8d486e718f..91efcc868a05 100644
>>> --- a/drivers/firmware/Makefile
>>> +++ b/drivers/firmware/Makefile
>>> @@ -33,6 +33,7 @@ obj-y				+= efi/
>>>  obj-y				+= imx/
>>>  obj-y				+= psci/
>>>  obj-y				+= qcom/
>>> +obj-y				+= samsung/
>>>  obj-y				+= smccc/
>>>  obj-y				+= tegra/
>>>  obj-y				+= xilinx/
>>> diff --git a/drivers/firmware/samsung/Kconfig b/drivers/firmware/samsung/Kconfig
>>> new file mode 100644
>>> index 000000000000..f908773c1441
>>> --- /dev/null
>>> +++ b/drivers/firmware/samsung/Kconfig
>>> @@ -0,0 +1,11 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +config EXYNOS_ACPM
>>> +	tristate "Exynos ACPM (Alive Clock and Power Manager) driver support"
>>
>> depends ARCH_EXYNOS || COMPILE_TEST
> 
> oh yes.
>>
>> Please also send a arm64 defconfig change making it a module.
> 
> will do
> 
> cut
> 
>>> +
>>> +/**
>>> + * struct exynos_acpm_shmem_chan - descriptor of a shared memory channel.
>>> + *
>>> + * @id:			channel ID.
>>> + * @reserved:		reserved for future use.
>>> + * @rx_rear:		rear pointer of RX queue.
>>> + * @rx_front:		front pointer of RX queue.
>>> + * @rx_base:		base address of RX queue.
>>> + * @reserved1:		reserved for future use.
>>> + * @tx_rear:		rear pointer of TX queue.
>>> + * @tx_front:		front pointer of TX queue.
>>> + * @tx_base:		base address of TX queue.
>>> + * @qlen:		queue length. Applies to both TX/RX queues.
>>> + * @mlen:		message length. Applies to both TX/RX queues.
>>> + * @reserved2:		reserved for future use.
>>> + * @polling:		true when the channel works on polling.
>>> + */
>>> +struct exynos_acpm_shmem_chan {
>>> +	u32 id;
>>> +	u32 reserved[3];
>>> +	u32 rx_rear;
>>> +	u32 rx_front;
>>> +	u32 rx_base;
>>> +	u32 reserved1[3];
>>> +	u32 tx_rear;
>>> +	u32 tx_front;
>>> +	u32 tx_base;
>>> +	u32 qlen;
>>> +	u32 mlen;
>>> +	u32 reserved2[2];
>>> +	u32 polling;
>>
>> Why are you storing addresses as u32? Shouldn't these be __iomem*?
> 
> This structure defines the offsets in SRAM that describe the channel
> parameters. Instances of this struct shall be declared indeed as:
> 	struct exynos_acpm_shmem_chan __iomem *shmem_chan;
> I missed that in v2, but will update in v2.
> 
>>
>> I also cannot find any piece of code setting several of above, e.g. tx_base
> 
> I'm not writing any SRAM configuration fields, these fields are used to
> read/retrive the channel parameters from SRAM.

I meany tx_base is always 0. Where is this property set? Ever?

> 
> cut
> 
>>> +
>>> +	spin_lock_irqsave(&chan->tx_lock, flags);
>>> +
>>> +	tx_front = readl_relaxed(chan->tx.front);
>>> +	idx = (tx_front + 1) % chan->qlen;
>>> +
>>> +	ret = exynos_acpm_wait_for_queue_slots(mbox_chan, idx);
>>> +	if (ret)
>>> +		goto exit;
>>> +
>>> +	exynos_acpm_prepare_request(mbox_chan, req);
>>> +
>>> +	/* Write TX command. */
>>> +	__iowrite32_copy(chan->tx.base + chan->mlen * tx_front, tx->cmd,
>>> +			 req->txlen / 4);
>>> +
>>> +	/* Advance TX front. */
>>> +	writel_relaxed(idx, chan->tx.front);
>>> +
>>> +	/* Flush SRAM posted writes. */
>>> +	readl_relaxed(chan->tx.front);
>>> +
>>
>> How does this flush work? Maybe you just miss here barries (s/relaxed//)?
> 
> I think _relaxed() accessors should be fine in this driver as there are
> no DMA accesses involved. _relaxed() accessors are fully ordered for
> accesses to the same device/endpoint.
> 
> I'm worried however about the posted writes, the buses the devices sit
> on may themselves have asynchronicity. So I issue a read from the same
> device to ensure that the write has occured.

Hm, ok, it seems it is actually standard way for posted bus.

> 
> There is something that I haven't dimistified though. You'll notice that
> the writes from above are on SRAM. I enqueue on the TX queue then
> advance the head/front of the queue and then I read back to make sure
> that the writes occured. Below I write to the controller's interrupt
> register (different device/endpoint) to raise the interrupt for the
> counterpart and inform that TX queue advanced. I'm not sure whether I
> need a barrier here to make sure that the CPU does not reorder the
> accesses and raise the interrupt before advancing the TX queue. If
> someone already knows the answer, please say, I'll do some more reading
> in the meantime.

I think it is fine.


Best regards,
Krzysztof

