Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF7B46BA0
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Feb 2024 14:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706885699; cv=none; b=owvwlZW1D6QwFwp8MAaHFLF1CxBJIJZf3qXeHXuDyg51zYy09omgYE/UeyBar/vrmkJU+VYnBXyBp67QCZjyo//208zio5kd3t20WV92qEsbmn74nuonejoul3mWSzQ+ez1FjRcjQobEdr3vOHpGh9u5hUKPveul4LCMN+d4E0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706885699; c=relaxed/simple;
	bh=MdKH193MLZ1uUjDMsLOJIGIGHHF/3sdAUXTepKp2jrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UwbSzm4+LuiFd+lXLrwlPfpd6DFWbTWthXbIVw7BBm+Vmrh28AbYMFPmykYbbXKOoCnXD31YHda1tnZULDsOuazlu/HhPnTVNXpFk/K3licRQd6YLhwgAwaiIDTG4+0ZBN/A0YXRHLJghSAcNcfgsB9XMHNYkp/WsLNV7ki655U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wQr4qiWa; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wQr4qiWa"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-53fa455cd94so1538323a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Feb 2024 06:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706885698; x=1707490498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgZY6y3hYltlhybXLFHX3JY6qUiQxBKoDPMqI4ObTdA=;
        b=wQr4qiWallvd3zrm7rcwpIQxb8RSXItV0c1xtQi8an2TrF6mPXfuaREooXpcTpigtJ
         /J97f6b65dR7gf5Zqlg0n1yEy7qFwSBznIhJKdgxNdLX6Fcue/sxxiZOmXdnxZTNjwOR
         aHl8tzjbAJVVGaDe/hDYsZAtT02/99VxV1Tp0DaMh7xy5QuJjf9cTNT/BAxPLc1CaShM
         TSNbk3LZUMeHzUt0IqZOZX7Y6QTwD3fMw12a87VF4A8nYKtsQweeP6VMm02+ty2IkOZY
         IiLC2hMGkEOK+W8abTnQjlFAm+yEzYJDQjTs2mbfkZrLhVbQ9M4PkEYF2ZbMuqqNqwlu
         d3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706885698; x=1707490498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgZY6y3hYltlhybXLFHX3JY6qUiQxBKoDPMqI4ObTdA=;
        b=QPqEtNixxfH3yNjnh5sm6zVg78yeUBthsxdQ3TU+iKxAmIppb6j4ekWy2dvwRPBw3V
         OPAujDppgJQIT4JqZ+NxncMxMD+2csPLlYfCJoHyEfPEbPn4cF1vzwbCrNIp8HQoHedf
         vpAwyQUuFtwNdyrEVhBNhBeft+sva7rK1X9qd4/sE9bnMjcVq8HDxPLCZ4yRUo9WvHai
         5762VrfDBKaEIqaz4HGYwL2c+h+K3XGMQ0x0JqSgf1xrN0rZODBk71/Y7C4P9IJ1bmGL
         J4KtvguP/OnG9xCZUIJzchlO6KWLmB8PCB2sAsNKtE4mg0bcFTGoiifcNm6Jegh2TFjq
         N+VA==
X-Gm-Message-State: AOJu0YxtHuhtAT/NbxPev60jKJgXULLnqQvPi3IuUMgKCgEn7QAloqj5
	aRcjGbrM2MyIpxmOgn7FDdUMpALlQ2fuLfxUF2b39gwuwp90TEnjlHquw7E7IhTBYdWP0osJ4Ms
	d2h45k7psr0PfFQ45E+HRflFMTpV0KbISKEWGKA==
X-Google-Smtp-Source: AGHT+IFFYDDuTFvmOwr9M8ASQb3hTgoGrlx9OXayKv245V/5FAXMHWqna8B3y+9sdEi69bzIL4D85SyxTGIfNpF0rJM=
X-Received: by 2002:aa7:984b:0:b0:6dd:c1b4:2643 with SMTP id
 n11-20020aa7984b000000b006ddc1b42643mr7914114pfq.28.1706885697829; Fri, 02
 Feb 2024 06:54:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202010507.22638-1-semen.protsenko@linaro.org> <bed3d775-2d80-445f-bf28-b28a17a6370c@linaro.org>
In-Reply-To: <bed3d775-2d80-445f-bf28-b28a17a6370c@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 2 Feb 2024 08:54:46 -0600
Message-ID: <CAPLW+4nPnPywwsjkeJE70GzyBL=smEo5_=0usGwmnaPRgZwdrQ@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: samsung: Remove superfluous braces in macro
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 1:49=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/02/2024 02:05, Sam Protsenko wrote:
> > Commit 59f37b7370ef ("tty: serial: samsung: Remove USI initialization")
> > removes parameters from EXYNOS_COMMON_SERIAL_DRV_DATA() macro, but
> > leaves unnecessary empty braces. Remove those to fix the style. No
> > functional change.
> >
> > Fixes: 59f37b7370ef ("tty: serial: samsung: Remove USI initialization")
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/tty/serial/samsung_tty.c | 8 ++++----
>
> I am pretty sure you did the patch on some old tree, not mainline rc1.
> Please work on maintainers tree (or linux-next).
>

Hi Krzysztof,

I worked on linux-next, and rebased it on top of the latest linux-next
yesterday, right before submitting. I distinctly remember solving a
conflict while rebasing, due to the new commit 0b87a9fd670a ("tty:
serial: samsung: set UPIO_MEM32 iotype for gs101") which just got into
linux-next yesterday. Please let me know if you want me to rebase it
on another tree and re-submit.

Thanks!

> Best regards,
> Krzysztof
>
