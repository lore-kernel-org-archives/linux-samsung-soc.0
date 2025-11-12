Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F3C2F1FCF;
	Wed, 12 Nov 2025 07:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762934325; cv=none; b=mkgk6SNbmLgs/66tAKGxUFr9Bpc5GML2Ur8c2viB1lQDCxvfqlsohBaV/I5ef+Bd7lRTYQwNbIz3l9X2XSgO0RyLuqF8diX4cHUi4Z8AnYy52iZDkRebKgF7SVM/zVC+xXelBZLzfrW+4LuY1ogH5GJUsCDnEUVb21ll5yW4/no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762934325; c=relaxed/simple;
	bh=LCcm4OEFjR8DYGyKj6LSbU8hEZdIWWL61ysKlxDrze8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TT1vuwwLcJZWNsR2EQjwyCVM59i8fa0lnvTsP3n4gSBXpeI76vV0WNvurCO5aKOpoOOPVjj9aTO+l6bVOqQUJq+7r+47RChfiCuz7hweCZ5ubkXX+wzqA1WseVQSfirXxCXaO2JCV6ZxKeetvFXHu9GYq9dEoefhlq13QdNlPp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=em99TkqX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="em99TkqX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7176C19425;
	Wed, 12 Nov 2025 07:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762934325;
	bh=LCcm4OEFjR8DYGyKj6LSbU8hEZdIWWL61ysKlxDrze8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=em99TkqXV9U4/QWNHpLXP61LEDKwoh7NyP1c/sGdZHcHYecqBvDgK4BBa4wdDKjgT
	 jfcppFD9Brk5YirkwYEijLZMbmfDQAddoa2X+y1y/xl7HA5Y3/TJaJqHMgAk6/gZzC
	 dOWCGbn3lx2ttiBBesuIpvLYgKzxBuv+9s+rEzMmuL5kmMBaZqg7FIVHraFyKLvLTN
	 +ypehuDtw80VoK6bHLEfZLVAE9cJVsrjfchF/rEFM26+LsB9PW4+Np0yCeizqMbhwe
	 GTkRKPTzmKlOBL9jqf2p+Gg3OObRGb7n9+EH3+qM+WYIQEkqm6CnWKfVag3A4MTvOi
	 c+5zuT5Q18ahQ==
Message-ID: <05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org>
Date: Wed, 12 Nov 2025 08:58:40 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for
 frankel/blazer/mustang
To: Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Roy Luo <royluo@google.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>,
 William McVicker <willmcvicker@google.com>, linux-kernel@vger.kernel.org
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2025 20:22, Douglas Anderson wrote:
> Add top-level DT bindings useful for Pixel 10 (frankel), Pixel 10 Pro
> (blazer), and Pixel 10 Pro XL (mustang).
> 
> Since overlays are fairly well-supported these days and the downstream
> Pixel bootloader assumes that the SoC is the base overlay and specific
> board revisions are overlays, reflect the SoC / board split in the
> bindings.
> 
> The SoC in the Pixel 10 series has the marketing name of "Tensor
> G5". Despite the fact that it sounds very similar to the "Tensor G4",
> it's a very different chip. Tensor G4 was, for all intents and
> purposes, a Samsung Exynos offshoot whereas Tensor G5 is entirely its
> own SoC. This SoC is known internally as "laguna" and canonically
> referred to in code as "lga". There are two known revisions of the
> SoC: an A0 pre-production variant (ID 0x000500) and a B0 variant (ID
> 0x000510) used in production. The ID is canonicaly broken up into a
> 16-bit SoC product ID, a 4-bit major rev, and a 4-bit minor rev.
> 
> The dtb for all supported SoC revisions is appended to one of the boot
> partitions and the bootloader will look at the device trees and pick
> the correct one. The current bootloader uses a downstream
> `soc_compatible` node to help it pick the correct device tree. It
> looks like this:
>   soc_compatible {
>     B0 {
>       description = "LGA B0";
>       product_id = <0x5>;
>       major = <0x1>;
>       minor = <0x0>;
>       pkg_mode = <0x0>;
>     };
>   };
> Note that `pkg_mode` isn't currently part of the ID on the SoC and the
> bootloader always assumes 0 for it.
> 
> In this patch, put the SoC IDs straight into the compatible. Though
> the bootloader doesn't look at the compatible at the moment, this
> should be easy to teach the bootloader about.
> 
> Boards all know their own platform_id / product_id / stage / major /
> minor / variant. For instance, Google Pixel 10 Pro XL MP1 is:
> * platform_id (8-bits): 0x07 - frankel/blazer/mustang
> * product_id (8-bits):  0x05 - mustang
> * stage (4-bits):       0x06 - MP
> * major (8-bits):       0x01 - MP 1
> * minor (8-bits):       0x00 - MP 1.0
> * variant (8-bits):     0x00 - No special variant
> 
> When board overlays are packed into the "dtbo" partition, a tool
> (`mkdtimg`) extracts a board ID and board rev from the overlay and
> stores that as metadata with the overlay. Downstream, the dtso
> intended for the Pixel 10 Pro XL MP1 has the following properties at
> its top-level:
>   board_id = <0x70506>;
>   board_rev = <0x010000>;
> 
> The use of top-level IDs can probably be used for overlays upstream as
> well, but also add the IDs to the compatible string in case it's
> useful.
> 
> Compatible strings are added for all board revisions known to be
> produced based on downstream sources.
> 
> A few notes:
> * If you look at `/proc/device-tree/compatible` and
>   `/proc/device-tree/model` on a running device, that won't
>   necessarily be an exact description of the hardware you're running
>   on. If the bootloader can't find a device tree that's an exact match
>   then it will pick the best match (within reason--it will never pick
>   a device tree for a different product--just for different revs of
>   the same product).
> * There is no merging of the top-level compatible from the SoC and
>   board. The compatible string containing IDs for the SoC will not be
>   found in the device-tree passed to the OS.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> In the past, attempts to have the SoC as a base device tree and boards
> supported as overlays has been NAKed. From a previous discussion [1]
> "Nope, boards are not overlays. Boards are DTB." I believe this needs
> to be relitigated.
> 
> In the previous NAK, I didn't see any links to documentation
> explicitly stating that DTBs have to represent boards. It's also
> unclear, at least to me, _why_ a DTB would be limited to represent a
> "board" nor what the definition of a "board" is.
> 
> As at least one stab at why someone might not want an overlay scheme
> like this, one could point out that the top-level compatible can be a
> bit of a mess. Specifically in this scheme the board "compatible" from
> the overlay will fully replace/hide the SoC "compatible" from the base
> SoC. If this is truly the main concern, it wouldn't be terribly hard
> to add a new semantic (maybe selectable via a new additional
> property?) that caused the compatible strings to be merged in a
> reasonable way.
> 
> Aside from dealing with the compatible string, let's think about what
> a "board" is. I will make the argument here that the SoC qualifies as
> a "board" and that the main PCB of a phone can be looked at as a
> "cape" for this SoC "board". While this may sound like a stretch, I
> would invite a reader to propose a definition of "board" that excludes
> this. Specifically, it can be noted:
> * I have a development board at my desk that is "socketed". That is, I
>   can pull the SoC out and put a different one in. I can swap in a
>   "rev A0" or a "rev B0" SoC into this socket. Conceivably, I could
>   even put a "Tensor G6", G7, G8, or G999 in the socket if it was
>   compatible. In this sense, the "SoC" is a standalone thing that can
>   be attached to the devboard "cape". The SoC being a standalone thing
>   is in the name. It's a "system" on a chip.
> * In case the definition of a board somehow needs a PCB involved, I
>   can note that on my dev board the CPU socket is soldered onto to a
>   CPU daughtercard (a PCB!) that then has a board-to-board connector
>   to the main PCB.
> * Perhaps one could argue that a dev board like I have describe would
>   qualify for this SoC/board overlay scheme but that a normal cell
>   phone wouldn't because the SoC isn't removable. Perhaps removability
>   is a requirement here? If so, imagine if some company took a
>   Raspberry Pi, soldered some components directly onto the "expansion"
>   pins, and resold that to consumers. Does this mean they can't use
>   overlays?
> 
> To me, the above arguments justify why SoC DTBs + "board" overlays
> should be accepted. As far as I can tell, there is no downside and
> many people who would be made happy with this.
> 
> [1] https://lore.kernel.org/all/dbeb28be-1aac-400b-87c1-9764aca3a799@kernel.org/
> 
>  .../devicetree/bindings/arm/google.yaml       | 87 +++++++++++++++----
>  1 file changed, 68 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
> index 99961e5282e5..f9f9ea1c8050 100644
> --- a/Documentation/devicetree/bindings/arm/google.yaml
> +++ b/Documentation/devicetree/bindings/arm/google.yaml
> @@ -13,27 +13,18 @@ description: |
>    ARM platforms using SoCs designed by Google branded "Tensor" used in Pixel
>    devices.
>  
> -  Currently upstream this is devices using "gs101" SoC which is found in Pixel
> -  6, Pixel 6 Pro and Pixel 6a.
> +  These bindings for older Pixel devices don't use device tree overlays so
> +  no separate SoC entry is added. This may change in the future.
>  
> -  Google have a few different names for the SoC:
> -  - Marketing name ("Tensor")
> -  - Codename ("Whitechapel")
> -  - SoC ID ("gs101")
> -  - Die ID ("S5P9845")
> -
> -  Likewise there are a couple of names for the actual device
> -  - Marketing name ("Pixel 6")
> -  - Codename ("Oriole")
> -
> -  Devicetrees should use the lowercased SoC ID and lowercased board codename,
> -  e.g. gs101 and gs101-oriole.
> +  Newer Pixel devices are expected to have the SoC device tree as the base
> +  and specific board device trees as overlays.
>  
>  properties:
>    $nodename:
>      const: '/'
>    compatible:
>      oneOf:
> +      # Google Tensor G1 AKA gs101 AKA whitechapel AKA Die ID S5P9845 boards
>        - description: Google Pixel 6 or 6 Pro (Oriole or Raven)
>          items:
>            - enum:
> @@ -41,13 +32,71 @@ properties:
>                - google,gs101-raven
>            - const: google,gs101
>  
> +      # Google Tensor G5 AKA lga (laguna) SoC and boards
> +      - description: Tensor G5 SoC (laguna)
> +        items:
> +          - enum:
> +              - google,soc-id-0005-rev-00  # A0
> +              - google,soc-id-0005-rev-10  # B0

SoCs cannot be final compatibles. Your commit msg does not explain what
is 'soc-id' or 'soc_id' in this context.

> +          - const: google,lga
> +      - description: Google Pixel 10 Board (Frankel)
> +        items:
> +          - enum:
> +              - google,pixel-id-070302-rev-000000  # Proto 0
> +              - google,pixel-id-070302-rev-010000  # Proto 1
> +              - google,pixel-id-070302-rev-010100  # Proto 1.1
> +              - google,pixel-id-070303-rev-010000  # EVT 1
> +              - google,pixel-id-070303-rev-010100  # EVT 1.1
> +              - google,pixel-id-070303-rev-010101  # EVT 1.1 Wingboard
> +              - google,pixel-id-070304-rev-010000  # DVT 1
> +              - google,pixel-id-070305-rev-010000  # PVT 1
> +              - google,pixel-id-070306-rev-010000  # MP 1
> +          - const: google,lga-frankel
> +          - const: google,lga

So what is the lga? What is lga-frankel?

> +      - description: Google Pixel 10 Pro Board (Blazer)
> +        items:
> +          - enum:
> +              - google,pixel-id-070402-rev-000000  # Proto 0
> +              - google,pixel-id-070402-rev-010000  # Proto 1
> +              - google,pixel-id-070402-rev-010100  # Proto 1.1
> +              - google,pixel-id-070403-rev-010000  # EVT 1
> +              - google,pixel-id-070403-rev-010100  # EVT 1.1
> +              - google,pixel-id-070404-rev-010000  # DVT 1
> +              - google,pixel-id-070405-rev-010000  # PVT 1
> +              - google,pixel-id-070406-rev-010000  # MP 1
> +          - const: google,lga-blazer
> +          - const: google,lga
> +      - description: Google Pixel 10 Pro XL Board (Mustang)
> +        items:
> +          - enum:
> +              - google,pixel-id-070502-rev-000000  # Proto 0
> +              - google,pixel-id-070502-rev-010000  # Proto 1
> +              - google,pixel-id-070502-rev-010100  # Proto 1.1
> +              - google,pixel-id-070502-rev-010101  # Proto 1.1 Wingboard
> +              - google,pixel-id-070503-rev-010000  # EVT 1
> +              - google,pixel-id-070503-rev-010100  # EVT 1.1
> +              - google,pixel-id-070503-rev-010101  # EVT 1.1 Wingboard
> +              - google,pixel-id-070504-rev-010000  # DVT 1
> +              - google,pixel-id-070505-rev-010000  # PVT 1
> +              - google,pixel-id-070506-rev-010000  # MP 1
> +          - const: google,lga-mustang
> +          - const: google,lga
> +
> +allOf:
>    # Bootloader requires empty ect node to be present
> -  ect:
> -    type: object
> -    additionalProperties: false

Please keep it here

> +  - if:
> +      properties:
> +        compatible:

not:

> +          contains:
> +            const: google,gs101

> +    then:
> +      properties:
> +        ect:

ect: false, instead


Best regards,
Krzysztof
