Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F142F99B5;
	Thu, 13 Nov 2025 02:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763000841; cv=none; b=nPXThc18PhQj3GvqQx3okLYyiArEGBMbBK1cD87IR55L6ut46+9uVq8uVokLiTRDL2pljzFyE+xDxWNGYNyYUnCMLIEb66EEunfoXfr+h300nCSH5epbUNROVktGEl05nxY1dABf/gfuXN/p1WOO6le69F8o3HvaqLmIQU/xxKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763000841; c=relaxed/simple;
	bh=yNXVjwB02D6ijpBD4DNv7JfxSUtsr+AkiMEO13PQgwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbCAHuQMNOy35+iX9ezTJgt40aa+ggM569BweUggHt6LiAerCHZBXdnzauzF3N0lz7fcd1hmbkO5vUnzMjieQ/tJikoYymBlLDENGxOuBvdik+arsM4Fp3zfERkXmgEzSDudIAdt0edfA7qpP66Hg7kNC1hjevtcwnPlWCzPwNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYbPAsSD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYbPAsSD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE269C113D0;
	Thu, 13 Nov 2025 02:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763000841;
	bh=yNXVjwB02D6ijpBD4DNv7JfxSUtsr+AkiMEO13PQgwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYbPAsSDm/ZWgd+yI2erQND0RM9Lbv7i360mOyJRQfzKH0BndtuOo9LAK0qaD0XyW
	 adbQrqVymdGQiQL0GHO6mdEaqTBk2Gtr53D8N16btB80RNoNbDKlrJy0MktAkJ9BtL
	 BOPIbtlT00hWq9b75NNvNIxrWcHVGdd7VRnmIyDDeROxsaONG1LwF98mK0OX2CNhnm
	 I4dFEyvmhjeXiJrY8d3xI0rQbprd/XI8gkjkcxuVXzLAsV5rgk1NOz7nD0d+SGTPX/
	 W7TR7GxItsO/b3/OzmaQdKwNc+mg4nR47yoseOqoiiriumLRAMicGOzfu2wBMKg6WV
	 V2vtpjhWSCGZw==
Date: Wed, 12 Nov 2025 20:27:19 -0600
From: Rob Herring <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-samsung-soc@vger.kernel.org, Roy Luo <royluo@google.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	William McVicker <willmcvicker@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for
 frankel/blazer/mustang
Message-ID: <20251113022719.GA2281498-robh@kernel.org>
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>

On Tue, Nov 11, 2025 at 11:22:04AM -0800, Douglas Anderson wrote:
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

I think this is a problem...

> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> In the past, attempts to have the SoC as a base device tree and boards
> supported as overlays has been NAKed. From a previous discussion [1]
> "Nope, boards are not overlays. Boards are DTB." I believe this needs
> to be relitigated.

I think it is worth having the discussion. There's been some discussions 
about an overlay split with SoMs and baseboards as well. I think that's 
what is driving this addition[1]. I don't think this case is much 
different.

As a different way to combine things compared to .dtsi files, I don't 
care too much how things are structured to the extent that's just 
internal structure and we're moving the combining of files from one 
point in time to another.

My concern here is largely around validation. Can the SoC DTB pass 
validation, and can we still validate the whole thing at build time? To 
start with, it's not great if we have to make the schema allow only an 
SoC compatible without a board compatible. Then suddenly omitting a 
board compatible is always valid. Solving that with an entirely 
different SoC compatible as you have doesn't seem great.

My other concern is whether this is an ABI between the SoC and board 
DTBs? And I don't mean just you, but for anyone wanting to do anything 
remotely similar. An ABI is a problem as we don't really have any way to 
validate each piece separately. (This is already a problem for existing 
overlays.)

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

Should upstream really care about anything other than MP1? I don't think 
so. Which ones are useful in 1 year, 2 years, 10 years?

> +          - const: google,lga-frankel
> +          - const: google,lga

It's not clear to me how you map boards to SoC revision? You boot up 
using the SoC DTB and then select the board DTBO based on? This all 
needs to be well defined and general enough any (existing) platform 
could use it. If [1] helps or doesn't work for you I'm interested in 
hearing that.

Rob

[1] https://lore.kernel.org/devicetree-spec/20250911151436.2467758-1-raymond.mao@linaro.org/
