Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A801D1EBFEB;
	Fri,  8 Nov 2024 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731074694; cv=none; b=JtPs0mSuFNul1jql+cfHAzs4JAQl6h+At2r7N3/zlRicQZzmEU68LBZBFq1eURMUQ0Nk36cGmaU+RG7Z5CRhJIzyOME14/kDlFyKwYu62RBu27aH9BucPSOgnZDj0cSMb9xfWS3pUDcz9acu8fnNfHXwGVAgj4XgzI1xLfsper4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731074694; c=relaxed/simple;
	bh=6ZnSU+m0Cd0UtNFM0il2aDZjDK4c/onwYc77e0mh9xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sW9vxU78So8qzDxo3gz62YDepjKZo2s/h9pyXUjlr8XkmQPVOCkadER6p95rj7W2EDjgga48eqL3xeadKpvR45egzLDjKhYS6s9xfRQanKUtua1yb1ifRIcL8bZFHkCtIHT2FzfTP4akMotK9FXPwW+Y63d2TAwf5sZkyameXFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dimzUVuG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dimzUVuG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A45C4CED5;
	Fri,  8 Nov 2024 14:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731074694;
	bh=6ZnSU+m0Cd0UtNFM0il2aDZjDK4c/onwYc77e0mh9xw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dimzUVuG1q9swhaHEIi5yxspVRGJwMt/wUtahvSop3+a8cN4xZnuGbeot+ndbZeQ4
	 +pi/ulZXE1JIEq/7r6cLNtfhr91Nm8gW/L5jtl3jx083D1HkxsDmYi+CNHHjrNEmBZ
	 9J4DqRCaMOlvlM8vT2YsSesqUy9UjcS9UW0NDMHy1D2kzX+DCc17JRzWWEo/9BXnQJ
	 fYBB+MRdFnhiiW8iAwc1iW1aygW/GkBxxn1SX508Z9JgO8F0wJVEJaKBcwyfSk2LDo
	 hSorHxprR3AW3GBStISOJQ4D8bmVmuxf9ZxByaAGANnynRkveH5sr4cfiGhNy7ww28
	 P6Btq15GovTZw==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ea5003deccso24409247b3.0;
        Fri, 08 Nov 2024 06:04:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIKmrC31jjrWTHdf8dfEPhkwO3zJ9o8Fajnn3aZCH6BJzYLHUUwwuU18WdphCx7oCasJQuusZmUIAKXGzWw32po0o=@vger.kernel.org, AJvYcCX8EaOCjSsFByQJ/177Vxo4A1KqJkRR6u+9quKvyQwGHDQsaRdvJFs8nJMmSR/SYQjbqT6bWrxelamu+WwD@vger.kernel.org, AJvYcCXXwG6ACd89SnBHulvDtpB1d91NpzIj+uxrxJwpBxgxOmIpIKSnE3uZPydMgXbwhlpIWfdhG/irX2TJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyLKwsqz/ioop0GX3gSF+daGFJGBZP8u6dcXPq0EDbvJgUXXZcK
	CsbwHu9FssYEaRyf6qO6zZeO1/U9FgyuqmG+zrosM335WHJS2gtPoyRlj51/PS3rl66rpcLGuPc
	PaHuo8V2+N6yTar6gvIxooNTfgw==
X-Google-Smtp-Source: AGHT+IGSkDHv6GeugPAoixz1l5GZ3GqOy9QxCCNnwGqAo4ktmPEwMouS80JH5JREEEPqz8kcp8lVTmeuRcZuTcd/9IU=
X-Received: by 2002:a05:690c:fd4:b0:6e5:e6e8:d6b7 with SMTP id
 00721157ae682-6eaddd7958cmr35629217b3.1.1731074693415; Fri, 08 Nov 2024
 06:04:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106171028.3830266-1-robh@kernel.org> <CGME20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d@eucas1p2.samsung.com>
 <3706d174-fadd-485f-be7b-f7ef4b11cf84@samsung.com> <73eacca6-b6cd-4689-8ccd-f7e2e8b716f3@arm.com>
In-Reply-To: <73eacca6-b6cd-4689-8ccd-f7e2e8b716f3@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 8 Nov 2024 08:04:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLyFV85w1kf397AcvZ7+Oewpe3vYeZdz_uvQrYwb1B8ag@mail.gmail.com>
Message-ID: <CAL_JsqLyFV85w1kf397AcvZ7+Oewpe3vYeZdz_uvQrYwb1B8ag@mail.gmail.com>
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells handling
To: Steven Price <steven.price@arm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 7:26=E2=80=AFAM Steven Price <steven.price@arm.com> =
wrote:
>
> On 08/11/2024 11:04, Marek Szyprowski wrote:
> > Hi Rob,
> >
> > On 06.11.2024 18:10, Rob Herring (Arm) wrote:
> >> While OpenFirmware originally allowed walking parent nodes and default
> >> root values for #address-cells and #size-cells, FDT has long required
> >> explicit values. It's been a warning in dtc for the root node since th=
e
> >> beginning (2005) and for any parent node since 2007. Of course, not al=
l
> >> FDT uses dtc, but that should be the majority by far. The various
> >> extracted OF devicetrees I have dating back to the 1990s (various
> >> PowerMac, OLPC, PASemi Nemo) all have explicit root node properties. T=
he
> >> warning is disabled for Sparc as there are known systems relying on
> >> default root node values.
> >>
> >> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >> ---
> >> v2:
> >>   - Add a define for excluded platforms to help clarify the intent
> >>     is to have an exclude list and make adding platforms easier.
> >>   - Also warn when walking parent nodes.
> >> ---
> >>   drivers/of/base.c | 28 ++++++++++++++++++++++------
> >>   drivers/of/fdt.c  |  4 ++--
> >>   2 files changed, 24 insertions(+), 8 deletions(-)
> >
> > This patch landed in today's linux-next as commit 4b28a0dec185 ("of:
> > WARN on deprecated #address-cells/#size-cells handling"). In my tests I
> > found that it introduces warnings on almost all of my test systems. I
> > took a look at the first one I got in my logs (Samsung Exynos Rinato
> > board: arch/arm/boot/dts/samsung/exynos3250-rinato.dts):
>
> Just a "me too" for rk3288-firefly.dtb:
>
> [    0.138735] WARNING: CPU: 0 PID: 1 at drivers/of/base.c:106 of_bus_n_a=
ddr_cells+0x9c/0xd8
> [    0.138776] Missing '#address-cells' in /power-management@ff730000
>
> I'm sure it's easy to fix up the DTB, but we shouldn't be breaking long e=
xisting DTBs.

What broke?

The intent here is to exclude any platforms/arch which actually need
the deprecated behavior, not change DTBs. That's spelled out at the
WARN which I assume people would read before fixing "Missing
'#address-cells' in /power-management@ff730000". I tried to make the
warn message indicate that on v1 with:

WARN_ONCE(!IS_ENABLED(CONFIG_SPARC), "Only listed platforms should
rely on default '#address-cells'\n");

But Conor thought that wasn't clear. So I'm open to suggestions...

Rob
