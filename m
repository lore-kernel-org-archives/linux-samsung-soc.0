Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEBB1527B9
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 14:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714488688; cv=none; b=bn5DqCIPLLx1mafjsw2XR53WdgldxU7KdsbfoIYe6jcsVaBZg/Tv2OyeZQu7U4ZXYJfL1SJ1EAYTMO3lqwfJA9nIynEwhgQSZBjQdlWbwFUEmLTzEDB1Zj9rLoWyavoUpQhjKqNQLLAMBxilzNgBMd48dYag/R34B4eVYOdt9LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714488688; c=relaxed/simple;
	bh=IpiYm2z3Xokj50Ufc53SW3z0nz6Cx5v5JZOZFPnX180=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eu/2jR0lotJqWssn54xym7++QKZAQe/uwwcq8/roR3QqIRPIveVW0tmey/E0SPgaolOXDQi38i3KocDccoSt8gZGp7gjreuYX80COjCZc00XzytYRh8ImHnrIE9FYCnFVqtSzAFAg7rDXl3EscqrUYpllidEsJ9ceW4svdBe+E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CwcxHPUq; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CwcxHPUq"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5aa22ebd048so4295348eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 07:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714488686; x=1715093486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxX+xXejTxlbPqAQPLlr4xfJbh/oiV1O0GeyGWL14sE=;
        b=CwcxHPUquV9vP189dGACro8W+1R85QOijFjoIfEwoZxrRcKEKbBmWc6f2WUdQRKk8C
         wsQzdh4vtH/WFycTW/AsdmQTYM+V3Rslwsi+6hwJGmXx5copiZLiBPwZ0r2lQTBg8iXl
         75TlIt6atTooHjJ2lE6dbo4GblZ4jOvrn6sBkoUJo1JqOfP3fDn4x5b0DgVBliH85uBz
         CYM9wU82Ak2cNX4pke85iXdXhuBgHRR0zLM3pcmpoX2zeum/zXV5y4Y5PbHN2Dz91mLa
         upI2NKQZsi/VJpFh+gnBuqWdCJf9gv/niLit8X104xdDZwKrzebNJ+/lY+MHNvcpfSL5
         djIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714488686; x=1715093486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxX+xXejTxlbPqAQPLlr4xfJbh/oiV1O0GeyGWL14sE=;
        b=v8wrPdh8x7Hd+Ezc/OlEwsGPbHE0mv5pIOlFbnCVHlnTIfC8Mg4QEbzSc2U45snbVN
         W4Em7Eeis2bKkeNtGJltcBLtf98eE5QIPm/zmJDm7jEQyaYm6tnIKHZCnv9YH7dmmf19
         /Nrvh2Ta/81zj70yuNjBW1/yiFQ+Lg3yZZOj8LqLd85/Tz3FZOfx9pqCH1xEIIKT+/Nx
         X8EiFSMWaGGeo4iXhskbD0cvuC56XRqK8D5AuvzbV0oOBHGAZl1FbPFLV5Kja/qAkWLM
         hQLPGdt9jCaeewz2FluUi6boQ2ysDrNAeyZi7L8r4pbu/LuAgjh5Gqub4ewpJq3g+Y66
         AWTg==
X-Forwarded-Encrypted: i=1; AJvYcCX7yGUnpUcIAw61zjt2fQb/Ghytemn00PN+mbKELYZcVl1JCMT2Pk5yR5w/NgI0z9q6V4BZK/woxTepywTRj6mrjdMKymtEMBgqrrPc+/+O6Hk=
X-Gm-Message-State: AOJu0Yx3444HBrkuhCbyhcuxZqxf9c7HlH+4M+dm3khX3MEr5kEXVi2A
	koglfwhlKuh4eTSpNwBrDZLpJ2H1eTc9HI33x1TGbs71vbwRVxqO3GnLF0FgLX69ZQOtcYFPD+0
	DRFqp1p+2byqIfTtKDMIyEo8/efudjP3z08OzDQ==
X-Google-Smtp-Source: AGHT+IEsLnrGreIKl2LS4gfWEBapNunJHnsl4kD1kDEZIRMUem5qTN0K1wafStnoMyjiFEuBumZvkoLkhvorgJgGjSc=
X-Received: by 2002:a05:6820:ec8:b0:5af:c4b3:7c6a with SMTP id
 en8-20020a0568200ec800b005afc4b37c6amr2598691oob.4.1714488686500; Tue, 30 Apr
 2024 07:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430143208.GA7157@samsung-a5>
In-Reply-To: <20240430143208.GA7157@samsung-a5>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 30 Apr 2024 15:51:15 +0100
Message-ID: <CADrjBPp7_GxQ9dnb=opc=OtknrU+COD+hqLWrn8i5ObM5HMSjg@mail.gmail.com>
Subject: Re: gs101 vendor kernel sources
To: Henrik Grimler <henrik@grimler.se>
Cc: andre.draszik@linaro.org, krzk@linaro.org, semen.protsenko@linaro.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henrik,

On Tue, 30 Apr 2024 at 15:34, Henrik Grimler <henrik@grimler.se> wrote:
>
> Hi Andr=C3=A9 and Peter,
>
> I am working on getting mainline linux to work on a phone with an
> Exynos 8895 SoC.  Samsung has not released any user manual for this
> SoC, so I only have the vendor kernel sources as reference.

Sounds like an interesting project :)
>
> Exynos 8895 seem to have some similarities with gs101 and Exynos 850,
> so it has been very helpful to follow your work on gs101, and Sam's
> work on e850-96.  For e850-96 it is extra helpful that the vendor
> kernel [1] is available, which is very similar to vendor kernel for my
> Exynos 8895 phone.
>
> Is there a similar vendor kernel available for gs101 that you have the
> possibility to share?

The best documentation to follow is
https://source.android.com/docs/setup/build/building-pixel-kernels.
That links to the manifest, and the manifest links to the kernel
source repo.

v5.10 kernel is what shipped in production on the phone, but there is
also v6.7 forward ported version of the drivers which have evolved
with the upstream kernel API changes.

Thanks,

Peter.
