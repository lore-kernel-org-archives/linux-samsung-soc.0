Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EB01C84D0
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Jun 2026 01:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781401016; cv=pass; b=j1cPUplGfOie+plfIWpnbZX4rVgOdh8VOPUXCJbBkP5jz+ZzVtyDgHjKMmR07SG+Bvphpc6QvKSlGnjGUa5tWcBPlgbY8C1GrcDlu+dJKtbDDoghD6W9H5WFnxCp05S/f7fzZ0VT2kYZZOLvQyeoeEN+cUWOTJGWZMKLjwBXKUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781401016; c=relaxed/simple;
	bh=tFndD4xhU6TM1v7geR2uc3Y5I7UDLVFeRXl5ob/r77w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2v9mGQlBE6bt0VcYkID2uLnpKgYd04qUz2wEWmyxqg4qcgHYlj8fW8NUcKWF7Uv77LZx7qZPJp1F+8SMt2aFjebcqt1V5/m5cteO+8au7nTdW26BNgmn024/brbV/Atdity6FeJzet+GaHSE2HRj0X8VFOAl+v4YjaN+kBo71o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lq7oVhaT; arc=pass smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lq7oVhaT"
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-8ccea53f35cso27465736d6.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2026 18:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781401014; cv=none;
        d=google.com; s=arc-20240605;
        b=eaQLq6wstkGjcYGPqG5vqHDr2uL0JC4c3cj0JYAnd4ZDPrLlZ0al5eX6pDjSve1cwN
         uXDNMszDO9PhZVLb3Hp4gxFDOSyQigmBTGxmx8kjAp6wgS3M646pUCUPm3G6Pj968UE+
         d66uqaHMPnJb+SVeJ1zussm7Op4dx1nKId87atb/U0gmEKNYDA829zKivvGaGQWr0Tsd
         Q0D3wTkK20PZKo+bx7jPUBtcCWnGr3c79gG3hIbfa3qk4QvkMzrGL4pJAOF43va7wwOC
         z6zd/2jMomsTvdT0w3mvd6Hz8BldV16oDuDG5jBGzjExLbEtf+KYee3m3g7esdN2Wwyx
         h7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n5fB2rVLAd0NOe06dMOPUowfvJcEsGLFODQSz7k5AdA=;
        fh=GjBCi8iRWYH2bs33IRxRqb1P0xhhdGTERgiaOPDAe2U=;
        b=hYY6pRGgIW5oVaQQ5h0qJJX6TYoqgmqxXp728rvjfH3UFwdJ1YXH57CRfTbWTIf60K
         ETyVkhTvY4p2gC4FOprJjmqf+U4aUoelEeMBloAtHk1NjfFMWlEOZe5hWUBZ+VsvUpLF
         D58eDzS4fEmaeVmRMUYRNd2RAaDTzkCikaGd8C8wPGMzgQHdEnCfBteXjwEJBej9LOkY
         d/fpJ1t4tq4olXkSqHuoQJrteviHJWcyH5eW7iQSNrL0TiySuya2U80TcDRE/8SwyVg6
         0A1uGobYr+XooLn+8RjxywQMo0tanDKihxV2XOghFFE8ejcQX7yaanHD9LCoBgE8lOv4
         pE1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781401014; x=1782005814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5fB2rVLAd0NOe06dMOPUowfvJcEsGLFODQSz7k5AdA=;
        b=Lq7oVhaTp3shuBcI4FV6IeeDy07NOxFCQMIkoGPSGZeQzsGeivts5YzYdZEpdeKbHE
         Rp5o0/Ea9UVbIOq2i5UpJUYQwfOR2eL3py3INDf3ehftrLru5P1SSJT+m0NEKgiE5lSb
         qygXvVB9s9z5Dy+Jv6vKD0MzQifxhiD1QFFzKnnzWrtI2STMWtiOdRn69JThiroCAK9y
         0F5zxy8AuLjGi3PadroDCALDPRoqUWr7PMTn7NrOzEhJ54ycQ6E9PvvR6lo4d+BGQ/xx
         PyNYvHicEtxYgPtEuoRWq2i9didX+FNncszBaLzr6C+Vm1pm04Avkrnt898J7W2sYfte
         onEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781401014; x=1782005814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n5fB2rVLAd0NOe06dMOPUowfvJcEsGLFODQSz7k5AdA=;
        b=q7oO3yl0EeE7y7XuvxuGeJbk3alG6wsI+qYpPESy1CXwfwh774wlWmw8JCkiJM+rC3
         Xgp40eo3MbFIMzMh3FZKPPZTcXY7BOCIoe9E0z5F5Vdh4cCG2tihEC+jCrWisFCE/69t
         wae/c7MQrmYSKhJ+5q28p81fW9mDyfkjBBZGY3ainQH/m2FOF84PDoR9SHuBbj3Pi18h
         7oQuGVQTnhIshfCpPkUoMxCSDn8vskL3yY//kFZ2acTnSalWATQmPK1fr5OuVL2wytLb
         liK/EosvZ/7mMCyFeH9hGb2pKFZp0Jzui+uEuNcqin7vIDUDRnacJfnNsYSbRyGE8px/
         4m0A==
X-Forwarded-Encrypted: i=1; AFNElJ8MgxS2aqafPG41wNDOaKTE5tEgnoBIJpw6y4IanrirEJZcnnFlqYpuIkGOvfHebkOjlfYJ6cTQ6YjCj/VsFQ8vEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySPXWCeLh4FPkuJJthFBOtM4w3EG/5dei/KmIxK32zl/Bj6f6o
	lJVt1F3FwFlGdJm6BMShM0g+gblsooF11+nQXiDL4NccM6mItiYD6667KlzKWVHQ6AQebBRUDMV
	vN+5zxKTcjF3JYdyrOIIGCiIiS5w/w4+m7pdw
X-Gm-Gg: Acq92OELbOuJzejGIN3LvtDbadGALjc6EBw3ktZIOyJbUaVrZKoEIK+mKqX8cjDYVPA
	jHezEgTpaQDwuo2dxnQf2FvH+hhlKU5tmICJBWJx2QN4hJ5rpCM63dsB5HxSAOgFupq7/HEwyWT
	Il5tx2H5ON/m7yeMk3/xj6qbgC6kNm2Z2arLfq85ffCUCA4uE2ji3Gsbe2yVEe2pq0KOvLd0UTl
	SBgotoK1LnUuyv9vKOBbmySzY9O5Fz5w/GZ2t88uuBDWmIe3m4vMa45rzIcQaPiSMKj6mKXu/Rx
	CcRIKFxF4fg9vyi0aDnURpiMV0D9VD67rEIYQIjbiPHQUSmYDBL1uAllAuNo5gxJ4rWB0g==
X-Received: by 2002:a05:622a:1456:b0:517:6550:2a0 with SMTP id
 d75a77b69052e-5195338b5edmr85745681cf.19.1781401014088; Sat, 13 Jun 2026
 18:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613223648.119694-1-enelsonmoore@gmail.com> <20260614005044.GA1808@sol>
In-Reply-To: <20260614005044.GA1808@sol>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 13 Jun 2026 18:36:43 -0700
X-Gm-Features: AVVi8CepR6jF4mFfkqqK9wY4g4xLO3th8OtglCBTM-sf5Kca7lHFvKNbbL4gNGA
Message-ID: <CADkSEUiZHbSGi=Fp4u5dNxZDrXnFpk3WK86JMd+oU5z2CEO19A@mail.gmail.com>
Subject: Re: [PATCH] crypto: s5p-sss - correct CONFIG_CRYPTO_DEV_EXYNOS_RNG
 macro name in comment
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Eric,

On Sat, Jun 13, 2026 at 5:52=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
> CONFIG_CRYPTO_DEV_EXYNOS_RNG was already removed by
> https://lore.kernel.org/linux-crypto/20260531175932.32171-1-ebiggers@kern=
el.org/

Thanks for letting me know.

> I didn't want to touch this comment which is nonsense anyway.  But if
> you're going to try to update it, it should be updated to correctly
> explain that the driver is working around broken devicetree bindings.

Yes, that comment definitely needs rewriting - I had no idea that is
what it is referring to.

Ethan
