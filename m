Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08997425CFC
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Jun 2026 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574247; cv=pass; b=GH5y9ffduQEdfPzO7j2M1kcTKhyf7Lv53dgjI/CFx1xwY7TkraMIuBTIjGKf8w0bqRQH9n2odaf8uQO41QAZBw0YUvVOabjUlxUqTMFGUc8+a3L+v60/kJJRzMBCIgUDGzyiLUA+mHQATWgbVJbgSjgxADWVisi3bDcqiLRlZSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574247; c=relaxed/simple;
	bh=I1IsJZ9VsoHWf+kU/vnao0WS/4NFd54dWmBswkYEDVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nw1NsHLtnQNHhst5hz5JE8w50Hd+gggRKiFsaq7fMGpj34np3A8/6ZOvOh+gOWimEiTNv7DcLGJjHJXwlcQWMcYsGA+ZAgdb3+Wf7qVVuPSuSjLfvKJSQjCQHtMITwikvNuWIzK17Py/C/VcO+BEJ+weF+6ztTF262ve0mQl/vU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hTy7MeMb; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hTy7MeMb"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-beeba001887so84172466b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Jun 2026 04:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780574242; cv=none;
        d=google.com; s=arc-20240605;
        b=Utje20AU5U2PyfLjJHr681r+zJyNzAEpMKWq6f8wCkAhylyU1tnbsJuhd2oLxIEOvJ
         nQSZl8xNAvkVnr05oNlON+xwtpVJAPER3U5ZrEXMjvrFsgjd8cVZdCEnerQhVb1Ce1kT
         pKglZghZppS65cua+iYM5WC73gV3dCEYADkHC5YoSDjnEvdO79Gitv0VqP/nMyc6nXS3
         hd+mFqR/JRDRVOaV9K8RASShfogQbbgx2kM380nYwAVwqxzOVdDcI+lfCXsTt6foVkwR
         S6odw9OtXjS1I7HdVzG0TrAhPTAxm5tlqxuLrBwe8hma4ObuB24e/o36XhVsBBUMBki6
         wZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IyEzb+3XRdRyr37ys5CCQqDn980bHp2Leeui4PMQv/0=;
        fh=zXUbfaH7utWz7OWZY7/0SqwHqVs8euMli+UHPGLrU7I=;
        b=bu3wdoFI8uw+Xv5oW3+kzy+ELEsSdDjZLYKn35LQoCwect0qZZZeE3bCR5kxDpliWf
         QRdq432woS4nrMOSLWmRwBFUAbd7DQdrxxvCmkO7JtolVZAZ2OXHsbYZERlXbH6s17Ul
         wNKXdvPDo6RnchS7ddaY9hlwrDAqEyuWBvnKHZI0+R9JetJrULsnnJzRDbfmPlMX85vC
         wkEwJvzEXMsZ1yp9V7NgpjbzE2WX2sLMacxj2tVIUwaX9KmmE66EVB9tLbrN19er21Dg
         myiWXshfhDJqd1r34hyFYrD3fvlOa4RJUJDFzF8FnrTt6HryYGrs/+iDQmEA+9puwaHs
         KrpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780574242; x=1781179042; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IyEzb+3XRdRyr37ys5CCQqDn980bHp2Leeui4PMQv/0=;
        b=hTy7MeMbnVM3tT14eYkrmRvhzoLBHk6oVol6dlf+voq95pO2jPFQaEZHC+4DaD/HZ0
         PpWMuam0iN2y34grNNjEVPPubmwqGa0GlvFNatE6LGgXpM8IJj+H3w/qnmP/xxP47zUo
         eeas9jBzN9DIJSbUSlD3uthIHkbCOmOVYaVHsuA+qdg57PkOjK31aRlHCh1sejJM23bC
         V5Cm3Kq6HvMkbpqx2txmTwenaMn8x6pdtyzMSPC7D4244mf/sWYRq3aVaFgTqutcPmHn
         bzgAsSc1w8Slxox7+6rJBDwAyU4QylG71APoAMgTvEbOKE2nTvPgw5tFofy2nOmPCGI3
         8b2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780574242; x=1781179042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyEzb+3XRdRyr37ys5CCQqDn980bHp2Leeui4PMQv/0=;
        b=BUAaOAfC7i4wqKMFiFDpJc0d4l2qdQd6pttwszfHnh74z8/iV14ClQYQl2aAbIMV74
         b2sjN7q6j5F047vs7IGWwi7p+UVV7yelGtAlOZr9/psOhCPmDI17t+KPxhO3tmpCaiA7
         ivfCh51yOtoCCPlt4o8CoLlDEat2Uc8q1rABrNvIm7c9OvvfbCFDLAJJEION8Xr68VB6
         M5/+V+mqXf2rhRSBg/7X0zihfscIKxP48g1uHV8SxREHYInHCFdX4tX85Or5RsYvvKgO
         LL9RbXEplOfzs2K9QmBQEovJZv9N/eAz5MF6KbeB77QUEDdwPeIB3u+2+5RA3mZlhdlR
         kiOw==
X-Forwarded-Encrypted: i=1; AFNElJ9LOy8dugvOogcWNDPrjzQiAQxhJH/Faiq/AgBm9h9tuLu1EvzvxbaK6ZzJpXat5WIeiMPq8cqOaNlGnQ9bXOJwbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygmwiTxcr4XG1ZzNMbvJw8cShy30QwOwx+Mpz6OiLZCeIgqtf1
	emVQ+g+gmtPNXX97NPBUSM3TKLVoUEDcBgNZBuM8iiPcZp1hPicWkD/ez3T6cy0PZMBVeUs60Vz
	DbifctKRebdU7R1mDlseDIdoO8YXia5rhvl85DmjEwQ==
X-Gm-Gg: Acq92OFOLuvWIhiTHhZ9n7NeN3ctg4jqZ6w97ZmWjLIUwelG8eiyxep+Zo9KJZzUqd8
	ZJ8Z/cT2bv2ObDN8xKb4DaoQpeiyDkc34gFMYg7s9yZKyZw+ACUUedbGS6nKlvXHyPchj5t2W+y
	jXK7RJEDhqvrpwJpCKk+j4jTKiGPeKJGrTYx22jvobyv8mhXV6vvfetHB9d3Tx5Phr/iOBe4BnB
	wXYJXsqD1swsdwTR1luVN5ZP1bGOm8XBB3qZN9fUgKpXJ0rwFkQmaJfVhqLqdoWLVoIV5xjnMEq
	52hJxx4ZHWZH/yQu09Ty8hHpNBg3eWA0dBaF/9ogOEnfhNL3
X-Received: by 2002:a17:907:cb89:b0:bec:fa92:d370 with SMTP id
 a640c23a62f3a-bf0b32b528bmr439481266b.33.1780574242197; Thu, 04 Jun 2026
 04:57:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org> <20260603-acpm-tmu-v8-3-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-3-0f1810a356e6@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 4 Jun 2026 12:57:10 +0100
X-Gm-Features: AVHnY4KWKy6Zaqr6HchCfbtUy4GGigvt_YXk_Yu2tFv0GUwKJqXP0QbORP7VN80
Message-ID: <CADrjBPrb+3pFPFRnufY+wYvu_d4NH5a0ZXLXEju9HB1=Tc3rVQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, jyescas@google.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 14:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e8218c2749b7..6a8521270daf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23661,6 +23661,14 @@ F:     drivers/clk/samsung/clk-acpm.c
>  F:     drivers/firmware/samsung/exynos-acpm*
>  F:     include/linux/firmware/samsung/exynos-acpm-protocol.h
>
> +SAMSUNG EXYNOS ACPM THERMAL DRIVER
> +M:     Tudor Ambarus <tudor.ambarus@linaro.org>
> +L:     linux-kernel@vger.kernel.org
> +L:     linux-samsung-soc@vger.kernel.org
> +S:     Supported
> +F:     Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> +F:     drivers/thermal/samsung/acpm-tmu.c
> +
>  SAMSUNG EXYNOS MAILBOX DRIVER
>  M:     Tudor Ambarus <tudor.ambarus@linaro.org>
>  L:     linux-kernel@vger.kernel.org
>
> --
> 2.54.0.1013.g208068f2d8-goog
>
