Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFC21F5839;
	Fri,  8 Nov 2024 14:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731077920; cv=none; b=No+3W0KRN17YzhcP32HNDYRDbdHHDMZXC/4W6l6Gh9Mv3iY4yfLRpkIHkXKEWqbUhytGtpMDFEYeDq+LrOWHu/+TGm9NFPaRZJWeyUTp5jUEgAK47cW9IzijXeHhOx3UouKiy+03CK8TSHPG+b/5GuTR57qtg6xPCEfxyoG54oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731077920; c=relaxed/simple;
	bh=LpG39qqU1URrHICuGs7ygOJgOeEZduFX4Mef0Sou4KU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j18gj3X4AGC3vf+gW74FwbRdQoFvYBiCsP5qJwGFnKfGKxXixO8chDLMN3VEEb+r5NllSt3aixyqG3AGtSwP8gdqhWlNzDPfkIsQOg6N1cmV/Bit0PSQB0SE9Hq9R1ECkfxnOewPYPPHOH3gKFX2BCosi9SvWLE2BLQq37ITl0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WK+BhFva; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WK+BhFva"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD86C4CECD;
	Fri,  8 Nov 2024 14:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731077919;
	bh=LpG39qqU1URrHICuGs7ygOJgOeEZduFX4Mef0Sou4KU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WK+BhFvasjIaKvlDTSittKA3PF+kBXMecJ6pH/MtfGiQPZnZzAoVqnBYRS4GRXZRl
	 WVNoqt8GnDV0x2+mmZrxxptn6WKtZPTs36jQguBLaQjOnWQPJ4zFUkzAGDjZuAubGX
	 TddvV1DpwPRBC4rcNmAkHYAcaTKp27UdjAPW1HcoQNwaM0rGAYJg0LLphBHPEBt5rw
	 B+bx4sqqYBftInWDe0w1UQNp5TRt45ElNm5NG3Qntu/NqNdMlLJHgvoBen6eiZCyEi
	 glA2IYD7aaHLo6XW4ZUxgRmu2Yul8XnRLPMYt8WaV/ut+FRpLgwK2y5uUCILpDNyv0
	 L4DoEKO8VpgEA==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e290222fdd0so2319845276.2;
        Fri, 08 Nov 2024 06:58:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3zJHm2S1eKvjye1vJ/N4HjXlvI1DuhneC27ohj80Krxdgv+dDllk5Ugwzt8Vb3R7IM4i0583PDorJ8P5B@vger.kernel.org, AJvYcCUAzlbkwP4YQ9CXZNd50xsa2fXRfanL6pr10NZHu5BWePuJLbGasRRDkmOm5JW4PboC+EIoQmeRtMAl@vger.kernel.org, AJvYcCXgAkqZnpQy+5QnwZda+cFthsOPHWlu+wtqXxrOf7xUucyVJoFvb+ca3w72prRbdW7nRV15XtJOCNDS6HBJFF9dH60=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAQ719+E6VEPSU+Gxjhm/Iox2rnILIoPHl4fcZivC4stcWyM50
	RMGKsEBpoto0UZ+sgSxB7rgriFxYl+hb2mZUVSPOnapn1C9lhjJS2Keod2sispLdvOBU/FUFl+v
	sK5Faulv3nUxzDkwh+QQ6bjl1jA==
X-Google-Smtp-Source: AGHT+IFTijkWBoFuDrAuQlURtR/GqlKnV1aE+tc3/ggelsz1fdahHEgBLcMYQ94HPKN48fC3aaYfm0kx1I18FcNf4Xs=
X-Received: by 2002:a05:6902:68b:b0:e29:566d:c30 with SMTP id
 3f1490d57ef6-e337f860db3mr2498969276.16.1731077918830; Fri, 08 Nov 2024
 06:58:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106171028.3830266-1-robh@kernel.org> <CGME20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d@eucas1p2.samsung.com>
 <3706d174-fadd-485f-be7b-f7ef4b11cf84@samsung.com> <73eacca6-b6cd-4689-8ccd-f7e2e8b716f3@arm.com>
 <CAL_JsqLyFV85w1kf397AcvZ7+Oewpe3vYeZdz_uvQrYwb1B8ag@mail.gmail.com> <e23ecbab-66ba-478c-b720-fb045a08bc9c@arm.com>
In-Reply-To: <e23ecbab-66ba-478c-b720-fb045a08bc9c@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 8 Nov 2024 08:58:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLyuQaKpoq7wQeQs38HBu+_=SfgbMOGyGYtns6Dm-Y2Vw@mail.gmail.com>
Message-ID: <CAL_JsqLyuQaKpoq7wQeQs38HBu+_=SfgbMOGyGYtns6Dm-Y2Vw@mail.gmail.com>
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells handling
To: Steven Price <steven.price@arm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 8:33=E2=80=AFAM Steven Price <steven.price@arm.com> =
wrote:
>
> On 08/11/2024 14:04, Rob Herring wrote:
> > On Fri, Nov 8, 2024 at 7:26=E2=80=AFAM Steven Price <steven.price@arm.c=
om> wrote:
> >>
> >> On 08/11/2024 11:04, Marek Szyprowski wrote:
> >>> Hi Rob,
> >>>
> >>> On 06.11.2024 18:10, Rob Herring (Arm) wrote:
> >>>> While OpenFirmware originally allowed walking parent nodes and defau=
lt
> >>>> root values for #address-cells and #size-cells, FDT has long require=
d
> >>>> explicit values. It's been a warning in dtc for the root node since =
the
> >>>> beginning (2005) and for any parent node since 2007. Of course, not =
all
> >>>> FDT uses dtc, but that should be the majority by far. The various
> >>>> extracted OF devicetrees I have dating back to the 1990s (various
> >>>> PowerMac, OLPC, PASemi Nemo) all have explicit root node properties.=
 The
> >>>> warning is disabled for Sparc as there are known systems relying on
> >>>> default root node values.
> >>>>
> >>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >>>> ---
> >>>> v2:
> >>>>   - Add a define for excluded platforms to help clarify the intent
> >>>>     is to have an exclude list and make adding platforms easier.
> >>>>   - Also warn when walking parent nodes.
> >>>> ---
> >>>>   drivers/of/base.c | 28 ++++++++++++++++++++++------
> >>>>   drivers/of/fdt.c  |  4 ++--
> >>>>   2 files changed, 24 insertions(+), 8 deletions(-)
> >>>
> >>> This patch landed in today's linux-next as commit 4b28a0dec185 ("of:
> >>> WARN on deprecated #address-cells/#size-cells handling"). In my tests=
 I
> >>> found that it introduces warnings on almost all of my test systems. I
> >>> took a look at the first one I got in my logs (Samsung Exynos Rinato
> >>> board: arch/arm/boot/dts/samsung/exynos3250-rinato.dts):
> >>
> >> Just a "me too" for rk3288-firefly.dtb:
> >>
> >> [    0.138735] WARNING: CPU: 0 PID: 1 at drivers/of/base.c:106 of_bus_=
n_addr_cells+0x9c/0xd8
> >> [    0.138776] Missing '#address-cells' in /power-management@ff730000
> >>
> >> I'm sure it's easy to fix up the DTB, but we shouldn't be breaking lon=
g existing DTBs.
> >
> > What broke?
>
> Nothing 'broke' as such (the board continued booting) but the WARN
> shouldn't be happening. My CI treats the WARN as a failure as these
> shouldn't occur unless there's a programming error.
>
> > The intent here is to exclude any platforms/arch which actually need
> > the deprecated behavior, not change DTBs. That's spelled out at the
> > WARN which I assume people would read before fixing "Missing
> > '#address-cells' in /power-management@ff730000". I tried to make the
> > warn message indicate that on v1 with:
> >
> > WARN_ONCE(!IS_ENABLED(CONFIG_SPARC), "Only listed platforms should
> > rely on default '#address-cells'\n");
>
> So one possibility is to include this platform in the exclusion list -
> but I'm not sure how to do that, I assume including CONFIG_ARM in the
> list would rather defeat the point of the patch. But my feeling is that
> it would involve a lot of playing whack-a-mole to identify individual
> platforms.

Please see my posted fix in this thread. Things "broke" quite a bit
more widely than anticipated.

> One obvious idea would be to look at the DTBs in the kernel tree and see
> which are affected by this currently, that might be a good place to
> start with an exclusion list.

It's been a dtc warning since 2007, so I can say all of the in tree
dts's are fine. The problem for these reported platforms is the
kernel, not the DT.

> You could also downgrade the warning to a pr_warn() or similar.

I find that pr_warn() may or may not get noticed, but WARN for sure
will which is what I want here.

Rob
