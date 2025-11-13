Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36901F5834
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 02:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763000708; cv=none; b=EQmGcJhqdzFSHB864MqiAsE1mhP4AF1wymZojGeM1asUbwxhoYpHJNPQSM22ZvI5Cbo7aCqwA1FZdnY5TKtSqftygpjLv5NjIQFJLwxFTwMl2Pvj3f792nGIadYvFZ2eQg5lGE96xIZmKH8xPZ8wqAAt5LZSzj9djnBx+8ZG+Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763000708; c=relaxed/simple;
	bh=Ml9Ykm1Z3bq0beAly9optdGdngZ9IF5m2Caf3Zc30oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJzCx9IduxTMCrH2FH8o6tAYiy/iO/ehZccB1iL8Yhl8X5xyMOLQQevY15P2RKNY7afAwtrB51k9OHggdHI5gacwRt7O8c7bKCeen1NccE4PCHnYNkBUswbFpwrA1JGNtUE17SFhI5moppKgnMvDqQeRA8MIZGmZ7zoVdFQd/1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ioTD63NH; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ioTD63NH"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7815092cd0bso3480557b3.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 18:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763000705; x=1763605505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpS8KaArpznUhK/i8V7RPAif5JPdnBo+2tROHA42EAI=;
        b=ioTD63NHO/xwgGSFoD6V2qC8B2WmnoTud/9jgJ8NHlnjgQD/c5xCu5OaNkD+Ak0STA
         P9/Nkct7RaaqN33Gz/NTfq/mcD+KXjfxw5KPazYMxHfiGfwhzd6XKXco+N6eBujD7iSt
         lIMqYuUA3Vu0htnmq2Xs5+TXOr74/gZ2W9FpaRdG7imf2VQF0G4soHtTimBFQt0inXNf
         V4OkO1OM8k6GHFt7IrUH/4DkIPGhNHofUAkZ2ijm+UWeHboz1CujO13gPeWlEX64cfUB
         ER1a1xNxa5xo7Xv16NZUq7ZF8jwMXEl2HJ4CMQLTw7PGFLvo3tatHvhr5FRcz0vQSQkb
         zKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763000705; x=1763605505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vpS8KaArpznUhK/i8V7RPAif5JPdnBo+2tROHA42EAI=;
        b=DB3leNZ1aJgnylo/AfOecNsec/erKtAViBtKHj2LCFDebtYNBtA7FQ8RfVB1bvkdQ5
         Plz4bntfGyAcb8J8FipAC+8PyZ/2Q8s4slkwz4ojhMAOFkoIJ6uoRs+VJTw3ILr11C8I
         3t+jVvRXskxjIZb0J9mgXq6fFL+po7NvzICOUHqOborwQPLezGN/obsjOKFri/gfNB5D
         BCZy2Ut4j2hMrpFVID8OrMywBsX+76c728Q7FtT2rbgao6LqTkADhVDirXubc4muU2hr
         aAsMFVHq3hm69dSg3mAyBsaMchoGRGZfoBTUTtt5sqZB7nSEkT3fVmfuWsbBwmJZewk/
         ZlDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW52zrnDdY63azayslXPvjbnWiBZdR1OUJ+DTJcizgAjiONOHWQJmTVeUD9G2I6/MsLnAP4aGvwSEj/tZzsAgDqaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNWMLMYooFL0CmKmbllBGLFYWakh4ak8mD4WiZsuTV8a7ZVA75
	FiNesrNydrBGUtBGbSgtMkeIPG+Yb88LzoGLuCFtE8AlMibLwuahGjUveNK7PqU4PLh3hBaNmZr
	22w5cfCBU72G3Z0PM8QB4eLz3zPlbddrnqS97Rm+riQ==
X-Gm-Gg: ASbGncsh2S8CEz9HDm1I0ZFUzAxIpgwvzWp9fNNUFn97l46HoxRNRd/ZAM2PQtoAZya
	UF+nTN3yoVUZc6K47Fb+1QQrzqxcVNUAA5QKCwnfaOC5jJzYiSAkm75eCr7gj+T8KXNp8Ucd2CV
	L3djzDy1ZhOHoQyBnA1jm5ri44fGqWWPsKEENKGTupyMHMTcfcEGzId+6RP5zvsDG05l5MGaI3s
	OXTlMfpkxw1Z10bn5uuQkJ8wtTkKGNNAn/RoV8K06GqUmOZvw7DgShBRTmylDA2ImJKMLvan7b8
	x3P6FHZhYGiIRORi90M=
X-Google-Smtp-Source: AGHT+IE9nw79ok3XVYsnuZRzmWffEr2r7gNXoUrKtnl63L+YsA3Oe+wKl96YiZ3F2poj1t2mJW1YjQd/vouEkz+SJPQ=
X-Received: by 2002:a05:690c:560c:b0:786:a774:e415 with SMTP id
 00721157ae682-788136a9efcmr58233327b3.56.1763000704785; Wed, 12 Nov 2025
 18:25:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251110082143epcas2p264578c49f1ac241c3ae721d5e23149ff@epcas2p2.samsung.com>
 <20251110082649.3109858-1-youngmin.nam@samsung.com> <20251110082649.3109858-5-youngmin.nam@samsung.com>
In-Reply-To: <20251110082649.3109858-5-youngmin.nam@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 12 Nov 2025 20:24:53 -0600
X-Gm-Features: AWmQ_bnE2aLrQQBbPuIUIN3YkM_h-hHAIsBVkI4nJ59IEGnJlp8CMF73aSymTzM
Message-ID: <CAPLW+4mQQ=fWAxD4yBYan4fUEOBTJ-k0K6zNjoULi9X4MjOe8w@mail.gmail.com>
Subject: Re: [RFT PATCH v1 4/5] pinctrl: samsung: exynos: fold GS101 pin-bank
 macros into EXYNOS9_*
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, peter.griffin@linaro.org, ryu.real@samsung.com, 
	d7271.choe@samsung.com, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:21=E2=80=AFAM Youngmin Nam <youngmin.nam@samsung.=
com> wrote:
>
> GS101 had dedicated GS101_PIN_BANK_EINT{G,W} helpers,

Style: please make line as long as possible (AFAIR the limit for
commit messages is 72 characters). And no UTF-8 characters, if
possible. This goes for all patches.

> but they are redundant with EXYNOS9_PIN_BANK_EINT{G,W} (same semantics,
> including the per-bank .eint_fltcon_offset).
> This change removes the GS101_* macros and
> switches the GS101 pin-bank tables to the EXYNOS9_* helpers
> with exynos9_bank_type_{alive,off}.
> While here, update the struct comment to note
> FLTCON is Exynos9-specific (not =E2=80=9CGS101-specific=E2=80=9D).
>
> One macro family for all Exynos9-era SoCs (incl. GS101) reduces
> copy-paste drift and keeps the FLTCON handling consistent.
> There is no functional change.
>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> ---

LGTM:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 98 +++++++++----------
>  drivers/pinctrl/samsung/pinctrl-exynos.h      | 22 -----
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |  4 +-
>  3 files changed, 51 insertions(+), 73 deletions(-)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index d4b2e9f8baef..ea11543e4e26 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -1842,83 +1842,83 @@ const struct samsung_pinctrl_of_match_data fsd_of=
_data __initconst =3D {
>
>  /* pin banks of gs101 pin-controller (ALIVE) */
>  static const struct samsung_pin_bank_data gs101_pin_alive[] =3D {
> -       GS101_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00, 0x00),
> -       GS101_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04, 0x08),
> -       GS101_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08, 0x10),
> -       GS101_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c, 0x18),
> -       GS101_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10, 0x1c),
> -       GS101_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14, 0x20),
> -       GS101_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18, 0x28),
> -       GS101_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c, 0x30),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 7, 0x20, "gpa1", =
0x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 5, 0x40, "gpa2", =
0x08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x60, "gpa3", =
0x0c, 0x18),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x80, "gpa4", =
0x10, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 7, 0xa0, "gpa5", =
0x14, 0x20),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0xc0, "gpa9", =
0x18, 0x28),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xe0, "gpa10",=
 0x1c, 0x30),

As mentioned before, please try to keep the lines at 80 characters max.

>  };
>
>  /* pin banks of gs101 pin-controller (FAR_ALIVE) */
>  static const struct samsung_pin_bank_data gs101_pin_far_alive[] =3D {
> -       GS101_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00, 0x00),
> -       GS101_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04, 0x08),
> -       GS101_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08, 0x0c),
> -       GS101_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c, 0x14),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa6", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x20, "gpa7", =
0x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa8", =
0x08, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x60, "gpa11",=
 0x0c, 0x14),
>  };
>
>  /* pin banks of gs101 pin-controller (GSACORE) */
>  static const struct samsung_pin_bank_data gs101_pin_gsacore[] =3D {
> -       GS101_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00, 0x00),
> -       GS101_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04, 0x04),
> -       GS101_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0, "gps0", 0x0=
0, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x20, "gps1", 0x=
04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x40, "gps2", 0x=
08, 0x0c),
>  };
>
>  /* pin banks of gs101 pin-controller (GSACTRL) */
>  static const struct samsung_pin_bank_data gs101_pin_gsactrl[] =3D {
> -       GS101_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 6, 0x0, "gps3", 0=
x00, 0x00),
>  };
>
>  /* pin banks of gs101 pin-controller (PERIC0) */
>  static const struct samsung_pin_bank_data gs101_pin_peric0[] =3D {
> -       GS101_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00, 0x00),
> -       GS101_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04, 0x08),
> -       GS101_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08, 0x0c),
> -       GS101_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c, 0x10),
> -       GS101_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10, 0x14),
> -       GS101_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14, 0x18),
> -       GS101_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18, 0x1c),
> -       GS101_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c, 0x20),
> -       GS101_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20, 0x24),
> -       GS101_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24, 0x28),
> -       GS101_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28, 0x2c),
> -       GS101_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c, 0x30),
> -       GS101_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30, 0x34),
> -       GS101_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34, 0x38),
> -       GS101_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38, 0x3c),
> -       GS101_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c, 0x40),
> -       GS101_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40, 0x44),
> -       GS101_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44, 0x48),
> -       GS101_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48, 0x4c),
> -       GS101_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c, 0x50),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x0, "gpp0", 0x0=
0, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp1", 0x=
04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp2", 0x=
08, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x60, "gpp3", 0x=
0c, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp4", 0x=
10, 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xa0, "gpp5", 0x=
14, 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xc0, "gpp6", 0x=
18, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpp7", 0x=
1c, 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x100, "gpp8", 0=
x20, 0x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpp9", 0=
x24, 0x28),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x140, "gpp10", =
0x28, 0x2c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x160, "gpp11", =
0x2c, 0x30),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x180, "gpp12", =
0x30, 0x34),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpp13", =
0x34, 0x38),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x1c0, "gpp14", =
0x38, 0x3c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1e0, "gpp15", =
0x3c, 0x40),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x200, "gpp16", =
0x40, 0x44),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x220, "gpp17", =
0x44, 0x48),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x240, "gpp18", =
0x48, 0x4c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x260, "gpp19", =
0x4c, 0x50),
>  };
>
>  /* pin banks of gs101 pin-controller (PERIC1) */
>  static const struct samsung_pin_bank_data gs101_pin_peric1[] =3D {
> -       GS101_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00, 0x00),
> -       GS101_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04, 0x08),
> -       GS101_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08, 0x0c),
> -       GS101_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c, 0x10),
> -       GS101_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10, 0x18),
> -       GS101_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14, 0x1c),
> -       GS101_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18, 0x20),
> -       GS101_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c, 0x28),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0, "gpp20", 0x=
00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp21", 0=
x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x40, "gpp22", 0=
x08, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x60, "gpp23", 0=
x0c, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp24", 0=
x10, 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xa0, "gpp25", 0=
x14, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0xc0, "gpp26", 0=
x18, 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xe0, "gpp27", 0=
x1c, 0x28),
>  };
>
>  /* pin banks of gs101 pin-controller (HSI1) */
>  static const struct samsung_pin_bank_data gs101_pin_hsi1[] =3D {
> -       GS101_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00, 0x00),
> -       GS101_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0, "gph0", 0x0=
0, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x20, "gph1", 0x=
04, 0x08),
>  };
>
>  /* pin banks of gs101 pin-controller (HSI2) */
>  static const struct samsung_pin_bank_data gs101_pin_hsi2[] =3D {
> -       GS101_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00, 0x00),
> -       GS101_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04, 0x08),
> -       GS101_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0, "gph2", 0x0=
0, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x20, "gph3", 0x=
04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x40, "gph4", 0x=
08, 0x0c),
>  };
>
>  static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst =3D {
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/s=
amsung/pinctrl-exynos.h
> index c0f4639dbb0e..476346d163d8 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -187,28 +187,6 @@
>                 .name                   =3D id                           =
 \
>         }
>
> -#define GS101_PIN_BANK_EINTG(pins, reg, id, offs, fltcon_offs) \
> -       {                                                       \
> -               .type                   =3D &exynos9_bank_type_off,      =
 \
> -               .pctl_offset            =3D reg,                  \
> -               .nr_pins                =3D pins,                 \
> -               .eint_type              =3D EINT_TYPE_GPIO,       \
> -               .eint_offset            =3D offs,                 \
> -               .eint_fltcon_offset     =3D fltcon_offs,          \
> -               .name                   =3D id                    \
> -       }
> -
> -#define GS101_PIN_BANK_EINTW(pins, reg, id, offs, fltcon_offs) \
> -       {                                                               \
> -               .type                   =3D &exynos9_bank_type_alive,    =
 \
> -               .pctl_offset            =3D reg,                         =
 \
> -               .nr_pins                =3D pins,                        =
 \
> -               .eint_type              =3D EINT_TYPE_WKUP,              =
 \
> -               .eint_offset            =3D offs,                        =
 \
> -               .eint_fltcon_offset     =3D fltcon_offs,                 =
 \
> -               .name                   =3D id                           =
 \
> -       }
> -
>  #define ARTPEC_PIN_BANK_EINTG(pins, reg, id, offs)                     \
>         {                                                               \
>                 .type                   =3D &artpec_bank_type_off,       =
 \
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/=
samsung/pinctrl-samsung.h
> index 0f7b2ea98158..0209c2d28858 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -145,7 +145,7 @@ struct samsung_pin_bank_type {
>   * @eint_con_offset: ExynosAuto SoC-specific EINT control register offse=
t of bank.
>   * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset =
of bank.
>   * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset =
of bank.
> - * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register o=
ffset.
> + * @eint_fltcon_offset: Exynos9 SoC-specific EINT filter config register=
 offset.
>   * @name: name to be prefixed for each pin in this pin bank.
>   */
>  struct samsung_pin_bank_data {
> @@ -180,7 +180,7 @@ struct samsung_pin_bank_data {
>   * @eint_con_offset: ExynosAuto SoC-specific EINT register or interrupt =
offset of bank.
>   * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset =
of bank.
>   * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset =
of bank.
> - * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register o=
ffset.
> + * @eint_fltcon_offset: Exynos9 SoC-specific EINT filter config register=
 offset.
>   * @name: name to be prefixed for each pin in this pin bank.
>   * @id: id of the bank, propagated to the pin range.
>   * @pin_base: starting pin number of the bank.
> --
> 2.39.2
>
