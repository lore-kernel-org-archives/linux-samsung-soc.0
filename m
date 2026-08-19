Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CA53A783B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 23:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787182859; cv=none; b=m979KMLP8THxjx6JjEfEuRV5usZXFVWT+rDGiX8yidihmv0b3jMM3DlG5E1cIbkGJ7gx6Q9bPhrEExA7l7kFZJo35oj6DvIvU5XmvE2IIejv8DsRD+FUvmNFiO36XjfUvn4EtQRokVwlyyNJ/56M1JRW+PzzAcsXZxpjo3nLrZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787182859; c=relaxed/simple;
	bh=bk8X/C1AqkDTikcqiW7Hg2XdCI/waiwQ0VemNKokSJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SUzA+lcoArOCWlWP5ebGKUSkER1kd1xae+KnGrCGMyDZhctQFRfk+aNoyx2EarNeFeaqO7V444LenH/4KIjtYkqDYy+8LGnUBJ/zvEZLSyNJErrffFG3/ZdX2PjJUmWQiIm7REVwTy8+OOBmMYWY2zyhosr5f3P9TSHNO2vauzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=klPlzYSp; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="klPlzYSp"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c375a9e76cso1097396e0c.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 16:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787182857; x=1787787657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bk8X/C1AqkDTikcqiW7Hg2XdCI/waiwQ0VemNKokSJg=;
        b=klPlzYSp+wttNPFbZ8Ogrw4aBT6ikyzcCP0ZJxJMWZdRlhYymPBaNnN3bj0wsP1a88
         WE2Cet76LcW9DsjbbCjBDtZ1xv6oVTMj1jQv91nPg5DAIm0rxz+G/TQ+fpPXMSMmk5Bn
         tCN1fjBM3uw1U3ZhmK1FbaF4jwJMa2qQ5aJFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787182857; x=1787787657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bk8X/C1AqkDTikcqiW7Hg2XdCI/waiwQ0VemNKokSJg=;
        b=QJFzipCiG/ibRZ+OiSOZbAmXTPAQ4rw1XYgUut4HSehPdBbgEhKPwubpKP3m6l6QtW
         xBKxGig0cyhwp9ivLBNbWj8HRehtsGPOn4coFAD/Jb94fUW4ivR07AGFX85G9n3+kBFH
         k185goDtbBLoK/YtttWpC4BiVrCMeS0h1YxA4hz5ANzsisQJhWxQjKpjuHadmPv/xEUY
         T3L8lDNegcN0kVJggBpu9oPeBQdjVXr9nXvA/2qJmk1yQmCdYcXbeZG0A86In5T/J/Yf
         VtcioKpPV93UxZxrDcqj4q37MlM3KC3yL1a9WKYBI8GTpc6g6zVBUo/+iRj8m7YthExD
         pTLg==
X-Forwarded-Encrypted: i=1; AHgh+RrlEv5eCR1hMhOksLZT6bUYOVcdSg+mpk2kr3ooSi+hfDkTRXaCfT2XimEzi0Idajmv2qKQ9Pf9K2WZ6CmSIkRBdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcFNM1YdYorSbFytMIbddyljpU1eDpSoLLIPYP0gaPk0RTBrov
	JRhjKlB5/Cw/84T5LhklELgDnIHWp89dlCXnzlT0ugawMaai1K0vkIIY0JPqP6ZrF8Si/YhgnR6
	FTl0=
X-Gm-Gg: AR+sD10T12TOURCvKCIXgVO3ZKYyhb0UoKe3zBiiArJAS17LdRFiHJk87zw8qXxhTMV
	qsu8ViWuRZlN7+eAXyIHM9IOiMW4oTy4vD8sa692n4MTWkhSJ8wWP+iYdpsiDz+xehyKAg6bG+H
	rpYmtxyoQtzHHl9fZIqZNxgV7nixh0EvZIrX0sV2zsFLxJG8H/Cl98Dmjj8jNosUhCY+HZ9Qv2T
	tvrcTKQvgxWqNpECzM83oN+9xqG1H3EYLX2XrQMG7wNW/HvwGlLykPlEqiATHGI6ZcvTuIwziqH
	mIxi3upfEwWGmps7pLNCO/rbsY21wrviac9jbsad7A+1ua9+vXbCAbPP9gi7Pu1MBNB61gDLhpP
	mX5WkLNq6zLm806PvqKVGhhD/QYcZQ11nZaMofXfc2t9wVnwrpTU+dJNHKptbq1nr5EeYmwNqA8
	08JRr2dCL1AZaPiVQ5QdZUq/ismTK1kw+wjPeWT8VBpHQgcH6iwMIfJZeHvx1IqRzXb2hAELAEx
	uvRlcGxIcMbLvlp3x/eKYaRaHI=
X-Received: by 2002:a05:6102:6ce:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-777f8976d3amr3372367137.2.1787182857130;
        Wed, 19 Aug 2026 16:40:57 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777dafa9b1dsm3938654137.1.2026.08.19.16.40.54
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 16:40:55 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97bf8f10ebfso774205241.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 16:40:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpgvOVzssU+GCC1utaKBlgmUbtqfOmsUXu5Ug8Ow+BQXu0DnrlxHq+RLl6YJI2436d0pjBR6Y9q7rhJH6971Cpn0w==@vger.kernel.org
X-Received: by 2002:a05:6102:15ab:b0:777:4e3a:8dde with SMTP id
 ada2fe7eead31-777fab9d4a7mr3615810137.11.1787182853246; Wed, 19 Aug 2026
 16:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
 <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
 <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com> <CAD++jL=VLzW-4eB=izJwaTJ+6xObk9+AQGTDK6ABdrGX4K3vAg@mail.gmail.com>
In-Reply-To: <CAD++jL=VLzW-4eB=izJwaTJ+6xObk9+AQGTDK6ABdrGX4K3vAg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2026 16:40:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VsiQfoGYHw3D2xmV=Jedu+cmqEfrCk0mkKFzsrRCQcTg@mail.gmail.com>
X-Gm-Features: AcwNN1UHCTu0dpSrOeIjoA8l2gjjfO6Nzx_OO7IAuQCNztYoKMKLEde815SfxYY
Message-ID: <CAD=FV=VsiQfoGYHw3D2xmV=Jedu+cmqEfrCk0mkKFzsrRCQcTg@mail.gmail.com>
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

On Wed, Aug 19, 2026 at 4:29=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Wed, Aug 19, 2026 at 7:03=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
>
> > I appreciate your suggestion of having a separate node for calibration
> > storage. This feels more awkward to me than just giving up and having
> > the bootloader hardcode all known device-tree paths that the UFS node
> > might be found at. That being said, if everyone says that this would
> > be a great solution, I could try prototyping it. The trick would now
> > be that the Linux UFS driver would need to be able to find this
> > calibration data, so the Linux UFS driver would either need to be able
> > to find it at a specific hardcoded device tree path or the Linux UFS
> > driver would need to search the device tree for a specific
> > ufs-calibration compatible string.
>
> Can't you just put the calibration data as a custom property inside
> the UFS DT node? Just a long byte array or whatever it is.
> The driver would certainly know where to find it that way.
> I don't know who or how it has to be put there during manufacturing
> or inserted by the boot loader into the node from wherever
> manufacturing stores it though. (Assuming it's some calibration
> added at manufacturing, I don't exactly know what it is...)
> If the actual storage place is in something the OS can read
> then we could probably use the nvmem to fetch it live?
>
> The calibration business and what it is and where it is stored
> evades me a bit...

The problem we're facing is _finding_ the UFS node in the bootloader.

The device tree for the board is stored / maintained outside of the
bootloader codebase. It is compiled and stored on the device. The
bootloader runs, locates the device tree and then wants to make
changes to it.

The bootloader needs to _find_ the UFS node in the device tree in
order to make changes to it.

The question is: how does the bootloader find the UFS node?

* Does it hardcode the DT path to the UFS node?

* Does it use an "alias" to find the path to the UFS node?

* Does it search the whole device tree for a certain "compatible"
string and use that to locate the node?

Hardcoding the path is the easiest thing to do here, but then the
bootloader will break if the UFS node ever changes. We also know that
this path will differ for every SoC and is currently different between
the downstream device trees and the upstream ones (because downstream
device trees don't have a "soc@0" node). I've also been told that
device tree paths are not ABI, so hardcoding paths in the bootloader
seems less ideal.

We could just hardcode the path in the bootloader. If this
conversation goes nowhere I'll just change it to do that. If paths
ever break, then I guess we'll just have to get yelled at when folks
say "Why in the world would you hardcode DT paths in the bootloader?
That's not ABI!"

-Doug
