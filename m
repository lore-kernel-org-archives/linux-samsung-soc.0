Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793569410;
	b=ZispMzBnCSHaqO88c32dP2mlJcTq5nErFIftOez28HDNiCaIk3ek+CFSpPc5Uk3BaBTx
	 pgD7eGr7awoi+wbH05kXEfXcFWFd0+jinWQbCxj67Nf3C6EkSzAvb778v77W6hWbCAflR
	 zLW/cZh5k5ife+h41aLpp5ZwbtzZDEZFgysuU7GcK7LCAxDzdblF/FIYWT+FW11QITo90
	 nWziFQ0rfIY5yaN8sJbnaoxQHH6CKKhddyzpQg4wn7/oU5Em+zz+tjVwZ753Qd/14sez5
	 cRx1W4RmJDmJITn6shEKzho76G07SvSLs0PMwOPSV/tGDLfnGByejJAdwU6uKug3y9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793569410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
	b=yV80XYydGp/S+yeYA/P/Q1P35EzaM2qvsU0hU9zZVS6BYbiWaDFKQScr16rphAWmQP87
	 /tIADfWkrWX/kGWYF5u1L02Zgczv7AVpVLWzjHjeMmXKOfTeNavS2C4AqWhB2KE/ibX6n
	 WlxIlx+TdfiPSCHu1aDEkzopLB69kYKJ2mD/uGtEzvgXq8fg2dWtiCD0GfumwY7ZlR2ON
	 lKQgjMbwCHy+kUMLUT2QJIRGbGlLkN3VLYB/RFg72Z/D0YfZuuwF3frFQNeN4EGH50cYC
	 IR0OoIDtkTvlI4DNNknnPa9sG2fjvUScxlET4cxUek76l4dr0YfH0gmPricAlHVX3BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VoxCo65h;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80630606A324
	for <linux-samsung-soc@vger.kernel.org>; Sun,  1 Nov 2026 21:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80630606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VoxCo65h
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c43fbcb4393so355585466b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Nov 2026 13:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793569408; x=1794174208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
        b=VoxCo65hHGxCLFt6EDapKGY1f1ThCsresiLxsnX1x3XxbHe8pUB9HXyn8nGSuo/Kwi
         h4r2UmNd1xMxVPrA4gPZxrqOh6G+Ca73s9xWZvTrlrZ2JjbjLqsb5OXhtyoAbqt+VHI6
         RO7YoymdzkWyqjUdn8+07TiEKOjfsyDNpRewQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793569408; x=1794174208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
        b=vkEg+SnX+wTWuTYJ2a8ITzKTsfG1QgZsu+RDLAhwBTwqKqzwD/4um5JzHvbLWcd7W5
         4e9KaS/vveY6wlSEAGO5NsWPmsLYPSqGBLpPfmP8pNabQfd4izxbERrt7QNEZ4TkH+Yb
         0eS7hBFzEqPuHv3XB7ULzj4Hz+e0A0BpUXG3b+VjFAXQzWxVnsWBVxZkSVpZ3o4IYiYg
         5M2FqJuUTx6QlVNgx77UUXVp3+avGXxayZa2d4wrsXQKBpa9H/IygZFvf+s59SbOal2z
         tIcTLk3eSunGhTpt3IiL8INBZQiOx5JvNMO3ZohWYLdnyP+jFPoHmnKp+953V0TKUeY6
         VmZw==
X-Forwarded-Encrypted: i=1; AKwUvBxplDqiLycr2hasku4e6uUBFa9RolaxLY17S105sP0sj6e54YFYfCYtiGMJYBRhTSLdRAciWVwgzns0xoMlOCo9Fw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLjfFTo8F76hL/mnYXEidnCnEPIPJOe4DzOhOhzyed3wqzPZesc
	CA2P1BkCOirAZyllFnjiCCTOdMh5/EKSaTbypbKt1DGCkEviL9Mb//4iHetxY9b99WJKuO1S6Iy
	pm0VTuA==
X-Gm-Gg: AYBFou16yrFbY4wFah6nWaFWAR/Cjbpk2AhjS6V5sXt2xRJRxv7mwkkxh+sLu3UVF17
	gyyXnjMBPCj5xgun8dnXTK/kvAH8RdG9f4d/LaRA1VreSmfbNX5SP24Je93nZJ29nBhkPNgAygm
	c/PH9NriWSLTn/YeKhSpR2H1xzeDw7xK/h3Eb4psAVAJg7mqr/wOn87n8UhzhJDI7+jRQpCJ1MI
	HowMO2AtESsNuBrObj7C7kiicOhTielpggUcc7wwFlBJDdrQpw9D3Ha1OpwUfL9btwnhz8hUDu6
	7H/Pbvy5hfDatbC9TLLdHtMQonEiXoC6+huWBc+e/yPFGHulezXHzdTWxB5WeOX2DDz11Ogql7m
	l0NoodM/LDNBslu/+IfXIRdgfPkq2I+0C9yOCzksodss9veiHp70hdEFhyn8kZtd2UCUUXmu3OL
	zaxi16Y63+ekgT9tex7SKMkhJJHw96d6+OTMY4a1mpnJBFAER63s/DyMdk3CbyNu4iIm9Z4Xz5F
	vkqPeRQWrdLtehY1XJVV6865JzIv6zC4XN8dmAnokYHrFJBVJ7hnixxAIAeCNkn0uHdpNCFAcIy
	FX8OTVwWivFkO8c2VIvJMOAAVCwaG+JFmx3r2U1ounmvnOsW2WeZIYu7TTMhvzrMpqk=
X-Received: by 2002:a17:907:6d29:b0:c33:dbe8:291c with SMTP id a640c23a62f3a-c4ca7a4dd2fmr691437766b.20.1793569407954;
        Sun, 01 Nov 2026 13:43:27 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe5006dsm310582266b.64.2026.11.01.13.43.26
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 13:43:26 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b4883643ccso3065925a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Nov 2026 13:43:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxZ+mg1GgzS7I6J1H/qRDtiX7zKSPyjqL5Jm+2a+gCe6H0wWARszMbpk1XbCzInY6dX5zhytXBwKG14mBFLlaV1LQ==@vger.kernel.org
X-Received: by 2002:a05:6000:41d9:b0:48e:646e:fb61 with SMTP id
 ffacd0b85a97d-48e6e305b9emr20425341f8f.34.1793569013833; Sun, 01 Nov 2026
 13:36:53 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
 <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com> <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
In-Reply-To: <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 13:36:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WGtmBxQhc+ujm3qtVgftfKupqtp9sUpg_ubeQ=-_QG-A@mail.gmail.com>
X-Gm-Features: AclHuK83p4a2Vbxf-q7Oyea7vApFkqc_qnBlge2O9IlGicuQhVVmFjLkwyEXh7A
Message-ID: <CAD=FV=WGtmBxQhc+ujm3qtVgftfKupqtp9sUpg_ubeQ=-_QG-A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 1, 2026 at 11:34=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> Doug Anderson <dianders@chromium.org> wrote:
>
> > Putting the metadata in the configuration's `description` property came
> > out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
> > already uses configuration descriptions for similar board matching).
>
> Thanks for the background. The Xilinx case is a bit different, though:
> the same project writes the string (the binman .dts) and parses it
> (board.c), so it can change both sides together. Here the kernel would
> write the string and the Pixel bootloader and outside packaging tools
> would parse it. That makes it a cross-project ABI, and I'd rather that
> ABI were typed properties than an unwritten string format.

OK, fair enough.


> > The proposal I've tried to push a few times is that it's OK that
> > different loaders have different types of information available
> > to them, but people don't like that. They want a universal standard,
> > which nobody can come up with.
>
> I agree with you here. We don't need a universal set. I've sent a
> proposed spec change [1] which lets a configuration node hold one or
> more match sub-nodes. Each one names its scheme with a vendor-prefixed
> compatible string and carries the properties that scheme defines, for
> example:
>
>     conf-1 {
>         compatible =3D "google,lga-...";
>         ...
>         match-1 {
>             compatible =3D "google,board-id";
>             board-id =3D <...>;
>             board-rev =3D <...>;
>             soc-id =3D <...>;
>             soc-rev =3D <...>;
>         };
>     };
>
> Trogdor would use its own scheme (board name as a string, rev and SKU
> as u32),

Sure. For now I might just leave the "match-" out for Trogdor and
simply have the config file simply be a list of DTBs. Trogdor
currently boots OK with the "compatible" strings. Maybe Chen-Yu will
want to propose something for a newer Chromebook where he can take
full advantage of it. :-)


> and Michal's loader could do the same. Each loader still gets
> what it needs, the types are explicit, and nobody has to parse
> 'description'. Please can you take a look and comment there? If it
> works for you, you can point to it in v2.

That looks reasonable to me. Do I need to respond directly to the
github proposal, or is my response here OK?

Yeah, I can point to it in v2.


> > Should I give it a shot for v2?
>
> Yes please. The DTB list already reaches make_fit.py from the Makefile
> through the @file argument, so the new file only has to say which DTBs
> to include and what metadata each one gets.

FWIW, I still liked the idea of limiting the DTBs that were actually
compiled based on the list of DTBs included in the FIT image. My
current v2 draft still has that feature. It adds an argument to
make_fit.py where we can give it the "fitconfig" file and it can spit
out the list of dtbs. Then the kernel Makefiles use this to limit
things. If you don't like that idea, though, it wouldn't be the end of
the world to (slightly wastefully) compile a bunch of DTBs that we
don't need.


> We'll need a simple
> per-platform file next to the .dts files, passed with a new option
> through FIT_EXTRA_ARGS

At the moment my v2 draft doesn't just use the FIT_EXTRA_ARGS but uses
something like this (which will be documented).

FIT_CONFIG=3Dgoogle/lga.fitconfig

Hopefully that looks good.


> Running fdtfactor can then be another make_fit.py option, like --decompos=
e-dtbs
>
> [1] https://github.com/open-source-firmware/flat-image-tree/pull/66

I don't think it buys us anything to have make_fit call fdtfactor
directly, does it? The kernel build can just call it. That also makes
it easier for people to pass non-standard options into fdtfactor if
they want (via FDTFACTOR_ARGS)

-Doug
