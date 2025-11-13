Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3733C3054F7
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 03:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763004615; cv=none; b=mjiYnolxL7KhEaZ5/VFov6UKQd2ue6R7sUqUSgX/TBUqllUDzP7ZTodez84q/2MPD7LySRhSOpT7992wQOnrY1aAfx8ztIs6nnFDr80tC43RkRvNURbHuJfjzyiIl1M2WX4e9jAikXl+nOAAXUKG7u+lpKKXngkmNSm6irzRnaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763004615; c=relaxed/simple;
	bh=8JI+x6ZdcL25cu+nNa50Rvxzn1siL7V10cXC1zjWmCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJ8UaypQpibfLYdMElBHUhyZ17yBXQ+jRe6fEu8ffqKyowhXqGJk7Dd+nlnFFsrxdr9PPIIRLvzwJSKTQRWb48YfNTmpaoNZFXzhpr8mjeNQvwC+1ORLr4MVNyhDg42e4WuG3aZX8SOAqnRTt/Tme+qNzp2ZV1saRmb7bLU4Ijw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CP68sSZa; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CP68sSZa"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b72b495aa81so34246866b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 19:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763004609; x=1763609409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kumcQLXhRVJ42+kqGdBB5vBon2g+g8mfBJG3iE4h+7I=;
        b=CP68sSZaTZpMKXF/NhJ6Isq9LS9LeMu2fWmPQj6XGAP1g1oog7sqZ5y+xND0U2UgRE
         /SvvrMnAsAyeQifqzmPicRnBKfmCQfTe9HcporFkVvF+C4qJ7bhXFF3fi6wm+L31eehB
         NAFhrkHqSgCId91/MngKBFjQ/6I029pQyQaqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763004609; x=1763609409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kumcQLXhRVJ42+kqGdBB5vBon2g+g8mfBJG3iE4h+7I=;
        b=oWlAAtdpMogKNUOZiajso7Rp1nYClP607BQAwqLS3D8q2HH9JZoJDdsAUF+PALg2Cd
         7mueQuSiyhnjnyF5EuYRWvvrPx8hWvcm9VrFIk5odWMn4OOtwmg4dE4WfjVlhgAnEk2f
         kvnsHBgWVlKlsTBEPW+UQJc2vHTrKBl/viO3ZChMjVOHMdluXYMMLEFS/D4NHHK8qP4C
         P38Wrs7yuFGieNM0TLbe0BDrUHci1OMOFMGdaM87NQJlO2AR7IJ2j+t3HG62usPBOJE+
         o5Sh2bfBUvIlg5JS2kcJDvIDlmmG7Y8hYMAGdq4B5E7PuW1T8X0ZZ7jlWPqoVM0WXEo4
         tuRg==
X-Forwarded-Encrypted: i=1; AJvYcCVIraS9m44VUvRZciIWhXIgvUEVpqDfB54EAgj1wBRTT83y4zLxv9+a2wkQT7DQGAiYQCdYq2ylcmqRad06AmeCKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1lcyGeg06QySNZBQbR2FYiNobZI0ShSazYLRP/XB5t+NerqqD
	tKa3s+q2HImn7Ksxhwd3RATow2PU0a6JDzqmwWhjX6m73ChLIg1z7JKyJJwsDPyHGSNxhd0PYst
	YXPsTfyHZ
X-Gm-Gg: ASbGncuO+BE16XtPDjdvAjWtNdjHy4VFZsbzXbv+No0/MFM0908V0qixuvyY7yph71y
	xmYvhRLXJ6b+ju2aaonmr9XehIFxo6GHjp+kWO+04wRmc75uAhgavkBu6j3ixFLtnpMlWMKccLz
	k7qxkKcCIupI9XxWFHyYPACLX97e+WAY+jtM4dgi6xWa7uKHurRwSaLNMaHWugBtNVSez8lZwCC
	RMOBm6opIBVFuqNU3UgEjhsOIObMz1ZC1PeWXJpfSUycT/7xOsH4Ij22yCxcSDl7P8+TfRoY0B4
	Rkezk2sxx4WI6ucdVWFp/rNJHmqDi9nktdefnudKmdFhpAPQQxFX4nM4LskEdfPxmnnMZMJ7Ozy
	hHF+uOxG2FTJ5yX5MQcHJvX0vn82DeLOACZBiB2TOpsoJWsgX3r5luEbmhad6uIAPTNmtJUERVm
	OUr01jlob+wvi8tEMIqvRpY2to2O7qCBqXIVMRLTI=
X-Google-Smtp-Source: AGHT+IHs+SZS+mF8Kkryjfbqvfox3+zyNRwUk6SPvKUZO4PRf62lB0M8n8KLjvh5pfNZAH2Ap9EwQQ==
X-Received: by 2002:a17:906:f8ce:b0:b73:392b:89ff with SMTP id a640c23a62f3a-b73392b8b84mr297502966b.10.1763004608771;
        Wed, 12 Nov 2025 19:30:08 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734ff36ac6sm66075266b.74.2025.11.12.19.30.07
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 19:30:08 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so3889235e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 19:30:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYztqTS9IqVf65NseCKg257whFhpxS/N+PTwHLrei8yMJSBiGp6JqgmDuH3meOGyXu7jG5Pg+8bVx1ULiJULmS/Q==@vger.kernel.org
X-Received: by 2002:a05:600c:3790:b0:475:e067:f23d with SMTP id
 5b1f17b1804b1-477870c52a3mr31201855e9.25.1763004606759; Wed, 12 Nov 2025
 19:30:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid> <20251113022719.GA2281498-robh@kernel.org>
In-Reply-To: <20251113022719.GA2281498-robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Nov 2025 19:29:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WUXK_xs4taxs8Q4kxqvkNYE+Ftk3N=N7Nm7yKEvUMtAQ@mail.gmail.com>
X-Gm-Features: AWmQ_blcmWR5kJDaDngm-8O-X2v8SAcxprJmk_stg7YsNR0KAtWultK00ENsFTE
Message-ID: <CAD=FV=WUXK_xs4taxs8Q4kxqvkNYE+Ftk3N=N7Nm7yKEvUMtAQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 12, 2025 at 6:27=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Nov 11, 2025 at 11:22:04AM -0800, Douglas Anderson wrote:
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
>
> I think this is a problem...

Fair enough. Is the right answer to add a special rule when applying
overlays to base dtbs? If both the base DTB and the overlay contain a
top-level compatible, should we merge the two instead of having the
overlay replace the base property? Would that be right in all cases?

Specifically, if we were to look at how we handle our dev boards that
are socketed and can handle either SoC rev A0 or SoC rev B0, I guess
the top-level compatible string somehow needs to indicate this
somehow? If we "merged" the compatible strings of the board and the
SoC?

So if we had a deepspace (devboard) with a A0 rev SoC:

base (lga A0):
  google,soc-id-0005-rev-00, google,lga

overlay (deepspace devboard 1)
  google,pixel-id-070101-rev-010000

Final compatible:
  google,pixel-id-070101-rev-010000, google,soc-id-0005-rev-00, google,lga

If we had a deepspace with a B0 rev SoC:

base (lga A0):
  google,soc-id-0005-rev-10, google,lga

overlay (deepspace devboard 1)
  google,pixel-id-070101-rev-010000

Final compatible:
  google,pixel-id-070101-rev-010000, google,soc-id-0005-rev-10, google,lga


...is that what you're thinking? Of course, it still somehow feels
cleaner to me to put the SoC compatible under the "soc@0" node, though
I know that goes against "tradition"... If we did that then the base
SoC "dtb" doesn't need a compatible at all and the board would _just_
have its own compatible.


NOTE: I don't think this is a novel problem. There are already
existing overlays that mess with the top-level compatible...

grep '^\tcompatible' $(find arch/arm64/boot/dts -name '*.dtso')


> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > In the past, attempts to have the SoC as a base device tree and boards
> > supported as overlays has been NAKed. From a previous discussion [1]
> > "Nope, boards are not overlays. Boards are DTB." I believe this needs
> > to be relitigated.
>
> I think it is worth having the discussion. There's been some discussions
> about an overlay split with SoMs and baseboards as well. I think that's
> what is driving this addition[1]. I don't think this case is much
> different.
>
> As a different way to combine things compared to .dtsi files, I don't
> care too much how things are structured to the extent that's just
> internal structure and we're moving the combining of files from one
> point in time to another.
>
> My concern here is largely around validation. Can the SoC DTB pass
> validation, and can we still validate the whole thing at build time? To
> start with, it's not great if we have to make the schema allow only an
> SoC compatible without a board compatible. Then suddenly omitting a
> board compatible is always valid. Solving that with an entirely
> different SoC compatible as you have doesn't seem great.

I guess, in theory, we could solve this by simply not trying to
validate the SoC "dts" file on its own. Is this as simple as giving it
its own filename suffix? Do we just call it "lga-b0.dtsb" or for
"device tree source base", or something like that? Then we add kernel
rules where we don't validate that on its own but only validate it
together with overlays?


> My other concern is whether this is an ABI between the SoC and board
> DTBs? And I don't mean just you, but for anyone wanting to do anything
> remotely similar. An ABI is a problem as we don't really have any way to
> validate each piece separately. (This is already a problem for existing
> overlays.)

To keep the problem smaller / easier to think about and not try to
solve all existing problems: the only case we're worried about at the
moment is when the base device tree and all overlays are generated at
the same time. That feels like it might be an easier case to handle?


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
> >
> > diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Docume=
ntation/devicetree/bindings/arm/google.yaml
> > index 99961e5282e5..f9f9ea1c8050 100644
> > --- a/Documentation/devicetree/bindings/arm/google.yaml
> > +++ b/Documentation/devicetree/bindings/arm/google.yaml
> > @@ -13,27 +13,18 @@ description: |
> >    ARM platforms using SoCs designed by Google branded "Tensor" used in=
 Pixel
> >    devices.
> >
> > -  Currently upstream this is devices using "gs101" SoC which is found =
in Pixel
> > -  6, Pixel 6 Pro and Pixel 6a.
> > +  These bindings for older Pixel devices don't use device tree overlay=
s so
> > +  no separate SoC entry is added. This may change in the future.
> >
> > -  Google have a few different names for the SoC:
> > -  - Marketing name ("Tensor")
> > -  - Codename ("Whitechapel")
> > -  - SoC ID ("gs101")
> > -  - Die ID ("S5P9845")
> > -
> > -  Likewise there are a couple of names for the actual device
> > -  - Marketing name ("Pixel 6")
> > -  - Codename ("Oriole")
> > -
> > -  Devicetrees should use the lowercased SoC ID and lowercased board co=
dename,
> > -  e.g. gs101 and gs101-oriole.
> > +  Newer Pixel devices are expected to have the SoC device tree as the =
base
> > +  and specific board device trees as overlays.
> >
> >  properties:
> >    $nodename:
> >      const: '/'
> >    compatible:
> >      oneOf:
> > +      # Google Tensor G1 AKA gs101 AKA whitechapel AKA Die ID S5P9845 =
boards
> >        - description: Google Pixel 6 or 6 Pro (Oriole or Raven)
> >          items:
> >            - enum:
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
>
> Should upstream really care about anything other than MP1? I don't think
> so. Which ones are useful in 1 year, 2 years, 10 years?

I suspect that nearly all of them are useful, though _possibly_ some
of the early proto devices can be removed?

Specifically, engineers at Google will be supporting these devices for
many many years to come. Newer Pixel phones have something like an
8-year support life during which engineers will need to continue to
support them. From my experience on the Pixel team, unless you can
demonstrate a need for something newer it's common to get assigned EVT
1 or EVT 1.1 devices when you request hardware, even for older phones.

Even if end users are unlikely to need these, having them supported
will be essential for those at Google who need to support the product
as a whole.

We've had similar discussions in the past about Chromebooks and the
need to support old hardware, which is why Chromebooks have many
revisions supported. I can tell you that when we tried to drop old
revisions in the past I had angry people come and visit me.


> > +          - const: google,lga-frankel
> > +          - const: google,lga
>
> It's not clear to me how you map boards to SoC revision? You boot up
> using the SoC DTB and then select the board DTBO based on?

The key here is that combining happens in the bootloader. The
bootloader boots up and has its own (non-device tree ways) to handle
things. It then looks at the SoC ID register, looks at the IDs that
tell it what board it's running on, and picks a base DTB (representing
the SoC) and an overlay (representing the board). It combines these
two and passes a single unified device tree to Linux.

Maybe this is a key difference between what we're doing and what
you're thinking of? We're not trying to boot the main OS with just the
base.


> This all
> needs to be well defined and general enough any (existing) platform
> could use it. If [1] helps or doesn't work for you I'm interested in
> hearing that.

> [1] https://lore.kernel.org/devicetree-spec/20250911151436.2467758-1-raym=
ond.mao@linaro.org/

Perhaps I don't understand the proposal, but it doesn't seem useful to
me (?) or at least it's not relevant to the problem we're trying to
solve here.

If I had to guess, I'd say the problem they're trying to solve there
is that they've got some external peripherals (like an i2c-connected
dohickey). They want to ship their dohickey to customers and tell
customers that they can attach the dohickey to any of a number of
devboards. If a customer attaches their dohickey to a Raspberry Pi it
should go on, let's say, i2c5. If it's on a Beagleboard they'll say it
belongs on i2c3. On an stm32 it belongs on i2c11. So they distribute a
bunch of "dtbo" files with their dohickey, one for each target
devboard. This mechanism allows a loader to figure out which devboard
is running and which overlay should be loaded. Is that right?


In our case, the problem is very different. We're really just trying
to pick together all the pieces that make up a full system.

-Doug
