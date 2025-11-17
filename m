Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB41020A5E5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 07:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763362924; cv=none; b=cfspvruhi7MbmxArSyjebbsUwDGB5oGHEtC8hJSwscy+WicpdatZa7NsZ5RtZxml7Z1FVgnRDIyIfXs4uRU7a22Rd79UY6WmUYnkTTy/5zRSlhd2k7oNLuc28z4LS7rp5+h0KKvcsyUPP+D9lQrGcMUJmfDKGscvUwQFsC3sh7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763362924; c=relaxed/simple;
	bh=EDpznTLDG+eOmuiyc6ETf0Io8s2a1iBtEmnfJB2QR7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TEBvpVCtFE8UoiYX3HAGOG1IXEIgIxNqYu4uJFPkB6GOn9UX0Tf4Ol/7QkjCDdgkc7M02uy49kIIN25XiBaqxxKHij21MG13ZiIYSv3jkKc5ZnoX+1eeFj3fotN74e6ygtIhLdtaOYwskLOdvd1JAdSPK7zrMv2/mJG2DczONuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CINUOkGP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CINUOkGP"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5942b58ac81so2926165e87.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Nov 2025 23:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763362919; x=1763967719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iI7nA787yREp7SF+ZgPv2IF22WeDdIHHgGC9t9xZSFo=;
        b=CINUOkGP8E4tnI5LpRUrcD8OeB1lVAvp6aGveOmwU/lamCMCwwAkWJVx/AfksNlOBW
         wEDSp8//L4PZC9q9xTqbXuCeN/13fnU0UMSh9gi4+2glsSP//iXBFJ7b73XzCGh/1Dd1
         4VVbzR7Hljui7nQSuMW8nWhL11UDH3AsTLJWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763362919; x=1763967719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iI7nA787yREp7SF+ZgPv2IF22WeDdIHHgGC9t9xZSFo=;
        b=eMfmioknNy+2WPaN4JtZ3THY/+ziE3NyGPsHMHM9QVGulxAALuJevfgWRprORCpdSD
         GCTNbMjwF3zAjLwL/GYWYvRPc6eHaF0gARfZICgBF1QCY3/HHgndl3kA6QKuwDElINjz
         /FtV/kelXga1WeJgtUZK0yKrVD2AXAXEZPJiRIrZrnwOVGp1Qd6seaNmsmZtgNVgPwoC
         KNN4DTd1nT/wg5zJ7A2v8PO/X3muDJgA7vNo9uw5IHOC+BXiDor3cNfl8VRUssK958NB
         Q9prXxqLpnsozNVzgYdwO93iVxxzuKk8UIhZvv2hlBMOEVrPjSAFgFbnqSK4xA+SB9fg
         LY4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDhMVPwOTxIIr/lTcO/z6wVDX5bfI49/ShzPQQpCDzsfhkWIInEAfjEcoYyDD9hC5KEotle9hM1857GbTn0uCAaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywilv1JDtVPtXLfVZxEKUHgTWptHJ30jqB7S1WO8yMSrRc5yQlQ
	cRCqC8znf5Qee/RHLSvvfMqXTYRsitiSoJ1zEJ8BHuWsKq/y7Wg7SKAQLpwRFknW96iUUVXCynZ
	I3EVs8kdRbNKnafMpksO5tobSWd8CEbug/Mlx0WIA
X-Gm-Gg: ASbGncu/j3AQyxHgab097x19a/F1W9CbXznewrGUnbHrNeqADuKLYHVvcCxsuUqEZS2
	BMB+STcM8vo7tcoPhKGhiUwDUeS1MbtiGgSnB5dWfMzskQ3VVqqDnBDBtinyyUvcWTCFLz1rw4B
	wfaSw2TRTP8Q8UFtgwklakipbMks2jX/vgotXmL/bQpMO7WntJVqXHkeaem8WcniJDBs3XpWSY0
	xntanCePEyT0qA4qug2wFtV9NvjwJn/xLI3VPw//TWkO8QgOrUP2zvxz7iOThzAj/C87ZIHdHAE
	/3brImHJdVBzK0Q=
X-Google-Smtp-Source: AGHT+IERsUCpfw0ba2ZiCnoMPSwz482Iwmvh9l4yNvx3DiJpyztXvkPfAcsqYFZhO50s2/2D2hz7qLUeVGcO3KFp+QU=
X-Received: by 2002:a05:6512:3b09:b0:595:7d95:eab8 with SMTP id
 2adb3069b0e04-59584200406mr3411850e87.23.1763362918712; Sun, 16 Nov 2025
 23:01:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.4.I5032910018cdd7d6be7aea78870d04c0dc381d6e@changeid>
 <40e67c6d-2430-483b-b4b1-0220ffbd6418@kernel.org> <CAGXv+5Gx+skrUR3PXt=RSL8YyKZYeQCkJ-3qW9wtrHrr9aqWAg@mail.gmail.com>
 <312ca473-77a6-4b95-b558-bb121294fbc9@kernel.org> <CAGXv+5EdkibBaB1-AyyfYO-STtmZzvTh1t-p+QW3jGb8cHY5wg@mail.gmail.com>
 <5180555c-b9c2-498b-af53-dff9ddc7f676@kernel.org>
In-Reply-To: <5180555c-b9c2-498b-af53-dff9ddc7f676@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 17 Nov 2025 15:01:47 +0800
X-Gm-Features: AWmQ_bniIy-SMvSeqjFnpBYxeAVpBsmuGvcRUbYHegTmYwGCe-auKL5oxLqakP0
Message-ID: <CAGXv+5FmgzPcjQ2qAc6Na2m+_FsCszd5PEPWqPOxkNP-f4c9Bg@mail.gmail.com>
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

On Mon, Nov 17, 2025 at 2:55=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 17/11/2025 07:43, Chen-Yu Tsai wrote:
> > On Wed, Nov 12, 2025 at 5:49=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 12/11/2025 10:35, Chen-Yu Tsai wrote:
> >>> On Wed, Nov 12, 2025 at 4:14=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>>
> >>>> On 11/11/2025 20:22, Douglas Anderson wrote:
> >>>>> Add barebones device trees for frankel (Pixel 10), blazer (Pixel 10
> >>>>> Pro), and mustang (Pixel 10 Pro XL). These device trees are enough =
to
> >>>>> boot to a serial prompt using an initramfs.
> >>>>>
> >>>>> Many things can be noted about these device trees:
> >>>>>
> >>>>> 1. They are organized as "dts" files for the main SoC and "dtso"
> >>>>>    overlays for the boards. There is discussion about this in the
> >>>>>    bindings patch ("dt-bindings: arm: google: Add bindings for
> >>>>>    frankel/blazer/mustang").
> >>>>> 2. They won't boot with the currently shipping bootloader. The curr=
ent
> >>>>>    bootloader hardcodes several paths to nodes that it wants to upd=
ate
> >>>>>    and considers it a fatal error if it can't find these nodes.
> >>>>>    Interested parties will need to wait for fixes to land and a new
> >>>>>    bootloader to be rolled out before attempting to use these.
> >>>>> 3. They only add one revision (MP1) of each of frankel, blazer, and
> >>>>>    mustang. With this simple barebones device tree, there doesn't
> >>>>>    appear to be any difference between the revisions. More revision=
s
> >>>>>    will be added as needed in the future. The heuristics in the
> >>>>>    bootloader will pick the MP1 device tree if there are not any
> >>>>>    better matches.
> >>>>> 4. They only add the dts for the B0 SoC for now. The A0 SoC support
> >>>>>    can be added later if we find the need.
> >>>>> 5. Even newer versions of the bootloader will still error out if th=
ey
> >>>>>    don't find a UFS node to add calibration data to. Until UFS is
> >>>>>    supported, we provide a bogus UFS node for the bootloader. While
> >>>>>    the bootloader could be changed, there is no long-term benefit
> >>>>>    since eventually the device tree will have a UFS node.
> >>>>> 6. They purposely choose to use the full 64-bit address and size ce=
lls
> >>>>>    for the root node and the `soc@0` node. Although I haven't teste=
d
> >>>>>    the need for this, I presume the arguments made in commit
> >>>>>    bede7d2dc8f3 ("arm64: dts: qcom: sdm845: Increase address and si=
ze
> >>>>>    cells for soc") would apply here.
> >>>>> 7. Though it looks as if the UART is never enabled, the bootloader
> >>>>>    knows to enable the UART when the console is turned on. Baud rat=
e
> >>>>>    is configurable in the bootloader so is never hardcoded in the
> >>>>>    device tree.
> >>>>>
> >>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>>> ---
> >>>>> To avoid fragmenting the discussion, IMO:
> >>>>> * Let's have the discussion about using the "dts" for SoC and the
> >>>>>   "dtso" for the boards in response to the bindings (patch #1).
> >>>>
> >>>> That's discussion here, bindings are irrelevant to this.
> >>>>
> >>>>> * If we want to have a discussion about putting "board-id" and
> >>>>>   "model-id" at the root of the board overlays, we can have it
> >>>>>   here. I'll preemptively note that the "board-id" and "model-id"
> >>>>>   won't show up in the final combined device tree and they are just
> >>>>>   used by the tool (mkdtimg). We could change mkdtimg to parse the
> >>>>>   "compatible" strings of the overlays files (since I've put the ID=
s
> >>>>>   there too), but official the docs [1] seem to indicate that
> >>>>>   top-level properties like this are OK.
> >>>>>
> >>>>> In order for these device trees to pass validation without warnings=
,
> >>>>> it's assumed you have my dtc patches:
> >>>>> * https://lore.kernel.org/r/20251110204529.2838248-1-dianders@chrom=
ium.org
> >>>>> * https://lore.kernel.org/r/20251110204529.2838248-2-dianders@chrom=
ium.org
> >>>>>
> >>>>> [1] https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/Documenta=
tion/dt-object-internal.txt?h=3Dmain
> >>>>>
> >>>>>  arch/arm64/boot/dts/google/Makefile           |   9 +
> >>>>>  arch/arm64/boot/dts/google/lga-b0.dts         | 391 ++++++++++++++=
++++
> >>>>>  .../arm64/boot/dts/google/lga-blazer-mp1.dtso |  22 +
> >>>>>  .../boot/dts/google/lga-frankel-mp1.dtso      |  22 +
> >>>>>  .../boot/dts/google/lga-mustang-mp1.dtso      |  22 +
> >>>>>  .../boot/dts/google/lga-muzel-common.dtsi     |  17 +
> >>>>>  6 files changed, 483 insertions(+)
> >>>>>  create mode 100644 arch/arm64/boot/dts/google/lga-b0.dts
> >>>>>  create mode 100644 arch/arm64/boot/dts/google/lga-blazer-mp1.dtso
> >>>>>  create mode 100644 arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
> >>>>>  create mode 100644 arch/arm64/boot/dts/google/lga-mustang-mp1.dtso
> >>>>>  create mode 100644 arch/arm64/boot/dts/google/lga-muzel-common.dts=
i
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/=
dts/google/Makefile
> >>>>> index a6b187e2d631..276001e91632 100644
> >>>>> --- a/arch/arm64/boot/dts/google/Makefile
> >>>>> +++ b/arch/arm64/boot/dts/google/Makefile
> >>>>> @@ -1 +1,10 @@
> >>>>>  # SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> >>>>> +
> >>>>> +dtb-$(CONFIG_ARCH_GOOGLE) +=3D \
> >>>>> +     lga-blazer-mp1.dtb \
> >>>>> +     lga-frankel-mp1.dtb \
> >>>>> +     lga-mustang-mp1.dtb
> >>>>> +
> >>>>> +lga-blazer-mp1-dtbs          :=3D lga-b0.dtb lga-blazer-mp1.dtbo
> >>>>> +lga-frankel-mp1-dtbs         :=3D lga-b0.dtb lga-frankel-mp1.dtbo
> >>>>> +lga-mustang-mp1-dtbs         :=3D lga-b0.dtb lga-mustang-mp1.dtbo
> >>>>> diff --git a/arch/arm64/boot/dts/google/lga-b0.dts b/arch/arm64/boo=
t/dts/google/lga-b0.dts
> >>>>> new file mode 100644
> >>>>> index 000000000000..83c2db4f20ef
> >>>>> --- /dev/null
> >>>>> +++ b/arch/arm64/boot/dts/google/lga-b0.dts
> >>>>> @@ -0,0 +1,391 @@
> >>>>> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> >>>>> +/*
> >>>>> + * Google Tensor G5 (laguna) SoC rev B0
> >>>>> + *
> >>>>> + * Copyright 2024-2025 Google LLC.
> >>>>> + */
> >>>>> +
> >>>>> +/dts-v1/;
> >>>>> +
> >>>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>>> +#include <dt-bindings/interrupt-controller/irq.h>
> >>>>> +
> >>>>> +/ {
> >>>>> +     model =3D "Google Tensor G5 rev B0";
> >>>>> +     compatible =3D "google,soc-id-0005-rev-10", "google,lga";
> >>>>
> >>>> So that's SoC, thus must not be a DTS file, but DTSI.
> >>>>
> >>>> ...
> >>>>
> >>>>
> >>>> ...
> >>>>
> >>>>
> >>>>> diff --git a/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso b/arch=
/arm64/boot/dts/google/lga-frankel-mp1.dtso
> >>>>> new file mode 100644
> >>>>> index 000000000000..133494de7a9b
> >>>>> --- /dev/null
> >>>>> +++ b/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
> >>>>
> >>>> And that's a board, so DTS.
> >>>>
> >>>>> @@ -0,0 +1,22 @@
> >>>>> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> >>>>> +/*
> >>>>> + * Google Pixel 10 (frankel) MP 1
> >>>>> + *
> >>>>> + * Copyright 2024-2025 Google LLC.
> >>>>> + */
> >>>>> +
> >>>>> +/dts-v1/;
> >>>>> +/plugin/;
> >>>>> +
> >>>>> +#include "lga-muzel-common.dtsi"
> >>>>> +
> >>>>> +/ {
> >>>>> +     board-id =3D <0x070306>;
> >>>>> +     board-rev =3D <0x010000>;
> >>>>
> >>>> Undocumented ABI, which you cannot document because these properties=
 are
> >>>> not allowed. You cannot have them.
> >>>
> >>> This is part of the discussion I want to have at Plumbers. But I supp=
ose
> >>> we can start here.
> >>
> >> Then the patch should be called RFC as not yet ready for merging. :)
> >>
> >>>
> >>> The Android DTB partition format uses six 32-bit integers for matchin=
g,
> >>> as opposed to a compatible string used in FIT images. Two of the inte=
gers
> >>> are the "id" and "rev" numbers in the example above. The remaining fo=
ur
> >>> are custom and left up to the (vendor) bootloader implementation.
> >>>
> >>> The values for these fields need to be stored somewhere with the .dts=
.
> >>> The compiled DTB is useless if the user cannot build a proper image f=
or
> >>> the bootloader to consume, and that involves putting in the right num=
bers
> >>> in these fields. The android "mkdtimg" tool can either take the value=
s
> >>> from some known properties within the DTB, or have them fed to it
> >>> externally.
> >>>
> >>> So if we don't want these numbers in the dts itself, then we should c=
ome
> >>> up with some format to store them beside the dts files.
> >>
> >> Re-iterating comment from Rob long time ago: adding such new propertie=
s
> >> is fine, but they must come for more than one user and be universal
> >> across these users.
> >
> > Is Android universal enough? As mentioned above, Android defines some
> > fields that it wants in its DTBO partition header. I am doubtful we
> > could generalize further, since each bootloader scheme wants different
> > things.
>
> There is no such user of these bindings as "Android".

Sure, since many vendors for Android-based devices don't bother to
upstream their device trees.

> >
> >> And of course the ABI needs to be documented which did not happen here=
.
> >>
> >> I indeed said incorrectly that "properties are not allowed". The
> >> properties could be allowed if we document them according to above Rob=
's
> >> comment, but that did not happen.
> >>
> >> Adding these properties per one SoC vendor is not really allowed, like
> >> qcom,board-id and qcom,msm-id, but maybe you intend to make it generic=
.
> >
> > That is indeed not great. I believe this part predates the DTBO partiti=
on
> > format, and is also related to how vendors split their base DTB and
> > overlays, such as the scheme Doug presented.
> >
> > Maybe the new Android Generic Boot Loader (GBL) work will provide
> > unification. I will reach out to them to see what's happening in that s=
pace.
> >
> >>> On a similar note, we would have a similar problem with FIT images an=
d
> >>> overlays. The FIT image format maps a (series of) compatible string(s=
)
> >>> to one DTB and any number of overlays. If overlays are involved, then
> >>> the compatible string cannot come from the DTB itself, and the mappin=
g
> >>> must be stored somewhere.
> >>
> >> I recall, although cannot find now references to, a email talk on the
> >> list saying that such overlays should have their own compatible, thus
> >> solving this mapping problem.
> >
> > Rob provided it in the other thread. The per-overlay compatible allows
> > identifying the overlay instead of using the filename, which I think
> > is much appreciated. But we still need a mapping of what a final device
> > compatible breaks down to.
>
> Who is "we"? Linux does not care about that mapping. For user-space
> "google,yoda-sku0" should be good enough.

"We" as in the Chromebook team, but more broadly, any user or developer
that wants to build a generic kernel image based off of base DTBs and
overlays.

> >
> > For example, say we have the the following:
> >
> > - product common base "google,yoda" (DTB)
> > - codec option one "google,yoda-codec-rt5682i" (DTBO)
> > - codec option two "google,yoda-codec-rt5682s" (DTBO)
> > - WWAN module and SAR sensor option "google,yoda,wwan" (DTBO)
> >
> > We then have different SKUs that are a combination of the above:
> >
> > - product SKU "google,yoda-sku0"
> >   combine "google,yoda", "google,yoda-codec-rt5682s", and "google,yoda,=
wwan"
> >
> > - product SKU "google,yoda-sku4"
> >   combine "google,yoda", "google,yoda-codec-rt5682i", and "google,yoda,=
wwan"
> >
> > - product SKU "google,yoda-sku16"
> >   combine "google,yoda" and "google,yoda-codec-rt5682s"
> >
> > This is the mapping we have to put _somewhere_. The bootloader only
> > knows about "google,yoda-skuXYZ" and "google,yoda", as described in
> > the Chromebook boot flow document [1].
> >
>
> The entire pathset is about Google Pixel so I really do not get how
> Chromebook boot flow got here.

My apologies, I should have forked the thread to make it clear my stuff
was about Chromebooks, but the discussion on overlays seemed relevant.

I'll try to work out an example and RFC patchset based on existing
ChromeOS device trees to further discuss things.


ChenYu
