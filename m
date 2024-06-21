Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F5916E868
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2024 22:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719010563; cv=none; b=GQphVmE22vKEzf1Miu2/36TkVMHSO6qFJHtpP+Of7ATFzbPMxrTkNOG1kNE/GrgB9LVtIMCZTrxCMNlpB+/IvnqihEDAyTdhEYBINuLFBITO77JBCSIiy2RjHcOD4iorLS+yfmj0S+ljVwXlAFB0n5/JDAmHPTmYNXJLceFZHKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719010563; c=relaxed/simple;
	bh=/fGMQstslMAQ1sAwKBQnY3piKVTdf0FZ+sfr3d5+kQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=llvAb+X2fm5XPAkuz9sMpYHdH3qZxredb0jPlqwv9wnqgXIWjBA7cVb/ai+b7cJIwq/6ytYP9UJRo8aUnLXLNmDCgJmPoS8OrLCTfxFykMNLyy7Z5bF8nyNtJL2X0Jno3ZCL9AVO53Y8Sm+G52mOYBv8yo9r/jtQJF5Mv1fUBJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qffyzywr; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qffyzywr"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-63bdb089ffdso21720727b3.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2024 15:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719010559; x=1719615359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fGMQstslMAQ1sAwKBQnY3piKVTdf0FZ+sfr3d5+kQU=;
        b=QffyzywrIMiiOUDrInGm2s+cz3kMzPYkPPwCFB3j5KIOPr355fiTeqBYglaNXBe054
         kCKazQ5sK0diOLVl19gQcT7DWvlNfZAoPYqYtF3KWCYarWFh7qPu/1w7D6RED2aVQVw6
         /5FBs/KRahanQgxXCbMs1L+Xe8cvCYNl/hVQX9XCQT+qUY96wZMe4CDwce54IZCI/c7Y
         J0Op/PEeumJUez43jQjjkOZBNQlDFtM+rqLnVUgEq1WZovuULnjt74yEK8oZqSDI9s51
         ZWEGUfNCgPwD1v1By3ODqSe4Bm6NBA9Af9DAhECATRlAWH+nbIEG9hC8PlSCEXVnPKbv
         C1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719010559; x=1719615359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fGMQstslMAQ1sAwKBQnY3piKVTdf0FZ+sfr3d5+kQU=;
        b=qdE4XPL3GAByg8yq93LWXOQzGVF9kFA8So2UJ8K9WZfgRdscF+DWv58bpzNn5k3UqY
         +fiDv1VxxnmtSbyZHm0JA+0VkwYfSFQnWVCZQusTK7QFFwbngXJLMhGEitP2Eiu7iLFe
         p6M0uZs9mM0bBfbgmfjy7J/Pd/mVbWU1rS2J/QcYj4h0+H9ajHKut/WYgh8anp+98nGW
         A8TXtA9xk6zMxhknkf73D9cQ5VjlmuU4JQqURw+vSgZbuAEylMi8xFH3UlJsBpx5f2Q+
         TVLeMKeZ7qaUCJU5/mk/zWu1/ZrcOMd6y0g9z191XH9PsF1WK+/oOWLeWjt5fMmX3kJd
         rBpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4E+1U4m+Y6dsbg3HutDIF5+DN/60/o8tjOPv5Q0D19v9aoG5tfB6JT52dDAmCKgLZjRYU+4d7nDIBXqZiPI4ADmS9Dxto58EV9bFGXGm+E5c=
X-Gm-Message-State: AOJu0Yyt5/V9gKc+PEnNcM0SqgF/8CjGWUt3cWSHin/98tfYaPK7VPNp
	B4cl98EIZ40yDv0R0uIUT6vM8n8h6LdDJz5NfvS9VOVrpXaRGd/9StrC50Eb24DQQhYaAMhxPec
	XEmoAeKJdWXIDibIrEunqx1H0loLBf3jqyuQQgA==
X-Google-Smtp-Source: AGHT+IEADyU6jrow5QVvxIIaLO6aTLEpPe+v44mG82CDywhDOOxA21g7uo+yUCib/NcuqiEIGJo5wYXwLqozIVXQNcg=
X-Received: by 2002:a81:be12:0:b0:62f:23c3:1b68 with SMTP id
 00721157ae682-63a8f9fb0b9mr92774257b3.48.1719010559268; Fri, 21 Jun 2024
 15:55:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240621221113eucas1p25c2fbadceef48913c4a7b164e6d14890@eucas1p2.samsung.com>
 <CAPLW+4njmKxXSMqNazX6t6LS=fHNh6Pi8_icF1=aPw27G0J3PQ@mail.gmail.com> <oypijdcyoarlou.fsf%l.stelmach@samsung.com>
In-Reply-To: <oypijdcyoarlou.fsf%l.stelmach@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 21 Jun 2024 17:55:48 -0500
Message-ID: <CAPLW+4nQa_hnqg=UxgZ7EZ1z26HX+Y0Y-fV8rtHb4Sb7NQ47CQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] hwrng: exynos: Add SMC based TRNG operation
To: Lukasz Stelmach <l.stelmach@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Anand Moon <linux.amoon@gmail.com>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 5:11=E2=80=AFPM Lukasz Stelmach <l.stelmach@samsung=
.com> wrote:

[snip]

> >> This is good, thank you for adding it. It can be even better though, i=
f
> >> you don't skimp on message length (-; I mean, I know what BL is, I can
> >> fingure what LDFW is because you have explained to me and I can see th=
e
> >> source code, but somewone who sees it for the first time will be only
> >> slightly less surprised than with v2 error message only. Come on, you
> >> can make this message twice as long and it will still fit in 80 charac=
ters (-;
> >>
> >
> > Guess my OCD got in the way and I just didn't want to break the line
> > :) But yeah, LDFW =3D Loadable Firmware, and BL =3D bootloader. There i=
s
> > an "ldfw" partition on eMMC, and I noticed Samsung usually uses LDFW
> > term, so I figured it was not a big deal to throw that abbreviation at
> > the user. But I totally agree on BL part, it might be confusing. I
> > don't have any strong opinion on this one. If you are going to apply
> > v3, can I kindly ask you to change that message the way you want it to
> > be?
>
> I guess Olivia or Herbert will be applying it. Let me try=E2=80=A6 How ab=
out:
>
> "Check if your bootloader loads the firmware (SMC) part of the driver."
>

Much better. Thanks, Lukasz!

> >> Don't change it if v3 is the last. If not, please, make it more verbos=
e.
> >>
