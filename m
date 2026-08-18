Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1437C238C2A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Aug 2026 22:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787091615; cv=none; b=fmX1HjgGesLpRdlE7Svbi8AwOKjSGKYuQhA166qeNfULpk1q+ntFZp/2V4ZnxMYUrgfyIDk3+RdFbLNfvrdXDuiGn0HewsQMudMEXa4rR29ypYxeRQGf061LY8O1IFNpinmIdGIcx+sXJ1P7jz6OWWpTAzSJYzU+7mySWvuL1tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787091615; c=relaxed/simple;
	bh=IcRGBxPKmByruY+4O0/f4Uf9z2skvWKVFPpiGpCrHJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2CZ5SR+bI67/fQT99uKYUnXXm2f0Npxk4cJQVoY4UdAdAuBg7Dml+QD0ZtcpPgwIxftL8H6D735VXYzSLuSqSgz48iI0MIm5xO36PAa2vwv7moootcyM9oZ/mV4SZot7OFpuV4TAoCjkDl93ZRYbr3iUj0emZA26IQ2kJormGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TqHqWrCQ; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TqHqWrCQ"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9ecd7216cso177048a34.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Aug 2026 15:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787091613; x=1787696413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OAeyHXN0Zof9oCVlItznCba1s0MUdsF9dzRH/tkJGa4=;
        b=TqHqWrCQSi6v7lxWHkEJbJg7GzYW4fHg357fLd91/EF/wSax8xUG75xZwB9J2wqtX1
         XiEedlYPBUVMmBqciT17rUeiBognDckh9O8uVKI/a5UFDlk/MWJXqok92sEo4TRVfvpR
         nMxFFtlXp0dEOqeoAgeKwEnjztuosyBKu45l4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787091613; x=1787696413;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAeyHXN0Zof9oCVlItznCba1s0MUdsF9dzRH/tkJGa4=;
        b=Zu6ca7cnavvmBLdwnl8csLd81mOw7LWq7XWpoYtqhAlEDGCJmh8gJrpFjx29MQbcA9
         91ihKE4Q4+gm8LG8mbMncwiVydVqfWFMKZXD+h2ZtaYibk5KeD7e4jhlgjzCB9+Hq+nM
         s0dCE/wpOtTEJ05+t8pkY+W/Sjptg8fTO0QSFhOrNAvYPMvmdG890O6ydI6EEExwLF8k
         cPNLaH0XvljdDYTvLwfwDx/LCh/UclaESeABctYC9ony7U9ouetJyYYHldwPcMlUWNLh
         CXsiw22kuCD2wCkpRIl7xyMIeWLr6/e8VOdKnCck6v4ouS1zMbn0SPf3pGMJKcrxoa5e
         z/+w==
X-Forwarded-Encrypted: i=1; AHgh+RpoJBXK5bXqRxh4dDHxgncr2FUAZdyCj92g21suU1JulnAxkimjcCFkYhcFMsQgq08VE8IGq8Fp5cnPhO0RE4LR6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7l8KYlQgnyOUsQrL1KQYxlT/4GYlFKxGpwr9ef+VYrMqycR4z
	vyPaX8GCuFm4vQ6+XoqNTejzJu9dF0N/CLvD/NB+U8TxCg5VNn9FMIMbU8YVdNLdlD8RFSUkpxh
	nrnY=
X-Gm-Gg: AR+sD13kswMrwBvTwJGNdNwMbM5O4IyAT8oopHzOmaINdVLOtdTzNBf8tMjfaYDs9lG
	ZK/jpQ0mYdWMIXekHL+OSvzWYFptXMyAbhtqPT3fkrZD4mJ3IOERcwXym1+3WV3OFFpHaj8F0ER
	+gb+AXgDIekwLrxOZnBSUZpOYdJSsI14q4AXe9dhafU9Yq9jS04Aa+EvJEh+xC4loaF9o88ynu+
	VW6b9Xn/l8bBs6JmCy3zoU6tEowoRo/vWggjDNYnBpyr+mbD03IrPJp3yJySXIlYzEHKdBzjKvf
	l7lEPGx6Xn0uL86b6eNUYC311521KahYfLVgtxJD7iBT8KbaKxDUFUAVohI1AzNW1hfcAZvQjDn
	WykkXGNnpm31WdkYc+IlvHKn3RjxhP7BEKI3nZg7TIxmuchrSxCodYVahVVJb3C2d5ZqNaf30V9
	m2j4beWs67TM4UnRd7ScucwD6TFqxo6WVEtSDtMLUkeuyvJP3f0MdnffKJUHuHpdkZE07qPKFI9
	Gu8tKLIKwzA5+mt2n+7+sBklPQ=
X-Received: by 2002:a05:6830:4424:b0:7e6:f2dd:93c3 with SMTP id 46e09a7af769-7f43da52508mr1049134a34.15.1787091612633;
        Tue, 18 Aug 2026 15:20:12 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f41c0b94b0sm5510522a34.15.2026.08.18.15.20.12
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 15:20:12 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b1334a3b16so309123eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Aug 2026 15:20:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqAnHYTPtDmr+N3pffDVxc3wUdbcu5luELvg80+e7oX41OqFGaxjvJPO/XTep/W9Ac7FvxN5a117NiEmTEGxQ02MQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3f02:b0:772:5acc:b849 with SMTP id
 ada2fe7eead31-777b68d3b50mr613053137.5.1787091192379; Tue, 18 Aug 2026
 15:13:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
In-Reply-To: <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Aug 2026 15:13:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
X-Gm-Features: AcwNN1X4wWbBuO7BL4eki7ShctQouAC-d3_rSaFZoxuWUTz7v7oqnlkPyiKP63w
Message-ID: <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 30, 2026 at 4:32=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > > +     /*
> > > +      * The Pixel bootloader considers it a fatal error if it doesn'=
t find
> > > +      * a `ufs0` alias so it can add calibration data to the node. U=
ntil
> >
> > Fake node is ok, but alias won't fly because aliases are not allowed fo=
r
> > ufs. Well, would work 10 years ago, but this is a device from ~2025 (so
> > SoC maybe a bit earlier), thus Google already knew that they MUST talk
> > with upstream open source maintainers before they ship such ABI.
> >
> > They did not talk, so you reap what you sow.
> >
> > There is no more excuse for a vendor to ignore open source and push
> > whatever-ABI-they-wish into their product, if they ever want to upstrea=
m
> > that product.
> >
> > I know it is not your fault, obviously. And I know that not much you ca=
n
> > do, so that is not rant towards you nor towards Doug.
> >
> > You will have to keep this part of patch out of tree or fix the Pixel
> > bootloader.
>
> FWIW, it actually _is_ a rant towards me, since I added the "ufs0" alias.=
 :-P
>
> When I was originally bringing up Pixel 10 with upstream, the
> bootloader had a hardcoded path to the UFS node. It looked for it at
> "/ufs@3c400000". That certainly wasn't going to work. Downstream
> _still_ hasn't transitioned to having a "soc@0" node to put all the
> MMIO peripherals under, so the equivalent upstream path would be
> "/soc@0/ufs@3c400000"
>
> Now, I certainly could have made the bootloader search both paths, but
> that seemed bad to me because:
>
> 1. As I understand it, DT paths aren't ABI. While it feels unlikely
> upstream would change "/soc@0/ufs@3c400000" to something else, I
> believe upstream would feel free to and not consider it a "breaking"
> change. This makes it feel unwise to hardcode the path in the
> bootloader. In the past, upstream has renamed nodes to clean them up
> and it wasn't considered a violation of the sanctity of the
> device-tree ABI.
>
> 2. If #1 is untrue and we consider DT paths as ABI, it's still a bit
> awkward. We have one bootloader base that supports multiple SoCs. The
> unit address differs across SoCs, even though the IP block is nearly
> the same (bootloader still adds the same type of calibration data to
> the node). The code I started with had a bunch of #if statements for
> the paths in various SoC variants, and that went away with the alias.
> I suppose the bootloader needs to know the UFS base address anyway so
> I could have probably constructed the node name based on other
> #defines, but it still was a bit awkward.
>
> 3. I certainly could have searched the whole device tree for the UFS
> node by "compatible" string, but the Pixel 10 (and future) UFS
> controllers aren't upstream yet. We wouldn't be able to land the Pixel
> 10 device tree without the UFS bindings landed yet and I think we're a
> bit far away from getting the Pixel 10 UFS bindings landed...
>
> With all that, the "aliases" seemed like a pretty clean way for the
> bootloader to find the UFS node. It also matched my understanding of
> an appropriate use of an "alias".
>
> Any suggestions for how to resolve this? Do we go back to hardcoding a
> path in the bootloader and cross our fingers that upstream never
> cleans up anything that changes the path to the UFS node? Would it
> really be terrible to allow a "ufs0" alias for this case?
>
> As a side note, I did "talk" to upstream shortly after adding the
> "ufs0" node by sending the Pixel 10 patches upstream, but I guess we
> were so focused on the overlay topic that nobody thought to comment on
> the "ufs0" node? At the time, I'm fairly certain my resulting device
> tree files passed schema validation at the time, too...

I guess no response / silence =3D=3D my email was so dumb that it wasn't
worth responding to? Even despite that, we still need to find a way to
move forward, so popping back here...

I did some digging. As far as I can tell:

* Nothing in the DeviceTree specification 0.4 [1] mentions that
aliases are deprecated.

* Nothing in the dt-schema repository [2] causes validation to fail
when you use new aliases and there is no "allowlist" of old aliases
that are allowed for historical reasons.

* There is a single reference in the kernel "Documentation/devicetree"
about not using aliases to assign an "instance ID" [3].

Is there some other documentation saying "aliases =3D=3D evil" that I
missed? Maybe some email thread we're all supposed to have read?

Is the only issue here the fact that the alias ends with a "0" and
thus implicitly provides an "instance ID"?  Would it be OK if I
changed my alias name to "ufs-primary" or "ufs-internal" or "ufs-boot"
or just "ufs"? We're not using the alias to get an instance ID, but
when I added the alias I followed the pattern of all the other aliases
and put an number at the end.

I'm happy to attempt to fix our bootloader using whatever scheme
upstream suggests. I'm trying to "talk to upstream" as requested, but
for it to work I need upstream to talk back. :-)

[1] https://github.com/devicetree-org/devicetree-specification/releases/tag=
/v0.4
[2] https://github.com/devicetree-org/dt-schema.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D6a57cf210711c068a650bd86acae4a88303dfd5d
