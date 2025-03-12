Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56C923ED71
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 11:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741778695; cv=none; b=B8xIUmD31pBD5txB9U9oVmq4VobsMOmrGYPv3Y563XLVY2DaPRYzeR0SGyaIKui0wWyx67aswCVycwYDhOkgypP25siJRxVwX8PYfTcSA56jrDoZZkhFkxP90M47L7nxhSfD5L/Bae3t1nBJd3VLG9ZQcFje/NqgV3ywOgNVWJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741778695; c=relaxed/simple;
	bh=UcXaR+GDawWoQaNRuFtyapQxtDjf/bEMrcOSC2FkQ1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMElBVcOZg1o53hMg0cAGHaqkoasNJVz8KsUpTE9Tzaxgt0F1h2NItK+6A+NfSfezGspf8ggxZZ1FGY4XBD+Wc8rIzHEOZEW2keoG6K2KxlDQBZuy/v/BVFK8yiYce+GbsPmOhmEnzRFH+nKxuUVFtc6aWU7LDOarjTKwLZcnAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tY4m9qUC; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tY4m9qUC"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6feab7c5f96so54045487b3.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 04:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778692; x=1742383492; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7OnDqzR6YtSLwONQoTdDT31SC3+7fyj7xPsRU2pi+G4=;
        b=tY4m9qUC71QAzCkvtu+FlH3ht9gu/SOiEZ3r+On8JHrv6xL+cPGeBd0HEpK2nbM4Al
         A4bAIBRyHsRzBWf41VdzD0IH8KsP9RyUNlmz0jLe9dK2QTNHcvniOQFmMZQsexYGsYOn
         pPPj0gVZTgM5BQvM4HgpNkrSfF6Z+iOISHwWNpZb2BwxF3Xm0P+gnTsimpUYNgjg9pAV
         RNZqPejxRdlNhPwK4Z9vNgMg/1DbC5uqwHjBrN7oCzVFoBCZT8/5SR6oTk9u0FSTPEQk
         9r1vDJeb2se0lcbh2yo42KYBXPchoTxqECASTWBNK6gZVjUsWl2YNtWHCyPoSxXRI8Ql
         /BAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778693; x=1742383493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7OnDqzR6YtSLwONQoTdDT31SC3+7fyj7xPsRU2pi+G4=;
        b=CTs0YEdpOkmtXeXY/+88u8TRrJIO+GL7imgyAJkorSzDaIn6o/N94kiid0lKEsG3Q6
         1kqdAKYkNynMtfno3D1m6SF3Km+facte90KHnW4/PsQyWRgcZSUul9FxKqD5wR7xkrwA
         glISHRxxLXzS23BNpO+LaRbdbgVVy7kdbiVkIZeJU1/YCgYO0kEbXl/okCOuciLgsyp1
         a+SOYqWydxJUDq4ywKGTyaki/3x5pFT8bg8vFGAyHxx1uqJbyLyjEyqLPkTxc5IPmfRQ
         wXJ4Rv9KMVJvBzdq05nzI9GejOwhk1ozxEOsHO9jij2xEhFfc0OlwoS1pGKSohh7rT49
         7cwg==
X-Forwarded-Encrypted: i=1; AJvYcCVJdXB3ZfzWS8GcGn378t8hWmouC6JhZjJ/Q2JY+MWBS9wa/yqEuUrkcFUn/rg36lzjGH0ap5AE/PTHiAtfqIu0Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZnRgFWjOb1aP3Hj5XptMk2jNY8rhJimfl/7KR6ZOwkAdf+YtX
	lX7HErxjcYuQxH45YW56x8KGZUaJZ8UCLIbSUzqnvOYDDmnyOwGYNmwKq83mFmj49qOYAweKARQ
	7U5gTY8q+hI+L+qsqIVDAjCo1HhFA8XoBOnRkwg==
X-Gm-Gg: ASbGncvE8fMkeSWj53GXvTLUDDv37Uf6BQErrK0Okxgi5l7lXUUmF+o+0zkYIpoCl9x
	AOmjxA8fBw1eAGrUs+D18Ecb8qPmVDur1Eb1X+GrquwtRPrl6hDeBaL+wWhDzo5UVtwXQGjyyqt
	6a6fTLykEUR0Fh4CpZ58TEpZHIAPo=
X-Google-Smtp-Source: AGHT+IHIrYfmo2j3yVIIaYFZE5oDvK+hQZ8/RGWocwnTto9a3k4qtBGozDsAeCNABMZLWFLC8+SYFjOJXfUQHYTuZMU=
X-Received: by 2002:a05:690c:3612:b0:6ee:8363:96d3 with SMTP id
 00721157ae682-6febf3ade28mr290798997b3.27.1741778692704; Wed, 12 Mar 2025
 04:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org>
In-Reply-To: <20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:24:16 +0100
X-Gm-Features: AQ5f1JruelnoNSp1FLqFV_ATP8uAM2_7A2P1q-OWLObav93kN6mUQJG3IRna_fc
Message-ID: <CAPDyKFrmn21xksS6Co9AjLQbtq_EWC8WF=r3RSAc6nfWTT9-zA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Introduce DW MMC support for Exynos7870
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Feb 2025 at 19:48, Kaustabh Chakraborty
<kauschluss@disroot.org> wrote:
>
> This series adds support for SMU and non-SMU variants of Exynos7870 DW
> MMC controllers.
>
> Some DW MMC controllers require two 32-bit r/w from a 64-bit FIFO,
> the series implements that feature as well.
>
> This patch series is a part of Exynos7870 upstreaming.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

The series applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v2:
> - Take over ownership of patches by the co-author, upon their request.
> - Link to v1: https://lore.kernel.org/r/20250204-exynos7870-mmc-v1-0-c87cfc72be4a@disroot.org
>
> ---
> Kaustabh Chakraborty (3):
>       dt-bindings: mmc: samsung,exynos-dw-mshc: add exynos7870 support
>       mmc: dw_mmc: add a quirk for accessing 64-bit FIFOs in two halves
>       mmc: dw_mmc: add exynos7870 DW MMC support
>
>  .../bindings/mmc/samsung,exynos-dw-mshc.yaml       |  2 +
>  drivers/mmc/host/dw_mmc-exynos.c                   | 41 +++++++++-
>  drivers/mmc/host/dw_mmc.c                          | 94 +++++++++++++++++++++-
>  drivers/mmc/host/dw_mmc.h                          | 27 +++++++
>  4 files changed, 161 insertions(+), 3 deletions(-)
> ---
> base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
> change-id: 20250203-exynos7870-mmc-75bac583c864
>
> Best regards,
> --
> Kaustabh Chakraborty <kauschluss@disroot.org>
>
