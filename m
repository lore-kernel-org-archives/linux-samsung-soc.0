Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99182C11FD
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 19:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762975192; cv=none; b=M+bCcCFkldnFKEblPpi16hrJa8ABgcGgdLpVr54oYEl0jqa09G3FewN1G25cQ0Zsd0nCeYkfbvG+YxiCY1brUwrLs/w+L9jUSlhFawW/4p9OKj9fYQjqJQ9KpcQpWCVHkBshjzKsiHFthbap/f7UbUD+mIOXTx2n6QG94W1BN3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762975192; c=relaxed/simple;
	bh=+CR2WTdfwO89a/ZSL6clAhrjR0ic8Ig0fZC/v0WomQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rdr31Gi+Qta2s43uKGNJrdM6bl1Kw0FZ98oLz0zIyU6lftvohxeTsOB2RTrp71QsnXbhfCFELsR2ReoNpyHbew68H16zrBOOIaJ+o0QC8P3PWBThc6FoVvBxEm/Z/BNq0Ywh5cdjqhf+uuEavubtrFxGUBk95rj1s0w81cNuBls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ESxINzD6; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ESxINzD6"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b72bf7e703fso223403966b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 11:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762975183; x=1763579983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QS8gokQgq3E8I5XU2wjPkqCo67fzHyQgZ5U/H0JQjw=;
        b=ESxINzD6mMkDp+aCk51r+ZFEI+h8asUkl4iwcIQOoWkOKreItGigxEXKVgQr1jSrj5
         uCp3VYUx4CTlTPBrK+6lqE2Or1nYc0PL8gbgniDc0bNgvP7TbwQFzrkp2YFveUeYNjBU
         l6vrD+c9/ipDkJaNu2FtzeF2AizOGGSBrZZVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762975183; x=1763579983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4QS8gokQgq3E8I5XU2wjPkqCo67fzHyQgZ5U/H0JQjw=;
        b=G38RAshFpxss0IaL8+JX8DS4HoFIg28lo0U26KzmQN3N75CF5gn8RHmMFmdwdTbfcN
         TXlYtuTYGhuDg/ePdJgo6mQd74yY+sUWNVCk+fB8J8unf1YuYD18oejW9faQVeJZK9gh
         jF7CBKKp5q/s51oF86uDCBHYWOG3TRv9bzUF4S7+x414dGjsFx0v195i9ulD5tKWCP2L
         hsFw8wxRiXsxHev/iHSPi+XyXZUQLlX8rS2jIi2UDEy3lBEyWfuy1f8HcAiMKSgyTbpt
         oRNZhXToTKm4n4c4uO7rmlr6FeRETF1mKs8xC/Bm8cDOG+nkONTpF30i3NKOCLgBKY9l
         +5oQ==
X-Forwarded-Encrypted: i=1; AJvYcCV01Q3bhXutGFkQ4pYizvpTxBxNdYoEeIeVNZNhlMQWjTid7Z3MsAF5nvssCRb3F4E1yZsuhdVf9j/iVH+/ikMU/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpfPfAd6EdBNZ9h1p5oRn8dKLCltC+4Ot5Tn6fCVpiNacqMElV
	b9VFI+8QcWQ6k35YHmKMGqnvoHVehP/V4BqKcVBnoBtvcIBls+iasIrBPyCJJ257/YfMQok+KRD
	CMdAsVQ==
X-Gm-Gg: ASbGncvJUShfKwM+HIWyDAcKFXbTLGCaHrY4u9TcX+o9N3BBoqkHOA07Bd3Sq+qoli4
	L03o9nl5yhrP+c4Quo4C15yj9/Oc4DfoTEoHY5WWlt/o6Ym8bEqoiGbDQhYRE4oBNxCADRuLoDH
	250Lbts9z98MPOtc9NyYFpZ7mpZ4ekDCeXnf0sC0wlrGvfMjers74YtEE6Elgx9ubgiic2ZXhd8
	8gbO/mj/ctB6qW6P8lFnWmd7/jcAYpx2ykL2VDDN6otReHX+mYkDweurLCv1PX48YTLKpiANpUG
	sr6IGnAU38QTo6VrMZKlNf44+GBZx3EnbQCkCiVTnb7ShpDC2ebQm+wSAXpjnl1r+nj/1/AoDcz
	DjlselVYJpqTM51qNPtl0PNCPR1OQpqaO2qX5GlVFafPimYkp7K0wwITYB88bEuvWaxi6YUGtnf
	BehyaDWc0WsrpX5SVVsCRxsueSwybs0lllRqfauiI=
X-Google-Smtp-Source: AGHT+IHKkB9wjV0Pz8kQ20JpLy+G3ElAvEGq6d+dufe8U+oXrHxVbFnAtJGPK5FhU7UJkwffNs1XCw==
X-Received: by 2002:a17:907:2d28:b0:b3b:b839:577b with SMTP id a640c23a62f3a-b7331930001mr403258966b.12.1762975182937;
        Wed, 12 Nov 2025 11:19:42 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa11271sm1652333066b.66.2025.11.12.11.19.41
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 11:19:42 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477632cc932so191635e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 11:19:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVE9vpI2WywJbG6OYhGZwRPk6iaWBDx4AxxGEcAm46fTFrkwdTViOR1/T6eOow8rBmY1tGZhAYBV9MnQgtTk+Bpfg==@vger.kernel.org
X-Received: by 2002:a05:600c:4f91:b0:46e:4704:b01e with SMTP id
 5b1f17b1804b1-477870708e1mr37015705e9.8.1762975180559; Wed, 12 Nov 2025
 11:19:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid> <05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org>
In-Reply-To: <05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Nov 2025 11:19:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XXWK9pmZQvNk6gjkqe6kgLXaVENgz0pBii6Gai7BdL-A@mail.gmail.com>
X-Gm-Features: AWmQ_bllj73opmZSJK51jDVz1VEpznvY8KvYwWyOvKxQfGVzwkj1oSJIf8eIOYQ
Message-ID: <CAD=FV=XXWK9pmZQvNk6gjkqe6kgLXaVENgz0pBii6Gai7BdL-A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 11, 2025 at 11:58=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 11/11/2025 20:22, Douglas Anderson wrote:
> > Add top-level DT bindings useful for Pixel 10 (frankel), Pixel 10 Pro
> > (blazer), and Pixel 10 Pro XL (mustang).
> >
> > Since overlays are fairly well-supported these days and the downstream
> > Pixel bootloader assumes that the SoC is the base overlay and specific
> > board revisions are overlays, reflect the SoC / board split in the
> > bindings.
> >
> > The SoC in the Pixel 10 series has the marketing name of "Tensor
> > G5". Despite the fact that it sounds very similar to the "Tensor G4",
> > it's a very different chip. Tensor G4 was, for all intents and
> > purposes, a Samsung Exynos offshoot whereas Tensor G5 is entirely its
> > own SoC. This SoC is known internally as "laguna" and canonically
> > referred to in code as "lga". There are two known revisions of the
> > SoC: an A0 pre-production variant (ID 0x000500) and a B0 variant (ID
> > 0x000510) used in production. The ID is canonicaly broken up into a
> > 16-bit SoC product ID, a 4-bit major rev, and a 4-bit minor rev.
> >
> > The dtb for all supported SoC revisions is appended to one of the boot
> > partitions and the bootloader will look at the device trees and pick
> > the correct one. The current bootloader uses a downstream
> > `soc_compatible` node to help it pick the correct device tree. It
> > looks like this:
> >   soc_compatible {
> >     B0 {
> >       description =3D "LGA B0";
> >       product_id =3D <0x5>;
> >       major =3D <0x1>;
> >       minor =3D <0x0>;
> >       pkg_mode =3D <0x0>;
> >     };
> >   };
> > Note that `pkg_mode` isn't currently part of the ID on the SoC and the
> > bootloader always assumes 0 for it.
> >
> > In this patch, put the SoC IDs straight into the compatible. Though
> > the bootloader doesn't look at the compatible at the moment, this
> > should be easy to teach the bootloader about.
> >
> > Boards all know their own platform_id / product_id / stage / major /
> > minor / variant. For instance, Google Pixel 10 Pro XL MP1 is:
> > * platform_id (8-bits): 0x07 - frankel/blazer/mustang
> > * product_id (8-bits):  0x05 - mustang
> > * stage (4-bits):       0x06 - MP
> > * major (8-bits):       0x01 - MP 1
> > * minor (8-bits):       0x00 - MP 1.0
> > * variant (8-bits):     0x00 - No special variant
> >
> > When board overlays are packed into the "dtbo" partition, a tool
> > (`mkdtimg`) extracts a board ID and board rev from the overlay and
> > stores that as metadata with the overlay. Downstream, the dtso
> > intended for the Pixel 10 Pro XL MP1 has the following properties at
> > its top-level:
> >   board_id =3D <0x70506>;
> >   board_rev =3D <0x010000>;
> >
> > The use of top-level IDs can probably be used for overlays upstream as
> > well, but also add the IDs to the compatible string in case it's
> > useful.
> >
> > Compatible strings are added for all board revisions known to be
> > produced based on downstream sources.
> >
> > A few notes:
> > * If you look at `/proc/device-tree/compatible` and
> >   `/proc/device-tree/model` on a running device, that won't
> >   necessarily be an exact description of the hardware you're running
> >   on. If the bootloader can't find a device tree that's an exact match
> >   then it will pick the best match (within reason--it will never pick
> >   a device tree for a different product--just for different revs of
> >   the same product).
> > * There is no merging of the top-level compatible from the SoC and
> >   board. The compatible string containing IDs for the SoC will not be
> >   found in the device-tree passed to the OS.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > In the past, attempts to have the SoC as a base device tree and boards
> > supported as overlays has been NAKed. From a previous discussion [1]
> > "Nope, boards are not overlays. Boards are DTB." I believe this needs
> > to be relitigated.
> >
> > In the previous NAK, I didn't see any links to documentation
> > explicitly stating that DTBs have to represent boards. It's also
> > unclear, at least to me, _why_ a DTB would be limited to represent a
> > "board" nor what the definition of a "board" is.
> >
> > As at least one stab at why someone might not want an overlay scheme
> > like this, one could point out that the top-level compatible can be a
> > bit of a mess. Specifically in this scheme the board "compatible" from
> > the overlay will fully replace/hide the SoC "compatible" from the base
> > SoC. If this is truly the main concern, it wouldn't be terribly hard
> > to add a new semantic (maybe selectable via a new additional
> > property?) that caused the compatible strings to be merged in a
> > reasonable way.
> >
> > Aside from dealing with the compatible string, let's think about what
> > a "board" is. I will make the argument here that the SoC qualifies as
> > a "board" and that the main PCB of a phone can be looked at as a
> > "cape" for this SoC "board". While this may sound like a stretch, I
> > would invite a reader to propose a definition of "board" that excludes
> > this. Specifically, it can be noted:
> > * I have a development board at my desk that is "socketed". That is, I
> >   can pull the SoC out and put a different one in. I can swap in a
> >   "rev A0" or a "rev B0" SoC into this socket. Conceivably, I could
> >   even put a "Tensor G6", G7, G8, or G999 in the socket if it was
> >   compatible. In this sense, the "SoC" is a standalone thing that can
> >   be attached to the devboard "cape". The SoC being a standalone thing
> >   is in the name. It's a "system" on a chip.
> > * In case the definition of a board somehow needs a PCB involved, I
> >   can note that on my dev board the CPU socket is soldered onto to a
> >   CPU daughtercard (a PCB!) that then has a board-to-board connector
> >   to the main PCB.
> > * Perhaps one could argue that a dev board like I have describe would
> >   qualify for this SoC/board overlay scheme but that a normal cell
> >   phone wouldn't because the SoC isn't removable. Perhaps removability
> >   is a requirement here? If so, imagine if some company took a
> >   Raspberry Pi, soldered some components directly onto the "expansion"
> >   pins, and resold that to consumers. Does this mean they can't use
> >   overlays?
> >
> > To me, the above arguments justify why SoC DTBs + "board" overlays
> > should be accepted. As far as I can tell, there is no downside and
> > many people who would be made happy with this.
> >
> > [1] https://lore.kernel.org/all/dbeb28be-1aac-400b-87c1-9764aca3a799@ke=
rnel.org/
> >
> >  .../devicetree/bindings/arm/google.yaml       | 87 +++++++++++++++----
> >  1 file changed, 68 insertions(+), 19 deletions(-)

> > @@ -41,13 +32,71 @@ properties:
> >                - google,gs101-raven
> >            - const: google,gs101
> >
> > +      # Google Tensor G5 AKA lga (laguna) SoC and boards
> > +      - description: Tensor G5 SoC (laguna)
> > +        items:
> > +          - enum:
> > +              - google,soc-id-0005-rev-00  # A0
> > +              - google,soc-id-0005-rev-10  # B0
>
> SoCs cannot be final compatibles.

Right. I talked about this at length "after the cut" in my patch. See
above. I wish to relitigate this policy and wish to know more details
about where it is documented, the reasons for decision, and where the
boundary exactly lies between something that's allowed to be a final
compatible and something that's not. I made several arguments above
for why I think the SoC should be allowed as a final compatible, so it
would be great if you could respond to them and tell me where I got it
wrong.


> Your commit msg does not explain what
> is 'soc-id' or 'soc_id' in this context.

In the commit message I do say: "SoC: an A0 pre-production variant (ID
0x000500) and a B0 variant (ID 0x000510) used in production. The ID is
canonicaly broken up into a 16-bit SoC product ID, a 4-bit major rev,
and a 4-bit minor rev."

...then, I further say "In this patch, put the SoC IDs straight into
the compatible. Though the bootloader doesn't look at the compatible
at the moment, this should be easy to teach the bootloader about."

The idea here is for the bootloader, which can read the ID of the
current SoC, to be able to pick the right device tree from among
multiple. I am certainly not married to putting the SoC ID in the
compatible like this. As I mentioned above, in downstream device trees
the SoC is stored in a custom node and I thought upstream would hate
that. I also considered giving the `soc@0` node a custom compatible
string and adding properties about the SoC ID underneath that and
teaching the bootloader how to find this, and I can switch to this if
you prefer.

If you have an alternate technique for which the bootloader could pick
a device tree based on the current SoC ID or you have specific wording
that you think I should add to the commit message to explain my
current scheme, I'm happy to adjust things.


> > +          - const: google,lga
> > +      - description: Google Pixel 10 Board (Frankel)
> > +        items:
> > +          - enum:
> > +              - google,pixel-id-070302-rev-000000  # Proto 0
> > +              - google,pixel-id-070302-rev-010000  # Proto 1
> > +              - google,pixel-id-070302-rev-010100  # Proto 1.1
> > +              - google,pixel-id-070303-rev-010000  # EVT 1
> > +              - google,pixel-id-070303-rev-010100  # EVT 1.1
> > +              - google,pixel-id-070303-rev-010101  # EVT 1.1 Wingboard
> > +              - google,pixel-id-070304-rev-010000  # DVT 1
> > +              - google,pixel-id-070305-rev-010000  # PVT 1
> > +              - google,pixel-id-070306-rev-010000  # MP 1
> > +          - const: google,lga-frankel
> > +          - const: google,lga
>
> So what is the lga?

"google,lga" is the name of the processor. I was under the impression
that the last entry in the top-level compatible string was supposed to
be the SoC compatible string. Certainly this was true in every board
I've worked with and I seem to even recall it being requested by DT
folks. It also seems to match what I see in examples in the kernel
docs [1].

At the moment, the fact that the SoC name is part of the top-level
compatible is used in the Linux driver
"drivers/cpufreq/cpufreq-dt-platdev.c" to implement its blocklist. The
extensive list of compatible strings there shows how prevalent this
concept is.

I seem to recall a previous discussion where Stephen Boyd proposed
that a better place for the SoC compatible string was under the
"soc@0" node. Ah yes, I found at least one [2]  post about it, though
I think there was some earlier discussion too. Do you want me to try
jumping that way?


> What is lga-frankel?

This was an attempt to add a slightly more generic name for the board
in case it was later found to be needed for some reason. I know that,
occasionally, code finds it useful to test a top-level compatible
string to apply a workaround to a specific class of boards. In this
case, if someone needed to detect that they were on a "frankel" board
but didn't care about the specific revision, they could test for this
string.

Alternatively, I could add something like "google,pixel-id-0703xx", or
"google,pixel-id-0703", or something similar which "means"
google,lga-frankel. If you'd prefer this, I'm happy to change it.

I also have no specific need to add the "lga-frankel" compatible
string here other than the fact that it shouldn't really hurt to have
it here, it seems to match the example I pointed to earlier in the
docs [1], and that it could be useful in the future. If you think I
should simply remove it, I can do that. If we later find some need for
it we can add some rules to deal with it then.


> > +allOf:
> >    # Bootloader requires empty ect node to be present
> > -  ect:
> > -    type: object
> > -    additionalProperties: false
>
> Please keep it here

"it" being "additionalProperties", I think? I'm not sure I understand,
but let's discuss below in the context of full examples and not diffs.


> > +  - if:
> > +      properties:
> > +        compatible:
>
> not:
>
> > +          contains:
> > +            const: google,gs101
>
> > +    then:
> > +      properties:
> > +        ect:
>
> ect: false, instead

Trying to understand the above is making my brain hurt. Perhaps I
didn't get enough sleep last night. ...or maybe my brain isn't meant
to directly parse diffs. It's probably easier to just look at
full-blown examples.

Before, we had this:

--

properties:
  ...
  ...
  # Bootloader requires empty ect node to be present
  ect:
    type: object
    additionalProperties: false

required:
  - ect

additionalProperties: true

--

In other words we were _required_ to have an "ect" node with no
properties under it. However, additional properties are allowed in the
root node.

After my patch:

--

properties:
  ..
  ..

allOf:
  # Bootloader requires empty ect node to be present
  - if:
      properties:
        compatible:
          contains:
            const: google,gs101
    then:
      properties:
        ect:
          type: object
          additionalProperties: false

      required:
        - ect

additionalProperties: true

--

In other words, on gs101 we're _required_ to have an "ect" node with
no properties under it. However, additional properties are allowed in
the root node. This seems correct.

The best my brain can parse your request, I think you're asking for this:

--

properties:
  ...
  ...
  ect:
    type: object
    additionalProperties: false

allOf:
  # Bootloader requires empty ect node to be present
  - if:
      properties:
        compatible:
          not:
            contains:
              const: google,gs101
    then:
      properties:
        ect: false
    else:
      required:
      - ect

additionalProperties: true

--

In other words, we still define the "ect" node in the main section and
say that it can't have any extra properties, but we enforce whether
it's required under the "if" statement.

The above has the "downside" compared to my syntax that it bans a node
named "ect" on non-gs101 devices. While this doesn't really hurt, it
also doesn't help. In my mind there's no reason to even think about
(let alone ban) the node "ect" on devices that don't have the gs101
bootloader requirement. Similarly, even though a node named "quack"
would also not really be allowed, we don't have any rule like "quack:
false". :-P

I could also leave the "ect" in the main section and just add the
"required" for "gs101" down below, but then I can't find a use for
your "not:" or "ect: false" lines.

In any case, I'm more than happy to use whatever syntax you prefer for
this, but I'd love it if you could just paste in what you'd like the
syntax to be so I don't need to kill 45 minutes trying to figure it
out, test various hypothesis of what you could mean, and respond. ;-)


[1] https://www.kernel.org/doc/html/v6.17/devicetree/usage-model.html#platf=
orm-identification
[2] https://lwn.net/ml/all/20250108012846.3275443-3-swboyd@chromium.org/
