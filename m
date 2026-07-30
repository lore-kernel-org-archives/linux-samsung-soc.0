Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DC31D5CFE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jul 2026 23:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454745; cv=none; b=CVnm78JsavEgLSOqdPhofJjc0NJxZ17qytySo5PTrtRGWAvq9NcwiNqwDdfHiDwv2INJ0Wu91NvuOVvU9wKLkMFc3Vlb6E3zk3e/8WCzhSQW9G0lnFw6GALmiALGWsSnzn8put2gNZhJprqyroP2wGkpm8LG9jQZIuvfz2+TMuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454745; c=relaxed/simple;
	bh=O0SjzN/C0aO3qHhb3UBjmXFOhQPDFTOsNKhcZLytoNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2HvxccyrA0+mOwyEK8LhhsksUqlyR9osdxgLebOmBoGA5rt7k9NvD4iQXxvy2GsJHCgpvtvgQWuBFUxq5LrITZFWZTeLgRcLhusAUhmGB95ozN8Dt7efHIoguZ8y8Qd5oxLZVJOJzZwW61w1ImjIzgBCY9gXsLgxCQ+M/pBE/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U67my3KI; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U67my3KI"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6689f36ae56so451217d50.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jul 2026 16:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785454742; x=1786059542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b2iUYeLjQUxHnF+XDQe2fiV8PKRsDwqLHqM0lXiq4GU=;
        b=U67my3KIApyZMkUH8X78BJjGyjb/eAq7V1aH5SBzJ/eWnt+8/HFunKVqcXrmnYcxiF
         mwmNAjXnM49Ky8Xgw7SZhmAeaUAqxnlF5WKk6P7roCuUWQq4qnoELdruBKzFnxMlW9FM
         dW5hapm5Vg10bQb9t840UHhGTv3cKIiAjHTJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454742; x=1786059542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b2iUYeLjQUxHnF+XDQe2fiV8PKRsDwqLHqM0lXiq4GU=;
        b=dFeSioo23z03LRGfLD9R224xx2JVX0hIqPL5R33t8Bfao7iNachXkbewuzgngy/pVm
         NoyVcnius9cN575M5KAi6Z/jMzMLuFbcD+okgQxX48xRF+4A7Qt5+6DjdFMxi9etMFsz
         HI8yMA/BrzuZSanHa1r9LSj6w3t/1LQnZWh5JyJ9PY+Cu717IJGlGqNQTBF+e1R4Sdlx
         6vDYDT2Rp1Y6AkFalI438sHcwKm6FzAiG6hgZq0PrIgqY1FXNAaj2KeIaIi6hScjqziA
         7CRuEUkZNEVz+hMvyFbSW8mqyrLl7XQgMNrbzyzteh/uKl3ACilbDRugseaOVWXqSJra
         gcqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWjbDidYHVj0Aj7R7kcuE2OjIIOewcTfcvbavqORcxeHZx8iuz5wwMl3tlHXFrrBjOL+qjtibm0e28QcGJcHpkKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxebUEFeJv32Rzjul1/K4Z0/mDlfR18ZuUW4lWMJLqBOt4YsnRZ
	VbE2PgYscZHiPwSVvl3u2yuc6h/JP8MZkCdqZs3uWWbZ5jhrvMpzbqX2qSthpKGmJG2oFjU5kMG
	tB1o=
X-Gm-Gg: AR+sD12N+6yTgPXlR2ebo5WxJ2d39QRqTE4t+QaJsaHYLl8sHECtvizpWBH5amEj+aF
	ui7vK02Oq17LmXgZQODN5dYuwVSly5+3SFV8AU+2xsNywXk0ipyhtE3+Dgr6RRTC2VBO4IKwQ64
	B9T+MinBZorMx0OnvCzT4K9/igqv+x0IQ6nuRsRVOxdZWIOh3e3tkilrJHSzWUQCQQ6r8+k43W2
	I+Gs97u3XGNhg7DcLB4dwbglhYEkvdIADFQZQ8J0GsoWcAIcNob8rAOcPyLyFUwRygIq3Rbu9ro
	SL7+Y3S4FU3ZQWzwb1i9hP6+x1BhvgjQLTYxA07V7py8J7dRzu709mmq1T+x4qBE+Q8vpEpb/py
	95upWWrggTv47/D+Apx+LuScTd5jERvD1Md1P+G2ACRE7FixkuzlLqQA3tJtP5A6WEHCYOekWWc
	B81okNjKFG6oe8IU7RbQw+2Uy2VqFAGW0iJ1ssfxDxHxePPrIuzdi8GLW7metwd/+S7QmRhK08B
	4IWEcAH5mk5RBdELqCwrkwxVlO+mJM=
X-Received: by 2002:a05:690e:4852:20b0:664:ec3c:93e3 with SMTP id 956f58d0204a3-6692f6f9e50mr2184113d50.61.1785454742082;
        Thu, 30 Jul 2026 16:39:02 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c53027esm2266763d50.0.2026.07.30.16.39.01
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 16:39:01 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81f64e8dfbcso5305047b3.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jul 2026 16:39:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqz/vLQB0GVeZXm3Nul5E+qBXWe1DRRq55DoW0a8YfDx9C0kuYpYsu8zeUyaKn6wUqiaWSd876Ar2BEbq89JVl0XQ==@vger.kernel.org
X-Received: by 2002:a05:6102:14aa:b0:739:97bf:9189 with SMTP id
 ada2fe7eead31-7574f93a65fmr1607449137.19.1785454369736; Thu, 30 Jul 2026
 16:32:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org> <20260724-dancing-skunk-of-novelty-72c1b8@quoll>
In-Reply-To: <20260724-dancing-skunk-of-novelty-72c1b8@quoll>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Jul 2026 16:32:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
X-Gm-Features: AUfX_mwnyu4WjATq-AQcVkDVhFUfk_uPBliwju6dkYwZZ_ZMH3FiPhsyMK3Tdpo
Message-ID: <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
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

On Fri, Jul 24, 2026 at 12:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> > +                     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LE=
VEL_LOW) 0>,
> > +                     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LE=
VEL_LOW) 0>,
> > +                     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LE=
VEL_LOW) 0>;
> > +     };
> > +
> > +     /*
> > +      * The Pixel bootloader considers it a fatal error if it doesn't =
find
> > +      * a `ufs0` alias so it can add calibration data to the node. Unt=
il
>
> Fake node is ok, but alias won't fly because aliases are not allowed for
> ufs. Well, would work 10 years ago, but this is a device from ~2025 (so
> SoC maybe a bit earlier), thus Google already knew that they MUST talk
> with upstream open source maintainers before they ship such ABI.
>
> They did not talk, so you reap what you sow.
>
> There is no more excuse for a vendor to ignore open source and push
> whatever-ABI-they-wish into their product, if they ever want to upstream
> that product.
>
> I know it is not your fault, obviously. And I know that not much you can
> do, so that is not rant towards you nor towards Doug.
>
> You will have to keep this part of patch out of tree or fix the Pixel
> bootloader.

FWIW, it actually _is_ a rant towards me, since I added the "ufs0" alias. :=
-P

When I was originally bringing up Pixel 10 with upstream, the
bootloader had a hardcoded path to the UFS node. It looked for it at
"/ufs@3c400000". That certainly wasn't going to work. Downstream
_still_ hasn't transitioned to having a "soc@0" node to put all the
MMIO peripherals under, so the equivalent upstream path would be
"/soc@0/ufs@3c400000"

Now, I certainly could have made the bootloader search both paths, but
that seemed bad to me because:

1. As I understand it, DT paths aren't ABI. While it feels unlikely
upstream would change "/soc@0/ufs@3c400000" to something else, I
believe upstream would feel free to and not consider it a "breaking"
change. This makes it feel unwise to hardcode the path in the
bootloader. In the past, upstream has renamed nodes to clean them up
and it wasn't considered a violation of the sanctity of the
device-tree ABI.

2. If #1 is untrue and we consider DT paths as ABI, it's still a bit
awkward. We have one bootloader base that supports multiple SoCs. The
unit address differs across SoCs, even though the IP block is nearly
the same (bootloader still adds the same type of calibration data to
the node). The code I started with had a bunch of #if statements for
the paths in various SoC variants, and that went away with the alias.
I suppose the bootloader needs to know the UFS base address anyway so
I could have probably constructed the node name based on other
#defines, but it still was a bit awkward.

3. I certainly could have searched the whole device tree for the UFS
node by "compatible" string, but the Pixel 10 (and future) UFS
controllers aren't upstream yet. We wouldn't be able to land the Pixel
10 device tree without the UFS bindings landed yet and I think we're a
bit far away from getting the Pixel 10 UFS bindings landed...

With all that, the "aliases" seemed like a pretty clean way for the
bootloader to find the UFS node. It also matched my understanding of
an appropriate use of an "alias".

Any suggestions for how to resolve this? Do we go back to hardcoding a
path in the bootloader and cross our fingers that upstream never
cleans up anything that changes the path to the UFS node? Would it
really be terrible to allow a "ufs0" alias for this case?

As a side note, I did "talk" to upstream shortly after adding the
"ufs0" node by sending the Pixel 10 patches upstream, but I guess we
were so focused on the overlay topic that nobody thought to comment on
the "ufs0" node? At the time, I'm fairly certain my resulting device
tree files passed schema validation at the time, too...


-Doug
