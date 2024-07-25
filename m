Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9032901
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 01:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721869584; cv=none; b=H6JV8etRvKtaBN8+0zHsOorfNLaPbx1eSNW2tiXGkzmPrFIXyceBPhHSfstveCntWlLg/jHKkWn2ebGr6Zft3PDT/2otiNfpujN6nxCANnbBg0k8WsfmggE9lOox6RqBrmBCH6aSpQJwbMN1H/nbY1fq+82L7JPzHbYwFZnsmog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721869584; c=relaxed/simple;
	bh=TB3Hm6XGbDPgJII4XztCnvOepjpz+iOC6LrCU/y/ZPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAc2OMkdJIfo8/b6+kBEGTjWOZ9oVMGTaZiXtBhsMFQ/WScRD0g1ISpZFyNij6H4XbkZwsyBYDuS21qXY1l3wQyiRjFBl0TwtxuTiBKFrMmiGeUiPEZmLPmdpmpmOXaoreJiic/oJxayrGJpERl1W9wCnRqkjwadQ9Y7WpG9VBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lS3IR5Hq; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lS3IR5Hq"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-64f4fd64773so4703717b3.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jul 2024 18:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721869582; x=1722474382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TB3Hm6XGbDPgJII4XztCnvOepjpz+iOC6LrCU/y/ZPM=;
        b=lS3IR5HqhWfIYa++7rheKl0hzgWUpgEDVF9gecKmvuauZBqQlpkcFMqtuH3NSyJIsX
         JsPl0P8ruIa+BBF0MKwAQWU1P8qG/d02hP07tNVf+sxTDG2n6z53OnN/GX2WYd7FA62J
         KWosg+nCObovqeRDgzDGCQrfW4gc/evvPEj4HuT45nQyxoHOHEcatXqS8jgT7NrvlVUF
         yncoQih/nKl/O9hBRUNu/p37oiZwotrnJY5+6zGE+yWO/+/ji69O2R0vwJmCElSMFGCE
         SgEYqdto1VJS6CEOVebbGCYpygqzM0NDUBO5SO0YIjWXfRs0p7eNb65l7RBKCXIoWAKk
         XIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721869582; x=1722474382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TB3Hm6XGbDPgJII4XztCnvOepjpz+iOC6LrCU/y/ZPM=;
        b=DM2ox8a/cKRCakj934+w9OQsfVYEayY7j6uTn+iN9rkBagW+xZiCf8ls3R+zHqRs0q
         wRU1Xq0il7tTkAJaGfviHEUZniBNzr/Ra0fZz0p3cAjBhyKPsHgEqCn4iLLD7IjHjYii
         aN4nArcr6R/fqCvcHfVe0mzZFH39bG0SrxNdh6eMQYaZRLzUtFDlf/x0fk1Kv2Bs6M6C
         oQV0GhfaJLatKvRcSa0OMM5/QkrkxikmfuEYDMDcyA+iv+obFOfn/LsYAy4Vtjh5x8my
         ipgkOSVbJ3P2hViewTVYH8C5BcMNMPm45E2AseZj9JChNZkzFFNWbyN1/zHtm+qcZfgh
         ofBA==
X-Forwarded-Encrypted: i=1; AJvYcCXLpW2qWWCmtB8RVc2xxenKaIsDNbkjl2sMFDzlS5p82AWgOdhY3rUIGOiOwzQw8xLboV+uCpRPx8zx96W7GfvFBWVyB2BiC9kb/oQk+fUPtpk=
X-Gm-Message-State: AOJu0Yysvunqiu8kSgG82sm59E97qkN/TUFhKbm6EHGFY1hmfUlh9upC
	VlPe3bCpvaNFeKbT7Mg6EMJLsAoYT27oT1M7otxo0hTl5rghOuydt+yzAiMHUl0Rc8PCrlpTAJt
	aVdwfwxD2y9ZpVA85TLe6Qsnu3S2cEI0J2QJy/w==
X-Google-Smtp-Source: AGHT+IEOV7O5I0pX0ll/iJ+MoyJB63BQHQXFPzbiOz03qd8h58aQ5h7oPXvbm2HxBtsw/y3yAhYUHuLdyclrxpZ+OBY=
X-Received: by 2002:a0d:e306:0:b0:618:2381:2404 with SMTP id
 00721157ae682-675b8336633mr3139137b3.44.1721869581819; Wed, 24 Jul 2024
 18:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240724153125eucas1p26cded41c82d3a851a7a4d845a81a3e29@eucas1p2.samsung.com>
 <CAPLW+4nYfVytXnpDs02QQGms59dL+=pAv7NMNPK6Ymsemmi_cw@mail.gmail.com> <20240724153118.914714-1-m.majewski2@samsung.com>
In-Reply-To: <20240724153118.914714-1-m.majewski2@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 24 Jul 2024 20:06:10 -0500
Message-ID: <CAPLW+4mg6XG=NzpKZ-j4L_djpYgaRv3rWJh5=ny3me3bngsLxg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add initial Exynos 850 support to the thermal driver
To: Mateusz Majewski <m.majewski2@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 10:31=E2=80=AFAM Mateusz Majewski
<m.majewski2@samsung.com> wrote:
>
> > Btw, I'm
> > curious what is the reason for implementing TMU? Do you have some use
> > cases where it's needed?
>
> Not really AFAIK? Mostly because we have the hardware, are familiar with
> this driver, and have some time to do this :)

No complaints from my side! Wish more folks were working on this
platform :) Please let me know if I can assist you in any way. Hope in
v2 you can account for the TMU clock I enabled in [1], and test it.

Thanks!

[1] https://lore.kernel.org/linux-samsung-soc/20240723163311.28654-1-semen.=
protsenko@linaro.org/
