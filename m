Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E1A315D21
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 06:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763361832; cv=none; b=SLkn1T0bl/S5T+PcyIGy8pBVYacvF2zWqghPZB7mbgRgkFs8E4Yss1m92owcII4RI+fs114vOKPUzjWl8YL8em1iKDdiUBTueyhHBLu4pTJ6d07Jlkif1wP5hJHSaaI9mjPNlhGAUTrllCi+vZAH3JJ1yTbQAjOdWdXW11ehpvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763361832; c=relaxed/simple;
	bh=9ysjpvLWsgTbmGqC4emtsSB30/a33Hh8jtrwzqe8o8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRyfA6kjUGJ9dwx6nyGn7eBYuAI9ybSYX699WmOndbBhxHgrI3K3pPBMpgXOfousJoiolal/Q2eiWj/W/hB2cCcMIVV34IL5RcKKInfBFeckBI0Z/RzsMaqducevs9/5gp+ju2SxmhKC5IAMLZD67AspaHA1uoWCvk9ZLkLGirg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MmYrVZFS; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MmYrVZFS"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59445ee9738so2954262e87.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Nov 2025 22:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763361827; x=1763966627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztzu8L8EDjVQmWigMrq/r3UxqoaXtRAo05IFtuz6rNQ=;
        b=MmYrVZFSUUWD9lkw+QP3E6YGftN71ijaCaewJK5BNMH4OjXM+yhZHyXCxijvgQfsrQ
         xmEpBFrq/1dCJZBaW8ejNETerAmMyMl/krXXGPAWEFslQPZieWDdGVQqV6IcBAbXPSKl
         KLWYGfFHkwLLDQbAJrpNrclZt74z8p2s39pI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763361827; x=1763966627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ztzu8L8EDjVQmWigMrq/r3UxqoaXtRAo05IFtuz6rNQ=;
        b=xPaDaMr2925ZWqmK8JolasP9dlWZptob6GYnUG8U9Us2k5cuk79NPJbd/Q/T38xx59
         P7PQeyzdnh4o7xjZa4IX5mBiWyGWobrEO452PK2rVvZHjo2BQaLd1fEnut7kqjMEcY4s
         F0aEcb5kIAYMKqs1nhkUUfJ+gT7sm/HqtwztMwOGi3inzXoTo60VoJ8di+0WpgcLdY+O
         cdEhnn1vzMedtsxmAubbK0LJTS6VBAp+xr0isf7CPBzxDNkr5juVHnUlsDlUN3+hEAZI
         eNSW3ndd+97qY4MNl1fmV47CgwZ7VIDVNoPn3dRFlg98hCFw8ieem1pZKyyFv4DKEUgP
         +DMA==
X-Forwarded-Encrypted: i=1; AJvYcCU/TbsvAYfsG6buqdYwdNtmqB7th/fWGPL4QpsT6uBpmQFSxC4UwqxMvDcxJpSE+na9W9QidGv1AU+ZOZAFClcOFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUD87lbEJsjoXG3xRe3BCX6GLdmNSaJWwIXMizuijwAWauD5LI
	KgzT196C/q6EDIgPXwxg7ICju6c6CMuJpMBF5mMQQH4nyZ4aJ32XX+E3Y4iD7wPSP0+gTqaS8ZH
	YCIRZ8qh7+Q7345UY/PXLpXbcAhtj3Kd32bL841+o
X-Gm-Gg: ASbGncvH4dfh5U8P5YJvCI1FzZKvArqyc2fGTSC2MEpZJFWps37qUXLsfiD4L7EGAx0
	e5IHs+K4LALJ+HU3VLNlXhy6rWayQjuupPBeVvJWkZhgrwlBvVNHyeHMwq8zaKC2st0dRiWFOh4
	Var/w5mNkvko7mxcLDYMD0LC079JpmKtn/TXrASNmLyyrFl3FuuGtNDU8cwomB8xkdnaxJtBHhv
	wqiBHtjmrhH3Gj/JWcjAOtGam62/9dbjhUaTWC5UfYbGVQ3hf19rzUEolcOLxUStixLrWkUFByg
	hQxNxl6BuPpBO+c=
X-Google-Smtp-Source: AGHT+IEC+yNRKOQ9NawANN7tyYA6Ho86/PVANukDuW3Y5gE7g+0lwkQo3dAyt0tv+U9auseXUxL2sMmlRPYBB0lWDTU=
X-Received: by 2002:a05:6512:39cf:b0:594:5000:4554 with SMTP id
 2adb3069b0e04-59584205e12mr3303964e87.28.1763361826796; Sun, 16 Nov 2025
 22:43:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.4.I5032910018cdd7d6be7aea78870d04c0dc381d6e@changeid>
 <40e67c6d-2430-483b-b4b1-0220ffbd6418@kernel.org> <CAGXv+5Gx+skrUR3PXt=RSL8YyKZYeQCkJ-3qW9wtrHrr9aqWAg@mail.gmail.com>
 <312ca473-77a6-4b95-b558-bb121294fbc9@kernel.org>
In-Reply-To: <312ca473-77a6-4b95-b558-bb121294fbc9@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 17 Nov 2025 14:43:35 +0800
X-Gm-Features: AWmQ_bl2shuWAHtLdGE1SHKrUg5L4s7uIhfcqFtBi7QSUqtHRD0ALPKOeLoheIw
Message-ID: <CAGXv+5EdkibBaB1-AyyfYO-STtmZzvTh1t-p+QW3jGb8cHY5wg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: google: Add initial dts for frankel,
 blazer, and mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	William McVicker <willmcvicker@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 5:49=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 12/11/2025 10:35, Chen-Yu Tsai wrote:
> > On Wed, Nov 12, 2025 at 4:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 11/11/2025 20:22, Douglas Anderson wrote:
> >>> Add barebones device trees for frankel (Pixel 10), blazer (Pixel 10
> >>> Pro), and mustang (Pixel 10 Pro XL). These device trees are enough to
> >>> boot to a serial prompt using an initramfs.
> >>>
> >>> Many things can be noted about these device trees:
> >>>
> >>> 1. They are organized as "dts" files for the main SoC and "dtso"
> >>>    overlays for the boards. There is discussion about this in the
> >>>    bindings patch ("dt-bindings: arm: google: Add bindings for
> >>>    frankel/blazer/mustang").
> >>> 2. They won't boot with the currently shipping bootloader. The curren=
t
> >>>    bootloader hardcodes several paths to nodes that it wants to updat=
e
> >>>    and considers it a fatal error if it can't find these nodes.
> >>>    Interested parties will need to wait for fixes to land and a new
> >>>    bootloader to be rolled out before attempting to use these.
> >>> 3. They only add one revision (MP1) of each of frankel, blazer, and
> >>>    mustang. With this simple barebones device tree, there doesn't
> >>>    appear to be any difference between the revisions. More revisions
> >>>    will be added as needed in the future. The heuristics in the
> >>>    bootloader will pick the MP1 device tree if there are not any
> >>>    better matches.
> >>> 4. They only add the dts for the B0 SoC for now. The A0 SoC support
> >>>    can be added later if we find the need.
> >>> 5. Even newer versions of the bootloader will still error out if they
> >>>    don't find a UFS node to add calibration data to. Until UFS is
> >>>    supported, we provide a bogus UFS node for the bootloader. While
> >>>    the bootloader could be changed, there is no long-term benefit
> >>>    since eventually the device tree will have a UFS node.
> >>> 6. They purposely choose to use the full 64-bit address and size cell=
s
> >>>    for the root node and the `soc@0` node. Although I haven't tested
> >>>    the need for this, I presume the arguments made in commit
> >>>    bede7d2dc8f3 ("arm64: dts: qcom: sdm845: Increase address and size
> >>>    cells for soc") would apply here.
> >>> 7. Though it looks as if the UART is never enabled, the bootloader
> >>>    knows to enable the UART when the console is turned on. Baud rate
> >>>    is configurable in the bootloader so is never hardcoded in the
> >>>    device tree.
> >>>
> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>> ---
> >>> To avoid fragmenting the discussion, IMO:
> >>> * Let's have the discussion about using the "dts" for SoC and the
> >>>   "dtso" for the boards in response to the bindings (patch #1).
> >>
> >> That's discussion here, bindings are irrelevant to this.
> >>
> >>> * If we want to have a discussion about putting "board-id" and
> >>>   "model-id" at the root of the board overlays, we can have it
> >>>   here. I'll preemptively note that the "board-id" and "model-id"
> >>>   won't show up in the final combined device tree and they are just
> >>>   used by the tool (mkdtimg). We could change mkdtimg to parse the
> >>>   "compatible" strings of the overlays files (since I've put the IDs
> >>>   there too), but official the docs [1] seem to indicate that
> >>>   top-level properties like this are OK.
> >>>
> >>> In order for these device trees to pass validation without warnings,
> >>> it's assumed you have my dtc patches:
> >>> * https://lore.kernel.org/r/20251110204529.2838248-1-dianders@chromiu=
m.org
> >>> * https://lore.kernel.org/r/20251110204529.2838248-2-dianders@chromiu=
m.org
> >>>
> >>> [1] https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/Documentati=
on/dt-object-internal.txt?h=3Dmain
> >>>
> >>>  arch/arm64/boot/dts/google/Makefile           |   9 +
> >>>  arch/arm64/boot/dts/google/lga-b0.dts         | 391 ++++++++++++++++=
++
> >>>  .../arm64/boot/dts/google/lga-blazer-mp1.dtso |  22 +
> >>>  .../boot/dts/google/lga-frankel-mp1.dtso      |  22 +
> >>>  .../boot/dts/google/lga-mustang-mp1.dtso      |  22 +
> >>>  .../boot/dts/google/lga-muzel-common.dtsi     |  17 +
> >>>  6 files changed, 483 insertions(+)
> >>>  create mode 100644 arch/arm64/boot/dts/google/lga-b0.dts
> >>>  create mode 100644 arch/arm64/boot/dts/google/lga-blazer-mp1.dtso
> >>>  create mode 100644 arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
> >>>  create mode 100644 arch/arm64/boot/dts/google/lga-mustang-mp1.dtso
> >>>  create mode 100644 arch/arm64/boot/dts/google/lga-muzel-common.dtsi
> >>>
> >>> diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dt=
s/google/Makefile
> >>> index a6b187e2d631..276001e91632 100644
> >>> --- a/arch/arm64/boot/dts/google/Makefile
> >>> +++ b/arch/arm64/boot/dts/google/Makefile
> >>> @@ -1 +1,10 @@
> >>>  # SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> >>> +
> >>> +dtb-$(CONFIG_ARCH_GOOGLE) +=3D \
> >>> +     lga-blazer-mp1.dtb \
> >>> +     lga-frankel-mp1.dtb \
> >>> +     lga-mustang-mp1.dtb
> >>> +
> >>> +lga-blazer-mp1-dtbs          :=3D lga-b0.dtb lga-blazer-mp1.dtbo
> >>> +lga-frankel-mp1-dtbs         :=3D lga-b0.dtb lga-frankel-mp1.dtbo
> >>> +lga-mustang-mp1-dtbs         :=3D lga-b0.dtb lga-mustang-mp1.dtbo
> >>> diff --git a/arch/arm64/boot/dts/google/lga-b0.dts b/arch/arm64/boot/=
dts/google/lga-b0.dts
> >>> new file mode 100644
> >>> index 000000000000..83c2db4f20ef
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/google/lga-b0.dts
> >>> @@ -0,0 +1,391 @@
> >>> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> >>> +/*
> >>> + * Google Tensor G5 (laguna) SoC rev B0
> >>> + *
> >>> + * Copyright 2024-2025 Google LLC.
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +
> >>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >>> +#include <dt-bindings/interrupt-controller/irq.h>
> >>> +
> >>> +/ {
> >>> +     model =3D "Google Tensor G5 rev B0";
> >>> +     compatible =3D "google,soc-id-0005-rev-10", "google,lga";
> >>
> >> So that's SoC, thus must not be a DTS file, but DTSI.
> >>
> >> ...
> >>
> >>
> >> ...
> >>
> >>
> >>> diff --git a/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso b/arch/a=
rm64/boot/dts/google/lga-frankel-mp1.dtso
> >>> new file mode 100644
> >>> index 000000000000..133494de7a9b
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
> >>
> >> And that's a board, so DTS.
> >>
> >>> @@ -0,0 +1,22 @@
> >>> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> >>> +/*
> >>> + * Google Pixel 10 (frankel) MP 1
> >>> + *
> >>> + * Copyright 2024-2025 Google LLC.
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +/plugin/;
> >>> +
> >>> +#include "lga-muzel-common.dtsi"
> >>> +
> >>> +/ {
> >>> +     board-id =3D <0x070306>;
> >>> +     board-rev =3D <0x010000>;
> >>
> >> Undocumented ABI, which you cannot document because these properties a=
re
> >> not allowed. You cannot have them.
> >
> > This is part of the discussion I want to have at Plumbers. But I suppos=
e
> > we can start here.
>
> Then the patch should be called RFC as not yet ready for merging. :)
>
> >
> > The Android DTB partition format uses six 32-bit integers for matching,
> > as opposed to a compatible string used in FIT images. Two of the intege=
rs
> > are the "id" and "rev" numbers in the example above. The remaining four
> > are custom and left up to the (vendor) bootloader implementation.
> >
> > The values for these fields need to be stored somewhere with the .dts.
> > The compiled DTB is useless if the user cannot build a proper image for
> > the bootloader to consume, and that involves putting in the right numbe=
rs
> > in these fields. The android "mkdtimg" tool can either take the values
> > from some known properties within the DTB, or have them fed to it
> > externally.
> >
> > So if we don't want these numbers in the dts itself, then we should com=
e
> > up with some format to store them beside the dts files.
>
> Re-iterating comment from Rob long time ago: adding such new properties
> is fine, but they must come for more than one user and be universal
> across these users.

Is Android universal enough? As mentioned above, Android defines some
fields that it wants in its DTBO partition header. I am doubtful we
could generalize further, since each bootloader scheme wants different
things.

> And of course the ABI needs to be documented which did not happen here.
>
> I indeed said incorrectly that "properties are not allowed". The
> properties could be allowed if we document them according to above Rob's
> comment, but that did not happen.
>
> Adding these properties per one SoC vendor is not really allowed, like
> qcom,board-id and qcom,msm-id, but maybe you intend to make it generic.

That is indeed not great. I believe this part predates the DTBO partition
format, and is also related to how vendors split their base DTB and
overlays, such as the scheme Doug presented.

Maybe the new Android Generic Boot Loader (GBL) work will provide
unification. I will reach out to them to see what's happening in that space=
.

> > On a similar note, we would have a similar problem with FIT images and
> > overlays. The FIT image format maps a (series of) compatible string(s)
> > to one DTB and any number of overlays. If overlays are involved, then
> > the compatible string cannot come from the DTB itself, and the mapping
> > must be stored somewhere.
>
> I recall, although cannot find now references to, a email talk on the
> list saying that such overlays should have their own compatible, thus
> solving this mapping problem.

Rob provided it in the other thread. The per-overlay compatible allows
identifying the overlay instead of using the filename, which I think
is much appreciated. But we still need a mapping of what a final device
compatible breaks down to.

For example, say we have the the following:

- product common base "google,yoda" (DTB)
- codec option one "google,yoda-codec-rt5682i" (DTBO)
- codec option two "google,yoda-codec-rt5682s" (DTBO)
- WWAN module and SAR sensor option "google,yoda,wwan" (DTBO)

We then have different SKUs that are a combination of the above:

- product SKU "google,yoda-sku0"
  combine "google,yoda", "google,yoda-codec-rt5682s", and "google,yoda,wwan=
"

- product SKU "google,yoda-sku4"
  combine "google,yoda", "google,yoda-codec-rt5682i", and "google,yoda,wwan=
"

- product SKU "google,yoda-sku16"
  combine "google,yoda" and "google,yoda-codec-rt5682s"

This is the mapping we have to put _somewhere_. The bootloader only
knows about "google,yoda-skuXYZ" and "google,yoda", as described in
the Chromebook boot flow document [1].

Now I suppose we could have per-SKU DTBOs that just update the base
compatible string, and have Makefile rules put them all together.
But we have something like 32 SKUs just for this product alone, and
I don't think we want to add that many dtso files. The whole reason
for us to switch to overlays was to avoid the explosion of SKU-based
DTB files.


Thanks
ChenYu

[1] Documentation/arch/arm/google/chromebook-boot-flow.rst
