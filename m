Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D4F82D89
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2024 19:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718219768; cv=none; b=l4B0X0ACWL6/QWRckrS+ndry1MGPDZE+91hTcmo4CfaKLvyVCOIlXEl2jiamU2/jVV7afbrFw5MsEiAge/J4L1g9mFu+wStszP+GBzixZJd/HwIgMoDMsKIEuutDnahQeaX/ehcnzqZCsKllmsOQ4iFEq6+WkX6tzUiy1YXZhB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718219768; c=relaxed/simple;
	bh=TT5Yy8Cg+zgc/dvH/JAnRm7xPX0YfVAnSj1ykdSJ2Ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ETWQdaaAnfAcW8RjG8CsEUPW80WKcWukBR2omukeHHW0ECaZ8CUkq7hF93r9G2Q1N9TbLYWLrUa3r7mWCqXehpzeMHD6KccOAY4DkeaWUueqiFQXeY2PdxO0XCirHAdxJNb/wMS57zx+Xqc7sGUV2V2esd8AU+oZ4ZPGmJDDgw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qqlsqxuI; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qqlsqxuI"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-62a0849f8e5so2370207b3.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2024 12:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718219765; x=1718824565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTOoAkY+XFAaDVAn5K5dGWlrUR6Zg5YNXYx5cYl0uTA=;
        b=qqlsqxuI4MrXCsiHf1QBwajMznvQd0klDYXqfWO0fmhEwkub1IFZ7mImy/kMhHg0mj
         ccs2XsUnw1uQFb4SDV8oXVV0siVRNsaKhueZa4cHmnry6p+ZlYsyI9E3qpaWkXPnx1u0
         n2AejvagYycZ+BlaqZ3vojoAllcD57s4i1lLe4l4N68eVc/NPHmKJxzCic1FO1M8sumY
         uISEevEhp1oawx3VBwqhGV5mFMLRW8QThfDnvE+Z3lSEM4OnMGClQxtMdjQbLkebVNFm
         gTpeeOrh/lhe63yZEXtLHOy+5/O9DTY8yCkCrzmggdZzDYj2ljCJT/m2+VWXbZR6/jP6
         V4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718219765; x=1718824565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTOoAkY+XFAaDVAn5K5dGWlrUR6Zg5YNXYx5cYl0uTA=;
        b=YE/080s3nlBO9vA2d7QuWUKwzPP36Mg5q6iHbjW8dUKXO+h4ah/csfUwHHp2fvpOJK
         KHdobTGrzhMFw/uQBFsOzuoP9V9+fvYKT2Rw6wWjh/sMQk9NwkxorfWwa7sm8OpGlh6W
         85VzHz/RTKIs3oXDodLtW9HOunumTO96FMkEDKeSDkfx+oFqLJTJYKC2damvPKTI0upx
         7qMGWs4UEygweRV4RJOtRVEukWAvOakNxS0JL7q5QYVaNvcisctC+UbOS51ersGlkuOA
         qdEgPPdllIREF93QbHWVOYV85nUdohHivHlc8jCT7Dj8JjM544E029AYUa+Lytv9tU9i
         bEVA==
X-Forwarded-Encrypted: i=1; AJvYcCVCkfPQs9McmW/O9OkuU29I9ScED6cVeiVX6snUPCEnTn5tiTBvtVouyknPXhOIZ+2hfHdPTk7yGpNA9IqJpcElitFVBGYxGno6SuXD99xB/wY=
X-Gm-Message-State: AOJu0YwtBt139i4PcnWCo8Ev+uXdjTge3ZTdiSXR1kYpjB+gJxQw/KXr
	DZiPVzrblz21Dy0woZLAdxm4LSuNDeDzC9IIQI/PM9UEfNC/pGFAgD0VOQF1JGH1An8bntILPNx
	sA5FUAp4AFEDdRmL7QENoi+rL3Dpg7yvoFdudZQ==
X-Google-Smtp-Source: AGHT+IG5dsLLwBGQuoG4Hoy7VVSKfSzrxGdFqSvbA7MGEl1gf4yhjr5zOnzliAi/dYKgH3eizXYGtPwh7TsAUPZRI9E=
X-Received: by 2002:a81:a189:0:b0:615:15fe:3cb8 with SMTP id
 00721157ae682-62fbaf3794cmr28360767b3.28.1718219765456; Wed, 12 Jun 2024
 12:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507-samsung-usb-phy-fixes-v1-0-4ccba5afa7cc@linaro.org> <171821470509.586907.3119518278516252634.b4-ty@kernel.org>
In-Reply-To: <171821470509.586907.3119518278516252634.b4-ty@kernel.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 12 Jun 2024 14:15:54 -0500
Message-ID: <CAPLW+4kgsSrbVbsHgFOhM_FppoPngnk2XhvbmByLtyUKkEWgWQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] a few fixes for the Samsung USB phy driver
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 12:51=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrot=
e:
>
>
> On Tue, 07 May 2024 15:14:43 +0100, Andr=C3=A9 Draszik wrote:
> > Before coming to an agreement on my Samsung USB31 / gs101 phy changes [=
1]
> > [2], I decided to split out those changes from that series which can al=
so be
> > applied independently and add a few additional fixes I had lying around=
.
> >
> > This contains mostly cleanup, but also a change to using fsleep() as
> > recommended by the timers-howto, and a fix for setting the ref frequenc=
y for
> > E850.
> >
> > [...]
>
> Applied, thanks!
>
> [1/5] phy: exynos5-usbdrd: uniform order of register bit macros
>       commit: 2a0dc34bab8ede5fa50378ef206f580303eed8de
> [2/5] phy: exynos5-usbdrd: convert udelay() to fsleep()
>       commit: 27f3d3f6d87f650cc6b3ea08335dea749f1b04aa
> [3/5] phy: exynos5-usbdrd: make phy_isol() take a bool for clarity
>       commit: f2b6fc4d5c9793c556412e9a8ac122670a0d8dcb
> [4/5] phy: exynos5-usbdrd: fix definition of EXYNOS5_FSEL_26MHZ
>       commit: 32b2495e731f2a56118034e9c665e6fe56bbfe3a
> [5/5] phy: exynos5-usbdrd: set ref clk freq in exynos850_usbdrd_utmi_init=
()
>       commit: d14c14618e851eb25d55807810c2c1791a637712
>

Did somebody actually test it on Exynos850?


> Best regards,
> --
> Vinod Koul <vkoul@kernel.org>
>
