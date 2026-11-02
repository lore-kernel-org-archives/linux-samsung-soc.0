Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649384;
	b=kNWljvkqoiMH6mAMwydlV4LEq1iXb6COLKgbVqPRWi0W7WGxSkQh73kxvchghC9Umid6
	 48hUKNpiMbDwc2d14gPpqnrB65abY1yxAWtQghwzbFLu36y/ee5q28sYPuvtqDh4NHwYA
	 Gg14X1Rci7vin+ZCaHa+XP0wS1ydMperpW61onfgjOwj1qPlBGG182oU18MBOgeYUZPww
	 5Fhy6RXR1GJzhh/ZCgciColf5OdkBRQGQeZLJRZrwaTQuMaDUg8njvc0v8h4TqHkBaWBl
	 gBJ6WVK7fIdcL49aNOBbcxAe96CZX9jqobRpU7b20lhmtPdzaaHzWyOM2JKrKcAdTQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649384;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vkPZCke7hJTQZvbapbGPiCbZtFfQN8ihxhANSyaamAE=;
	b=yOGSYk7HMBX2a8BqhS0+xKYWj5NF3+bfE+va97YIeGc+bQyxhBGj3vGOmORi1CciuP3E
	 uagUU8qPLYYbBjiVXnd2lt1nbI15SXuF4Yjxc1QrPN+h4swsftzRxy5MYm+2+eAHHsTEr
	 rv4s0Ji4QmZ3jj1iSUbJgbeF9rH3E9Y12mRpUVkaBIlvgTS0tsGUvZSaMWjugTwGcwHnt
	 ZitCR9VxCGh9hAa7LPzUDHotAWeH3YS4UyzAgskwRLo6o8o9E5zG9i8SZVGhEy7gDNRGe
	 xQ4mIUUJo9D3GmZJKMEFFe0IIPezRR7qPD/G3OqZuV20Nus4/WV0KUmtq3zDVBJ0vdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W18AJjqn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18932606A32D;
	Mon,  2 Nov 2026 19:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W18AJjqn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6295F1F00A24;
	Mon,  2 Nov 2026 19:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793649383;
	bh=vkPZCke7hJTQZvbapbGPiCbZtFfQN8ihxhANSyaamAE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=W18AJjqn4zDwx3IwFZr0vMut0PvhGu9cc2jaTbjjO8tihCu2L4BNKKsRo4m2YokZE
	 dNafS2EKeUjsfDkpcL/J6V8PyOjvzBefc5vSiUdcJyE3LreRdEm9kSJbmaQsiqFVUv
	 F8pdYmsylQcF/dfL+E/0ETMr/9Nuf7fgrd0blq6n4/JbDH162o82qx4jUzbbIpHeje
	 axA84wR5lSHglb58Zgd3Qij6NK/f1JHM8h+VBZCcoGdQobhkAipBAeL+WL2q9MXKUx
	 F6d+adNM1vX+qnl2MLdIk67tkvD/3W5Kt1Z+je+2w/BZ9Ef2BtNwulOhop+cwQAAK7
	 jel3BI83VbKBQ==
Message-ID: <acd5e8bd-7577-42ab-89c1-6f406b3f3004@kernel.org>
Date: Mon, 2 Nov 2026 20:56:17 +0100
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos: tm2: fix wm5110 reset/ldoena GPIO
 properties
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
References: <20261026102658.968138-1-m.szyprowski@samsung.com>
 <179362278569.150793.16322788098732007689.b4-ty@b4>
 <CAL_JsqJ7mkOL6kBwjDV=-A99zpmHWTFdc+8TunXG5EfueiFDrQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAL_JsqJ7mkOL6kBwjDV=-A99zpmHWTFdc+8TunXG5EfueiFDrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/11/2026 20:12, Rob Herring wrote:
> On Mon, Nov 2, 2026 at 6:34 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>>
>> On Mon, 26 Oct 2026 11:26:56 +0100, Marek Szyprowski wrote:
>>> The wm5110 audio-codec node uses the legacy "wlf,reset" and
>>> "wlf,ldoena" property names without the standard "-gpios" suffix.
>>> gpiolib-of.c only recognizes these bare names as aliases for the
>>> correct "wlf,reset-gpios"/"wlf,ldoena-gpios" properties, and that
>>> alias support is compiled in only when CONFIG_MFD_ARIZONA and
>>> CONFIG_REGULATOR_ARIZONA_LDO1 are enabled. When those options are
>>> disabled, devm_gpiod_get() fails to find the GPIOs, leaving the
>>> codec without a working reset/LDO enable line.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] arm64: dts: exynos: tm2: fix wm5110 reset/ldoena GPIO properties
>>       https://git.kernel.org/krzk/linux/c/76ef3ed714ac178cda84ef39733d4f712e682081
> 
> Now in next:
> 
> arch/arm64/boot/dts/exynos:2:1
>    Schema warnings:1
>       2 audio-codec@0 (wlf,wm5110): Unevaluated properties are not
> allowed ('wlf,ldoena-gpios', 'wlf,reset-gpios' were unexpected)
> 

So no information about binding changes, no dependency and... I have no
clue how this passed tests, so actually never even verified against
bindings.

My CI is still working on this, but based on the report - dropping.

Best regards,
Krzysztof
