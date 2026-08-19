Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD23A3C1973
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 17:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787159382; cv=none; b=R1ZaMjEVxvtk4aTFY2J5CmzE5VA4RyU4Hj8Ln5jDR+tpRa3i1gOua0OKiuV8ObgnJmhN34pg5nouohLGrMaqOZEd85ljp2t/zH4TohpwVaxfSxNRyEVkjg1vQQcl7bWY9UiitsPJxie3Zo6Mv+IgIJCEJN+a5ACJTKp5OLC5/EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787159382; c=relaxed/simple;
	bh=R+X1+pJjWvWvVDlg36MzfNwzU5dUF/DCSQzZsCpt9jQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqYXTA5b6aNQEiMsING70ZGAqytxIyJN6XHU2HJ21V2BXIzXwMfrc9bvsooekG94x4NAFCfG/OcEpVv6ej1x4VP2wLYpVqbwIq98t1LtI0nyVdPsikDlGFkaSNyb25f+yolM+BXZExi4NL3uwe0IIkXO1HckkyaQ254KG4tTfhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X9+GyIkS; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X9+GyIkS"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so15038655ad.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787159380; x=1787764180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oOL0sGbjRAF6LYH92WM9uY0MD9+Nj1oBAHQxCb/Np7E=;
        b=X9+GyIkSEkgwjlBVcsnErq52cJYvQypxj500kk8vboCuwncM+pNaxD+HrqgM1CtcH1
         zICaWCAOtxuEAjLypyiW+LyiLJI1fHVeEjA/2mhH1ScxOIS4c7dNriBJ4iwiekWL+AMi
         u0d3z7zjO71kiFzji6CXWJZCSR5QKYFIoys5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159380; x=1787764180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOL0sGbjRAF6LYH92WM9uY0MD9+Nj1oBAHQxCb/Np7E=;
        b=IQ8BC83nDLzoBDWZJra95B7Y6K1eNobRfChw3PAU5yjG6CfYKmvlox3FgtpWxxbSxq
         sK5/a3tSAVDlWWQN5C8kZSEjfxtxw44PEP5F8yp2XTbLQTiWseA2u5HSpiIvRJChWwmR
         v0OlYrY4bFHxysEl6ykpI8blkXlwX5RBphFUTHzoR3j0lpqsb3zkZRyEUcQxcVWuFvxN
         hzeEdcwo2k8c8R8jWXXqEUpeTPvFeKe0iUZwLlx3b3djb69wbYnVFMWfM3EIvMyWZptS
         COtAPWH1/y9V0mm8XgXSUhaZkBjtEImqKVvsUkbo/VP+hvxLXsdeTTRKiaGNtwbBrSBO
         gP4w==
X-Forwarded-Encrypted: i=1; AHgh+Rq14j9nng5opz+VDFXkqjBdkQBa4hdbY3+zmBQE6vYnuQQB+nZn9ELLIOcFldxyGH+SrYKfzV9TXSiH/6fuYMlE0Q==@vger.kernel.org
X-Gm-Message-State: AFuF++m+1+9FLVXuyDjlG/xNH9Xe9wI8Hv9QMVkWcHpGWa74rbVgUWpx
	JO5CN3bUN5uSJgNSEBLrT6CA3M0gkLkdpNcXz7hnpVWIKKpLA/jmx7eMIwMMF7d3ebxOQeb8MMQ
	9baU=
X-Gm-Gg: AR+sD10gphVlZSJK6BDgBeFNz5O8YZMg1snEMoGYBQBez4V4Lfm5SKj00FSrFCXQkqg
	7KzFlbtZcF57giWehDDB5HCMzRO1lFub3TQ3/cYlcbcU3i7EcJETxmM3tVJJQmydUajDE2ZlQk1
	kvlotp/OmSaDsSixiFZ4iIxiD+5EBnxd8T3HDq5bfj1/UEBpXO00Ni585YyA8EXqVlhxN5KRL0l
	6MX3++YkMINTRQboYozhjZBXs5BvQx27nIBhai39vUQcc3FtDANqSJ045eTbaHkBliKc94sVWBY
	PgaVBrrzxisCDLNSGDhgw7YpslPEtCtiJrXm+m73Dp2AH9+wKGkd9eyG3fH3LlzNwqaGz1LnT6Y
	HoezRKZDBedwFDJqtoEejADLUxvMpItmfRd2OgXifHXqCF6D2VcnF/UAV2HBs5T9hYKL5EPhQto
	PsVzFIeyZIKLHKMufLLC/qqdttloVSRZFpXK7/rgJjJUWREOGOSeFeU9bb3qDgD+V4WZCMWDSFC
	+gDfbeUbt9GA+gSNM0C1Qx/5ig=
X-Received: by 2002:a17:903:26cf:b0:2bd:c925:3a16 with SMTP id d9443c01a7336-2d5fd684b75mr114833325ad.2.1787159379841;
        Wed, 19 Aug 2026 10:09:39 -0700 (PDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e5293asm27417355ad.52.2026.08.19.10.09.38
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 10:09:39 -0700 (PDT)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1877306a91.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:09:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr4sCt8Wbqwdz+vsAHzIamU+F3DBXI3C5LgWtYv4h7A9XkVEBGcOGiunkIo/dUdYPQke/+3dR9NaHlZG1qM4JlZDQ==@vger.kernel.org
X-Received: by 2002:a05:6102:191a:b0:778:5579:c662 with SMTP id
 ada2fe7eead31-7785579c755mr1067469137.9.1787159074606; Wed, 19 Aug 2026
 10:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com> <c0657108-1958-4c4c-b5f5-0eb24e81b2b4@kernel.org>
In-Reply-To: <c0657108-1958-4c4c-b5f5-0eb24e81b2b4@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2026 10:04:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
X-Gm-Features: AcwNN1VC5Sr-hmHls4qje9y_sLrQ3mcRyp6W877ec39iaS3jdP4hd--uL8qQ3VU
Message-ID: <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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

On Wed, Aug 19, 2026 at 2:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> > Is there some other documentation saying "aliases =3D=3D evil" that I
> > missed? Maybe some email thread we're all supposed to have read?
>
> A lot of rules are implied by other rules and this one, how Linus stated
> in other thread, might be implied by no-Linuxisms as you want ordering
> or stable naming of Linux /dev entries.
>
> I understand your reason is actually different than above, but your code
> does not suggest that.
>
> Anyway, if you wanted to have aliases as ABI, it would have to be
> documented. You cannot send post-factum DTS and say "we already use it".
> Every ABI must be documented before usage.

I'm happy to document. Can you please point to how / where I would
document this? As far as I can tell, no aliases are documented today,
so this would be the first. If you could give me a hint of where you'd
expect it, that would probably be better than me guessing.


> And this is what my comment was about: "they MUST talk
> with upstream open source maintainers before they ship such ABI."
>
> And no, sending such DTS in your v1 is not documenting ABI. Does not coun=
t.

Sure, sending a DTS isn't documenting, but it _is_ talking. Discussion
in responses to patches is where we figure things out. For that to
work, reviewers need to point out problems and then we need to have a
continued discussion until we can figure out a solution. When that
discussion just stops, it's incredibly hard to make progress.


> > thus implicitly provides an "instance ID"?  Would it be OK if I
> > changed my alias name to "ufs-primary" or "ufs-internal" or "ufs-boot"
> > or just "ufs"? We're not using the alias to get an instance ID, but
> > when I added the alias I followed the pattern of all the other aliases
> > and put an number at the end.
> >
> > I'm happy to attempt to fix our bootloader using whatever scheme
> > upstream suggests. I'm trying to "talk to upstream" as requested, but
> > for it to work I need upstream to talk back. :-)
>
> Make your case - what is the purpose of it? Boot device? Then you have
> "chosen" node for stuff between firmware and OS. There is even a
> property called "bootsource". If this is not boot device, but some
> calibration data for ONE given instance of IP, regardless whether you
> boot from it or not, then I find such case as border-base and not worth
> implementing, because basically one can come one month later with "I
> need 1000 aliases because my bootloader is patching up every device
> node".

I think I've presened my problem fairly concretely [1]. If you hate
aliases as a solution, I'd love for you to tell me which solution you
prefer so the firmware can add calibration data to the DT. To quickly
summarize options:

a) Hardcode the DT path to the UFS node in the bootloader.

b) Use some variant of aliases to find the UFS node.

c) Firmware finds the UFS node by searching the whole device-tree for
the right "compatible" string.

d) A separate "UFS calibration" node stored somewhere in the DT
(where?), as proposed by Linus W.

e) Something else?


[1] https://lore.kernel.org/all/CAD=3DFV=3DU0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr3=
8p+YwRnC_G6w@mail.gmail.com/
