Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A14347B4;
	Mon,  1 Jul 2024 08:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719821691; cv=none; b=QFVtfZpxRNEXAi6z7IMQoew2lWF+00f15R9MayhzzJNAJjRZs7rntSzgarws6bEqTpigl/rHMnbrUgbHnTpMBdQanfz8ZvMR++2+ay6cTdvw9vL2b9Aw3aLb2/RN/aKw7JMcHidUP6RmqBMpOq+1jQZEel91iq9Lbdyh8tvZn/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719821691; c=relaxed/simple;
	bh=tfEMQY0DKhDasKPat2xJnEEzu84z7QEZ76NcOgQR4/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIAE1h48IF2dK89MAHSLUk8/vdL7CKPefXxivBFT6zIrUSykEd75M60qPMnLOXiyg+bMlgXAUVmb/gZlxYvjx2SgoOcbUqkuAQjJF7CntliwNvp4muTllWZ8JRWOSxqzlBxVjsH9rHUSxDOQomZlgb/ulssMo/B6sIYYsln3VCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9orfJKf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9orfJKf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A36C116B1;
	Mon,  1 Jul 2024 08:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719821691;
	bh=tfEMQY0DKhDasKPat2xJnEEzu84z7QEZ76NcOgQR4/0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n9orfJKfo/JF/gjEsSdvufQ4A04I0O377SxQVyyh8Y3FJgP8Ivr8YtzggRolg71D2
	 /qUNsWs8YDyelGhondshLnS8K3EYF0ZSsPQp1jGF1r0FcDOnMREzkrsqCQ6GsxopWv
	 Rs1SCWhpNhVoKDyBt276HWNsrdNfZ9XBZMtaoeUnrDSy5vyX97yFYrr8F3qgds36zZ
	 k1+Atz8SMmt/fbYC+VgCiAaoq+uUJmYt7uc8BgHGX24JEcgVzysIZhAZ+x0VbQTEEM
	 +/SCTfSfKiLGwXz3IQVQg8SbSyS6RzcmIpJIAGyh1PWf8GUL0urLHjMDvRxHoBAMZq
	 aO8zZmBPpIk+Q==
Message-ID: <6defa043-ddf7-4de2-a9bf-a440c4ac1ec8@kernel.org>
Date: Mon, 1 Jul 2024 10:14:43 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add syscon-reboot and syscon-poweroff support for
 gs101/Pixel 6
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, cw00.choi@samsung.com,
 mturquette@baylibre.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20240626194300.302327-1-peter.griffin@linaro.org>
 <fd840123-31d5-4472-a755-ef6a47613e5c@kernel.org>
 <CADrjBPqLT7e_eV9=ykDXG7_p3j8yJTbQNAc_dXVVRDP7Vqbtag@mail.gmail.com>
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
In-Reply-To: <CADrjBPqLT7e_eV9=ykDXG7_p3j8yJTbQNAc_dXVVRDP7Vqbtag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/2024 14:10, Peter Griffin wrote:
> Hi Krzysztof,
> 
> On Thu, 27 Jun 2024 at 11:47, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 26/06/2024 21:42, Peter Griffin wrote:
>>> Hi Krzysztof,
>>>
>>> This series adds support for syscon-reboot and syscon-poweroff to gs101/Oriole.
>>> It has been tested with reboot and poweroff commands respectively.
>>>
>>> Note the syscon-reboot/poweroff has *runtime* dependencies on the exynos-pmu
>>
>> How does the runtime dependency manifests? Something get broken if there
>> are no dependencies? Or maybe reboot does not work, but probably it did
>> not work before, either?
> 
> Without [1] but with this series applied you will get an Serror
> interrupt and hang on poweroff, and reboot commands, as it will use a
> mmio syscon to write the protected register.
> 
> [   74.680240][    T1] reboot: Restarting system
> [   74.680322][    C0] SError Interrupt on CPU0, code
> 0x00000000be000011 -- SError
> [   74.680329][    C0] CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted
> 6.10.0-rc3-next-20240613-00009-g6ca503bd3c2b #476
> [   74.680336][    C0] Hardware name: Oriole (DT)
> [   74.680338][    C0] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT
> -SSBS BTYPE=--)
> [   74.680345][    C0] pc : _raw_spin_unlock_irqrestore+0x10/0x44
> [   74.680363][    C0] lr : regmap_unlock_spinlock+0x14/0x20
> [   74.680373][    C0] sp : ffff80008009bb40
> [   74.680375][    C0] x29: ffff80008009bb40 x28: ffff00da4587e158
> x27: ffffa38d3bc74708
> [   74.680386][    C0] x26: ffffa38d3d9c9ca8 x25: 0000000000000000
> x24: 0000000000000000
> [   74.680394][    C0] x23: 0000000000000000 x22: 0000000000000002
> x21: 0000000000000002
> [   74.680400][    C0] x20: 0000000000003a00 x19: 0000000000000000
> x18: ffffffffffffffff
> [   74.680407][    C0] x17: 0000000000000000 x16: ffffa38d3c6cf438
> x15: ffff80008009b6a0
> [   74.680414][    C0] x14: 0000000000000000 x13: ffff00dbb6980000
> x12: 00000000000007d4
> [   74.680421][    C0] x11: 000000000000029c x10: ffff00dbb6c40000 x9
> : ffff00dbb6980000
> [   74.680427][    C0] x8 : ffff80008009bc28 x7 : 0000000000000000 x6
> : 0000000000000000
> [   74.680434][    C0] x5 : ffffa38d3b83e074 x4 : 0000000000003a00 x3
> : 0000000000000000
> [   74.680440][    C0] x2 : ffffa38d3b831764 x1 : ffff00da40230000 x0
> : 0000000100000001
> [   74.680447][    C0] Kernel panic - not syncing: Asynchronous SError Interrupt
> 
> and
> 
> [   49.448590][    T1] reboot: Power down
> [   49.448747][    C0] SError Interrupt on CPU0, code
> 0x00000000be000011 -- SError
> [..]
> 
> Without the clk-gs101 critical clock change, poweroff command will
> hang, when shutting down UFS.
> 
> Without the exynos-pmu support for !atomic registers, the reboot
> command won't work when the DT is present as the register write to
> SYSTEM_CONFIGURATION register will fail.
> 
> [  114.525217][    T1] reboot: Restarting system
> [  114.525290][    T1] tensor_sec_reg_write(): SMC failed: -22
> [  115.525434][    T1] Unable to restart system
> [  116.025576][    T1] Reboot failed -- System halted
> 
> For poweroff, you are correct this has not been supported on Pixel 6
> so far upstream.
> 
> However `echo b > /proc/sysrq-trigger ` has worked in previous kernel
> releases (it would reset the system using Watchdog). With the
> syscon-reboot DT present, but without [1] this will cause a Serror and
> no longer restart the system which would be a regression.

Thanks, DTS will wait for the next cycle then.

Best regards,
Krzysztof

