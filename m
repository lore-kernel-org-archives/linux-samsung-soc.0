Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793408995;
	b=bb46FebwCs5iDnlE4RoZvxBfBRJelhvsDFR0d5o6CtMU7IHj7yTb2ZV7PlPK5z47Ptqx
	 l+DrYh2IOba+ZhyLHWtSMvsccB+AxutAxTSr3mUa8H09/Fd4AKSLNnZXUN969IK94ABpk
	 X0y7+ol3kIv0Cu4+BAEq44Kp6KaiRQfjWwbKceMkJgjhgaSEqc1OP+jvD6QtgdEHmwdCe
	 kOUXiQ3btcxa4RIKvtAM+STZa917OGEvLvmObk/QtSXhSKBQe05+xV7vFB8hSqAohrB+b
	 SCWcdEkU+Y2w5P07Mi4caV9HxOHsYpTjtB+yS/mda5vi2K1l9x+1zBR3wdIBG+v7CHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793408995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
	b=dh1D/0mFn1lWgPG/u3IEeZeHIyI7A6Tsd3jQowmzf2bZFG1BvOWg4OMjnemVc1fzmzhc
	 ByBNGuq0TxhxHw/UoyNhuuoXdQZo/i7jbwQLnZTY46Rf2jFrZNjmz23B2i/keLtGaQHUc
	 T3loAh8AZ/djukg6ltby7obbomqYz/+u2PdtEVJ8A7c5xJsgR/sFcc/FEXEOUMeLrK0Tw
	 UENzbN6AKAHj0TlMHvVHO2PAJMrhsSx4hc2IJHDir0rI53SDLfPfjC7Pr0odqmdDA0UR5
	 aArKv7zJAIcyHjHvHHXONnw/jfJg6tUVqA4a/uZPUWiatyVVJQn9ioJHr9xZWkXFa/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ImoCjvk0;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09651606A31A
	for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 01:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09651606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ImoCjvk0
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c37b612635bso195231466b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 18:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793408993; x=1794013793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
        b=ImoCjvk0lrQH9FxfBHeYqTXTFqrT8jshFCGQWdZppo8gLiLL7vYHS95dC3Gp2YJthw
         4TSKSHUKLuXdLdKPJJ5JtjXxbyp62paIKYqDk4H1sqoL7UjJhKP30IMsyDsvRQgRBRNL
         pucq3mcl7lEBCe8sHOEFgjA0aLX7WRdTn1VnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793408993; x=1794013793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
        b=05OOGOhCysMFsLFNTOM//LUQwoJdbvFycDa5Tv4b3JaRFxxuaCOXJjxeS/f5QU2cN8
         aHZAgAJubsdKrrEy9lRg9XzUuiF9avV51JtOFqtigGNGMX3BfPuFg5WmSUh5kWpUyOsc
         XKXTw6qeALW2h1DY8lsk5mXQh1a1lFCrOTpbaGketsk75DbCMVt3RO8X45/D4oskKxN3
         pCFDsmMxk2Q6mCFpErr5q7hvAbFxy0mMFq8TGwVJwaE7oduMOJ6XfUedQouevKxmo8Te
         MhbXBSCsfQBGNS5QnFVrqrf8h/LtAkzD6ESWpHf5kyetThKAwP4oZYHfLmxP3ME/6st8
         6u6g==
X-Forwarded-Encrypted: i=1; AKwUvBwIxUgC8B5+QuR+MyD6GeNGTPrYKCgh/mv0LlK0FliJq5mhqU/FRzZgrCGC3RvUsppvilD9CJdevmpX2QGJ5INDDw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPgGnnDfWHoNJ6qK5HEVPDae+W8xxse2/XFLxWkcyI7nL3y1OM
	PLmiov79Pe0Xz2/UIVBTdnkwG3oVdgnLMlK9myoQDNvUtd6KVFtDZInU119RZeQog17bfNZbgaC
	SBX+nMQ==
X-Gm-Gg: AYBFou2PErMepfCyefx1Vu+MnRxizkAGgY0Ag4Qy7xo2DWBBxD/bfESOKKtz2REH5w1
	cfIpxt1a1HTH+DI/TScKaN2bPy/CzRWiX7y1mAEs8VqbR981vq+jiFDWREQYY//ScjkkHTr97c0
	UfPz0MG0xUhew4O1JDGLBeH68WKhDssu9TDO2NKPcPev9eQ2V9VUbw9fuS6XMqthP6X5gcDNXzz
	PE1QlhSPgg1ggusKYjv5ZT2GBphV5x8p537WT4MFalEV80rwMl2ddwxrIo8CVWtgauGyyYWnDyV
	OUnbnJ4rgX7y/cIUNiy1v4MvpHGmce2p4sHRnOkcaqaquT3unQo2SiLEMSicWdUhgIrl1SxyBVv
	6mUrJTpO9g3cfkVZwPx+LfvV394Ke52rnzdimNtUOfmhDPtiqFeheJngP2JVylGNlmEFV4oa64A
	4X1yYRIE1TnDdeeoH0O4rPmOMWQ3h8GT2WWPZm/b6DBzo8Ws+6lIgi6G7XNakdevUkD+5lti8CX
	s5tsE78CYyl/aiCwk/JtC7oKF9Q7QhdCC8MXN6aXKhO824dZj/gjsp7XuQnPtbZitITxX1bJW0n
	UdMzznIIQpr5f6RNOcxxLaaxjIt8gcfTqTn6lQi5wZyHwDU7qFrxof92VswZzTg6mvwr
X-Received: by 2002:a17:906:9fc4:b0:c44:14d:d95d with SMTP id a640c23a62f3a-c4ca7a4a76dmr348807966b.23.1793408993482;
        Fri, 30 Oct 2026 18:09:53 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf0bfa2sm121021666b.80.2026.10.30.18.09.53
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 18:09:53 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso11426085e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 18:09:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw9EXSKjITxx6oPcYqenZ13Ir6Zc99kpc3A3Ai2cyW4wUOkwADPZsq3gb4BcjxYQXuqtkwjTIgcwfi1NbbjGN1+Cw==@vger.kernel.org
X-Received: by 2002:a05:600c:609a:b0:4a1:7c56:d4e2 with SMTP id
 5b1f17b1804b1-4ac1709aa77mr83103245e9.16.1793408992269; Fri, 30 Oct 2026
 18:09:52 -0700 (PDT)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org> <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
In-Reply-To: <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 18:09:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
X-Gm-Features: AclHuK9Km6WTJvvTvOnJ9g5USO9Th2gdTGYh9-cjnPaFh3hhpAF88g-93yWA4Zk
Message-ID: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
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

Hi Simon,

On Fri, Oct 23, 2026 at 5:26=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > 1. It uses a checked-in .its script to associate metadata with each
> >    board's devicetree. Other tools can parse this metadata in order to
> >    craft a package that the Pixel bootloader can understand.
>
> One thing I'd like to check before this goes further. In lga.its the
> metadata is a string packed into the configuration description
> (board_id=3D...,board_rev=3D...,soc_id=3D...,soc_rev=3D...). The FIT spec
> treats 'description' as human-readable text, so this turns a
> free-form, undocumented string into an ABI that bootloaders and
> packaging tools must parse. I'd much prefer proper properties in the
> configuration node, defined in the FIT spec [1], so that every tool
> can rely on the same names and types. I'm happy to help get that into
> the spec. What do you think?

Putting the metadata in the configuration's `description` property came
out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
already uses configuration descriptions for similar board matching).

You can actually find one of Michal's files here in U-Boot:
* arch/arm/dts/zynqmp-binman-som.dts

Then parsing happens in:
* board/xilinx/common/board.c

I honestly still think this information would be better to live
directly in a board's devicetree itself and then extracted to put
in the FIT, but I've decided that fight is lost. Honestly, the
allure of using `description` for me was that, since it as
free-form / non-standardized, my hope was that nobody would really
care what I put there.

If you want to help get something more structured into the spec
then I'd be happy to use that instead. It's my opinion, though,
that the metadata that we need will be different depending on
the loader. For instance, on Pixel phones the loader has this
information to help pick devicetrees:
* board ID (number)
* board rev (number)
* SoC ID (number)
* SoC rev (number)

On trogdor Chromebooks, the bootloader instead had this information
to help pick a device tree:
* Board name (string)
* Board revision (numbrer)
* SKU ID (number, though actually made up of a number of bitfields)

Michal's loader obviously has a whole different set of information
that it uses to figure out which configuration to pick.

The proposal I've tried to push a few times is that it's OK that
different loaders have different types of information available
to them, but people don't like that. They want a universal standard,
which nobody can come up with. Thus we end up with no solution and
everyone does something different / downstream...

In any case, assuming we keep this as 'description', I'll document
the exact format in v2.


> > How does this series help us?
>
> The FIT_ITS path is a second way to build image.fit alongside
> make_fit.py, and much of it repeats what make_fit.py already does: it
> puts the root compatible from each DTB into the configuration and
> compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
> /incbin/ paths and a shell loop in Makefile.lib to do the same for a
> hand-written .its file, and the .its files repeat the DTB lists from
> the Makefiles.
>
> Have you thought about extending make_fit.py to take the per-board
> metadata (e.g. from a small file next to the DTs, or via
> FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
> in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
> logic, and trogdor would come almost for free.

I certainly can do that if that's what people want. ...and, yes, I
think it would simplify some stuff in this patch series. The
question is: what does it look like? Is it a file that is a list
of devicetrees along with descriptions? The list of devicetrees
would be to limit which devicetrees are built into the FIT
and then each would have a description. ...and yes, that would mean
it would need to be updated in parallel with the Makefile, but I
don't see a significantly better way to do it. Yeah, I guess that
could work OK.

If so, I think a bunch of the patches in this series will be
dropped or look very different. I probably won't directly reply
to your comments on patch 2, 4, 6, and 7 if we go this way.

Should I give it a shot for v2?


> The new FIT_ITS, FIT_FACTOR_DTBS and FDTFACTOR_ARGS variables aren't
> documented anywhere, including the image.fit entry in the arm64 'make
> help' output. Please can you add something, perhaps alongside wherever
> FIT_DECOMPOSE_DTBS ends up being described.

Sure, I will make sure that any newly-introduced variables are
documented in v2.
