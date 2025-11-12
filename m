Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FB22594BD;
	Wed, 12 Nov 2025 10:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762942857; cv=none; b=DHLUAfR7aMiex+5pwhT8iepr/T7kj4T8HHRNwz8RoaisI7Lvfm+pXgfiKJk4Du0KN5YWxcg8bJHqBJ8qbmzoN9Ce/Tc6WXwBOh3BguW67r7RSuQ/2mYbC7qcsfhVcsNVVBnG9TQ1DWQAPTBby1TgcAr/GWWKnBS6R9APkY7j4Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762942857; c=relaxed/simple;
	bh=BjbMbn6QXuES5GSmGzJYQMBQyUywLDkryqleK8Yl/iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnaFPdtK+ZiHWQp7RWvSGKN/F2G5aJahBMu+RGDUPI10pd0NCTZmZH3SJbx7ncmkoi8konEZXqYQl/CglNksX+Cj4KjIc0ykdIN9STYZ2rGojCuGzAq7v9lgeaJ6CO6nG7orwOjhM0Q9tPBwojCvuNB7lRPzg6Qcwb9+LT88KXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnfEQmj1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnfEQmj1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55556C4CEF5;
	Wed, 12 Nov 2025 10:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762942856;
	bh=BjbMbn6QXuES5GSmGzJYQMBQyUywLDkryqleK8Yl/iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KnfEQmj1uZS0TGaWKSAdADLFlu8oZecWfpLq1rdx4dQ/8lV7AWqVTXLhFTOOfgGHT
	 uROw5hHAKgy1wnTlRXE29p2DOem+o3fTD8DuxWSXAJQEF7aBjGP0SA7s20cl9dEYjg
	 xR37clnTdSJ582ojs//Mw/i6t1b4Fgz4lI3APhbTp9v0Mb1goh4mbVH3fwOYvdTZhn
	 5E2C/E8XrkA41m/eVgxiLnNQ/44X6QfqXwmQ5HvS7AlF9do4VJT5TiNQlDhsec6JN9
	 bfOPEUH1LH4G8d2BpjjXabyEiDdkof2BuyXY2maoGNZ6G5HOQJe6EgunyVsnHGmoU9
	 OTS+ZPZTHtO0Q==
Date: Wed, 12 Nov 2025 11:20:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org, kernel-team@android.com, willmcvicker@google.com, arnd@arndb.de
Subject: Re: [PATCH 1/2] dt-bindings: soc: samsung: exynos-pmu: remove syscon
 for google,gs101-pmu
Message-ID: <20251112-airborne-tungsten-chupacabra-1c668c@kuoka>
References: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
 <20251103-remove-pmu-syscon-compat-v1-1-f2cb7f9ade6f@linaro.org>
 <20251105-guillemot-of-demonic-courtesy-6127ac@kuoka>
 <CADrjBPog8u8sRsUjcgKNG87kdcF5HHx94tUXPdTrCUG-PxSXWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADrjBPog8u8sRsUjcgKNG87kdcF5HHx94tUXPdTrCUG-PxSXWg@mail.gmail.com>

On Tue, Nov 11, 2025 at 10:18:47AM +0000, Peter Griffin wrote:
> Hi Krzysztof,
> 
> On Wed, 5 Nov 2025 at 08:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Mon, Nov 03, 2025 at 08:03:10AM +0000, Peter Griffin wrote:
> > > Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> > > "syscon" compatible") it is possible to register a regmap without the
> > > syscon compatible in the node.
> > >
> > > Update the bindings for google,gs101-pmu so that the syscon compatible is
> >
> > That's an ABI break...
> >
> > > no longer required. As it isn't really correct to claim we are compatible with
> > > syscon (as a mmio regmap created by syscon will not work on gs101).
> >
> > ... with kind of a reason, but then the question I have: was the
> > standard MMIO regmap exposed via syscon ever working for any part of
> > this PMU?
> >
> > Original posting here:
> > https://lore.kernel.org/all/20231209233106.147416-2-peter.griffin@linaro.org/
> > did not change PMU driver and did not express that the syscon is broken.
> 
> With the benefit of hindsight, no, PMU write register access was never
> working for any part of the PMU.

Please add it to the last paragraph of your commit msg, that this was
never working in practice thus changing ABI is justified.

Best regards,
Krzysztof

