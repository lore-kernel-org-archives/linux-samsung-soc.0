Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BD5290F;
	Sun, 16 Feb 2025 09:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739698936; cv=none; b=hsb2huDcJEiMbZIOg4dT19PGhhB2nXRFX5eanreHTfSgCjCGgBDXw5bNxWrZJY5eM+DGMN2q7ppxFRfoCZTcO0qMaj5oD4DgFkWZ6ZDTYOjIxo5THYQZPbum8S5wc6mFXavxAIKr7nPTM18G8d2gzd5QULX9G5dgAaGdwtzwWC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739698936; c=relaxed/simple;
	bh=yPuBCMN9XIdBvxrumsPxF5C26IdTv+mfG7ZX3zZkuFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uWcQa8EH1AvVfW5j7BnZSU09WJtyOq7kq3yjXjb4CkXuV3EKT4xVAazrZ9mHqNpcNw5ujr9VN4ywpJOzUp6t3Zbqmq87gBSBgqjmHUqcsARtIkiEgHeHr8y8wUEdRqs95o1Jxzt6RxXECx5PHxbJ1+nk1QuzBkx/ckD0ax/B5zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjst3Uod; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjst3Uod"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE51C4CEDD;
	Sun, 16 Feb 2025 09:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739698936;
	bh=yPuBCMN9XIdBvxrumsPxF5C26IdTv+mfG7ZX3zZkuFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hjst3Uod31p29bdXJF46wjboMwy7VAccbIbkN2SEXbtG5KYbQeZ9IDhG/pCqdl3aM
	 qqRbvN3mc+KkDkODLopTCA/CkBLZrLQIA8e3DFamaFrbCzbgrGzPfV/VBu0pVwlDuI
	 Xw/AEATN8OG3cfg8XstDFiDHVOqDEirYdNfseozYvHGtElsy+IiaeMTM4Qxsj0lgp7
	 baFWpaMDgWugc2+1jR/QipKxJRI3k/0MG3QIWiOA6XvjwW6e0NpDATjkKeaVu+9oqA
	 M/Qm/r8cvvkn7GJiGHApUxKdQVkgWXOZajLQhsPCUYaWRrBM56cBZi04WDbuWK9HCy
	 N98RWxIV9niAg==
Message-ID: <23e8f626-e512-4e80-b6b8-8ff073bd37e6@kernel.org>
Date: Sun, 16 Feb 2025 10:42:09 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: exynos5-usbdrd: Fix broken USB on Exynos5422 (TYPEC
 dependency)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
References: <20250215094122.60535-1-krzysztof.kozlowski@linaro.org>
 <bc292f121afaacb29fdc7d600c72cb3008b6b56a.camel@linaro.org>
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
In-Reply-To: <bc292f121afaacb29fdc7d600c72cb3008b6b56a.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/02/2025 17:20, André Draszik wrote:
> Hi Krzysztof,
> 
> On Sat, 2025-02-15 at 10:41 +0100, Krzysztof Kozlowski wrote:
>> Older Exynos designs, like Exynos5422, do not have USB Type-C and the
>> USB DRD PHY does not really depend on Type-C for these devices at all.
>> Incorrectly added dependency on CONFIG_TYPEC caused this driver to be
>> missing for exynos_defconfig and as result Exynos5422-based boards like
>> Hardkernel Odroid HC1 failed to probe USB.
>>
>> Drop incorrect dependency and rely on module to be reachable by the
>> compiler.
>>
>> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Closes: https://krzk.eu/#/builders/21/builds/6139
>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Closes: https://lore.kernel.org/all/3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com/
>> Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notifier if required")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Patch for issue in linux-next
>> ---
>>  drivers/phy/samsung/Kconfig              | 1 -
>>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
>>  2 files changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
>> index 7fba571c0e2b..e2330b0894d6 100644
>> --- a/drivers/phy/samsung/Kconfig
>> +++ b/drivers/phy/samsung/Kconfig
>> @@ -81,7 +81,6 @@ config PHY_EXYNOS5_USBDRD
>>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>>  	depends on HAS_IOMEM
>> -	depends on TYPEC || (TYPEC=n && COMPILE_TEST)
> 
> This line ensures that PHY_EXYNOS5_USBDRD changes to M if
> TYPEC is M.


I know what it does. But it is not the correct way to express optional
dependency. COMPILE_TEST makes no sense here. Unless this was not meant
to be optional dependency, but then it is wrong because none of older
(or many other) devices depend on typec.

> 
>>  	depends on USB_DWC3_EXYNOS
>>  	select GENERIC_PHY
>>  	select MFD_SYSCON
>> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
>> index ff2436f11d68..e8a9fef22107 100644
>> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
>> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
>> @@ -1456,7 +1456,7 @@ static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *phy_drd)
>>  {
>>  	int ret;
>>  
>> -	if (!IS_ENABLED(CONFIG_TYPEC))
>> +	if (!IS_REACHABLE(CONFIG_TYPEC))
> 
> On arm64, the defconfig has TYPEC as module (while PHY_EXYNOS5_USBDRD
> defaults to y above), and therefore all following code is becomes
> disabled with your change on arm64.

In terms of defconfig, this could be fixed as simple as changing it to
module. This should be module for arm64, anyway.

In terms of users, that's indeed tricky runtime debugging issue, so
probably we need separate USBDRD_WITH_TYPEC symbol.

> 
> Can we find a different solution to unbreak arm32 and keep arm64
> defconfig working as intended?
> 
> Cheers,
> Andre'
> 


Best regards,
Krzysztof
