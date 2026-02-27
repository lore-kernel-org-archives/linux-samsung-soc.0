Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965B11D5151
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772175128; cv=pass; b=Z1c+yaX7JQe6FRqhc5oJaoNsFx/KGUF1UPUywxU1XrfjxMKB3/rQR+5+TRXfmpKwFh9I33YpAMeAEYRs+2tDUlIDQ0w6I58jAvPzCOvOMg685DYAzGQzO/wg0yUiqBpZhm8ZaXH5b/FxyZEnn4PwBu6avsnvxD7U4jc1RS/qDp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772175128; c=relaxed/simple;
	bh=g9wHoPkDzs7dsMviLr9ahhhO07mSBUmi2+nWedJpil4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ho8z63pegTbKZfB5c8DbcYGQyfNDa4Ym8A18DRokE37D0BOiIWG+2zhoC7i5LChN4neI2AEvVPfaO83fYISherr6aJi8MwZOHu7lj/ViLeeGO6p5E551taNoLOnzNbYT1Gsl1LtA8k0/FNhMSFQfptugoRTDAzWJLs26NGlu2zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=di+605jT; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="di+605jT"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d4c12ff3d5so1778677a34.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 22:52:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772175125; cv=none;
        d=google.com; s=arc-20240605;
        b=g8YgQMHt5ezetXe2zli4NOlza75Ka6x6v7O99aUEuRqEkcrxG1/T1mlbtxczVR5uIY
         6Wir5/l/rRtmTP8oJfO5fL+TpqV6wQkjCmKkL5UdrFXoSFP6PVuHR6DpnLd8aVX2gmQ2
         /2QBkMIJ5NJFf+lIK4DH9tIXidybU+6jq/2J5Fd4pW8dTBDVOR4W7dfAkWCtZ/oDhNzK
         ePovkxbJsQJJJTaz3lMX+iZuOPgcTaqckZXgIFXHU7sx6PzHDWRCtqhOdVHH1fFk0QfZ
         vHeI7Q4RJ79/NXrsqMGJuX3sNUU99Pxr+beH7iWuoZK6SWUzdpTApA4nQhfmxRZkozhS
         MdfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W+hpkMHQxm9A5ILtjnEVwOWZsFYHiCVwtuiqtCxtlTQ=;
        fh=ykriJNwXhoT7I6cfBGc60ftda4++Y+9SkCrogcHgjhY=;
        b=TB17d1vJWa68+7gSBDl4U0UT0hHDjmiNbLMXE4JM23ymusJlmtrmD4knXx/3qXtxlr
         GONfLZhwanY+3fyWcT+A3AV4INvBGevCA5mdIsq/a9jBt8wOzndloozErxodcLdJEzrp
         rY+fvHHnXtDsg+1dXBMy8Eb0gDO9qHHUIuzkCS08sFKwidNuPDtIyho8XH/2dyQL5fjt
         chX2SOVePu7pecwZm+IPNJmlzcQWvVzIetIbuyhj//bF5NnXGaSHmuZN8lyk5a0eHfYd
         wceCvJAiI52Ses7QvR0m5U12oD0/IgMnzPClnQDR8Ud2O5oges6+/wXWDL1ymI9x54wV
         H11A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772175125; x=1772779925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+hpkMHQxm9A5ILtjnEVwOWZsFYHiCVwtuiqtCxtlTQ=;
        b=di+605jTT5XFpMfGTWj5xroP0Prd6GqMdnGS1F7yEqPXRUT+0/8Bqo6j0ig1t0UwO2
         mEUk+mvz538w/bsX7urJ3LOF+K+eKAnKbBjEcfftUipA2yRsPo9lUiV8hvY4XFoIhRY5
         N0YE9VE1ehfamKwFhHEngHgwP5xSLn7lXXwLhb+lkou68qx4XOfX92D4EO1GWkIDFAQY
         ioDZhVauUR7rhI05ev8gsnRfMA8p/yiN8hx2ORU5s/uDcKubHaKDnDv6aKaSL5G2T94E
         Cp6kY+hQGqBoezBRGREmCrgHtjm0INPaeGBMAzQR3C4d/P/E4hjVF3Io33AxbZryosHM
         uDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772175125; x=1772779925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W+hpkMHQxm9A5ILtjnEVwOWZsFYHiCVwtuiqtCxtlTQ=;
        b=rDHvQa7txc8V9uJJRMJ9lOIy4PPSMCiz9At0EUAnQSC8kQp7CoufyJvr4rHzp7UAkw
         V9828Vk8X420bwZzEA1ngzE8FBwlm2eMIOuk0+Ciam0CkZVuXcg90YoJ+gKxFr6s4wPb
         RDhi3U0QgWVJEfUL/y8mEVnaAAt3MO85K6eWLCBdBDppWN+GJ2LX0G6sJE9M6D2no8tT
         f28sU8yGgTEQqDX+rxkhIwerR3fWACkitAbgWCp9gaZyW47N/mInxm5LqllfpJbwjujD
         gXy+uCt0iYqtKB7THEyjTPPgp4KRiq9NUPBnkvrG/k5ZLiCjK+4Zl0rAu7QuT0pJj+c/
         SMQg==
X-Forwarded-Encrypted: i=1; AJvYcCU+2M9bSLFh3brbwSEMRbbY1ARWa4QTFKTOp7pDtcS+61UYcyVWKdpxjVt9ceB8vIx0iE5ftcugvOsBVWurdyLoYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDF3HeqiqlU/WUfDx0oUXTfi1ypUK5QH5E0xCaz/HmRzzklSG1
	TNSIKcpinf+uKzy2Iq6PLEtY4hwQTD3BIzF4ynUf9G9d5Nzja7TSLrQU/f2KTEewdFEIu37zkzg
	vzrT92QAiKvNjzf7FJWU/5bvJOaeU3kZwkGNOwNtu
X-Gm-Gg: ATEYQzymxFby1zG80muMoWKUUnAkEohDZ54CX2ajoJIpXZ4pp6sfkXuSMYJHVilV/NH
	QN4ycNf2Ehq/26qNzyFI38Jx2h/JB9EiAU8dZTuQa0q1zijR+LYZlYrnXuHpexiOPl4s0b61hHK
	rWhS1de4XjII0BKi1s6njDfP926C2hLGNLP5/HnAvJ5gHyMNW6OgaFSP1ekCph5OPbfmX3noXKy
	ApRgWoOjiOegWi3IWL/6LQucUBTMClRQM1UX9BXg+QtV16l4OCjYDd+TlvX0WtjK/Pvd84Jjs+Z
	J9RS8elLHRI+0RB54HRGoPfB0sZW/PB147Fw8PDZNHL798mFjDs=
X-Received: by 2002:a05:6830:83bc:b0:7cf:d18e:706e with SMTP id
 46e09a7af769-7d591b237bemr1327887a34.5.1772175125157; Thu, 26 Feb 2026
 22:52:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226061053.2596167-1-badhri@google.com> <8eeadb7a-5075-4444-8714-45e589dda47f@kernel.org>
 <0c91fa84-dd0e-45bf-9c08-3b374daed7ba@kernel.org>
In-Reply-To: <0c91fa84-dd0e-45bf-9c08-3b374daed7ba@kernel.org>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Thu, 26 Feb 2026 22:51:28 -0800
X-Gm-Features: AaiRm50NTve-AmaddguPfEtEJC8GabDksFfWp4neLtEZ19nDLqFIv74vF5-ygN0
Message-ID: <CAPTae5KuLGcK1TE2HcJHT9X_fXef=JSyoCSf4TF41_oTc2Lpuw@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: exynos: gs101: Enable AVS APDO
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Amit Sunil Dhamne <amitsd@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 10:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 26/02/2026 07:51, Krzysztof Kozlowski wrote:
> > On 26/02/2026 07:10, Badhri Jagan Sridharan wrote:
> >> Enable USB PD SPR AVS for gs101 by adding SPR AVS APDO to the sink cap=
s
> >> pusblished by gs101.
> >>
> >> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> >> ---
> >> Depends-on:https://lore.kernel.org/lkml/20260226055311.2591357-1-badhr=
i@google.com/
> >
> > Really, how? If it depends on that, it is wrong and cannot be applied.
> > DTS cannot depend on the hardware. NAK.
>
> s/hardware/drivers/ obviously...
>
> >
> >>
> >>  arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi=
 b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> >> index 93892adaa679..5a689be61432 100644
> >> --- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> >> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> >> @@ -174,6 +174,7 @@ connector {
> >>                                              | PDO_FIXED_HIGHER_CAP
> >>                                              | PDO_FIXED_DUAL_ROLE))
> >>                                   PDO_FIXED(9000, 2200, 0)
> >> +                                 PDO_SPR_AVS_SNK_APDO(3000, 3000)
> >>                                   PDO_PPS_APDO(5000, 11000, 3000)>;
> >>                      sink-vdos =3D <VDO_IDH(1, 1, IDH_PTYPE_PERIPH, 0,
> >>                                           IDH_PTYPE_DFP_HOST, 2, 0x18d=
1)
> >>
> >> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> >> prerequisite-patch-id: 4dacd8bc550e317d67134d030814765fb9f4c6e1
> >> prerequisite-patch-id: e863378fc602b6bee2e9fdd8c568003c00b2a38e
> >> prerequisite-patch-id: 202a9e1e9cf27a0b9ff7ebea76eb45cdac2cb581
> >> prerequisite-patch-id: f3817c560d0e701d7499fa1fb9ee40d22816c09e
> >> prerequisite-patch-id: c071913307a6eaa417d1345485d7a9c165d40834
> >
> > 5 patches here. This is confusing.

Apologies for the confusion Krzysztof. This DTS change depends only on
the binding defined in the topic:
https://lore.kernel.org/lkml/20260226055311.2591357-1-badhri@google.com/).
I will drop the  prerequisite-patch-id and will add the following in
V2 where just the binding from topic is marked depends-on by this
patch. i.e.

Depends-on: https://lore.kernel.org/lkml/20260226055311.2591357-2-badhri@go=
ogle.com/

>
> Best regards,
> Krzysztof
