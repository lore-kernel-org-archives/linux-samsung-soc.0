Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548802741B5
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Dec 2025 05:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767073717; cv=none; b=gdEuKuR15YhpjEPtDx1HLXwBE85dzDL+AkIuHr8aG/b23JfR+Tk9F+iz5JvLX3G9/jXFl6fGO4XDEe6C4x/1stOSX5OuWgysjF2ZEOcxwLYLDFPBdXa1ODg9Xsn3wwaD1FHBgLOKJswwH4r8sVb9+p6Po0rxbSHm4cK9lAk0xZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767073717; c=relaxed/simple;
	bh=r+zhJnCySE0n0KunEGbUZgwC+UCEOqkukxqim76Xsg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hxRlYedZaUS8XWIDMlwTLr7wDO26x5rH8hjqqUfdOg3/cjROUo1QMAUXNXAvf3NY8x53iMmNwYYAitgiifPupLEvRVVtSZr0EcVfhdMekTsKFSsUUtJ5QHPOsheM+y8Z6O+FEkiT/2ybPXFkEedm7dOygeN+BdcxNEhZd1Xp7Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQYXC+Fl; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQYXC+Fl"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5dd6fbe50c0so3535429137.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Dec 2025 21:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767073715; x=1767678515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Io2ywk5egcCouRJ+jUh5kFNImLPSJfA7UhLYpX0iGxI=;
        b=jQYXC+Fl/EFmOVEFTF92M1vAQhh6QbsaAjWEMMHc7RuuFgp14mFZ+JxKWMq/V12W73
         b7eCScGUxGm27/ipFcJBoB1XVLlxRectWNWY/ezCgenXkyQH+9I6Wep+iMBQfjs6dcVz
         59Ei2CsbVFdECoHJfF4KIpwQCvswBa90D9i9V0Rg7/kKxE9L0NwzmBufpDgMoGVcW63f
         +4f6e5itvEWAG9IEmtcR+jhdHLAz9mOGs8wObHY0pEzi5y9aizT/iS8Xgf74811w1D92
         n3Wwo9tCBZVm0xQN71x8vz2eDElXKkal1mbRRA8FU5sFj2tK09w/X2msO5l9xyiG2Sb+
         rEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767073715; x=1767678515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Io2ywk5egcCouRJ+jUh5kFNImLPSJfA7UhLYpX0iGxI=;
        b=weBp5RKfmnCrZviO+D8ixdujIsCKfuqXfcqFWu54Sq/xhQKwbPgN2OzovaZzS5bLHW
         V8TcKlk3kQwoPHQocfQMjFjFzlplfxJ6e7M1oiztbeaS9G+oOtlejueNxf756BbMtgOu
         amsVD2K4RSCrVU1BI/Mv0J0PfSUTZrFyO7IXhutIyWaPT7ZWaglNW4D7XsegCdfKeHmK
         352746mxgxNMBlw5dAHwjplbU3vA+ujz5u9DZ2Jn5autxzo8Uy2zkA5Z8kHjWN3jtOFc
         tFvHby2Zo9VnYH8G/EO5h2TB+HdMKuaUVRGk6c3ZRwRZCSsevcw94mxAgELKK5GwA1Mn
         TSrg==
X-Forwarded-Encrypted: i=1; AJvYcCW0PcJQfxFRr5O3CeFttHySL2DqpYHUIOByITMDllC4vQMHPF45a4aOP+i4eybMvqbDcz8zRXF/hckZjR0Wthyb3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YweMhUrNpAvgBmvZVQ0ibBjS7sOC0/x7l6JExDU68o+w1Jcv3id
	PmQGO2KNSQytVrvpbHi/eq9WHPEs9Tkz0Fm3QxPuwCxfscMNzcVEnRDYQyd8kP9xgYDYcmFzQMZ
	i8CfAdjHMnAsX8sexpOiCbCoHdvmwFl8=
X-Gm-Gg: AY/fxX72C4485gT2zXNInC+jg9zaHEGZ+bEw1FRy3pzD4kpzwFEVPgwOWjtFIVZN+n2
	NiLeQZMjIZBo7XZ45qnuisXbv0ETvcLLrkjans0DQ/emeR4YcA0wTxoLI1Hmjr0vD42V5oHOkAe
	Wsmnme412uNDMr5Br9OAc+O2rebzfOHvcmu5icZgGX8QBd1Ni1f/wEIUna/ZYhED54QWjl8eDNV
	PcxzYHQZeBIZEzdnYR1vr7mj0G86/zv7ij5tDXcQQBNR+Z1vR//QkeKCZxUqQJ5UwJPBw==
X-Google-Smtp-Source: AGHT+IGcn7ngK1Vl7ZEBA+uwHaBbyq/LtaGbWOTh1TF7kp4rDbVZJDT5LgJQCOziJh0geZNQCW6ZGjhSrLMHLeIwNHg=
X-Received: by 2002:a05:6102:568d:b0:5d6:155c:33aa with SMTP id
 ada2fe7eead31-5eb1a663165mr9947765137.16.1767073715290; Mon, 29 Dec 2025
 21:48:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104112923.143408-1-marco.crivellari@suse.com> <CAAofZF4OJi5eEfjhE12RWi6wDU+A9Rghsd2721SxZR4AC08sYg@mail.gmail.com>
In-Reply-To: <CAAofZF4OJi5eEfjhE12RWi6wDU+A9Rghsd2721SxZR4AC08sYg@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 30 Dec 2025 14:47:59 +0900
X-Gm-Features: AQt7F2pUL_-MfhVXCOS419JhBeqjx_drkdULdJgcsbrWyUHU3_jdpuTD8pVkzYY
Message-ID: <CAAQKjZPVi1KHuS4p6G2uAeKMAg=PEbECj7DHW7OYNYLG-S9hmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: replace use of system_wq with system_percpu_wq
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for late reply. Merged.

Thanks,
Inki Dae

2025=EB=85=84 12=EC=9B=94 25=EC=9D=BC (=EB=AA=A9) AM 12:01, Marco Crivellar=
i <marco.crivellari@suse.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Tue, Nov 4, 2025 at 12:29=E2=80=AFPM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> > [...]
> > ---
> >  drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Gentle ping.
>
> Thanks!
>
> --
>
> Marco Crivellari
>
> L3 Support Engineer
>
