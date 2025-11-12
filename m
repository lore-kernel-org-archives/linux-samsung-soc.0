Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D44A31355E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 12:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762951407; cv=none; b=RdyuMdlZKn8FDYLt/CCfh393Q/CowG+p6yncw3ACn1Fh9vMOmX9FRQ7JeqxiblKwV0XCO9PoYOZ2jlplrVlKMCTmRLGW6LbGy2vKtFgRb/IAmiR5O5v1wpi949X8183GC10yMZVjm/yryIEMheALhH+KLlr7JD3rCLSloZa3lp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762951407; c=relaxed/simple;
	bh=3nCLGdNg0B7kK9ihswq7fVace/Pjn+bodu3kR1lh3t8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wn7kgbz/0ZMXEL22hcm2Neilxt5KMum5ce/FfsCvpDlr24Sb9HLAjPOnhuD99otiALnBShf3iCQMj0/DaurHA7enx2OKtCdPxWQvCaM6OPYjsE1u2P/xia2QHwcpirXI8nT3wonFR7+cWqrKzJuCPeLziw1V8VrHYhbTWbHvAek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mX8DZZSG; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mX8DZZSG"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-3e0f19a38d0so475400fac.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 04:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762951404; x=1763556204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nCLGdNg0B7kK9ihswq7fVace/Pjn+bodu3kR1lh3t8=;
        b=mX8DZZSGiFmqWcfKLgsYJDP44Ga2DuJq9d6nzwjLltzH+hPrtGlWtbthL9NH6yynWj
         Q19iZOsyg9SZOOl61OJMxM/OxyE6UiTkGsI1kCHqDW0fM79XcyEUfmesFew8lEo2nPuh
         hmhD+1WdixoslUXxL5QKYlae1ReVuHlWAp4ufImR/SVo0ERu1usCDr4GHKT9jUmYveSx
         P2WgBakSR6uCdlviVf15jwnTfEluATz2ncPbGNcprTxBidaT0QvgCIoeuYd2eqFF8qH2
         Hn/WiEEKMIh8y71vjZ8xAhwicx3Q+2SqfvTRUmAkbj7ROkR0ZxJHYkB2HuICL3JjnR05
         Ahvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762951404; x=1763556204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3nCLGdNg0B7kK9ihswq7fVace/Pjn+bodu3kR1lh3t8=;
        b=KKv9g07D2x18oFFtpTWWMjF+HozFH/QHzb0S29EjEwswjLYA3CeY/LyeBBah1n1H6c
         dG/59rN8USH5vWwdZURduzw2Lanizb2oUUqZCEqxGxVZBYQa8a78EgaZRLwRC5hFetBm
         UcXfL0KLyg07uPCq5olCpwv5Fk15++ccSBUgzfzp42+sJlivqiTAASVQnsL4RIrx3opx
         Kvu7SvW9VLwbx4G3rbXuwyDVfY51vpoWD7fWZ7dcWBWJJZ5QVKbksmDyXItv3TTsfngp
         CIxTfGLFcPfn+5Xz9VRisIPVSJcPXdnWOkaOunr56FP6Zz9Tc6uCJhQbQOb9XpBeJbdV
         cbzg==
X-Forwarded-Encrypted: i=1; AJvYcCWs0mpW8ehvUAkLmPqBCGU3vPUThBly5W+efTycG/0NiSnzIdoeyofvfhQMWAxSYlrGo/tQdldqdXkToKY6SJTitQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YztkO3nJoDTDjDd2A1tIvSG6g75kLfpOb6OHqcUbTmptZt8wZL2
	3ePY11gQ8k0CfPPrmMnImGJAXv87mtvcxGRqcVyA5epOCTxJrRC6vzG3GlymCLn99mMvH4a86da
	ieCLFkXGdC4NrDwfaF2dNqQp/K4ZcoJkMtRPSmgj0Jg==
X-Gm-Gg: ASbGncvL7ERYbnO25FFugEsKwwCwax+EWnjrzV5paNTDyWRAV/3KOwmkycyM1Yfz2tb
	sE/Scf+h2byQnyrtoTs/JYbODfBvhWh/nxIjSm3Ns/DnVoRcpepHxcNIBDVYkCE2AvoFmIwN4CH
	ByyxA6nRoOKmN7ASxPqFXJe9w+pUzw3Znii96yznkg8G+laKJlp8+LnkCrVXFb+i3Xb66zAo6YV
	ZMVaxxqUqa8h12Ry0LhnDrvOJRr8NUtRY0RZMdUEBakeMKXlHoS/hFG5dsx6g==
X-Google-Smtp-Source: AGHT+IF56OFOYiIqZ0djA3ZvTwB3pXvmWTE2Y/2e47Acadn9UwrR6l4mgUbLbvMhjjLW0TKRt/QCjKhcWzj8fAK4e1A=
X-Received: by 2002:a05:6870:b14a:b0:3d2:ed44:67b9 with SMTP id
 586e51a60fabf-3e83416c4e5mr1230844fac.23.1762951404616; Wed, 12 Nov 2025
 04:43:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid>
 <b55d94f2-6b79-407f-af58-b9847db3c9a2@kernel.org> <CADrjBPpCKfd_0PY=DULnmqfb8veqH-SQ-kr5gC6Y28uBVo8iRA@mail.gmail.com>
 <CACRpkdYN=FN92cuS3U-XBVoyD3DcKkfzEXYVNnQNK07rxJJZ=A@mail.gmail.com>
In-Reply-To: <CACRpkdYN=FN92cuS3U-XBVoyD3DcKkfzEXYVNnQNK07rxJJZ=A@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Nov 2025 12:43:12 +0000
X-Gm-Features: AWmQ_bmPb1_M5A-rGtzHjXMiQBLBGQHTdvPma_dayyNctbSOvz5HTwmZK5JuVGs
Message-ID: <CADrjBPo+EhJ5iLCm=HpzLCWjv+QCX3ft4e4eC1CPzeCk+trpKQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: google: Add dts directory for
 Google-designed silicon
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Drew Fustini <fustini@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, 12 Nov 2025 at 12:36, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Wed, Nov 12, 2025 at 1:26=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
>
> > There will be some Laguna SoC
> > drivers for pinctrl, clocks etc,
>
> Oh new pin control, interesting!
>
> Will you be doing the upstreaming of that?

It will most likely be Doug, not sure if he's started looking at that
yet though.

Peter
