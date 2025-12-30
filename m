Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EAB2E3AF1
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Dec 2025 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767088588; cv=none; b=hB8u1kBSvM+Hl60TRWxFt3uI39xkutOiTojZHb4LwR62zSkjPKTE7FqW59g8JdswsKVT/Vh/+I4VzLZ0N80i5JfM268u0usMoVhbFGUTCM7Kc85krdGv36Ab0Ra5Oc38EdombyduYng62/OP/XnW/DQUjPtVY1JUo9WnI9pFQ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767088588; c=relaxed/simple;
	bh=9CSA4RsITRmIPzLrBNLCxMgAc0tHKBMj5y/0Ba5xFWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AEq4r7dhODfiRbZoL73l+IO3mLbX3nX2JVuiwG3XilO/HyvFDEs3U8qkP18mIkAghPWTbgn8aqB7jsHf5810sOKQESrfMOIeCd4U+uR6FDE1K01yIM3Dx1GkpcJUSafo5v37wCptxgXib/8XZno+NZQZsqxz95eF6N/xk5szgS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=a+ilg3ac; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="a+ilg3ac"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59911cb8c3cso10866224e87.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Dec 2025 01:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767088585; x=1767693385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CSA4RsITRmIPzLrBNLCxMgAc0tHKBMj5y/0Ba5xFWg=;
        b=a+ilg3acELrwcExbB4NV0uorpuK+m51s6akVganUh+ffFQju+E/1Cm6mA/ZwBjCfgG
         nCcEgW/2Eq3nZ3sDwgovz0r6vNTpNdjkm+v1dl1xC60hnzWiYzrW3Wy3ps07xrhIcdRY
         FqSTgUnJNscS33xvchjovQ5+GUUVdICEdTCfN4Y3yhhJLXc0fxyNj8c/ynSlmh6+A3L6
         cHzrHmFkqpblwJCPXazoos5KHs86hxWlDMkx6HjCQZdGCFh0P2LJoSAy4lMWakcFdzbt
         lMbaf7oyVUjCZg6w4l/htK5m1hJpmFx4r/qCWSuXQE46hujpii+NwN1vfyCDrWWaGa6k
         bL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767088585; x=1767693385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9CSA4RsITRmIPzLrBNLCxMgAc0tHKBMj5y/0Ba5xFWg=;
        b=sIsJREp+Wxe/EhHO3bUdoBqvkoBcMsgv1MevwodemJZAv1mYek148hKbwJAFSvxmgs
         We/zzl8u0wNAxATq9OS8SxAZpke3Rk1qAuWDY7W2Nyws4KAR2kYPLvK01NIVAG+ETP7B
         HKDjzP1OVqKTC7GEtoiQYg+OWplJ9x1s/lUBaxQsqNBz40rqj4oMdKs0E/YOlqQVkDWd
         HlBsjolH6mtfCQtiQbmyzbLmfzMdNVpdtRU1qrqF1KQ8vVVE0q5xsoZ7kcegxrcN8x0P
         t85L4SgCfxWCwZn6ZoMkXZWf1ynXdB1R/ZaquRaC/8/V3/+GVGelvq25ZRbvfipxazXY
         t0QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm85fMKFYPFVWQzEKd8Mab0d9mlw44HEF+FtQuxQTGvMbBPOpF9TnvONYwm5WVjTBQPCpg/Bmgk50+gST0xSH5GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmS1nk1ZKxAIRhj9uEXX9Aq4/CHgNojx5eoqkK62e9OT7pAedT
	9FxNXeHIv8tsmWDmSLoh47vuxtGrNujO0q4u1zUZfc0HQ9I7ckrPeH1M5tffM1X8bX5ydXSdljh
	W8RH6BGJOV/mmZ1durWpFhO7xFpotRCC8luryu3aMSQ==
X-Gm-Gg: AY/fxX54xZbnC4RPGE20DQPUM3GX4S6KTDy/GkxoUXYZt/sVcPqtoJ35+8xJYrh8FeG
	3kmoGDyWkLScKHWGWESRToasYIvkoe/YY7pC7PJm+VTzx65h8Z7AyhT+cjutVWFvQy4uiLeg4M0
	9SOtcurAyEiV6VZTaVlKEGGU1BBLLrIelomh/0Vvx5Ob6rjoUXPeLdfcOb/WnlDuPIJHHXHCZ3g
	DEcG8HqGRKVxLPqCLEec+Asd8x0c/Wzu4DDfdVW9kCl9Deob/0Be1bAx0lrL7ND1tbhN0XfQrTx
	TKREUpfm6X+x6kio5XUjyDgqlUer
X-Google-Smtp-Source: AGHT+IGF2+DUuPOWMyxl/m/YE1J+MpsN9z3qB0Mfg4V4PK/uMaSMEjg5JdfAVQd/YzIJO09H45JgrMZiuh+pgS8W7s0=
X-Received: by 2002:a05:6512:110a:b0:595:909d:1af6 with SMTP id
 2adb3069b0e04-59a17d579dcmr10690623e87.28.1767088585063; Tue, 30 Dec 2025
 01:56:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104112923.143408-1-marco.crivellari@suse.com>
 <CAAofZF4OJi5eEfjhE12RWi6wDU+A9Rghsd2721SxZR4AC08sYg@mail.gmail.com> <CAAQKjZPVi1KHuS4p6G2uAeKMAg=PEbECj7DHW7OYNYLG-S9hmQ@mail.gmail.com>
In-Reply-To: <CAAQKjZPVi1KHuS4p6G2uAeKMAg=PEbECj7DHW7OYNYLG-S9hmQ@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 30 Dec 2025 10:56:13 +0100
X-Gm-Features: AQt7F2oh3vqm2C9AigTf7qyt5vRvEM0_ckvr_DiAVWkRHeGhyvYiTBn7mc558-8
Message-ID: <CAAofZF5Fi7x0JyyNm=pSh9H=qp7qCH1xawB5Ad6+=-xzwre+Ew@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: replace use of system_wq with system_percpu_wq
To: Inki Dae <daeinki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 6:48=E2=80=AFAM Inki Dae <daeinki@gmail.com> wrote:
>
> Hi,
>
> Sorry for late reply. Merged.

Hi,

No problem, thank you!

--=20

Marco Crivellari

L3 Support Engineer
