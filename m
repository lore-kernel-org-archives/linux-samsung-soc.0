Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D791A8F68;
	Mon, 23 Dec 2024 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734963486; cv=none; b=XKiCuOUJ3tMbBTsKaPLlKix62jtxFPN296QtlA+LGM1W0oS+m5Ka3ACwKX4RrM/2lQocaT1wa7l82qJqU0Kj8lScsznHIy0Sx2rjCtL+jTha/n6305k2s7ZmyrLs5/CXpz989Vj4vHpy6WvvQvpCVi7M6t8Kp+weOSJZrPgGSuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734963486; c=relaxed/simple;
	bh=Dnx5jq8dk5gccywgJ8I1S6xTsLN9qwfE/Enn2jq1nSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q0WHSemZr7bya6QMav4FjvxnE55VbOK6Fc71aM06nf3pfFt10Tn2WPE8Bh8oDPaGtj+oH3rfOaCivPNl42wgYu/+3ZG7J0FBvnX13ZKSo+D1lbEeiqHvxlLzKfXiAl97A6GmCplRAQEqlwFF7OrAh1CzlwiHAeZRdXIkVntDYP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/R+imZt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/R+imZt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D96C4CED3;
	Mon, 23 Dec 2024 14:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734963486;
	bh=Dnx5jq8dk5gccywgJ8I1S6xTsLN9qwfE/Enn2jq1nSY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E/R+imZt5bguB8G1UuKlY9bV0MshcchxOe7IWOxHoZHmL9l2teeuLZbBav5xbUDjj
	 RBLEaatHYNdu3KT8aAPhhBUOBhaWDN9dh9MWcVTsCOv2n7V8GXPkaXIBSPfxtd7HxM
	 w3jXIhEp41wSk3K1r2kiYJ5sPU/WvRKZdN05dIJPXjns81NzraJaWZbcPVlaLVTQq4
	 FVS+G7FWN7fOscbsb5T4TfCmvW2rxtj88tF5C4pKOBknxW0wJQpJ+0jQjzv6X+rGol
	 RmbLTUA6Py2PsPvRTXz26+mSZbLo3v1igqRQMRDwXmJ2JQlwn0oDNBEXApPvOwYr2D
	 1wgiarhGV5dwg==
Message-ID: <57d5cb47-5c4b-4334-98af-4fb842995366@kernel.org>
Date: Mon, 23 Dec 2024 15:18:00 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: exynos: gs101-pixel: add generic
 gs101-based Pixel support
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
 <20241220-gs101-simplefb-v2-2-c10a8f9e490b@linaro.org>
 <33c7a520-dda9-4d3c-aa27-2f48786996a9@kernel.org>
 <e85505c808661bedf2cca2433ef4c06038505a5f.camel@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <e85505c808661bedf2cca2433ef4c06038505a5f.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/12/2024 08:59, André Draszik wrote:
> Hi Krzysztof,
> 
> On Sun, 2024-12-22 at 12:42 +0100, Krzysztof Kozlowski wrote:
>> On 20/12/2024 12:27, André Draszik wrote:
>>> In order to support Pixel 6 (Oriole), Pixel 6 Pro (Raven), and Pixel 6a
>>> (Bluejay) correctly, we have to be able to distinguish them properly as
>>> we add support for more features.
>>>
>>> For example, Raven has a larger display. There are other differences,
>>> like battery design capacity, etc.
>>>
>>> To facilitate this, we create a generic gs101-based Pixel DT that can
>>> work on any such gs101-based device. At the same time, we move the
>>
>> No, whatever insanity Android has there, please don't populate it to
>> upstream.
>>
>> There is no such thing as "generic board" thus cannot be a
>> "generic DTS".
> 
> I'll rephrase to gs101-based Pixel base board. Unless you have a better
> suggestion.
> 
>>
>>> Oriole specific parts that we have at the moment (display) into an
>>> overlay, making it easy to add support for Raven and Bluejay in a
>>> similar way.
>>>
>>> Note1:
>>> Despite being an overlay, we instruct kbuild to create a merged
>>> gs101-oriole.dtb and a gs101-oriole.dtbo. This way existing scripts can
>>> keep working, but it also gives the option to just apply the overlay
>>> before boot (e.g. by the bootloader).
>>>
>>> Note2:
>>> I've changed the simple-framebuffer node to specify the memory via
>>> memory-region instead of reg, as that avoids unnecessary duplication
>>> (of the size), and it avoids having to specify #address-cells
>>> and #size-cells in the chosen node (and duplicating this in the DTSO),
>>> which is otherwise necessary to keep dt_binding_check happy and DT
>>> validation working in general.
>>>
>>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
>>> ---
>>> Note: MAINTAINERS doesn't need updating, it covers this whole directory
>>> ---
>>>  arch/arm64/boot/dts/exynos/google/Makefile         |  6 ++--
>>>  .../arm64/boot/dts/exynos/google/gs101-oriole.dtso | 33 ++++++++++++++++++++++
>>>  .../{gs101-oriole.dts => gs101-pixel-generic.dts}  | 24 +++++++---------
>>>  3 files changed, 47 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot/dts/exynos/google/Makefile
>>> index 0a6d5e1fe4ee..6e6b5319212a 100644
>>> --- a/arch/arm64/boot/dts/exynos/google/Makefile
>>> +++ b/arch/arm64/boot/dts/exynos/google/Makefile
>>> @@ -1,4 +1,6 @@
>>>  # SPDX-License-Identifier: GPL-2.0
>>>  
>>> -dtb-$(CONFIG_ARCH_EXYNOS) += \
>>> -	gs101-oriole.dtb \
>>> +dtb-$(CONFIG_ARCH_EXYNOS) += gs101-pixel-generic.dtb
>>> +
>>> +gs101-oriole-dtbs := gs101-pixel-generic.dtb gs101-oriole.dtbo
>>> +dtb-$(CONFIG_ARCH_EXYNOS) += gs101-oriole.dtb
>>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dtso b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dtso
>>> new file mode 100644
>>> index 000000000000..43572039cd07
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dtso
>>> @@ -0,0 +1,33 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Oriole Device Tree
>>> + *
>>> + * Copyright 2021-2023 Google LLC
>>> + * Copyright 2023-2024 Linaro Ltd
>>> + */
>>> +
>>> +/dts-v1/;
>>> +/plugin/;
>>> +
>>> +&{/} {
>>> +	model = "Oriole";
>>> +	compatible = "google,gs101-oriole", "google,gs101-pixel", "google,gs101";
>>
>> Boards are not overlays. Board equals DTB.
> 
> You're saying this should move into a dts instead of dtso?
> There are numerous boards upstream which use this same dtso
> approach.

Numerous? My quick look found zero. There are for specific
configurations, but not for boards. Look at something which could
support your case: imx8mm-kontron-dl.dtso
In first glance this is a board... but no! This is only about board with
display panel, because panel is detachable.

> 
> There is a base board, and also different versions of it,
> oriole being one of them.

Well, I did not see here baseboard - you renamed it.



Best regards,
Krzysztof
