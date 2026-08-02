Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D7B390CAA
	for <linux-samsung-soc@vger.kernel.org>; Sun,  2 Aug 2026 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785662126; cv=pass; b=FLvvQEARKPE6t6o964uKvTXJdgszOK30dRIjoO+6OhJIZ5J0bPLG7pH2L6EnrVmz7c5sVlXurb8DaOanMvwaB5e8NXKwCnFXWncEKwWDdG/aH8/6mLK0Kxl8A6X5hvnNq6NN27GA9r0REU0NjNRmkVZpCnT6CvO3hZLpSEpSOxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785662126; c=relaxed/simple;
	bh=QZV8ynflEO4JQkppwv0nIitNDbgzI01paOOgnqEbB/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcZCraEaYHVct3hvtfTjEo7rGqv0cNh4sq6mfkPXlDGzGoQH6/3fGeqZyV1y5h8w/5M2I5Ox1IAeAYkJ6QArCrF0mPFDIAp0mv6Kq9ZLmQjoYksrMKjsBVi0yLWV08XoeEd8zD1Ygijyc/UnTOYRN+RyZBFx4FTbawcimtcVEEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imUJBx2z; arc=pass smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imUJBx2z"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-43ccd4f6f6eso1572866fac.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 02 Aug 2026 02:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785662124; cv=none;
        d=google.com; s=arc-20260327;
        b=oxmNI/+aaPnCNsp6tfasXneSGvCvkU5K30EbQPrmV3QffJ7GruippgFEs38oTaMWGi
         H7+AONv/Bn0AW4TNiwDIaRdojNAT9Z8LFLaO0mfL+VZXlJTU1if3t7LQ5R6HjNozNYMz
         a1lDQ4xVIi5B2TwjYgUqQ6f4sb6EJ4JO53dTYzKI33z2nCHAeSS/59Devk+37Vza+wRr
         vFeZfnv5XYqBf2ODZ0BzUVR31HUV6RIMJBvtAW3yTnmmHkG6kvnEReiyabPY+ob7L7+L
         C0XHejrFCuNHRdnIT265FKhoWoJe2SWrzulMt59uig2hAKF+3g/WfQL6tSvwIEOZRQFS
         w1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QZV8ynflEO4JQkppwv0nIitNDbgzI01paOOgnqEbB/0=;
        fh=rSZpTnO1A+tzjfJQHu2/6bBhIt7zLFjEkoFg0I3RLi8=;
        b=H7eFLK5q7uEn2jR1DGDTvTX5RFfMyV4jZJanlnJdIXxV/Djb6qBqT6Yz3xcnNAbX+c
         v+vNprAw06yOrrq3qRX39BobkDonyXS35fcJYGeDi0cXjWgJzKtqmPBd5GbM3pz0eSLT
         b71uziXYQHS6+2wiFgxiuYM2Rj72EdzPaDQAvE1D3WxiZCHpaURXu36LdaCXOUWHQO0U
         IC9IgKYn30WYtecfbgx3u8/Y/Lp5BlBWBUv1+KPeoOnROnfBi52qDihwKCb22mFaksO0
         wwKEP8NJM9V6VprK1l5zB4cQK8nfDM4+OQerUxO0Qyn5ReFbfcfUXqvHyZS4yjFJanFT
         159g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785662124; x=1786266924; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZV8ynflEO4JQkppwv0nIitNDbgzI01paOOgnqEbB/0=;
        b=imUJBx2zA9NJyydTn1t4X/2zJACA9v9OPYR2HYdHFumyHZWF7AsGzbCPGdc0QuSdEA
         fvV3OEY0LPDbojNreJMiRBzNqLPXktQVKUoKGMrISpB0Y+mxGGfsmFA+AcQRHY5rlqkI
         zwk0v3iwl7nEqUCiROvustVFPvWwd4HFjBVQWgsYta3AauauJVf484SIabi6z8DW+d8P
         7YUQbFUqpz5e7FcbadA/Ao08zZImc34MnT/01uzo7cfVAAsAFF+VblszHaw/ejvO7zxD
         g1GUFuz5/8NwzLM4WKkqb9Hz4oaY5iUOlhQyNqyNAG9LFJB494F75wxo07atQutNYW/E
         fpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785662124; x=1786266924;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QZV8ynflEO4JQkppwv0nIitNDbgzI01paOOgnqEbB/0=;
        b=lY2fcKDOOPU98VBpZYO7w2m7X8KxIT+B8LbmETVIhS7Oj6mnjbtyJWqELS//jYqJBE
         +DPAp1lJCRP8aRYNnSxbSwflV3iMuznuuJnfbxTDKTQeYF2fFZMATMZkVEczmFL579cn
         k01xpZSSnVA7UnNRczGG6dyOp/cg+x1HjXxT9hMpCgzFGsvwxWOaZHZ6ZeuNOTaIhRkO
         cCrwK8zsMMWKnPnYB6pclFH5o60oAoYsv8vtCGZDm4R54SsC4sXRRmFZaDmdLcTM47OE
         ZIUVaIUQ12OjRglKZnYliFpUefxWP6/XPahD8zEIY1xTicp2WJOf9YrMkKzvNadb7wR5
         s7yg==
X-Forwarded-Encrypted: i=1; AHgh+RoMYvvzokUZCDRZJzC/dTIhjFPe3BhOVUeDtrM5qCqwNNcYjelm+tMHM0mSJRrWlEPXzqZpuor5jFEkPFr4j+FkeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybCekBmX0CFXtUvK/ClxPYqozqPclBz8l0juTHuLh41O0s6MQe
	7xwaHkZoFId8K7AXfBhP/plCvLPGhOSC74Da/u386po0yvRXIe9jZZabn+IGbKSePFLyjunZPbl
	kZxbLvY0cXz2ZStKkB7/MSr/YIQMsP1Y=
X-Gm-Gg: AR+sD12XqEeTpbwubp/Wht5AIpWlVK1xzElSI5PxpKMk4uNlKiKnmmzlfVu+EG+leZh
	Rj+eBv31CRrKDs1t+MHC6j9wOyhiTGxPvT0Dy6nYSeOoRGSNSV3Y05+MW/yzrzalUYTob+uIFrV
	5EgtRpruRVZw/0sb69roe6/ATiMvFvYJHN0qxzbzjDKZRH1Qn/6zueitP0hRtUgMYls514XpWZo
	LwzvAzbI1oPBKB19/d0heskkoi6VKWXHkLg+7SADkLQ66TuKUouLCZ9BnG/stHb1YLfJRgm/9rv
	qS/DFgXBPAb6BzoZKhIplBD66wle1d4HBRueIn/bRex8UFopFlbMw57xEA==
X-Received: by 2002:a05:6871:6005:b0:455:9a0a:f40f with SMTP id
 586e51a60fabf-45905d32498mr9874666fac.12.1785662124236; Sun, 02 Aug 2026
 02:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
 <CAAQKjZN12OSBg+ch+xf+-uO6_Sbrtq-o8AkLdLA3mFQ_ubiLxA@mail.gmail.com>
 <CAJpoHp48cXPLrwvANAt_-D-jE=DcSyodAL=p36kQw3cGtQW_fw@mail.gmail.com> <CAAQKjZM5cY8V_YaZzgF734Brabz=zwRkp2k-+b9CbqS2_Xvi2A@mail.gmail.com>
In-Reply-To: <CAAQKjZM5cY8V_YaZzgF734Brabz=zwRkp2k-+b9CbqS2_Xvi2A@mail.gmail.com>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 2 Aug 2026 11:15:13 +0200
X-Gm-Features: AUfX_mz1aNx58MfilAVRqksW7MpjeaHqifC8P2ZXRQ0TR5zNx84ocL2q9Pi4X1A
Message-ID: <CAJpoHp69qLrMKJvhktAtZBdLuh-fDQvmPYvae2YDsua2EBDZUQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/exynos: DRM encoder improvements for Exynos devices
To: Inki Dae <daeinki@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey Inki,

> Both are trivial, so no need to resend - I will fix them up myself
> while applying the patch.

Thanks for the hints and the help!

Best regards,
Diogo
