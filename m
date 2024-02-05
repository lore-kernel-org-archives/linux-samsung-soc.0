Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA3722F11
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 14:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707144939; cv=none; b=J9lhd/3tmEbmIGphuhFyeQy3C1xUZ9RsT2ObMrkvkvT5ePk/Uk7h5pzI6GvSfdduQwm2lwcGKO2Gm2ZoQbDNXXcSk/WXxI5YIyFl/yrOXPBmLbcK6P4qVCN7y5bUwIcyG4VGm5ePU8gWGef+fg1zmOGfBjXBNCuwIkgzVEqYixs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707144939; c=relaxed/simple;
	bh=prtwngRjSPswBsLKpAV13nwxdPeqSc9QYwUzmebLdkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYPgZEBnYdv0JXQnNBL2z7QKUaVEYNSQwFerPe1B3z+9CMuc8yjmz8NGiTjHs2mZnsZgJNgewtS1ag3iyUBSpEZOSY6QJzYFJZo5HZY6QjAATFKom+g0ky+nbY0akdHGizOchCf6gDbeNdYT9eZ7fSIfY7ExNAM1NYQHiO/tOZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ijtDirDU; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ijtDirDU"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-68c37bf73aaso21686376d6.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Feb 2024 06:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707144936; x=1707749736; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CV8zCL+Bkb52zUIjr4j2G2uqbzJyX+oUu0mInR3Ynbs=;
        b=ijtDirDUfgy9jKEZXCEtluOntzfHq1Fii6PLOAcwoxSe+c/+O2NF6JCoJYX+6DzY/m
         lpxeFnnmgvNkjhYlGIWSLpasaOC73ThyklLpbdjruW3f6WuMsXD0BVw2BBfMoS4a1JQ+
         oY5PO1n/Voqwm0NUoLk9u2rxreUGDxtIlxQ+TtzI6bzqC+/Qy9NuwUsLGYw44fDs/gPT
         ypf5cmV7d0buEHB6ZHKNoq7P8vTH3YUexwyUeR6WjG4moT2D0kGksW48K3yjYfnlKZrV
         H0QBTi6b/UaRV5EdIi0d7Z5GcS04CGisUWMyIMuPAXKaL5hGdZNnoZ2K/rxr8+CXHisY
         OHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707144936; x=1707749736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CV8zCL+Bkb52zUIjr4j2G2uqbzJyX+oUu0mInR3Ynbs=;
        b=c9lk5oa1IYVHvHSsYynbVLdeZTzTCtyoIS6UnI14lGnNXw8NPd/PaqMtkjh9VoiKpn
         K1vNxP9YZAQ6s5W/lXDXprPNmd2BoTYsDpxVgduW1JtEb0v+5VzgJjOCtS7NHzVeH4C7
         hxKtNodW1V87iNU86riHayk//3PM/bQ0g3XTDx27swAENnghAF0idLC8XCwlbE8pL7oT
         KDxzpBRtNKJRc6+rXfhku7+MQG1idSHmFxlbSDKbxtJrzCoi5HSZluCwWxx3RU5jXSRV
         q0XFLosbv+e4U5BjrBbS+8/jIqLFGiUXdD4fJrmn4LA0QmliS/0lzNwDFePIxALcPgP9
         MbiA==
X-Gm-Message-State: AOJu0YxiQh6TcahlrvWUJm49GtCu/Aw80mSQEZuvkDYdW1UcUOXRZrEv
	6ZtQyb9YSMmVSTbMd9JJXkZpGGrCV5e2086rAUKQmw5bB+/+AOANV+Cls0vQUSmexZO93iImO9e
	MpNR31Qas3LLDW4XVAMYUUu/XOOTCLo7+BklqXg==
X-Google-Smtp-Source: AGHT+IEGp95NgA3KvvkrXtsGjbN9gYfgN+bbfNs43Bva/sB71VU1nC4hj1ROtBypVVcdI/bxwL8OmPrLT5ov+2vR+ac=
X-Received: by 2002:a05:6214:daf:b0:685:6715:9693 with SMTP id
 h15-20020a0562140daf00b0068567159693mr8173405qvh.8.1707144935887; Mon, 05 Feb
 2024 06:55:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201172224.574238-1-alexey.klimov@linaro.org> <20240201172224.574238-3-alexey.klimov@linaro.org>
In-Reply-To: <20240201172224.574238-3-alexey.klimov@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 5 Feb 2024 14:55:24 +0000
Message-ID: <CADrjBPrEL-4DqMX-MnzTO7f3=gWnwrWrDSuXCOt0ugkhDUNV=g@mail.gmail.com>
Subject: Re: [PATCH 3/4] soc: samsung: exynos-chipid: add Google Tensor gs101
 SoC support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	linux-samsung-soc@vger.kernel.org, semen.protsenko@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, klimov.linux@gmail.com, kernel-team@android.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Feb 2024 at 17:22, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Add GS101 information to soc_ids table and related entries to other
> places. This SoC product id is "0x09845000".
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>



>  drivers/soc/samsung/exynos-chipid.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> index b1118d37779e..7fee6094db12 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -60,6 +60,8 @@ static const struct exynos_soc_id {
>         { "EXYNOS850", 0xE3830000 },
>         { "EXYNOSAUTOV9", 0xAAA80000 },
>         { "EXYNOSAUTOV920", 0x0A920000 },
> +       /* Compatible with: google,gs101-chipid */
> +       { "GS101", 0x09845000 },
>  };
>
>  static const char *product_id_to_soc_id(unsigned int product_id)
> @@ -178,8 +180,17 @@ static const struct exynos_chipid_variant exynos850_chipid_drv_data = {
>         .sub_rev_shift  = 16,
>  };
>
> +static const struct exynos_chipid_variant gs101_chipid_drv_data = {
> +       .rev_reg        = 0x10,
> +       .main_rev_shift = 0,
> +       .sub_rev_shift  = 16,
> +};
> +
>  static const struct of_device_id exynos_chipid_of_device_ids[] = {
>         {
> +               .compatible     = "google,gs101-chipid",
> +               .data           = &gs101_chipid_drv_data,
> +       }, {
>                 .compatible     = "samsung,exynos4210-chipid",
>                 .data           = &exynos4210_chipid_drv_data,
>         }, {
> --
> 2.43.0
>
