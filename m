Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DD03BB10E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 17:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787159037; cv=none; b=OnQyb9Kqx5QPiPSqVSxnZHl+G8VF9vmIBI94z7UMjhcFB/5GJ4x909M2hFDGv7busgyxBeIjx85QdjKTejU/plo0z+BOYAXlmIrg7/jcKWls6xaKtx2cl+ANU17agifXh/Ya6oBNVe3CAYSda7hsRfZoIsvzMHXkeugiKrVo1+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787159037; c=relaxed/simple;
	bh=Fe7DkO5aRoKlOx5BdmX7YNUhZMMlLH8G7Y1MOtuX6k4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TMO2ScRDZLhW4XiU8NiTLE3V3Q+ecM/gyNaBYv1BIwHol3N1ICSdUFf2l2TuYlC1wnlTzLo9H5T7Ta4Vwv5tsqAnOPGtnP92GCdlXCDdYbF58uxFloKU45FZzSG44nyRS4BRTOWyZ3qipDHwb8E8d5fmdLCNEJdHfUsmB8zF9VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MxZDACCE; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MxZDACCE"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7389cff36bdso490476137.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787159035; x=1787763835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fe7DkO5aRoKlOx5BdmX7YNUhZMMlLH8G7Y1MOtuX6k4=;
        b=MxZDACCEEhtNaPKgjDaJhxxKarAlc3P6yNi6C+Vc7HTOwa6NTSxbo9INpZaktE340c
         zOV2SHz0rwx92TxjyazpZNu/OdVEYNm0gzYaBsdbumf8ChG+C8vTUBYqNnd0PBgXXLFI
         T2dpIKAyL6OvSVuhsGIpNJc2DE7pfNrnYj37U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159035; x=1787763835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fe7DkO5aRoKlOx5BdmX7YNUhZMMlLH8G7Y1MOtuX6k4=;
        b=M0MzrMgrCmBG1gcT68Nqp3Xw4Bh0vhk/D5CzHIAgY9+Yg++FoEYMdX1rRw4B2xBWpC
         ivX3GfWjVWqro8bOn8ZKJqktPTUGPpfWch6k7aglNSKMz8WpumQKlowah2rOFjLrx2xj
         3t7zJ2iIqZfqNbFx498b7MkGjt7AFC/eM4HqETPFpRF3E5yxNKn1dmNKy0kwmvcFbZE1
         fE4eGAxyfdiRSBChRlmQ+GHzEojgOV8HTV9cybTlx/oj+CMZbk//nufZY6RcaJD/Ft4s
         xtwLanpA5veTVAntQoggRnjFbH56j7sMU59yqPxDF3cculi80mdKchfjX64j0+L2XvzA
         Szhw==
X-Forwarded-Encrypted: i=1; AHgh+RqKFoaNhxZYZEvXpzrVuh1HYRUPxhRwGab+B7En4osCjz/GY2pIDyro3wzpeJXi6zbYhmguAAdGkd5QRO86NBPjqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHRDGfNFtVx+c7eksjR+zWvsFDhLNYwFESLEdii1ixFJdlN+Nd
	3tqWTid4lO6eIO24IbNnfUhyq4vBDFYXPLjhXV7wXEn7m0TOqMKGp6tBBkmA0YlxvOsgoFdgwSm
	QWeM=
X-Gm-Gg: AR+sD11oJ74jh71xROBK5QjFWUhsYoEMbwy0TE9mXKlq42XHG/DiQ0UCyNlsAS/nJ4i
	KWwkXU7DEaMH/udlYbTFtBln4NNv6nSXpFoL9LfoO7gBFNx17fBehMFQSFE7B14rq+2PixK1d2P
	AVHjIYMvYf3wVVEoYpr9DmmN1CasMlDlRewVIz8bVbDbWAdVzWHdnUWTabvd85RLid+yDn3NVqD
	pREw6WJ3gDyVluwzOHnDzQUzhNbb92zx4Cu8FyOQK5kIeu6cMqMLRjkGT2I/f7uAyMZacTNe8m2
	NMQEjLE41xop21QKwTJNC57hUr5UDgUhLmhi5M/NNX8fgX3jhzpK8BragRGxmQ1FK1LDHQzA+tu
	skzuRPBs/MVdnbQ0jsREQsz96J0JGobTDJxDUGa3dXGJTUVRCEE8I6FxA3dNI8Xysbg9+tyumDI
	9mpTitgqVtcIM7ue7pucRcE6o0m2+j6ABlLP+Sv71vuYZ/Xb5bLnAZQj73oO4y1Or+LqtqjTMVI
	kJ5Bshx9LE34gFIHZ3xeIEZt7U=
X-Received: by 2002:a05:6102:5793:b0:773:756:6695 with SMTP id ada2fe7eead31-777f86830a0mr2068241137.2.1787159034737;
        Wed, 19 Aug 2026 10:03:54 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777dd4a7211sm2836674137.7.2026.08.19.10.03.47
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 10:03:48 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97c441f40a5so376275241.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:03:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpeY4GG+FKnOk1IqPPjDfmg8FJYAYcGZ4ArzXWe5wZ4f+qzLvgo9GL68PsgOMBDuOnXyDXuuM/zqMY4FXbcDmkrxg==@vger.kernel.org
X-Received: by 2002:a05:6102:918:b0:778:5c2b:f836 with SMTP id
 ada2fe7eead31-7785c2bf8famr1715744137.5.1787159025695; Wed, 19 Aug 2026
 10:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com> <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
In-Reply-To: <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2026 10:03:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com>
X-Gm-Features: AcwNN1Xq_Hs6V24rG4OhS-cjamxWAO0UpSeGmP_9xYxqjvzRBGkaMhCLOMPBOe8
Message-ID: <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 19, 2026 at 1:29=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> > Is there some other documentation saying "aliases =3D=3D evil" that I
> > missed? Maybe some email thread we're all supposed to have read?
>
> Yes, kind of, it was 10 years ago and about MMC aliases for
> selecting a primary device for boot:
> https://lore.kernel.org/lkml/CAD=3DFV=3DXLuPWKjQBMLApRQxk0K30p_TPcztB7g_1=
DB7iRA9BGRQ@mail.gmail.com/T/
> and you were in the thread, it's not pretty, leaves a bad aftertaste.
> For, I think, reasons stated in my initial paragraph.
>
> The takeway is something like "the device enumeration is policy,
> not hardware information, so it should not be encoded into
> the device tree", and that is not an argument about aliases
> per se.
>
> As a result (as I think, I may be wrong) MMC gained a few
> properties such as:
> non-removable;
> no-sd;
> no-mmc;
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>
> These provide a heuristic for which devices to inspect for boot.
> Then on top of that I think people use schemes like EFI for finding
> boot devices. (Or they still live with their quirks...)

Yup, I was definitely involved in that conversation around mmc. ...and
yes, that was a frustrating topic. Though I guess I remember things a
bit differently / have a different takeaway. Specifically:

* The whole argument there was about people not liking the idea of
assigning "numbers" to MMC nodes. As I have said, I'm OK with not
having a number here and it's not central to my needs. Said another
way, people seemed to hate assigning a numeric ID to hardware devices,
which is not my goal here.

* The "mmc numbering" patches were (independently) sent again and
again by people because (shockingly, I know) people found it useful to
have their MMC devices enumerate with consistent numbers.

* In the end, support for "mmc aliases" was landed. See commit
fa2d0aa96941 ("mmc: core: Allow setting slot index via device tree
alias").


> Now this ufs0 node seems to be about calibration of some sort,
> which is a more hardware adjacent subject. Is there a way to
> add the entity that needs this calibration to the device tree and
> reference the UFS device with a phandle along the lines of:
>
> calibration-storage =3D <&ufs_node>;
>
> ?
>
> Even say adding a synthetic modem node if the calibration is
> for a modem is probably going to be more acceptable than an
> alias.

The crux of the issue is that the bootloader needs to add UFS
calibration to the device tree provided to it, and later the UFS
driver in Linux needs to find this calibration data. Since the device
tree lives outside the firmware and is provided to it, the firmware
should make the fewest assumptions about the device tree possible.

Having the firmware hardcode the path to the UFS node doesn't seem
ideal, since (I believe) device tree paths aren't guaranteed to stay
consistent according to the device tree ABI. This, and the current
downstream device tree path differs from what upstream would accept.

Using an alias seems (to me) to be a reasonable solution. However,
I've tried to express that I'm open to concrete ideas.

I appreciate your suggestion of having a separate node for calibration
storage. This feels more awkward to me than just giving up and having
the bootloader hardcode all known device-tree paths that the UFS node
might be found at. That being said, if everyone says that this would
be a great solution, I could try prototyping it. The trick would now
be that the Linux UFS driver would need to be able to find this
calibration data, so the Linux UFS driver would either need to be able
to find it at a specific hardcoded device tree path or the Linux UFS
driver would need to search the device tree for a specific
ufs-calibration compatible string.


-Doug
