Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E232320CBE;
	Wed, 22 Jul 2026 14:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729407; cv=none; b=qzkCpYg+CBhFPZZ3XTpgHu2fV1Hn/JrNyl69MRq5AuqNCb4mwkiZxRTbSt8yeKaCDHsfH5fq6cIHcauP1gnl7rGo9nths54TpdCeem6D0xvPIEzwpAfPjV0zrHDDX0e7yemVNnHh4JGHe3Uxnkm2L9MbNodT2LRQTSyjc1i0pCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729407; c=relaxed/simple;
	bh=+UNxDf7R0fKYJyPR4rBG363ftHoOIEin6Wr6xd8h+VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niDqHNyq9a6EsGqIkIZIZH8Mz0373PJyUTOPxX4+VsPGVd9opQ71CgZTnwDmVSX//uksAiq2oVmSxIENK4rixZQYzBHRyQJuSFRFDS4ghl95VQ0TVlGtCFzkULjh7t5voJwcvDmowwHoOnyxQWCfXW4VH5P4LaVDazv2rxfLywA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBKZJysH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBKZJysH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE471F000E9;
	Wed, 22 Jul 2026 14:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784729405;
	bh=GKC9UuiVWxD/MFzLYjOHg83pmVBtg7m7d81lYjsbO4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FBKZJysHWtyygCrX8kFOgyhfU6JsT4+b8mD57jr1fEBBFHnR1CwvpG9Dej2mjrENQ
	 TD2HffbkHINJ4F9QFThkAws/a93D69vf8qsp+1OFudLsj9/kL1mJsRgPeyQjm4FNty
	 h1TIfz/RZoQNSICrYttVQTabtwHH8B9UGM2X/Melqh+gCZzVBOsZ0Wn67GIX53qKB2
	 dh6yUEVATyElmTWiwdAmoVWfbQ7HOhQzROthiI+RxeDfpcP++ZFV7dKiEyGHlhyvfC
	 UdZx13hKoS56mTpYZ3zXrgVeE/Bo7Tijz7toMzQkCII+LvDK7l7bx8vC7xqnVZkc7K
	 pLl2PMKBLjOaw==
Date: Wed, 22 Jul 2026 09:10:04 -0500
From: Rob Herring <robh@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox
 bindings
Message-ID: <20260722141004.GB548057-robh@kernel.org>
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org>
 <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>

On Wed, Jul 15, 2026 at 09:49:14AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jul 14, 2026 at 9:51 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 15/07/2026 00:21, Douglas Anderson wrote:
> > > Introduce bindings for the MailBox Array IP block present in Laguna
> > > SoCs (AKA "lga", AKA "Google Tensor G5").
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >  .../bindings/mailbox/google,mba.yaml          | 216 ++++++++++++++++++
> >
> > Filename must match compatible.
> 
> Whoops! Will fix in v2.
> 
> 
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - google,lga-mailbox-array
> > > +      - const: google,mailbox-array
> >
> > Don't use generic fallback. Just the SoCs.
> 
> Sure, if you insist.
> 
> In general the "mba" hardware is designed with enough identification
> registers that we should be able to autodetect which variant we're on.
> Thus, my hope is to not ever need to reference the SoC-specific
> variant in the driver itself. It's not the end of the world to use the
> "google,lga-mailbox-array" as the generic, I guess...
> 
> I don't suppose I can change your mind here? If we take
> "google,lga-mailbox-array" as the generic, then going foward a few
> generations we end up with:
> 
> properties:
>   compatible:
>     oneOf:
>       - const: google,lga-mailbox-array
>       - items:
>           - enum:
>               - google,next-mailbox-array
>               - google,nextnext-mailbox-array
>               - google,another-mailbox-array
>           - const: google,lga-mailbox-array
> 
> If we keep "google,mailbox-array" as the generic, then going forward a
> few generations we end up with this, which seems nicer / less
> confusing:
> 
> properties:
>   compatible:
>     items:
>       - enum:
>           - google,lga-mailbox-array
>           - google,next-mailbox-array
>           - google,nextnext-mailbox-array
>           - google,another-mailbox-array
>       - const: google,mailbox-array

I find 4 strings nicer than 5 strings.

> Sure, it means that if someone unexpectedly makes a new Google
> mailbox-array that's totally incompatible then the
> "google,mailbox-array" sounds too generic, but that doesn't feel like
> the end of the world. You could call the new mailbox array designed in
> the year 2037 the "google,2037-mailbox-array" and things would overall
> be less confusing than using the "google,lga-mailbox-array" as the
> generic.

What exactly do we need to do to stop having this conversation? We've 
done this scheme and version numbers and it never ends well.

The reality is the h/w folks can't help themselves from changing things, 
so nothing remains unchanged for very many generations.

Rob
