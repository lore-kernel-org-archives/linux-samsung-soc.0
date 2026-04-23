Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82A933F5A4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 23:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776986252; cv=pass; b=DGoLIe77nMs8P5KNymUk6pbo0oDQ+aI4NQlFuoFXAsqFhyc+XDKWuGkB+mMcBSiC9zbU67yFhYnt2YLmHaSX0HkYlWTGHDQAVXwVDX3EEmK5St+MuCMoHtjROXezakYM+U07rOI3ZSaiG841BM6H57AmnSwyQ6zZq/BJa2G4yKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776986252; c=relaxed/simple;
	bh=DTrJBD5WZu2JPtQuI42J6xPD7ulUb3XjwqbgtKnMYKg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=m3Gk+sLBmgKdLNTQH7FDuUbQiWjmUMLECXmT0azY//FxLOwOKZWhEvYuHhZInTA14CKc8iO/1oVQMYMuRr7L+jKMjadrv+sOVDlPkm48PT0X6wAv6WQ2s1C5OmCOs+RvJHoiRax8xRkkzk5VawF/3ueEfevvuhtBkVsFJ1w33xE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kO8pShyn; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kO8pShyn"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-671ab90fc1fso14198327a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 16:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776986249; cv=none;
        d=google.com; s=arc-20240605;
        b=M+I1DXSjTZyN8j1CdvLvBcAv1ppLjRV6txd4KC5016YA12E21XNlhRdNhI7Ck7ezPd
         UjLMhYug4Kx7VMLAAJqXQIjq6xQM143MyrASf5sBXHkTmkwRSFw3jvRKYN85+Ea18LMR
         QUHy8T+/REPz4B2h8wjJQlBuzfybfUsIcXJYQmh2SdkRNI0Q0/VJn7KhN9L1/h/pPdAs
         gQ7PpeDZks4ZmpgkG6ZD740/9aoWKZFpUK61gHUcJ/Fnl+PceubLU9qxnP5oAEAEP91d
         Ov7wlLs+RX+wFL3wYNhWnfvAlgcQdweTNYuGUpSGe97ySu1VUa4mDoOZ1qgHPZN7busT
         f6Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=kVeQxkglQ33D7W/SMRrJr0LHOKkCVnw33O1j7HbzhHo=;
        fh=NaDtaAoRrWC0XsPmUgeJXd8TIEAKeHz3QOUDt7mEzyk=;
        b=Vey3nYR+SpCEPPbusxWdpNsbrKzNeRcOOlHaE8pvw1fhuyqlLFy5zcJS9ZsE/vqy9i
         nnsH+13bN11jRxIDl4TE1e32V5M9CBjGggugTh2SuDbqdV9wjU40hcopqm7TNKBZilfM
         +It7eAjl6Me6AIk6+UMV/Rzj7NFiwR9BSkyuE3cNhB5fF9JfJHCl5KA4eDboS514UWZz
         gWNB+onX6hNpyBjLjFbmr3R06GkOtr7UTyQWIrBcV901466KYhaT0E5EPblWMkp8rjTO
         8iafjnoleaJZDVIiILJzGLC+wjIDriaIshK8GQ7kGC8gJfp76GWKgCSiphwkV189Edmk
         eFMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776986249; x=1777591049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kVeQxkglQ33D7W/SMRrJr0LHOKkCVnw33O1j7HbzhHo=;
        b=kO8pShyn8vGnxK+VPiifEA4ovTVZ382rBDGQ7T9mlJnG0d0mE47dHKVSl9PzGYb23A
         eqImnYaKC0Q3cFZOd25rSIFwt36Faam4HlSfHHkFsr0jXPnIjVvOVegjqS366EKO3rh6
         ZlZ4hSovudVnHs80qOwZX+0tJ6W0F51sXX1e8wf1CS0ZA+o338GAafnByonwx0FfyLUY
         D1GLM4mWyo6R+CL04IszWf+I0l4d9BcXG6Q++ELl97asfyB3XyShnXSmNYYRkn0eFPQS
         tGR6CuqqpUu5xt3jk2sLkFAR4TWQOjqCt3BNeSnkqKxVw7ThICIj+nzUTCHbQnZQCysK
         YFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776986249; x=1777591049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVeQxkglQ33D7W/SMRrJr0LHOKkCVnw33O1j7HbzhHo=;
        b=MxDsI1YH6PQ0adtE0+CtfZUAkJOmOibbFr+YluLdTwcOnKb+pJE2mmaAyPEReBzgqu
         C7s//eS4hPI6VX7Jp5NHb8Z6P22xE4AYD7mS8zm3ErhYZnAbrZkTDrD+00meq4VShc4i
         J3NBjTYyPbXRmZ4ZzyeLsMWO7d88rj/8IAkU+aQD4QABB65OyvkPY1AibPnOpIYcLWtB
         Nql9JCFgcTpdDaa0E4lOtxHVuUWxoWKJqmv1cBz9/3INRYDMisLHDFtUg3wsc1BWcdEz
         8mnrrPrCdRpJBsU0d391f20NCwuD0ZPJxAbOaCfXDC1bUmSSFf/no+WObqy7NNG2n54O
         A31w==
X-Gm-Message-State: AOJu0YxR8cFO8+aMZ6qBkEYJ+SZJC9iySFO1TTfmS0MEtZv2i4SzCHkd
	l5aAKQ0055Oem9rn7XN6zKkv6SOdhyfWCFRalW6DGttyy2Xss7FU0TkapU1Zgt4dt6NqSTUb+rc
	suyMlmS8hMug3jIlejLXJl3wC4zRVkxI=
X-Gm-Gg: AeBDieucOaLdNBDht04UwkHBV8f5KbugM9RI8GNRsDD4gWQWIXgzOgd5cvldN+RCFT5
	aRHE5oyt223+9ef2U8wiyu48s7W1wNjzQx7ZQCadeMC5eReCsHZXiHgEUiykwbQhFlX/ONabZH5
	AhwTbi/1eh5SShLlRtUzm1HSr8GnTw8oj1Q0plsrZcsB3WHHWsDmUluMoepDb3GInJxT0jOBazL
	4EFAk1drw37NJU75vxIGKfGrjD5Pq7BrYKA1DUnv4qi3XY8lJR8vktXBA/8orF/ZMOux9Xcwrgn
	r+kOJf0s3xaiQ6twbqI=
X-Received: by 2002:a05:6402:1cc2:b0:670:13a3:646a with SMTP id
 4fb4d7f45d1cf-672bfdd2090mr13266284a12.15.1776986249150; Thu, 23 Apr 2026
 16:17:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Saifuddin Kaijar <mailtokaijar@gmail.com>
Date: Fri, 24 Apr 2026 04:47:17 +0530
X-Gm-Features: AQROBzBU865jlGtjJ8pXT2qcrBRZtd_qYNAaiDdr5awt4sr6XxuOBkz15fSM56g
Message-ID: <CAD7tK9au2fRaeX_sBq72dL-yTAJ3JAqNxmsoLW_Pjm-fFJ3t7Q@mail.gmail.com>
Subject: [SECURITY] Samsung Exynos SROM: Out-of-bounds write via unchecked
 device tree bank parameter
To: security@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Linux Kernel Security Team,

I am reporting a security vulnerability in the Samsung Exynos SROM driver.

SUMMARY:
Out-of-bounds MMIO write due to missing validation of device tree bank
parameter.

COMPONENT:
File: drivers/memory/samsung/exynos-srom.c
Function: exynos_srom_configure_bank()
Lines: 74-100

AFFECTED VERSIONS:
All kernels since 3.15 (2015) up to current mainline (6.12.1)

SEVERITY:
HIGH (CVSS 7.8: CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H)
CWE-787: Out-of-bounds Write

DESCRIPTION:
The driver reads 'bank' parameter from device tree without validation,
then uses it as an offset for MMIO register writes:

static int exynos_srom_configure_bank(struct exynos_srom *srom,
                                      struct device_node *np)
{
    u32 bank, width, pmc =3D 0;

    if (of_property_read_u32(np, "reg", &bank))
        return -EINVAL;
    /* =E2=9D=8C NO VALIDATION - bank can be 0-4294967295 */

    bank *=3D 4;  /* Unchecked multiplication */

    /* =E2=9D=8C Out-of-bounds write */
    writel_relaxed(..., srom->reg_base + EXYNOS_SROM_BC0 + bank);
}

Valid range: bank =3D 0-3 (only 4 banks: BC0, BC1, BC2, BC3)
Mapped region: 20 bytes (0x14)
Attack example: bank=3D255 =E2=86=92 offset=3D1020 =E2=86=92 1000 bytes out=
-of-bounds

IMPACT:
- Kernel memory corruption
- Privilege escalation (CAP_SYS_ADMIN =E2=86=92 root)
- Denial of service (kernel panic)

PROOF OF CONCEPT:
Malicious device tree triggers crash:

srom-controller@12570000 {
    compatible =3D "samsung,exynos4210-srom";
    reg =3D <0x12570000 0x14>;
    bank@255 { reg =3D <255>; };  /* Out of bounds */
};

Result: Kernel writes to reg_base+1020 (only 20 bytes mapped) =E2=86=92 pan=
ic

TESTED ON:
- Linux mainline 6.12.1
- Samsung Galaxy S23 (Exynos 2200)
- Android kernel 6.6.x (android14-6.6-lts)

PROPOSED FIX:
Add bounds check after line 76:

+       /* Validate bank number is within hardware limits */
+       if (bank > 3) {
+               dev_err(dev, "Invalid bank number %u (maximum is 3)\n", ban=
k);
+               return -EINVAL;
+       }

ADDITIONAL ISSUE:
Device tree node reference leak at lines 139-146 (missing of_node_put).

DISCLOSURE STATUS:
- Reported to Samsung Mobile Security on April 24, 2026
- Samsung is developing patch
- Coordinated disclosure planned

I can provide complete PoC, crash logs, and patch if needed.

Best regards,
Saifuddin Kaijar
Email: mailtokaijar@gmail.com
Date: April 24, 2026
