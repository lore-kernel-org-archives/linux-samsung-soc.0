Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C356A39903E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817387; cv=pass; b=LNq6lVEYdYXWM5ejJdWTD1fF83lBgfiIWxmYD4qQi47KyPKbpF7zXf1iCdIa0X099v4dHP2IZ85kxcDLP0ArZC06E3Jfmxvqlx4F+hfeP76cn23yzXDMGjIP3khOE2/jJ1RM9n3ti3McJphfnFxVPOTBR6xw9sH72AMo6jF7KIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817387; c=relaxed/simple;
	bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r2yPV5NbcTzIzrXM3QZkOtN8KJj2j8YmpKiImqMyD1RaYiQvw/ch/ggXFH7JE+qr4ry3k68fkcBKKP60arVDRcsJsq43uX1aZmOWOs2TesZQ8q5P6JS7ZFdVVRy2pJoiMXP29VNttPFBpPjUjgal1aenD4ghT1y7OiNKnsiWt/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FI8Mm/CC; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FI8Mm/CC"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6983f8b0aebso721369a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 04:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782817384; cv=none;
        d=google.com; s=arc-20260327;
        b=myQ0BqDpudsMkgAZ0aHJCmsGtFHnAisk/AfPpUKwBih/gKXs9y1vxJLB8IwBiPG2io
         8JGGKm6pzIGNi/udfZCUfsWLNbAKFUHvup/FemrnYXyUuJAzt8DyW3DegLf0y/pFjcc1
         RPsKWCU54bWeYbICtrlRONOdvF+3XVmKQi9WGgZTXlZTilZ2jV9HY2g87EmtuzvVF8aq
         4s4CUncaHDV1ortER8BApwu867GNHlZORWQRkJvNKcccv1M+MaJqFX7qLrSX0l4z+5td
         lWGXEjcH4oQYYwOGBwjOqdqA2YNgKYmApKz1B3GQGUgoJTYSmlxgok/23/I61QK0OW7N
         0Y1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=;
        fh=b/HT3n/xf8PpmQ7TznfE5BR3Wu0Di4hlV8QD0xBaE4k=;
        b=AL+RMncqeX5fzNbcX62RzUVazy71zbdoELF51FyhiXNkTtULFZyeuqDDmip7XCye66
         busHnUP7ckcisxR14OtdDLbCXutnzQi7Rcyy5Emdt0osql7FzAC65BbIz+XYsUJbkvII
         Dodtuq5KDEzEjn6+D1zlfx3dof4ADa2yyQBnzyRrzm1t/RXK7uDy7tuDIdFoG+gIzQGo
         u0kzni/ORU436M1QMhmj324ViGxcF1IsGKFxxPz//N4OCYLWkZ0HTvoGOmy1+/fVJ9ND
         bHQgg7ZjRllb7DClwZc2G2YiFYRp93oB5qEKibhXSyhwiCy7+wiwouEpYe9ob61a9mXo
         Tlew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782817384; x=1783422184; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=;
        b=FI8Mm/CCqhCN5gcgXwiyaPrReLZg2XBTJl4ZBvTdsTX7PhNxJs00V6wYnKXAYxxWnX
         FX4gLOzWpeTqYp7exZk0PkPyvxeGbAwHEGHunoHT3vDYpu2UscNwjV3mt1ws22WwkNmX
         2pLmtNtVTJilFBX3JGGI6dtJgSCid7bPHoll31MGB1Z2ZilMfFxMtV5OQs4AthXUnjVp
         evxDZVYjI1bxzDvCov5PVDzdOhWEFqmcC7z/knhMJZF5SNBiMLA+7LcrMiENw5+G5iTj
         ly6aob1L79tjfy/fd8mgxTgbU4+4mpktN1sU+74tivnd1xbZeXy/wiHdRbHneJ39SUPs
         2UbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817384; x=1783422184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=;
        b=nr8GTNhcr13BriDJ06oWa5XJIEIRS3xD/Uy1FxANGs3npHlvCZgR/6V+l/6E+Pym+o
         KorWASO7inbsyvNZXHwQINIGcfU5sR8siM/snvIa1FLS4kjTvUvd/w+6ncfOLQSoEDlM
         bk5A6USrZojbOeHIYiAx8dEZW28IDamPEBvF6zbhYBTPf7YA0gXySk3+nQyt9Pwz5ze+
         l2JecOjPeni2L1zn7AzPrkZpyZ0s26UypYkdZyq1quj0/yK70tT+F0bG/G7Y5IptYWtw
         Q/npvzTGurUAFp2ntfcUxBdmDavQi0RUgn7AhcFNgijEeuqEtFRsnB9CKu0r6Ltn/tDp
         +BUg==
X-Forwarded-Encrypted: i=1; AHgh+RqxyzIEKUhJppnpIcalSrUidv6BABmx+J0f8vdM79ToCPDFgq5Wm/pFSU279l0iJPyOSUMowbrzjMIDvXwDMKTDtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrQ3JANB+zfNMkRNrVYrv3l0uI/wxzzbWp5KmjRqPXuDNMhU5n
	o0qFToDv/YX/13LxpKOwrGgUVuFYIB8BJw5FpTe5F0UspWV1MS4BwwkSiJ0a2tpJ9oDQ+ex7krF
	8+FT3CvzCc5yEKa2zVdzN/9z7mJQ1HgA6HZIvPiCA1A==
X-Gm-Gg: AfdE7cmTMwsCN98v77+Bx/gBZKfIRwZ7F5mAoKLkSu+5IsXPlP8s+ZzsNeo3Y2kjpJx
	ynUp6bUypMeqfbMpdrHbXbiEFp6g+bwzaUuwQr916X3b9nKOiSV74lo/nD3NxSfZj7mqocg0BTz
	okzs5oiW1Dj2j7LRoA+heC87+VEGWHngqmYoWtP/vprKz5/r+I+uWzF9jDdmdBDB92szr/D9hi2
	sisX/cLHlynyQLYxEjrnz2YVB7Y1f6tWZDAxB9gLlS7HptUk0bmmdf9jpwiLN5u6W2J6FnX0kXp
	827U2HvBl8OdVu53Iv3bHUUc3KoKpQ==
X-Received: by 2002:a05:6402:2695:b0:697:fbe7:2028 with SMTP id
 4fb4d7f45d1cf-698819d524fmr695334a12.13.1782817384224; Tue, 30 Jun 2026
 04:03:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
 <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
 <CGME20260629123246epcas5p2aab9da9ef417274bb0b70f74c386f7b4@epcas5p2.samsung.com>
 <CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com> <0f1e01dd0844$01190c40$034b24c0$@samsung.com>
In-Reply-To: <0f1e01dd0844$01190c40$034b24c0$@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 30 Jun 2026 12:02:52 +0100
X-Gm-Features: AVVi8CcnyhJ8d9gnBSRZyCKu3M5tPQ4ftaBlF7F7oCbmkRZx4xm5fGDGZptwHa0
Message-ID: <CADrjBPoZ4G09WGC_b59YWq3_EfTaPFyp0dD7VizKLYBW_eFk+A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock parents
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alim,

On Tue, 30 Jun 2026 at 04:53, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Peter Griffin <peter.griffin@linaro.org>
> > Sent: Monday, June 29, 2026 6:02 PM
> > To: Denzeel Oliva <wachiturroxd150@gmail.com>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> > <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>;
> > Alim Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> > <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Brian
> > Masney <bmasney@redhat.com>; Rob Herring <robh@kernel.org>; Conor
> > Dooley <conor+dt@kernel.org>; linux-samsung-soc@vger.kernel.org; linux-
> > clk@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
> > parents
> >
> > Hi Krysztof & Denzeel,
> >
> > On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com>
> > wrote:
> > >
> > > Correct eight PERIS gate clock parents to match the hardware clock
> > > tree and reorder the GIC mux parents so mout_peris_bus_user is the
> > > default source.
> > >
> > > Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> > > ---
> >
> > Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> >
> > @Krysztof: I was thinking, maybe we should establish a new rule/best
> > practice for Samsung clock upstream submissions whereby patch
> > contributors should link to the downstream cal-if code for the SoC after the --
> > - line. That would make reviewing the patches' correctness a bit easier, as the
> > downstream cal-if code would be readily available to the reviewer.
> >
> We can leave this choice to the reviewer if they want to refer to downstream cal-if code.

Generally I would like to, but I also don't have time to hunt around
the internet for a downstream kernel tree. My rationale was that the
submitter is most likely to know where the downstream code is, and is
likely using it for the upstream clock implementation. So, linking to
it as part of the submission should hopefully be fairly easy.

If it is a Samsung SoC for which no public code is available that's
fine. I didn't intend this to be a hard requirement: "you can't
upstream x,y,z unless you link to the cal-if code". I meant it more as
"best practice/guidance"; if the cal-if code is publicly available,
linking to it would be a useful reference for reviewers.

Thanks,

Peter
