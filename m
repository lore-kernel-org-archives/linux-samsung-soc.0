Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5511352F85
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Apr 2026 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574066; cv=pass; b=qu6qN9o1wgf1GXw4RBqU2AFFvVk16bLVyOzpOxVs5eMpeJEizyw5PaEya7CktyNumatGQUfz3mlMnuDS+ay/JdeE3WXTWrSSU/70rdyCbUG3DWT20zbkklZs2xAT1pTTlIh6+DdfYW/A5TVfDjIO9JmdkP/iokKZ8ypP06xIi6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574066; c=relaxed/simple;
	bh=3lNjW+dxr/buBuPTrI5vfayHnWO+C+X6rAlTXc04424=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TsoEQjVZUxciSgUrMXSQ4J4KLDsruUKQ76ROvqIRO+3jcsXz/hvTsh2szN0vDvLAkStxo1K0umb6JqwHuQ1VtnDlM0I5t2m2hte1yCHkMS32z/l6QTp7Fanq+zKp51f9ZKcVnhr3oRrV/Gs82/d53BF8ngSWCJ10dRn26VP2dbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ju7OIw6w; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ju7OIw6w"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-89e8e352dc1so31877706d6.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Apr 2026 08:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775574064; cv=none;
        d=google.com; s=arc-20240605;
        b=bG4/EgLGAF9Ffbi18V3dUhMqxL409lBT4oMo43GDxSl4FofdFf7m+Zw4CqegqhEUJe
         Zhpl5R2yN8SC7EplZjw2zc2txbBJlUwx1COucTXDm7tiNnwxQxzle6RGSnEZLvsgtIuv
         yJmuutbo2W7IDZHkOOOO6rLA7/GvvtXek+wtKlEIUxHjPlv6+Tc9QGFiYdsHulAEt8Zn
         RD+wG3dgyM191HB8DWHuQcEpG4/J3u9qwMz0FXBRQp1EM2SIwqnAEysxer31CtYGszWD
         s/iwIw+TstGH9GuOoLYkUw3I57vyOfHjynbBwB44KIB/nwfZB5YPaKLxMOez+VMSvcXo
         85XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3lNjW+dxr/buBuPTrI5vfayHnWO+C+X6rAlTXc04424=;
        fh=VyRzipEJkdX/xhK1wGjDzCFpk6ioTbtx4O5zkM7nrb0=;
        b=MDve7vYqOEvTBWaPZHGEH/o0Tw0rRZyP3qVI1z9wfOgzCU85VngUznGQ+y3azsLIk6
         dmat7oa4fHApBYiLqhfM1MC1E1PIulbY81H0kpUZNePlknIbEadvQ/4ik1nT1HIoJnY0
         dDvnwrlOpeohGTwWBa5OheTbWPyEtkphVBtpfA98ZYuqtJufoxga6YKPKn8W6iBJFg3D
         wl4FWX++nQvbQZFY+fdDXIQHuZfAvaUtMCcQjOwpjS9Cr09xOYg+INdR2amq649gK+WH
         UKlQ0NloVXZR+0rCUfY+y5XnXjdAOLB+KWKXe9mOJYtE8piY0MMP4wQK43LO46pE0vbr
         nmnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775574064; x=1776178864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lNjW+dxr/buBuPTrI5vfayHnWO+C+X6rAlTXc04424=;
        b=ju7OIw6wKFdAydGJgy/+Wy5jfPM6QaK3gkvmQOSyMWjRtZCNUTZHR5jL0aYfPam24R
         JGhY39X9ULcmSy2glnXgtJUL+lTqnrNKiDZpI0YkXKDvqwJhOWBrteNNjFD+i+q1LqqA
         DpnxIx18FrWDyxv3AxgF2r4/RXomuveE5Ax/besMcQbNk0B6L6NscSHLXaT6MATLK8XU
         dbVZrwP8eZ2qFLeJB70rVplTYN+OtVOhDVrzdcvaLhbRpXP0ZlrIpl/Ln+1MMwQEwN+Z
         5zOP6TWViMJttw56gn6GVkH/2GKgFaLDxI4YPg7jF6ytSa60XCiNvU0bHsRyUTrD9yWC
         LgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775574064; x=1776178864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3lNjW+dxr/buBuPTrI5vfayHnWO+C+X6rAlTXc04424=;
        b=MG1ITOPDS4u56Tui+Vb/awYb+Vr+F9qtMlVMDL/iZhBqGUc4SbJP6JApyAlcuvoXsQ
         +DyZQ+3T6qO9V7WSsUfcz8ppbCsv4HT53a+UCddtTDxneoeiKO5js2yLENaYt7Bs9OYN
         D3d79WuRwsYwhugkNchQNiaWnRVwWYuTvvvOU3qUNlxouHDDbehflnDuEhz7bk8KUp7u
         5n4xXyUswNTnfbUGFLkyH3T3Rx+UxaQkYZ7X+MlkIDnYGPYy4dOCAQZvmM2RtmAljZid
         YBZYAh+rmZ/PBszOnjwNRjQSopU5kyOi7nEG/xb2s6YoTg6hhA5jRZeaI7RkW52riOa0
         vOLA==
X-Forwarded-Encrypted: i=1; AJvYcCW38cVZtjEfNZrTO2P6myaR0Wq9dygD3NLpTehKTxVmfpyZsHVQLw6biJ7BAXSGySm5lgkoTajzNvAuHJZ7plBiqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcWUWuv/NurV8hktvWyfS3Kn1eOeVU/wCyts9mCw9WF6HIxjtv
	bN6V/gKX1M9od6BWoW3GHdeBRo5jJKqphrftjzUoc2AGR6QX1HFy+Pb5Qtdh9ZTSTN250yltY2E
	69dFRHIZ/rabvYHKsj7x+r70kx08VgWY=
X-Gm-Gg: AeBDiet/te+/Hz/Rr03qwfBOxT1uGBrRHh8FWbKtiUHSNcgocPtbwzLFwSvAwkK1KR+
	6OG2Jh1kJmoQBzXy29QV/wTH9w6Xr0qcFziFR7gqnpiaTlh8Omxwicdho0q0m2tf+9VjJX/LjjE
	uMkOE2XagYDtWTfcUvK/9i7PQyjbdMINB32YMlpCa465g37BvUSs2biPBxhXYC/SJTGA9EH+eM+
	EtmyxtFaR3GacUFT3PJEyUtgwCS78y4CScY/h67Vs2n+GhHSFGHZ6egvdbuZzR7iBLCI0eWaeTE
	MfynhA==
X-Received: by 2002:a05:6214:2f13:b0:89e:cb8b:a77e with SMTP id
 6a1803df08f44-8a704abb8dfmr284541396d6.32.1775574064233; Tue, 07 Apr 2026
 08:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326094308.1161335-1-wenst@chromium.org> <CGME20260327054445eucas1p2d1ac645faccf16272c3a12406400a364@eucas1p2.samsung.com>
 <CAGXv+5G2H3CSic5hCSd2g6RrfGyNSbpYS7Z9uo-XUn6No3a4Rw@mail.gmail.com> <52a26d5b-67ec-4a99-98f6-6216e930cdb7@samsung.com>
In-Reply-To: <52a26d5b-67ec-4a99-98f6-6216e930cdb7@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Wed, 8 Apr 2026 00:00:27 +0900
X-Gm-Features: AQROBzCwFYJ79nrP10FU2NCqyXv-mL-J9T-1EOFubFcU9cyDki20zWlIqj79km4
Message-ID: <CAAQKjZO=h9uegjBOi7dqq0DM3o2B9gJ9mkM+40pEXMHY87unvw@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/exynos: Random cleanups
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 3=EC=9B=94 31=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 11:39, =
Marek Szyprowski <m.szyprowski@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On 27.03.2026 06:44, Chen-Yu Tsai wrote:
> > On Thu, Mar 26, 2026 at 5:43=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> >> Here are some cleanups for the exynos drm driver. This was done as par=
t
> >> of the conversion of the driver to GEM DMA helpers. These patches have
> >> no dependency, unlike the actual conversion, so I am sending them
> >> separately for inclusion now.
> >>
> >> Please take a look.
> > I should add that these patches were only compile tested.
>
> I've tested this on the real hardware and it works fine.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks Marek, :)
Inki Dae

>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
>
