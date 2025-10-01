Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6832517B9
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Oct 2025 15:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759333263; cv=none; b=rfuo+SDr6g+0AL+8y2iBoIhH4FVDVRwARf/VE5LBl1GYpJr2InMen+M6J1olkoDVLLF4FEBvMvN2SolY+CDOqRL1Mv2aGHOpteSsHcqObFt7miesy935meu0KfppHMwlNb061vTggNpAtN7Z9Cr9rXlvhHaOKyULQOi0KlEs0AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759333263; c=relaxed/simple;
	bh=VPFhdajTzt4PMvSoazJy32tPKtXgLDASc3DZDYmsvgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBabLYwFAAmqZW579MPsMGqAAAsEOnbM/cUaafKKWvAUivHYrEgGmgwr+ksTy4U72IFsaneLCKxYAvZCxlYyWnGIVRwrHgVp6plBnqv5kxPaMvSpoAYRO8zUYs56QzfuWsrSNq5tFH6V+afGRbFSSJ0xIPwJjy0nwl9j0cLJNMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e23n1Qc3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e23n1Qc3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A23C4AF0B
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Oct 2025 15:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759333263;
	bh=VPFhdajTzt4PMvSoazJy32tPKtXgLDASc3DZDYmsvgc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e23n1Qc3HVN4q/9rR/RJ2z/QTpQP2EYU+7XtZXUBEmkvWg94/88Xcx5Xyohv2L02X
	 oebDZeQoYJUp/eKPBkFFf9TDFrYIgNEFU+fjF4v6HUKXPTZEfAYpl6RodLriRyu59Y
	 UZ58ngllpRf25ivv6yv1M7Uof/Sl+Di5nNGrlonEF2/+7x1WL2VRaiujoec/TMuAKP
	 Lb6vNxovtX1mLMoAiOFoUGZX9qhxZ1vyW4F+u3ORWbkM7uMYo1rxvURMI1vaoqDBcM
	 CSSTgzX4RL2s+PlNG62SiLPUABzoO57LA7caUyqy7xA9ZlKZj0jIZm9MGHbA7gW0fQ
	 LW0hf6Kf0KcRA==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b41870fef44so756066b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Oct 2025 08:41:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCViCHbLFmA4AtEAN3ovIDtZG+o4rAI11eYi0O5Y00uOhkR28i+6GYXNWajopzr5TT61K1fYVaiSwmR90jHTQu2kMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpYN/B06bO9LS6SqGhPg0SmEiisZYWhIsS1Rqho1DVr58X0bt2
	CmyhLzlIiompD3f/Q0xeQlphQLR+7uef2I9qOaBNyBgXdtGkhKNqOrh1WfPFlB8wF/1PkQoMIUc
	4bqSnlAeAiRelOubgy7KbIzRWGKceYQ==
X-Google-Smtp-Source: AGHT+IEQg/Wj/A5kVG6NeqjVifOVkTFeucuHaTw0oAe89TAlFoQQ9Maf0g7ETh3zkxolZbtxGs/+9BsGvGwwYEgRweU=
X-Received: by 2002:a17:906:6a28:b0:b3d:e9be:7ad0 with SMTP id
 a640c23a62f3a-b46e4d7dbdamr429653566b.6.1759333262008; Wed, 01 Oct 2025
 08:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
 <175911189634.2556697.2474466935066391775.robh@kernel.org> <32036b3916a944be9450e48b6be30dc0@disroot.org>
In-Reply-To: <32036b3916a944be9450e48b6be30dc0@disroot.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 1 Oct 2025 10:40:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLYCRfRuxtymiH50QrSXVsCQ_DFfP6E3GnnDP_Q0ofAJg@mail.gmail.com>
X-Gm-Features: AS18NWBM0yEC5v7mwPKzU4adk5H2ji9GiLwA3JN9Wk_AB63JYvswUWeOPHSnB2c
Message-ID: <CAL_JsqLYCRfRuxtymiH50QrSXVsCQ_DFfP6E3GnnDP_Q0ofAJg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 5:05=E2=80=AFAM Kaustabh Chakraborty
<kauschluss@disroot.org> wrote:
>
> On 2025-09-29 02:14, Rob Herring (Arm) wrote:
> > On Sun, 28 Sep 2025 23:26:34 +0530, Kaustabh Chakraborty wrote:
> >> Exynos7870 has a IP subsystem in its architecture dedicated to display
> >> management. Notably, this block includes the Display Enhancement
> >> Controller (DECON), and the DSI Master (DSIM).
> >>
> >> The following series and its sub-series implement all components for a
> >> functioning display pipeline. All vital information which helped
> >> shaping
> >> up the patches have been retrieved from Exynos7870 vendor kernel
> >> sources
> >> as provided by Samsung.
> >>
> >> Testing has been done on all three devices available upstream, i.e.
> >> Samsung Galaxy J7 Prime (samsung-on7xelte), Samsung Galaxy A2 Core
> >> (samsung-a2corelte), and Samsung Galaxy J6 (samsung-j6lte).
> >> Regrettably,
> >> I've only been able to test the functionality on video mode, as none
> >> of
> >> the devices have panels working in command mode.
> >>
> >> This series implements changes in the SoC subsystem, which includes
> >> devicetree additions. It depends on all sub-series listed below:
> >> (Legend: [R]eviewed, [A]ccepted)
> >>
> >> exynos-sysmmu-resv-regions A
> >> https://lore.kernel.org/r/20250712-exynos-sysmmu-resv-regions-v1-1-e79=
681fcab1a@disroot.org
> >> exynos7870-mipi-phy        A
> >> https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9=
d3@disroot.org
> >> exynos7870-mipi-phy-fix    A
> >> https://lore.kernel.org/r/20250710-exynos7870-mipi-phy-fix-v2-1-5cf50d=
69c9d7@disroot.org
> >> exynos7870-dsim            A
> >> https://lore.kernel.org/r/20250706-exynos7870-dsim-v3-0-9879fb9a644d@d=
isroot.org
> >> exynosdrm-decon            A
> >> https://lore.kernel.org/r/20250706-exynosdrm-decon-v4-0-735fd215f4b3@d=
isroot.org
> >> panel-samsung-s6e8aa5x01   A
> >> https://lore.kernel.org/r/20250721-panel-samsung-s6e8aa5x01-v5-0-1a315=
aba530b@disroot.org
> >> panel-synaptics-tddi       -
> >> https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d1=
3c7@disroot.org
> >>
> >> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> >> ---
> >> Changes in v3:
> >> - fixed minor issues with devicetree in regards to compliance
> >> - added memory-region to framebuffer region for decon device
> >> - added related patchset to list: exynos-sysmmu-resv-regions
> >> - replaced exynos7870-pmu with exynos7-pmu compatible to the list
> >>   allowing a MIPI PHY subnode (krzk)
> >> - updated compatible string and dt node for j6lte's panel
> >> - reorder properties: ${x}, followed by ${x}-names (krzk)
> >> - Link to v2:
> >> https://lore.kernel.org/r/20250627-exynos7870-drm-dts-v2-0-d4a59207390=
d@disroot.org
> >>
> >> Changes in v2:
> >> - modified compatible hierarchy to use non-deprecated syntax (krzk)
> >> - fixed subject prefixes of [v1 2/5], [v1 3/5], [v1 4/5], [v1 5/5]
> >> (krzk)
> >> - removed simplefb nodes instead of disabling it (krzk)
> >> - added dt-bindings patch to allow mipi-phy node under PMU
> >> - changed clock names of dsim node
> >> - Link to v1:
> >> https://lore.kernel.org/r/20250612-exynos7870-drm-dts-v1-0-88c0779af6c=
b@disroot.org
> >>
> >> ---
> >> Kaustabh Chakraborty (6):
> >>       dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
> >>       dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode
> >> for Exynos7 PMU
> >>       arm64: dts: exynos7870: add DSI support
> >>       arm64: dts: exynos7870-on7xelte: enable display panel support
> >>       arm64: dts: exynos7870-a2corelte: enable display panel support
> >>       arm64: dts: exynos7870-j6lte: enable display panel support
> >>
> >>  .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
> >>  .../soc/samsung/samsung,exynos-sysreg.yaml         |  2 +
> >>  .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 57
> >> +++++++++++----
> >>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    | 38 ++++++----
> >>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 57
> >> +++++++++++----
> >>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 84
> >> ++++++++++++++++++++++
> >>  6 files changed, 197 insertions(+), 42 deletions(-)
> >> ---
> >> base-commit: 262858079afde6d367ce3db183c74d8a43a0e83f
> >> change-id: 20250523-exynos7870-drm-dts-87ccab731ba9
> >>
> >> Best regards,
> >> --
> >> Kaustabh Chakraborty <kauschluss@disroot.org>
> >>
> >>
> >>
> >
> >
> > My bot found new DTB warnings on the .dts files added or changed in
> > this
> > series.
> >
> > Some warnings may be from an existing SoC .dtsi. Or perhaps the
> > warnings
> > are fixed by another series. Ultimately, it is up to the platform
> > maintainer whether these warnings are acceptable or not. No need to
> > reply
> > unless the platform maintainer has comments.
> >
> > If you already ran DT checks and didn't see these error(s), then
> > make sure dt-schema is up to date:
> >
> >   pip3 install dtschema --upgrade
> >
> >
> > This patch series was applied (using b4) to base:
> >  Base: using specified base-commit
> > 262858079afde6d367ce3db183c74d8a43a0e83f
> >
> > If this is not the correct base, please add 'base-commit' tag
> > (or use b4 which does this automatically)
> >
> > New warnings running 'make CHECK_DTBS=3Dy for
> > arch/arm64/boot/dts/exynos/' for
> > 20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org:
> >
> > arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb:
> > /soc@0/dsi@14800000/panel@0: failed to match any schema with
> > compatible: ['syna,td4300-panel']
> > arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb:
> > /soc@0/dsi@14800000/panel@0: failed to match any schema with
> > compatible: ['syna,td4101-panel']
>
> Note: This affects patches 4/6 and 5/6, rest should be mergeable.

You sent a series and it's easier for maintainers to take a whole
series than figure out what they can and can't apply. In any case,
we're in the middle of the merge window now, so you will need to
resend everything after rc1. You should either fix the warnings or
drop the 2 patches when you send it again.

Rob
