Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A51186294
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762988795; cv=none; b=X4VfGEEGJPg+6a1exJ98mnsOWQovJvXf7UI6UGXjdbFXMkzzPFi4bi69sUSBO5HtwMEYcPoXxPnlPNyfzwB23vnWS7Psl0pduds854mlYCOQ3fWgVD61+MI8x1PDw0XYDDLswjJlp4xMX7q0JCyGEKnRulNpFpwMBXe+XpgOpX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762988795; c=relaxed/simple;
	bh=jLqbM9k8ArjgL5GAa5XSpECKRQbkdoOMKW+pss+mW5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHNPGloqf+GGe6K2IL/+O0l5w8CPggIhgPzIYqfEBugs36M4FQHutWE2ykWf3z/GiKV4sguxdpUEzuZU/YyldRlb97n030swSCymJ1QXddjXLH8zpzi8rbfKKhm1Q0KMDP+h8csyO9og3I4YAVnrkRRtG+zLSOu4Z2hls5k1roM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WvJiDT2D; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WvJiDT2D"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-63f9beb27b9so192886d50.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 15:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762988792; x=1763593592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mX+OBtF2Nk0OHT4HzKQWVcVMA7PkNyGU78B40Ux1xkY=;
        b=WvJiDT2D4aEeJ8An6wxHiXpfL8Wtx7NgtKwkrQxR6q1H0AX0mjDP0GXUwZTz93JonA
         zOSCVl7eZq7sdX0Mfsc96M3g2Ot8mAeO0PeLEBo3zrnmT5eGlYxhKCkRzy09Kw4O/fek
         GFvelTojqMAU+H8yuN5DrGueHddUXFpPHuWOEtpfnCgDTbFSF1V1ZXWuFkdDcko4VxEO
         D3admZ8v2NV5tMgGtoJb7ScXxsoxCNrUtE8+ShTVOItvkbZq+QVnnU4KsUuwl8scR+l1
         LPkGc3n9FVrPOiytazluw9Im4F4sZ+HQ9qThGPxtVP4hgcrxDeA7tparBIeO36TslBR/
         4B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762988792; x=1763593592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mX+OBtF2Nk0OHT4HzKQWVcVMA7PkNyGU78B40Ux1xkY=;
        b=LJi9uS7E/IYMMZL0EZL1GWOAxb+GKQo8JeSzMYrGHN+ydYMPFzl56FI+jM/Mep7Xk5
         rJRxRujkhlfH7eIoh5zjokfeIquTVYeoHcHwsMxwiu7Nj6VjtbI6Cnbf1j1/O+80r6hl
         9VLTjb5Jm5RG7IWMxWOU+yohA+0V3sIgJIz5wswLBhafUd5gJ2VpiZRqkOAdXXNdwFt5
         gJPtx/QcYhQ3k/t5nJLeYtpbDrGT4z1zkPB4FPGCoCpI9p408uCQmvY/J4YTD3KFJj8j
         zwdg/bOplE26Gna31D2WWjkg+TFuzV2j5czurFhZP6ah2YOdpbzcbcKgkOmpOl05MQON
         CrIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1I2aSXGMUMaEosvKUS57dVauSdV/F7iJyGALSEliHZbN7/lQEcGjx5ycieuxLpnf/Tvdtb7gKtP24WTJUcnNz5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHKgZXPpBiBl8zk+v+Vz83tt44jORDW+OcsBRzCuwIYeA1jpPa
	8k4IDPC5UyMGwYPMiCvf4d6VA1MUEH4m1sumw51PgsRIDc3xGBqMyfOn8dFqEsyoU39KnXuDB98
	x/C/zgCTZjEsjhkn0IINNp6wdLHI1pV1SWVNw5Whhlg==
X-Gm-Gg: ASbGnctTsv/+/E8qjgnOZnAk4dBPDQfGU/8hwiK7Xe/laGq151po1I+mxgv9Cy8HGfu
	UDtKK0v6dUTIDFt4z4pgwjS4lZ6NM34KGDYIcPIPuP8tVrILS5DannNhZYYNz2G/0QggCU9GlW5
	+Rou2ATBsIO6o+eKcL9kay/ekMUSlSshMcKxqCl11/3rJ6zs6oLfyjxFiq1ycyrCMaTLQuis0hZ
	mfmdp+HMZ0aClyhYiu9nFbwZ4IIssEITd2oiamlURXc7NYgZSOJbpkHMrqrKHwT76Ubdma/DKas
	RNjcv4vlLQEsfYi8dsC+fe25JaSBoQ==
X-Google-Smtp-Source: AGHT+IFnfwNI6C3qIlER1aJ7gLd6z/gdoBFMPKwpDYVJaG9fei34NxDw19rlWjOHg95OoqkcNMIzwhskB/hqXPBQujM=
X-Received: by 2002:a05:690e:418b:b0:63f:b66b:3456 with SMTP id
 956f58d0204a3-64101b0707emr3801544d50.33.1762988791965; Wed, 12 Nov 2025
 15:06:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251110082128epcas2p410405ffa61706c79f0bc2abe56393ba7@epcas2p4.samsung.com>
 <20251110082649.3109858-1-youngmin.nam@samsung.com>
In-Reply-To: <20251110082649.3109858-1-youngmin.nam@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 12 Nov 2025 17:06:20 -0600
X-Gm-Features: AWmQ_blNAler-SH4AsQMJzDlIctwXOTeLcuDbteiLIPcCA2tm6cN-80UC_gZ_10
Message-ID: <CAPLW+4mo0n3C=_akxH=PKvdaQFn1pSCK-DhPsm8aWkvSuvJgTQ@mail.gmail.com>
Subject: Re: [RFT PATCH v1 0/5] pinctrl: samsung: exynos9 cleanups and fixes
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, peter.griffin@linaro.org, ryu.real@samsung.com, 
	d7271.choe@samsung.com, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Youngmin,

On Mon, Nov 10, 2025 at 2:21=E2=80=AFAM Youngmin Nam <youngmin.nam@samsung.=
com> wrote:
>
> This series tidies Exynos9-style pinctrl.
> Unify macros, fix a few TRM mismatches, and clarify naming.
>
> Several SoCs carried near-duplicate pin bank macro families, making table=
s
> verbose and hard to share when only the bank type (alive/off) differs.
>
> GS101 had its own helpers even though the newer EXYNOS9_* helpers cover t=
he
> same semantics, including per-bank filter control (FLTCON) offsets.
>
> Some pin-bank tables didn=E2=80=99t match the SoC TRMs (bank type, EINT c=
lass, or
> bank names), and FLTCON wasn=E2=80=99t always at a contiguous offset from=
 EINT.
>
> This series does
> - Consolidate on EXYNOS9_* pin-bank macros. Pass bank_type explicitly.
> - Fix table errors on Exynos2200/7885/8890/8895 per TRM.
> - Add explicit per-bank FLTCON offsets and update affected tables.
> - Drop GS101-specific macros in favor of EXYNOS9_*.
> - Rename gs101_pinctrl_{suspend,resume} -> exynos9_pinctrl_{suspend,resum=
e}.
>

Thank you for looking into this! I think this unification is very much
needed. It reduces code duplication, and as I understand reflects
correctly the fact that all modern ARM64 Exynos chips currently
supported in Linux share pretty much the same GPIO/pinctrl IP-core,
with a similar registers layout.

> I tested on Exynos850 through boot and verified the pin values as follows=
:
>
> $:/sys/kernel/debug/pinctrl/139b0000.pinctrl-samsung-pinctrl# cat pins
> registered pins: 42
> pin 0 (gpg0-0) 0:gpg0  CON(0x0) DAT(0x0) PUD(0x1) DRV(0x2) CON_PDN(0x2) P=
UD_PDN(0x1)
> pin 1 (gpg0-1) 1:gpg0  CON(0x0) DAT(0x0) PUD(0x1) DRV(0x2) CON_PDN(0x2) P=
UD_PDN(0x1)
> ...
>

Yes, I verified it on the E850-96 board too. Checked the pin muxes and
GPIO lines, everything works fine with your series applied. Feel free
to add, for the whole series:

Tested-by: Sam Protsenko <semen.protsenko@linaro.org>

I'll try to also review all the patches in the series shortly.

> Additional testing on the affected Exynos9-era platforms would be appreci=
ated.
>

I'd add that this series was based on the pinctrl/samsung tree [1], to
make it easier for people to apply and test this series.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git

> Youngmin Nam (5):
>   pinctrl: samsung: Consolidate pin-bank macros under EXYNOS9_* and pass
>     bank_type explicitly
>   pinctrl: samsung: fix incorrect pin-bank entries on
>     Exynos2200/7885/8890/8895
>   pinctrl: samsung: add per-bank FLTCON offset to EXYNOS9_PIN_BANK_* and
>     fix tables
>   pinctrl: samsung: exynos: fold GS101 pin-bank macros into EXYNOS9_*
>   pinctrl: samsung: rename gs101_pinctrl_* to exynos9_pinctrl_*
>
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 1069 ++++++++---------
>  drivers/pinctrl/samsung/pinctrl-exynos.c      |    4 +-
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |   93 +-
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |    4 +-
>  4 files changed, 560 insertions(+), 610 deletions(-)
>
> --
> 2.39.2
>
