Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422132FF167;
	Thu, 13 Nov 2025 07:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763018590; cv=none; b=Z/p878w5TVv+WGOemImopd9/iehCkiruldhwEDIV9lIfixD4WLnbvZpvZL5LhBb3wcUfHf/V5L5FXMBi6RKbI5u8Mv3GqssIJI5ecVYdGzDfduuR15frawvmH+DzfOChEFQ24E2FTcgzfr1HBLhwaRYiQ+sL/sxwHBMdJDXB7e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763018590; c=relaxed/simple;
	bh=x6exCT/jwQsyRSKnsqVBZEoI1kKZOy0U85qXSrekQxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+d9C3ePcq12gRh/wYY6lEbPBZA2heJ+o8x8k81jGAD8zu/lb0OMmbTA0X789uKum7CmSm1grr1UjmTsEMITj5/EmBh7SqNdpAZ184aq0oSmFafg8QbjBq836o1xhc6Bcyv+jtqWjZ5F6OZPXjlLML+UtT7ukyBnTfAqAk8tF08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8szyAkx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8szyAkx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254A9C116D0;
	Thu, 13 Nov 2025 07:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763018589;
	bh=x6exCT/jwQsyRSKnsqVBZEoI1kKZOy0U85qXSrekQxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T8szyAkxfKZnrgqLteWvFyKuRnRCQxwdlzdW+dx0E4wsCwaCCeV78cfCWuoZGonfz
	 fJQ3VyGDWoGWbKM4/gFtcWe38Re+z7MnB+jqkwv4PFo/GgkYGHvbd87JVGtfk0bwAW
	 WM1iYYw2ci1Cx09XW9YgLBPxZu+N/69iaFPmK4Qu7MuY1wcI3+5dxZ3dqbOwlgFuHI
	 2zI5RngSp1/lplQG9++t4/3GPqK2PGJudTmUXrNdFfAjoytIO6x6OwcQ8kssAXNtCK
	 A5y4yPzj2662DjoZxfRBzI2cwmi+ZvVBvKyfRgnrqqw9MYGfg1+KA8ynJ4yHIULG5Y
	 81PDbN0ktVZ/g==
Message-ID: <00ea821c-5252-42cb-8f6f-da01453947bd@kernel.org>
Date: Thu, 13 Nov 2025 08:23:04 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for
 frankel/blazer/mustang
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Roy Luo <royluo@google.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>,
 William McVicker <willmcvicker@google.com>, linux-kernel@vger.kernel.org
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
 <05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org>
 <CAD=FV=XXWK9pmZQvNk6gjkqe6kgLXaVENgz0pBii6Gai7BdL-A@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAD=FV=XXWK9pmZQvNk6gjkqe6kgLXaVENgz0pBii6Gai7BdL-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/11/2025 20:19, Doug Anderson wrote:
> Hi,
> 
> On Tue, Nov 11, 2025 at 11:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 11/11/2025 20:22, Douglas Anderson wrote:
>>> Add top-level DT bindings useful for Pixel 10 (frankel), Pixel 10 Pro
>>> (blazer), and Pixel 10 Pro XL (mustang).
>>>
>>> Since overlays are fairly well-supported these days and the downstream
>>> Pixel bootloader assumes that the SoC is the base overlay and specific
>>> board revisions are overlays, reflect the SoC / board split in the
>>> bindings.
>>>
>>> The SoC in the Pixel 10 series has the marketing name of "Tensor
>>> G5". Despite the fact that it sounds very similar to the "Tensor G4",
>>> it's a very different chip. Tensor G4 was, for all intents and
>>> purposes, a Samsung Exynos offshoot whereas Tensor G5 is entirely its
>>> own SoC. This SoC is known internally as "laguna" and canonically
>>> referred to in code as "lga". There are two known revisions of the
>>> SoC: an A0 pre-production variant (ID 0x000500) and a B0 variant (ID
>>> 0x000510) used in production. The ID is canonicaly broken up into a
>>> 16-bit SoC product ID, a 4-bit major rev, and a 4-bit minor rev.
>>>
>>> The dtb for all supported SoC revisions is appended to one of the boot
>>> partitions and the bootloader will look at the device trees and pick
>>> the correct one. The current bootloader uses a downstream
>>> `soc_compatible` node to help it pick the correct device tree. It
>>> looks like this:
>>>   soc_compatible {
>>>     B0 {
>>>       description = "LGA B0";
>>>       product_id = <0x5>;
>>>       major = <0x1>;
>>>       minor = <0x0>;
>>>       pkg_mode = <0x0>;
>>>     };
>>>   };
>>> Note that `pkg_mode` isn't currently part of the ID on the SoC and the
>>> bootloader always assumes 0 for it.
>>>
>>> In this patch, put the SoC IDs straight into the compatible. Though
>>> the bootloader doesn't look at the compatible at the moment, this
>>> should be easy to teach the bootloader about.
>>>
>>> Boards all know their own platform_id / product_id / stage / major /
>>> minor / variant. For instance, Google Pixel 10 Pro XL MP1 is:
>>> * platform_id (8-bits): 0x07 - frankel/blazer/mustang
>>> * product_id (8-bits):  0x05 - mustang
>>> * stage (4-bits):       0x06 - MP
>>> * major (8-bits):       0x01 - MP 1
>>> * minor (8-bits):       0x00 - MP 1.0
>>> * variant (8-bits):     0x00 - No special variant
>>>
>>> When board overlays are packed into the "dtbo" partition, a tool
>>> (`mkdtimg`) extracts a board ID and board rev from the overlay and
>>> stores that as metadata with the overlay. Downstream, the dtso
>>> intended for the Pixel 10 Pro XL MP1 has the following properties at
>>> its top-level:
>>>   board_id = <0x70506>;
>>>   board_rev = <0x010000>;
>>>
>>> The use of top-level IDs can probably be used for overlays upstream as
>>> well, but also add the IDs to the compatible string in case it's
>>> useful.
>>>
>>> Compatible strings are added for all board revisions known to be
>>> produced based on downstream sources.
>>>
>>> A few notes:
>>> * If you look at `/proc/device-tree/compatible` and
>>>   `/proc/device-tree/model` on a running device, that won't
>>>   necessarily be an exact description of the hardware you're running
>>>   on. If the bootloader can't find a device tree that's an exact match
>>>   then it will pick the best match (within reason--it will never pick
>>>   a device tree for a different product--just for different revs of
>>>   the same product).
>>> * There is no merging of the top-level compatible from the SoC and
>>>   board. The compatible string containing IDs for the SoC will not be
>>>   found in the device-tree passed to the OS.
>>>
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>> In the past, attempts to have the SoC as a base device tree and boards
>>> supported as overlays has been NAKed. From a previous discussion [1]
>>> "Nope, boards are not overlays. Boards are DTB." I believe this needs
>>> to be relitigated.
>>>
>>> In the previous NAK, I didn't see any links to documentation
>>> explicitly stating that DTBs have to represent boards. It's also
>>> unclear, at least to me, _why_ a DTB would be limited to represent a
>>> "board" nor what the definition of a "board" is.
>>>
>>> As at least one stab at why someone might not want an overlay scheme
>>> like this, one could point out that the top-level compatible can be a
>>> bit of a mess. Specifically in this scheme the board "compatible" from
>>> the overlay will fully replace/hide the SoC "compatible" from the base
>>> SoC. If this is truly the main concern, it wouldn't be terribly hard
>>> to add a new semantic (maybe selectable via a new additional
>>> property?) that caused the compatible strings to be merged in a
>>> reasonable way.
>>>
>>> Aside from dealing with the compatible string, let's think about what
>>> a "board" is. I will make the argument here that the SoC qualifies as
>>> a "board" and that the main PCB of a phone can be looked at as a
>>> "cape" for this SoC "board". While this may sound like a stretch, I
>>> would invite a reader to propose a definition of "board" that excludes
>>> this. Specifically, it can be noted:
>>> * I have a development board at my desk that is "socketed". That is, I
>>>   can pull the SoC out and put a different one in. I can swap in a
>>>   "rev A0" or a "rev B0" SoC into this socket. Conceivably, I could
>>>   even put a "Tensor G6", G7, G8, or G999 in the socket if it was
>>>   compatible. In this sense, the "SoC" is a standalone thing that can
>>>   be attached to the devboard "cape". The SoC being a standalone thing
>>>   is in the name. It's a "system" on a chip.
>>> * In case the definition of a board somehow needs a PCB involved, I
>>>   can note that on my dev board the CPU socket is soldered onto to a
>>>   CPU daughtercard (a PCB!) that then has a board-to-board connector
>>>   to the main PCB.
>>> * Perhaps one could argue that a dev board like I have describe would
>>>   qualify for this SoC/board overlay scheme but that a normal cell
>>>   phone wouldn't because the SoC isn't removable. Perhaps removability
>>>   is a requirement here? If so, imagine if some company took a
>>>   Raspberry Pi, soldered some components directly onto the "expansion"
>>>   pins, and resold that to consumers. Does this mean they can't use
>>>   overlays?
>>>
>>> To me, the above arguments justify why SoC DTBs + "board" overlays
>>> should be accepted. As far as I can tell, there is no downside and
>>> many people who would be made happy with this.
>>>
>>> [1] https://lore.kernel.org/all/dbeb28be-1aac-400b-87c1-9764aca3a799@kernel.org/
>>>
>>>  .../devicetree/bindings/arm/google.yaml       | 87 +++++++++++++++----
>>>  1 file changed, 68 insertions(+), 19 deletions(-)
> 
>>> @@ -41,13 +32,71 @@ properties:
>>>                - google,gs101-raven
>>>            - const: google,gs101
>>>
>>> +      # Google Tensor G5 AKA lga (laguna) SoC and boards
>>> +      - description: Tensor G5 SoC (laguna)
>>> +        items:
>>> +          - enum:
>>> +              - google,soc-id-0005-rev-00  # A0
>>> +              - google,soc-id-0005-rev-10  # B0
>>
>> SoCs cannot be final compatibles.
> 
> Right. I talked about this at length "after the cut" in my patch. See
> above. I wish to relitigate this policy and wish to know more details
> about where it is documented, the reasons for decision, and where the
> boundary exactly lies between something that's allowed to be a final
> compatible and something that's not. I made several arguments above
> for why I think the SoC should be allowed as a final compatible, so it

Because this represents a actual device users run. It is electronically,
physically impossible to run the SoC alone.

There are few - one or two - exceptions for the SoMs, but never for SoC.

> would be great if you could respond to them and tell me where I got it
> wrong.
> 
> 
>> Your commit msg does not explain what
>> is 'soc-id' or 'soc_id' in this context.
> 
> In the commit message I do say: "SoC: an A0 pre-production variant (ID
> 0x000500) and a B0 variant (ID 0x000510) used in production. The ID is
> canonicaly broken up into a 16-bit SoC product ID, a 4-bit major rev,
> and a 4-bit minor rev."

> 
> ...then, I further say "In this patch, put the SoC IDs straight into

That's fine.

> the compatible. Though the bootloader doesn't look at the compatible
> at the moment, this should be easy to teach the bootloader about."

But nothing explains why this SoC can be run alone without board.
> 
> The idea here is for the bootloader, which can read the ID of the
> current SoC, to be able to pick the right device tree from among
> multiple. I am certainly not married to putting the SoC ID in the

I am not discussing about style of the compatible. I said - you cannot
have SoC compatible alone. None of above gives any argument for that.

> compatible like this. As I mentioned above, in downstream device trees
> the SoC is stored in a custom node and I thought upstream would hate
> that. I also considered giving the `soc@0` node a custom compatible
> string and adding properties about the SoC ID underneath that and
> teaching the bootloader how to find this, and I can switch to this if
> you prefer.
> 
> If you have an alternate technique for which the bootloader could pick
> a device tree based on the current SoC ID or you have specific wording
> that you think I should add to the commit message to explain my
> current scheme, I'm happy to adjust things.
> 
> 
>>> +          - const: google,lga
>>> +      - description: Google Pixel 10 Board (Frankel)
>>> +        items:
>>> +          - enum:
>>> +              - google,pixel-id-070302-rev-000000  # Proto 0
>>> +              - google,pixel-id-070302-rev-010000  # Proto 1
>>> +              - google,pixel-id-070302-rev-010100  # Proto 1.1
>>> +              - google,pixel-id-070303-rev-010000  # EVT 1
>>> +              - google,pixel-id-070303-rev-010100  # EVT 1.1
>>> +              - google,pixel-id-070303-rev-010101  # EVT 1.1 Wingboard
>>> +              - google,pixel-id-070304-rev-010000  # DVT 1
>>> +              - google,pixel-id-070305-rev-010000  # PVT 1
>>> +              - google,pixel-id-070306-rev-010000  # MP 1
>>> +          - const: google,lga-frankel
>>> +          - const: google,lga
>>
>> So what is the lga?
> 
> "google,lga" is the name of the processor. I was under the impression
> that the last entry in the top-level compatible string was supposed to
> be the SoC compatible string. Certainly this was true in every board

google,soc-id-0005-rev-00 is the soc compatible string.

> I've worked with and I seem to even recall it being requested by DT
> folks. It also seems to match what I see in examples in the kernel
> docs [1].

Sorry but no. Writing bindings do not request having two compatibles for
the same soc in two different, independent (orthogonal) lists.

So it is rev-xyz + google,lga-frankel + soc-id + lga, if you need that
soc-id part.

> 
> At the moment, the fact that the SoC name is part of the top-level
> compatible is used in the Linux driver
> "drivers/cpufreq/cpufreq-dt-platdev.c" to implement its blocklist. The
> extensive list of compatible strings there shows how prevalent this
> concept is.
> 
> I seem to recall a previous discussion where Stephen Boyd proposed
> that a better place for the SoC compatible string was under the
> "soc@0" node. Ah yes, I found at least one [2]  post about it, though
> I think there was some earlier discussion too. Do you want me to try
> jumping that way?
> 
> 
>> What is lga-frankel?
> 
> This was an attempt to add a slightly more generic name for the board
> in case it was later found to be needed for some reason. I know that,
> occasionally, code finds it useful to test a top-level compatible
> string to apply a workaround to a specific class of boards. In this
> case, if someone needed to detect that they were on a "frankel" board
> but didn't care about the specific revision, they could test for this
> string.
> 
> Alternatively, I could add something like "google,pixel-id-0703xx", or
> "google,pixel-id-0703", or something similar which "means"
> google,lga-frankel. If you'd prefer this, I'm happy to change it.
> 
> I also have no specific need to add the "lga-frankel" compatible
> string here other than the fact that it shouldn't really hurt to have
> it here, it seems to match the example I pointed to earlier in the
> docs [1], and that it could be useful in the future. If you think I
> should simply remove it, I can do that. If we later find some need for
> it we can add some rules to deal with it then.
> 
> 
>>> +allOf:
>>>    # Bootloader requires empty ect node to be present
>>> -  ect:
>>> -    type: object
>>> -    additionalProperties: false
>>
>> Please keep it here
> 
> "it" being "additionalProperties", I think? I'm not sure I understand,
> but let's discuss below in the context of full examples and not diffs.

I meant ect node, existing hunk. Properties must be defined in top-level.


> 
> 
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>
>> not:
>>
>>> +          contains:
>>> +            const: google,gs101
>>
>>> +    then:
>>> +      properties:
>>> +        ect:
>>
>> ect: false, instead
> 
> Trying to understand the above is making my brain hurt. Perhaps I
> didn't get enough sleep last night. ...or maybe my brain isn't meant
> to directly parse diffs. It's probably easier to just look at
> full-blown examples.
> 
> Before, we had this:
> 
> --
> 
> properties:
>   ...
>   ...
>   # Bootloader requires empty ect node to be present
>   ect:
>     type: object
>     additionalProperties: false
> 
> required:
>   - ect
> 
> additionalProperties: true
> 
> --
> 
> In other words we were _required_ to have an "ect" node with no
> properties under it. However, additional properties are allowed in the
> root node.
> 
> After my patch:
> 
> --
> 
> properties:
>   ..
>   ..
> 
> allOf:
>   # Bootloader requires empty ect node to be present
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: google,gs101
>     then:
>       properties:
>         ect:
>           type: object
>           additionalProperties: false
> 
>       required:
>         - ect
> 
> additionalProperties: true
> 
> --
> 
> In other words, on gs101 we're _required_ to have an "ect" node with
> no properties under it. However, additional properties are allowed in
> the root node. This seems correct.
> 
> The best my brain can parse your request, I think you're asking for this:
> 
> --
> 
> properties:
>   ...
>   ...
>   ect:
>     type: object
>     additionalProperties: false
> 
> allOf:
>   # Bootloader requires empty ect node to be present
>   - if:
>       properties:
>         compatible:
>           not:
>             contains:
>               const: google,gs101
>     then:
>       properties:
>         ect: false
>     else:
>       required:
>       - ect

Yes, actually now I see you could drop the "not:" and exchange the
"then:else:" branches.

Best regards,
Krzysztof
