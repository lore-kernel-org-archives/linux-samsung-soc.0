Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D02C358D04
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Feb 2026 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770028126; cv=pass; b=G6uxyHaS1fF4ex6xX9K6v4ZqiqO5EvXtr9JJq6TQQI3jdbYGk4lUt5QWKzRsQJIFgRvzkoSEHhIMl2oVHWNYF+Sk5PXuGJw80oL3lgGPGWVLZtfKSIYP0Y2JybkJ0npPtj6O2wHYdCcNwkFBU8PZ18yDe5S3fBmSnRBX41QGaZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770028126; c=relaxed/simple;
	bh=nBdkcEQfMyCOW6kSj/WYXUCLYThl2kQXvWn51vv6mrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMsJxq0RL130ND+jJ0A6/zSzjZXVAilmPePkly9Hb0XdjrJH9dhZ9KtmRJ9Va6005MS0FNp28g1lm3EeUjkQ/cfG2e2u1L9Z3rfYx8At/XUEnIi1sN6Aa60VEDNk6bIjt9Ae8wnjPaSsHxbi/LgvaXgx4J5ylE5pI6fOPwTZoVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+LKrT9E; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+LKrT9E"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c56188aef06so2053025a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Feb 2026 02:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770028124; cv=none;
        d=google.com; s=arc-20240605;
        b=ElfUFlP8QIPKK6/I23Fa6dpIB5+zBO7hFNSrNRzGtLQi2s1YV/AQWgaznh+5F7phKq
         lsmXmqd158ytM61168f6AKappVCvO848vkBktA6bGvlWPUh2EzT9wtmTOXd/9Jz4J1KZ
         Mys2G5nlRrG0KnNHYW1AFNMXjOUUqFJ6eQB1KVkJDAd6e4SCuUQw0KdxplGDx5COAyL/
         dH4NBy0Mm0OqAa2sutJ+7CPM9yY9iMKoJtq0yecBzuTi3un/FPPbnZZ8jfoTsQEuIAgj
         kEeyTOEnsney2srmhQcKdFRZvuweT72usX0tYw839s2JEc7H+27QhAENJfrKz+DmSnqV
         Hvig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFOpNv5aGURhK7guif4BLW5/Z1g5jtAibOsBQwSYIj8=;
        fh=wSKK/yu4fHqjEL2c/+OPWtEO6G4JUUgtg6pAZPwxbZ4=;
        b=AVHoQ5cLxZ3exG6k6nYPLsC2lWEcb/30R+bbhOvJpkq9gUdOjnL4IKPqxahpCQ4fxL
         uFOjnWh3MMjqCLdPR9AmmK/su74FEx/l2pAizf6KOhZz298skWZukxmnvRawAumJ/KFv
         slH7S7Z3lbXd2GIsGt66oC84lZaPmV1MVg+uJIH/F0Ty4jU8wyrZIQfSu7BduSDTvmCn
         /OgiHCVIcDC84DTNWTjfwG95lvSsO3uENQuY2xGraDB4HRIvUzX32QBGUZH1R+4qLM54
         t+GZcXOv1y0OSOig462K7gKCmlzluGpD20I8PINdPTcVDDhLC2kX2rd9yfCgip6r+B/7
         16Hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770028124; x=1770632924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFOpNv5aGURhK7guif4BLW5/Z1g5jtAibOsBQwSYIj8=;
        b=d+LKrT9EE1qokG6CVypFD344h5EUkqPNcPC2lBT2HDGk+sbhTSm6I8oGMos+kVvuwm
         6jy4v+usK3ZXmCICXKYiHoKgRQoFR8iZbYyZbS9ARsCZ1sMrH7+cDyx+kolKJWMRKKDu
         9ZIYL0SaJXH4FeqI4e13x6izOuQ2pbz1UPzxAPZ3z/nSXhkqtLrzOkO4zf6zBZQ4c2tO
         Vsoa8JY6pCz/p3kIKAu2sq4mRbxphQmrU/Sf9IUeSqwvbrwzdsUWh8km1HXUszTPG5ND
         MbRQJP1Waqg9JdDiVjzrKnM1zNaYM4jWln8oosBzKFDcaslMD6MhpoYILTftjaDDDrFJ
         MM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770028124; x=1770632924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MFOpNv5aGURhK7guif4BLW5/Z1g5jtAibOsBQwSYIj8=;
        b=QlcLtn5eCNxMsrLkzhhvSvUgwBk3Fvfxm8XSfqO2+5kJDqndOMM/jjRXX4t1KDGNiX
         cUvEByC3zSLQKn0dw7Zxt8SUXjaKin1R55m7nGMPLr6lbmAuH9T2s1+KXRumLvm3gT/h
         ulZt7QJhyHPqA7zn1avZiM4OSlFYSeNjJbWb2i0qVyZ8kjqFXvfmC0z7fE7Osu8j0b1v
         +GiJo0T8+Z6xAkmDcA6k3RfpxOLoog0qvCr3ooyXyu8aWK9PpBbQR5dYS7qCxIpYd7+M
         wgCw/xh0jRL3qVnBgGvKv3BNsuYfqxUQQ3HBYFOyaJmICmb9BBbALZ2FuNmnXLuKQxU2
         mgGg==
X-Forwarded-Encrypted: i=1; AJvYcCWicrP2Cw3rYDAE/BFWGrm32GiJfajoJZphcqSX2Jwg0TDam8Rkq3yHXY7kzMbY38pxZSrYL08sap70AdjUN9TbQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Ao4YTUGwoaoWrdx/Ksy8Inq6DXi9T0IWJd3WCX8HUkmKi6+j
	8+4rAQPA9DyHWq5UPw1lo/gSZQukKlXbArBAv2uVylQEQHPIcp8scdL8C6hLKr8Qmp723mDzMoc
	6GIoJGb1C+/IvDVpM2r2sE2EoLKV1u70=
X-Gm-Gg: AZuq6aIaVp4gu8FVSlb7YZ7yZo40NKg7val4ODsSFWeqf6ypuV8r9WkX2VaDc0rZ3vR
	+dtLQycfHD+oZV2vaPrlut/UTIQN1mOEmt1Bvw6rpfNt68fHaRsdBurugnCfAbWvLj4nEsVvx98
	Qq70KizIIqkKUkBUN+RmKiDEk5EXsEf6zbht5fSBQ9SAdKskWJpopTIGTCQmSsEZ+42kSDmXF+r
	n3D+nhHBv5yrpsI8SeiJikPI2tEBEMAInR5f/aKj1E/PxNmwAOvx1KUkSPvZPKmV0E6LRzvTfnS
	/7etvJZx
X-Received: by 2002:a17:90b:3f85:b0:341:8b2b:43c with SMTP id
 98e67ed59e1d1-3543b3d65e2mr11169058a91.18.1770028124249; Mon, 02 Feb 2026
 02:28:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119082553.195181-1-aha310510@gmail.com> <CAAQKjZMHSQrowPWnWaO88Wynub00YjGLPnSNCg4n4CyNwgYtTQ@mail.gmail.com>
In-Reply-To: <CAAQKjZMHSQrowPWnWaO88Wynub00YjGLPnSNCg4n4CyNwgYtTQ@mail.gmail.com>
From: Jeongjun Park <aha310510@gmail.com>
Date: Mon, 2 Feb 2026 19:28:33 +0900
X-Gm-Features: AZwV_Qg17xGCvCzPBxDLKPqusD21IoQMfG9fEwI1GEiMPhdbVzUTaXzYVLC5Kk0
Message-ID: <CAO9qdTHodCQ=SnnSASSNnNiTyjxb6r2yfVMuTvdT8+LRLtf4Hg@mail.gmail.com>
Subject: Re: [PATCH 0/3 RESEND] drm/exynos: vidi: fix various memory
 corruption bugs
To: Inki Dae <daeinki@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	DRI mailing list <dri-devel@lists.freedesktop.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Inki,

Inki Dae <daeinki@gmail.com> wrote:
>
> Hello Mr Park,
>
> I'm sorry for being late. I forgot to review the patch you had posted bef=
ore. I will proceed with the review soon.
>
> Thanks,
> Inki Dae
>

Sorry I checked my email again and realized I forgot to add the Fixes tag.
I'll write a v2 patch and send it to you right away.

Regards,
Jeongjun Park

>
> 2026=EB=85=84 1=EC=9B=94 19=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 5:26,=
 Jeongjun Park <aha310510@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>>
>> This is a series of patches that address several memory bugs that occur
>> in the Exynos Virtual Display driver.
>>
>> Jeongjun Park (3):
>>   drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection=
_ioctl()
>>   drm/exynos: vidi: fix to avoid directly dereferencing user pointer
>>   drm/exynos: vidi: use ctx->lock to protect struct vidi_context member =
variables related to memory alloc/free
>>
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
>>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 +++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++-----------
>>  2 files changed, 64 insertions(+), 11 deletions(-)
>>
