Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF174181339
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099746; cv=none; b=ZYNMlaR7Cp7mUqbrQyCkTFSsUm4HYrMaAhqS5umcoVYFSTgwcKk/C0fwDL29QDqdHYPAaukI9M4nHIKYGlFh/QFUY4+0CgxQVMgDzeVwPXYee1lRjVBZhf4ADah62KTtyxAnq9rZbO25fQgxuArrpm372Lh2PakpQ/uPSIXg3Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099746; c=relaxed/simple;
	bh=XerfGCvQBLxAD+jV7USIjvv0r3O3fMyoQLRDmfzroSE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:Content-Type:
	 MIME-Version; b=cOoGfGiv7Z+CRmfeVvi1XUZlBUIiHycPU95AQTw8wy3oWUPmnmRYcJTJd/Zvjht5ko3DpNRmvTuY96Lzd6N2HrmrXIFgPMmgzCGarUz34Rc5SJUNSHYDxFeyewJKmv/tFkL9u8CREnIt2i0WDUIgB6nHWiLu5NEyOkLg+f2A+2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a0AsDGEz; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a0AsDGEz"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51ef64d051bso2688315e87.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2024 09:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715099743; x=1715704543; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:in-reply-to:date
         :cc:to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3b3JcB4jVVvpbe94/7RIYBwM5yodY4uezn7CZ5MUGh8=;
        b=a0AsDGEzQKmAzk0PcrXByRi7ywHDwGNfvp2B8De+nAwgQrQaR7WTWOQpYeIhy2ar9O
         9VWLrdDSiKnwW7zoyVU2w4dijzFfCWkxXKC+lx+QkfLjdFWgEOkvMU/NFvVUalWpy7Od
         WHWIBKKIMD3HBy+b2HCFW1xJY7rYwJ8NsCoGiT57vAd/XVImQAVeI16OavYt4ME/F6Iw
         6AUoGbO9Myh73Ol/AzudaG+iAFC2C1kNw+1dA+eNr1nT1hB1w9vIQ1ryvQh5itvlMu49
         unue9UI0iYDUIr6o/3Vjdx3MrFbjrlxEW9l+i3X0hlDnZSA3Foy3PK4E9t3VQEIRwlYW
         SyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099743; x=1715704543;
        h=mime-version:user-agent:content-transfer-encoding:in-reply-to:date
         :cc:to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3b3JcB4jVVvpbe94/7RIYBwM5yodY4uezn7CZ5MUGh8=;
        b=dNqVW08etuA5cI/ywqt4sPgmGo6Etjj13SAzFEV0eXz89g/h+Lec9SN6VXMf25rZo0
         aeNtqw4p3tVOo+ZpqR4TgRExODED+LInOr5UMBzwTSqOmRCOgWAxechAFRZA7njKRJjF
         VOaJHhqKsIzdiQIClmJ5v+f8Sx8MBFqZMtcU2DpOkqRqoJigs8uXXlPxDvRR2Z3kXpvw
         +NODXycIbkAwxE/XzR8/5LyPZ+qPgXmZhXzBir6OqwQEaxVSLoRwLmkERmHfXJISC4oC
         A9qDc4iWAcIrfOtuNu58pLxbqjftVOQbZUL5/ixevd363uanissgWZiorn5KpUq7pPQF
         fagQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxotlp2SQ0zQ9YS83VcI/kPvdkNSobxYzx+RhaBuv0AV8vIuwwVhq+4ZCOlbLx/z7JvCMhHcGRmw7vzaSmIB5eAV+aQk4zlCNjxTfdOTfpowk=
X-Gm-Message-State: AOJu0Yxnb3+NXuAYUYz/mCFAp4an/IRY2v7BRGOdTdCk43iBSb8T8Qx2
	XhU0joSawEGFh6XEMzmKbRFr+5ZuhehWKmokGSRL/AKDpIm9YqUEj3dt83yhxJc=
X-Google-Smtp-Source: AGHT+IHX7X1gVehuBdCEcnWbVY0I6JH8hCJ94H9IbdJ4fwiaepF1483cylE+qjfHRu/AM5LH7a5Q1Q==
X-Received: by 2002:a05:6512:3ec:b0:51e:25d2:453f with SMTP id 2adb3069b0e04-5217cd48db1mr23279e87.68.1715099742895;
        Tue, 07 May 2024 09:35:42 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id g1-20020a5d6981000000b0034d8b0b5329sm13288792wru.87.2024.05.07.09.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:35:42 -0700 (PDT)
Message-ID: <d6b694cdfc1db1abf230e546453d55248a0fb439.camel@linaro.org>
Subject: Re: [PATCH] clk: samsung: Don't register clkdev lookup for the
 fixed rate clocks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: m.szyprowski@samsung.com
Cc: alim.akhtar@samsung.com, cw00.choi@samsung.com, krzk@kernel.org, 
	linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	mturquette@baylibre.com, s.nawrocki@samsung.com, sboyd@kernel.org
Date: Tue, 07 May 2024 17:35:41 +0100
In-Reply-To: <20240507065317.3214186-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

> Commit 4d11c62ca8d7 ("clkdev: report over-sized strings when creating
> clkdev entries") revealed that clock lookup is registered for all fixed
> clocks. The mentioned commit added a check if the registered name is not
> too long. This fails for some clocks registered for Exynos542x SoCs famil=
y.
> This lookup is a left-over from early common clock framework days, not
> really needed nowadays, so remove it to avoid further issues.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Here is the fix for the mentioned 4d11c62ca8d7 commit, which fixes
> booting of Exynos542x SoCs:
> https://lore.kernel.org/all/20240507064434.3213933-1-m.szyprowski@samsung=
.com/
>=20
> This change is independent fix. I've tested it on all Exynos based boards
> I have in my test lab. It would be great if someone could test it on
> s3c64xx and s3c24xx based boards.
> ---
>  drivers/clk/samsung/clk.c | 9 ---------
>  1 file changed, 9 deletions(-)

I've boot tested this on gs101 / Pixel6, which now completes again successf=
ully on
this Exynos-based SoC.

Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
