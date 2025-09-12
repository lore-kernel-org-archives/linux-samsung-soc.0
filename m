Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5025B301026
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757683129; cv=none; b=gSUG9dTEphMpNIDoG1lxhDC99/DDogOOz8NXYPHkFJ8lfa2mxNKi9+iZKiswYZFBuabcIiv9ZX5E3gaEdAeVQC563x8dQWOFVlWrfVEPFgtgHxI/ebSA5Pe0Pp/LjqdcPlBfE+B2/+WApfXNjOv2dlLzjrQEq9BrzQRrScCRneo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757683129; c=relaxed/simple;
	bh=oeww4Ivx5YThdAfSYdbOCn1Gj1LUFzN/W4lJGwFtW3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AEKZte6OQxHqYKHcEP3D8ufXTlj+SZIavwoLm6VsVQy5AteWJx9Kx717GMyrhQQ1cR0IKUt6Pk5EDlh7cA4GYz6rZLcNKFvRKc1gs1TNrXdPoja7JzKUvbSPv6H4xGXzv5r7UYYvGZ3KQvP44EEjqdkWhg23hqMVd3eP9U6pLPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XaqoIiBN; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XaqoIiBN"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-62192ee029dso375069eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 06:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757683125; x=1758287925; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oeww4Ivx5YThdAfSYdbOCn1Gj1LUFzN/W4lJGwFtW3A=;
        b=XaqoIiBNSrrR2zrG++Bsaoq01VFgfEBGxJ+ysCJftMjj0hrGwBUazuS8iGMytsu/8+
         lTgSxMhEpFJuwhmEn1BH4LoZXb+4OVkBjrOwayy1oNBLRD3QvKof5X70wP0OE6BjrqAj
         Pyj/o9cUfpERUcSu749OXC2u09WfqzBhvJ8fwOUlATiCOTXxW+yURv9ck5QljCIWUDlT
         awKwsMPlCDb510+qlAr2M0LZepenW4WnUIhkOS2NvH2+pk75XlcNBAMYZYa/bEe7rdFK
         5Tpb8/xdAjXOZg4wYnwQDriqs9vJ9EZVUKb3ZqzkWdffm5cyc3VdJkVI3Ej7E8vDnMw4
         uItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757683125; x=1758287925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeww4Ivx5YThdAfSYdbOCn1Gj1LUFzN/W4lJGwFtW3A=;
        b=SJ2gKqrnUwrGIoz+XIoYSDcVX0VC+0Wo2OHntRICQ6C5snwApJy/xr2GLxoeyKhaBH
         Nc71KsTTjEZpaHXu64WTPR9jDVAvAsksTdLp/gx5ESRfF3ipLgGDpRjXBLVwnLFWUXLq
         fJMjFxKJjMDWCuKFFfc9whYHGGcaM+dUJRG/CPg2/fkSde9VeY9VF4wblM6h9QF+tRwm
         itcC1i0OsvZAwQxTb5pP6dA2fV2NWQtMMiuy+JakerFHi3MiNuQhRewv5yyZBt8uTZkM
         Im9UxGtXise2X74RhAnZkH0Wovg08dCXLYCpnsvEA3TcbENQEzkm7IVywRptAnKPi15u
         wALQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcWIYLH7NmQdgPRLb2e6QRy7xWq68SuialFyJei/MvCBE/dY8/es58tGS4tCJ7P6EiSTL8Rhkjnj/lpGCQM0zaCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdTnnCscoG7sRKJ1nsGWbW0SZ7A/Y1M+ePz/hGW5jV2iwwG540
	zIsoDiSwjynw/AQfpPjyqK7bBDMG2UrL/MBXO/wkAxN51qvuVGFAeg2DFvgMEINcQuQWXMM9f+Y
	3+nsz+BwTtsPMn7CrwTwuN+f0AxWam6GYYTwq1jD5JQ==
X-Gm-Gg: ASbGnct9bbDBzDWQ7hgXz1bP8FuuR77ga6OQLJ230O3rpp7krDVlHBznwVvCwaOB1WG
	lNKwHlBOTjRloUpWdMMtFtuHLBssRPgahfNd7Pgd5/ZFdSPh5hK4spu33Odnhs3MwkxsTLFqJhU
	IGllFLmSj0RWnTPRlun2nGUMIJWvKixyIKpmUdcqMKjrS7b/eRZAVFbgyFT4YKy47+dV/MWTCvC
	rjDZZs=
X-Google-Smtp-Source: AGHT+IGfSaVuijaDjlm+oIKN2iiydfgKjK+5YsMgIZmmXxQ/CONJDi7ONHUL/Qm+aJ4qj0ySkZLSHpb1XTjKs2wTKXo=
X-Received: by 2002:a05:6871:154:b0:322:4639:f3a0 with SMTP id
 586e51a60fabf-32e53e60589mr1203923fac.9.1757683125291; Fri, 12 Sep 2025
 06:18:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250907202752.3613183-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250907202752.3613183-1-alok.a.tiwari@oracle.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 12 Sep 2025 14:18:34 +0100
X-Gm-Features: Ac12FXyFWdruiBB0gYT4kEG-HddeFzWWyfMX32BSCDTTl49jpBagppTHhtL-eME
Message-ID: <CADrjBPoByCUtKLR193QpfMv+1VTspq1s8Mzm4dzLCUai8P30Tg@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: exynos: correct sync pattern mask timing comment
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: alim.akhtar@samsung.com, krzk@kernel.org, martin.petersen@oracle.com, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 7 Sept 2025 at 21:27, Alok Tiwari <alok.a.tiwari@oracle.com> wrote:
>
> Fix the comment for SYNC_LEN_G2 in exynos_ufs_config_sync_pattern_mask().
> The actual value is 40us, not 44us, matching the configured mask timing.
> This change improves code clarity and avoids potential confusion for
> readers and maintainers.
>
> No functional changes.
>
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
