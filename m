Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B00B316185;
	Mon, 17 Nov 2025 06:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763362524; cv=none; b=fY7aNeE5l4H7dtbx09aI5LMdcqwkxh0FRb+1jvacrATDFQIBKtCy/7ZzFUffjxQas/DPTcKZ3/eX9Ba09fAMiyWkmRLoNm2FOtK69SLVe0fUq+8fanD0xJEFCM/hJxREg+jkqwN/NloXheW0Xs9cAmzNzUEQ5hx4mvBrPUvYnd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763362524; c=relaxed/simple;
	bh=9m0g9RdT2GsxvOefGSn7jLmb2h2nyt97yghl0tAb1jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g7oGSFbFq464wu5RaSMAo7KNRU2qV1Cz1dw+Mtg878a73Qb6mwXuiMfDCeLg0JX8twt6NBY5z/pWNj/ZqC4TMfaCNAlvfwufWTcgZiLp4ocE0Rtmm0xCErgPx+sJmBMySuczi10GyTUa88VomLW//bd7s8GIj1XXncIU8EeS8mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUgI4g43; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUgI4g43"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F79AC116B1;
	Mon, 17 Nov 2025 06:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763362523;
	bh=9m0g9RdT2GsxvOefGSn7jLmb2h2nyt97yghl0tAb1jI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VUgI4g43/KCVs8UHB0nnC6obtIVQs1wvUmd3CGTiKm6jxNcYlTnEPti/OI2AqjVqO
	 k/LyNILzhqY7CDnSn9oP7xXUmPc1tZQcdpp0W5DSZEmvMvDyaamZekhUEadIjfxbuG
	 cz+43KP3j1/a6G6HxbpA6zJvsPNJ9kSNqWoDehQDVmgAR9cW/9VPWTS6urHdLm05To
	 eoCKvqULMMSBSrDyT4PWcCiB6Woi1wfzF18AFCC00fZfBje/EZSg6kiCdEUhyEyuZR
	 3aMXLEbZggT0xwbiyieaId9ktuCwzFSL8kcWT2ZCCovV66Yk5sZBRHPMFlgr0JrsDT
	 GJBHYRchjaGAg==
Message-ID: <5180555c-b9c2-498b-af53-dff9ddc7f676@kernel.org>
Date: Mon, 17 Nov 2025 07:55:18 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: google: Add initial dts for frankel,
 blazer, and mustang
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org,
 Roy Luo <royluo@google.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Julius Werner <jwerner@chromium.org>,
 William McVicker <willmcvicker@google.com>, linux-kernel@vger.kernel.org
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.4.I5032910018cdd7d6be7aea78870d04c0dc381d6e@changeid>
 <40e67c6d-2430-483b-b4b1-0220ffbd6418@kernel.org>
 <CAGXv+5Gx+skrUR3PXt=RSL8YyKZYeQCkJ-3qW9wtrHrr9aqWAg@mail.gmail.com>
 <312ca473-77a6-4b95-b558-bb121294fbc9@kernel.org>
 <CAGXv+5EdkibBaB1-AyyfYO-STtmZzvTh1t-p+QW3jGb8cHY5wg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAGXv+5EdkibBaB1-AyyfYO-STtmZzvTh1t-p+QW3jGb8cHY5wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/11/2025 07:43, Chen-Yu Tsai wrote:
> On Wed, Nov 12, 2025 at 5:49 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 12/11/2025 10:35, Chen-Yu Tsai wrote:
>>> On Wed, Nov 12, 2025 at 4:14 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 11/11/2025 20:22, Douglas Anderson wrote:
>>>>> Add barebones device trees for frankel (Pixel 10), blazer (Pixel 10
>>>>> Pro), and mustang (Pixel 10 Pro XL). These device trees are enough to
>>>>> boot to a serial prompt using an initramfs.
>>>>>
>>>>> Many things can be noted about these device trees:
>>>>>
>>>>> 1. They are organized as "dts" files for the main SoC and "dtso"
>>>>>    overlays for the boards. There is discussion about this in the
>>>>>    bindings patch ("dt-bindings: arm: google: Add bindings for
>>>>>    frankel/blazer/mustang").
>>>>> 2. They won't boot with the currently shipping bootloader. The current
>>>>>    bootloader hardcodes several paths to nodes that it wants to update
>>>>>    and considers it a fatal error if it can't find these nodes.
>>>>>    Interested parties will need to wait for fixes to land and a new
>>>>>    bootloader to be rolled out before attempting to use these.
>>>>> 3. They only add one revision (MP1) of each of frankel, blazer, and
>>>>>    mustang. With this simple barebones device tree, there doesn't
>>>>>    appear to be any difference between the revisions. More revisions
>>>>>    will be added as needed in the future. The heuristics in the
>>>>>    bootloader will pick the MP1 device tree if there are not any
>>>>>    better matches.
>>>>> 4. They only add the dts for the B0 SoC for now. The A0 SoC support
>>>>>    can be added later if we find the need.
>>>>> 5. Even newer versions of the bootloader will still error out if they
>>>>>    don't find a UFS node to add calibration data to. Until UFS is
>>>>>    supported, we provide a bogus UFS node for the bootloader. While
>>>>>    the bootloader could be changed, there is no long-term benefit
>>>>>    since eventually the device tree will have a UFS node.
>>>>> 6. They purposely choose to use the full 64-bit address and size cells
>>>>>    for the root node and the `soc@0` node. Although I haven't tested
>>>>>    the need for this, I presume the arguments made in commit
>>>>>    bede7d2dc8f3 ("arm64: dts: qcom: sdm845: Increase address and size
>>>>>    cells for soc") would apply here.
>>>>> 7. Though it looks as if the UART is never enabled, the bootloader
>>>>>    knows to enable the UART when the console is turned on. Baud rate
>>>>>    is configurable in the bootloader so is never hardcoded in the
>>>>>    device tree.
>>>>>
>>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>>>> ---
>>>>> To avoid fragmenting the discussion, IMO:
>>>>> * Let's have the discussion about using the "dts" for SoC and the
>>>>>   "dtso" for the boards in response to the bindings (patch #1).
>>>>
>>>> That's discussion here, bindings are irrelevant to this.
>>>>
>>>>> * If we want to have a discussion about putting "board-id" and
>>>>>   "model-id" at the root of the board overlays, we can have it
>>>>>   here. I'll preemptively note that the "board-id" and "model-id"
>>>>>   won't show up in the final combined device tree and they are just
>>>>>   used by the tool (mkdtimg). We could change mkdtimg to parse the
>>>>>   "compatible" strings of the overlays files (since I've put the IDs
>>>>>   there too), but official the docs [1] seem to indicate that
>>>>>   top-level properties like this are OK.
>>>>>
>>>>> In order for these device trees to pass validation without warnings,
>>>>> it's assumed you have my dtc patches:
>>>>> * https://lore.kernel.org/r/20251110204529.2838248-1-dianders@chromium.org
>>>>> * https://lore.kernel.org/r/20251110204529.2838248-2-dianders@chromium.org
>>>>>
>>>>> [1] https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/Documentation/dt-object-internal.txt?h=main
>>>>>
>>>>>  arch/arm64/boot/dts/google/Makefile           |   9 +
>>>>>  arch/arm64/boot/dts/google/lga-b0.dts         | 391 ++++++++++++++++++
>>>>>  .../arm64/boot/dts/google/lga-blazer-mp1.dtso |  22 +
>>>>>  .../boot/dts/google/lga-frankel-mp1.dtso      |  22 +
>>>>>  .../boot/dts/google/lga-mustang-mp1.dtso      |  22 +
>>>>>  .../boot/dts/google/lga-muzel-common.dtsi     |  17 +
>>>>>  6 files changed, 483 insertions(+)
>>>>>  create mode 100644 arch/arm64/boot/dts/google/lga-b0.dts
>>>>>  create mode 100644 arch/arm64/boot/dts/google/lga-blazer-mp1.dtso
>>>>>  create mode 100644 arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
>>>>>  create mode 100644 arch/arm64/boot/dts/google/lga-mustang-mp1.dtso
>>>>>  create mode 100644 arch/arm64/boot/dts/google/lga-muzel-common.dtsi
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
>>>>> index a6b187e2d631..276001e91632 100644
>>>>> --- a/arch/arm64/boot/dts/google/Makefile
>>>>> +++ b/arch/arm64/boot/dts/google/Makefile
>>>>> @@ -1 +1,10 @@
>>>>>  # SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>>>>> +
>>>>> +dtb-$(CONFIG_ARCH_GOOGLE) += \
>>>>> +     lga-blazer-mp1.dtb \
>>>>> +     lga-frankel-mp1.dtb \
>>>>> +     lga-mustang-mp1.dtb
>>>>> +
>>>>> +lga-blazer-mp1-dtbs          := lga-b0.dtb lga-blazer-mp1.dtbo
>>>>> +lga-frankel-mp1-dtbs         := lga-b0.dtb lga-frankel-mp1.dtbo
>>>>> +lga-mustang-mp1-dtbs         := lga-b0.dtb lga-mustang-mp1.dtbo
>>>>> diff --git a/arch/arm64/boot/dts/google/lga-b0.dts b/arch/arm64/boot/dts/google/lga-b0.dts
>>>>> new file mode 100644
>>>>> index 000000000000..83c2db4f20ef
>>>>> --- /dev/null
>>>>> +++ b/arch/arm64/boot/dts/google/lga-b0.dts
>>>>> @@ -0,0 +1,391 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
>>>>> +/*
>>>>> + * Google Tensor G5 (laguna) SoC rev B0
>>>>> + *
>>>>> + * Copyright 2024-2025 Google LLC.
>>>>> + */
>>>>> +
>>>>> +/dts-v1/;
>>>>> +
>>>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +#include <dt-bindings/interrupt-controller/irq.h>
>>>>> +
>>>>> +/ {
>>>>> +     model = "Google Tensor G5 rev B0";
>>>>> +     compatible = "google,soc-id-0005-rev-10", "google,lga";
>>>>
>>>> So that's SoC, thus must not be a DTS file, but DTSI.
>>>>
>>>> ...
>>>>
>>>>
>>>> ...
>>>>
>>>>
>>>>> diff --git a/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso b/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
>>>>> new file mode 100644
>>>>> index 000000000000..133494de7a9b
>>>>> --- /dev/null
>>>>> +++ b/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
>>>>
>>>> And that's a board, so DTS.
>>>>
>>>>> @@ -0,0 +1,22 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
>>>>> +/*
>>>>> + * Google Pixel 10 (frankel) MP 1
>>>>> + *
>>>>> + * Copyright 2024-2025 Google LLC.
>>>>> + */
>>>>> +
>>>>> +/dts-v1/;
>>>>> +/plugin/;
>>>>> +
>>>>> +#include "lga-muzel-common.dtsi"
>>>>> +
>>>>> +/ {
>>>>> +     board-id = <0x070306>;
>>>>> +     board-rev = <0x010000>;
>>>>
>>>> Undocumented ABI, which you cannot document because these properties are
>>>> not allowed. You cannot have them.
>>>
>>> This is part of the discussion I want to have at Plumbers. But I suppose
>>> we can start here.
>>
>> Then the patch should be called RFC as not yet ready for merging. :)
>>
>>>
>>> The Android DTB partition format uses six 32-bit integers for matching,
>>> as opposed to a compatible string used in FIT images. Two of the integers
>>> are the "id" and "rev" numbers in the example above. The remaining four
>>> are custom and left up to the (vendor) bootloader implementation.
>>>
>>> The values for these fields need to be stored somewhere with the .dts.
>>> The compiled DTB is useless if the user cannot build a proper image for
>>> the bootloader to consume, and that involves putting in the right numbers
>>> in these fields. The android "mkdtimg" tool can either take the values
>>> from some known properties within the DTB, or have them fed to it
>>> externally.
>>>
>>> So if we don't want these numbers in the dts itself, then we should come
>>> up with some format to store them beside the dts files.
>>
>> Re-iterating comment from Rob long time ago: adding such new properties
>> is fine, but they must come for more than one user and be universal
>> across these users.
> 
> Is Android universal enough? As mentioned above, Android defines some
> fields that it wants in its DTBO partition header. I am doubtful we
> could generalize further, since each bootloader scheme wants different
> things.

There is no such user of these bindings as "Android".

> 
>> And of course the ABI needs to be documented which did not happen here.
>>
>> I indeed said incorrectly that "properties are not allowed". The
>> properties could be allowed if we document them according to above Rob's
>> comment, but that did not happen.
>>
>> Adding these properties per one SoC vendor is not really allowed, like
>> qcom,board-id and qcom,msm-id, but maybe you intend to make it generic.
> 
> That is indeed not great. I believe this part predates the DTBO partition
> format, and is also related to how vendors split their base DTB and
> overlays, such as the scheme Doug presented.
> 
> Maybe the new Android Generic Boot Loader (GBL) work will provide
> unification. I will reach out to them to see what's happening in that space.
> 
>>> On a similar note, we would have a similar problem with FIT images and
>>> overlays. The FIT image format maps a (series of) compatible string(s)
>>> to one DTB and any number of overlays. If overlays are involved, then
>>> the compatible string cannot come from the DTB itself, and the mapping
>>> must be stored somewhere.
>>
>> I recall, although cannot find now references to, a email talk on the
>> list saying that such overlays should have their own compatible, thus
>> solving this mapping problem.
> 
> Rob provided it in the other thread. The per-overlay compatible allows
> identifying the overlay instead of using the filename, which I think
> is much appreciated. But we still need a mapping of what a final device
> compatible breaks down to.

Who is "we"? Linux does not care about that mapping. For user-space
"google,yoda-sku0" should be good enough.


> 
> For example, say we have the the following:
> 
> - product common base "google,yoda" (DTB)
> - codec option one "google,yoda-codec-rt5682i" (DTBO)
> - codec option two "google,yoda-codec-rt5682s" (DTBO)
> - WWAN module and SAR sensor option "google,yoda,wwan" (DTBO)
> 
> We then have different SKUs that are a combination of the above:
> 
> - product SKU "google,yoda-sku0"
>   combine "google,yoda", "google,yoda-codec-rt5682s", and "google,yoda,wwan"
> 
> - product SKU "google,yoda-sku4"
>   combine "google,yoda", "google,yoda-codec-rt5682i", and "google,yoda,wwan"
> 
> - product SKU "google,yoda-sku16"
>   combine "google,yoda" and "google,yoda-codec-rt5682s"
> 
> This is the mapping we have to put _somewhere_. The bootloader only
> knows about "google,yoda-skuXYZ" and "google,yoda", as described in
> the Chromebook boot flow document [1].
> 

The entire pathset is about Google Pixel so I really do not get how
Chromebook boot flow got here.

Best regards,
Krzysztof
