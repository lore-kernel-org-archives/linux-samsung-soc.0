Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB0F3876AB;
	Thu, 26 Feb 2026 06:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772088703; cv=none; b=jopIQmsqYBiyFfXt90AYojAUo1tR1W5uHT4StB3rS2od+VySCv1EBZrRMChyi152KfGmenlABK2VWuTLKTN2YG/40qkq5UG+ArBUJzZ5y+JRz0Jd0DyhHt9oP5V15ydnomwRTr+q+SdoW9VVgQByrsPiZMsYDYLe0QwLsLCff3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772088703; c=relaxed/simple;
	bh=EPcis5E6dgO1qz3kh+q3w1MutFbztm2Ji2wUIM2JyrY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VG2d/5IyemGOFHLA9bsC/2BCGL4/VtaQ6ZIcJu2kY9gRq3ySQhM28icq0vgzZhS/B+3KeUWS9ef1wPebBcy9m5cb9jMAB9TsKIvekf0tqYuh1qfrlg3Fx2XyNKDYRlzQdmTLf/XeGktMy3y6sQaRv5YXZCUnBBE0UGdjGcFAdbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMO0ncZd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMO0ncZd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE47C19422;
	Thu, 26 Feb 2026 06:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772088703;
	bh=EPcis5E6dgO1qz3kh+q3w1MutFbztm2Ji2wUIM2JyrY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=gMO0ncZdCQmwx+IziHQEbmLEfYXdQPx6lgKgAZcoaUNht8UCQztjAFPvO1CS/19qq
	 FyBYdl3//fxtgBUomEXCdtcY8FEuo640vrNh26GjerbGverHE7JGYesBLa0QQbFNSb
	 8lmFNoqY0tUOw+/b/+q1vNBTwvc/pB3BULkTabOY18BQ6UqS1jIpqYxbEt1CcAeQmv
	 P6o9Y99EFRirSUBST4BqPp9DUQsn7rB8Emd5YT6noRstY+bj1z/T0KE2Ipcfzw3AMW
	 RoV5bRR/6KIHWKEXdcZI5OgHcSEXEu0VJXsks9g6WsmUJscRG0lPHNwFfH5Ok6ZUM7
	 4lfx+6GeZZ9ww==
Message-ID: <0c91fa84-dd0e-45bf-9c08-3b374daed7ba@kernel.org>
Date: Thu, 26 Feb 2026 07:51:38 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: exynos: gs101: Enable AVS APDO
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Badhri Jagan Sridharan <badhri@google.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Amit Sunil Dhamne <amitsd@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226061053.2596167-1-badhri@google.com>
 <8eeadb7a-5075-4444-8714-45e589dda47f@kernel.org>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <8eeadb7a-5075-4444-8714-45e589dda47f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/02/2026 07:51, Krzysztof Kozlowski wrote:
> On 26/02/2026 07:10, Badhri Jagan Sridharan wrote:
>> Enable USB PD SPR AVS for gs101 by adding SPR AVS APDO to the sink caps
>> pusblished by gs101.
>>
>> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
>> ---
>> Depends-on:https://lore.kernel.org/lkml/20260226055311.2591357-1-badhri@google.com/
> 
> Really, how? If it depends on that, it is wrong and cannot be applied.
> DTS cannot depend on the hardware. NAK.

s/hardware/drivers/ obviously...

> 
>>
>>  arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
>> index 93892adaa679..5a689be61432 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
>> @@ -174,6 +174,7 @@ connector {
>>  						| PDO_FIXED_HIGHER_CAP
>>  						| PDO_FIXED_DUAL_ROLE))
>>  				     PDO_FIXED(9000, 2200, 0)
>> +				     PDO_SPR_AVS_SNK_APDO(3000, 3000)
>>  				     PDO_PPS_APDO(5000, 11000, 3000)>;
>>  			sink-vdos = <VDO_IDH(1, 1, IDH_PTYPE_PERIPH, 0,
>>  					     IDH_PTYPE_DFP_HOST, 2, 0x18d1)
>>
>> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
>> prerequisite-patch-id: 4dacd8bc550e317d67134d030814765fb9f4c6e1
>> prerequisite-patch-id: e863378fc602b6bee2e9fdd8c568003c00b2a38e
>> prerequisite-patch-id: 202a9e1e9cf27a0b9ff7ebea76eb45cdac2cb581
>> prerequisite-patch-id: f3817c560d0e701d7499fa1fb9ee40d22816c09e
>> prerequisite-patch-id: c071913307a6eaa417d1345485d7a9c165d40834
> 
> 5 patches here. This is confusing.

Best regards,
Krzysztof
