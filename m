Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A047F56456
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Feb 2024 23:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708556884; cv=none; b=uce1rTC30+IUJ5g4iz9I87BlrMIIq/V5Dy1NL9Dz7umwX8QleijQnpHZySAH6KSCsHnGkZM8GqGhDRI0BPw5n5cpthY/sewDSJoB/erw76r32brr9WkYgbGt9R0LVHanhG42CH4J+I2vC5rkGy+Zk+q6BPm4wP6k6e5YwjxzXJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708556884; c=relaxed/simple;
	bh=lVVt4cd6uaVryAH57NfvJaB+/vJBBdplCM95n6hzzPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXD7gCSh8oaRu4cBcLdYVSbS+Hn8JjD7bwexL/lsnitub/ntLf43dY0HG8xy2xqAGHKJvdyJqJCVG0+DVGZ3VkNmt66B/mugo6wjsj7qFmH34Eb5cp0DLK2bXvGpDW6/uQMa7bEHZ6ozG5FWWwCGCd33NB7b+3Qp/s+TsHtXJ1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LJ907JAM; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LJ907JAM"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso7109272276.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Feb 2024 15:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708556881; x=1709161681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYBbmRXDC5OSdjJgBE1Q6+6CYsK20VTrcWQxbaA18DI=;
        b=LJ907JAM0KZ3rh+wX/0fGafmuf+VI8G8mlYpSpCEbJ3D73rwPzzznxccPb6Q3Efh/p
         4Gh9RK/mWNrHsUzncuC+Rbr7HlRc95FVleY6x1+9Cwt/e6wRD13xxLQbv/Ke/I5Z5+Wd
         tLg7ruRbFD9qaom30VkhQ0LcINRX+sfrGJjIGju7BAemEoOU7xOOrcV0+JRsjEHl7Wcd
         OJzYqY6oOZl3jOmPdHIw82a70AkyzMYufmpbkeJcJO/F12KThYvKCoBO1HBLRu+LqUnV
         i4H5Yr2V9GX8XCeRJStmk7Sg5GMzxdXtlVOUWZeovAOpZ/FR3RQJi3BaMAarqAokWni8
         rQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708556881; x=1709161681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYBbmRXDC5OSdjJgBE1Q6+6CYsK20VTrcWQxbaA18DI=;
        b=bbsuDvTcuozpt8FnP1Yg/sWxcvhQlEsM3L6F05MTw6yqr0b5H/BQA4as+M4iyJOEFX
         5j95QmKAJtRES0LIfgwIBj1Jpm/hzVf34MSzdwpEt65JcDStu3LKFUWtuJDKxZQd6uI8
         fFILD/DIPuMkRjZlEI/BXiQ6gFySP/pQMpQvmlTSU8JjNXsPMmTnA3bVgP5GNOXNz8v1
         5k8eAClOU95a4JbcBtJkmARmWAU2Nd8BWM4fvDdn8G5RZ3bkKRQexTlCOhNjnYrMwwmO
         keeItVsPwc+dIa2M1DfzvNhj7ZnkpADkzqKY/bI0bJg6Z13DNZi/XcZXOV9dUMFIIv64
         7SOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm5vVQ8vL3v195VfEUpeChDcjR2R94Bh5Fg5wn0l+fW3W4FOgm23FCyiRQOOksUNdTfGvM0HGYKhfT8mq7T85+9l/MXR7++JlIi+EZdmDd5v0=
X-Gm-Message-State: AOJu0YyVIZLRfWiJ2vhefcgLdEwpcLmGrXe4r4tRLIZfaEnXPAR/dqGT
	K0L2oYXqFK7DQe/Fnlp9wc5FKFxRvRmvgC9m0tVTrwes1zW+XCuV1hDbuTBnB+59EfDFTLZLVcL
	U+d0wlW11qLGOpEADeAyp8/sXohENoIGuGmwvfQ==
X-Google-Smtp-Source: AGHT+IELSuez3wnkWzi8gUjXrk1ECFLfUvg+ZkAvG67cVdS+sTX65l5nPJGAnEdTxvcHLOGMpEqSWoalBsmdwXNDC2c=
X-Received: by 2002:a5b:f06:0:b0:dc6:8534:bb06 with SMTP id
 x6-20020a5b0f06000000b00dc68534bb06mr807288ybr.17.1708556881671; Wed, 21 Feb
 2024 15:08:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216223245.12273-1-semen.protsenko@linaro.org> <29090d97-9118-4765-a4fd-3bbe271a39bd@linaro.org>
In-Reply-To: <29090d97-9118-4765-a4fd-3bbe271a39bd@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 21 Feb 2024 17:07:50 -0600
Message-ID: <CAPLW+4kmoCoqO=+zXbVw7VsGc-VB2At91ZnJfyTDRtVFmN4aiQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] clk: samsung: Add CPU clocks for Exynos850
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 5:07=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 16/02/2024 23:32, Sam Protsenko wrote:
> > The series implements CPU clock support for Exynos850, adds CPU CMUs to
> > the clock driver and enables those in dts. This is the first step
> > towards cpufreq implementation.
> >
> > The breakup by patch:
> >
> >   * Patch 01: Add bindings
> >   * Patches 02..12: Prepare clk-cpu.c for Exynos850 support
> >   * Patch 13: Add Exynos850 support
> >   * Patch 14: Init PLLs to be in manual mode
> >   * Patch 15: Add CPU CMUs in Exynos850 clock driver
> >   * Patch 16: Add CPU CMUs and clocks in Exynos850 dtsi
>
> This crossed the threshold for a patch bomb, which is in general fine
> for me, but then please put v2 changelog in each patch's changelog. If
> the patch did not change, annotate it as well. It's not possible to keep
> jumping between cover letter and individual patches.
>

The above list is not a change log, I just tried to show that patches
02..12 are cleanups. I'll reword this in v2 to make it less confusing.
And as usual I'll keep the changelog for each patch separately. Thanks
for the review!

> Best regards,
> Krzysztof
>
