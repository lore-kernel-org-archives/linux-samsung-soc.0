Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5374DE703
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2026 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952237; cv=pass; b=U53Ntb0sksI4zxUL5dTbCxIjP2jZngtj8qQ418vz5LH/Gxrbvt2peTAXu5+3U/9ohWvjgVIWwOuowGmqdtKIoG6A+pKDsxDNxHQ9hhsI42u26zGZ9WQ9n2FUHFHtJV8ipH3cEb3vZQ9iSU+0JdWzZru6DepO0PbXbukvn314b00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952237; c=relaxed/simple;
	bh=ciy5AYs5s8nztyVhIOwmEsvrjTLJIlrAEhcvpdlNER8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nCEXweJFUi09fwzQEVoZrD++pvdkPfJ03Kb5U9XxgaBOyuDtykDB7KsvrbxZLKoGO5ASp6Aw/zvq1MTCZfIMOpozIv404iwoocWdgVLzpYPqGUafjvZjpllcYVC5NO/VHfoOEHLxyShUgzL4HV/wj7qGlgRO58Hm8UaS/zb9Cf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uCF3L400; arc=pass smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uCF3L400"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78564313adaso2341333137.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Oct 2026 07:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790952222; cv=none;
        d=google.com; s=arc-20260327;
        b=FkJmBBBwvFIOkq/7qD54n7Ke8QwsdlE/8jfiRMr8IWgOocoCCFinmTzcwhh92sKtbF
         HQxMYa6bFoUotB7K/IQGfcpazTUssbsaUzmPDuBZEWrwYIY0E5Cvh2ARxkWQMeml3IPT
         enn2Ziw4tDpiXIslVyNhuHelWjFFOK25G2+Boac+5LWzcgV58tiWccHrD2NfMdkKQz/L
         ecU3mL9HCEQ1q7CQvrR4zXG6RaK0jv5dAIm+T3/WebP1mDtk6lp1Mg0ZxFiSP7BF94rG
         I8vZ06BKeWDniOAxjX4JVEWfT7RQF+xPM2faq46k+aBlJO8J50S+B3SDNGRU45bqG5x6
         c5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=;
        fh=MYX4mrISKxsrhKeUkB7IeUwZTDVCWtZWjmstmy9fBHk=;
        b=SqdjIrCV/bKB3dlT3CuYWuGBqNpMPjhaoSKGOTIg1+BL+C33oqPe/1y79na+KirBk4
         xzMiydJlOOoVr43rUM/NjdM5EdClJd77optxNPV81cnMd1O1lBb7GTmODlob0NcJ3zG1
         nQW9FCuOw3wRn2b0WivFEkojEa+ci/4PSTW3f/ZDrHORVAFUkBKVb5nuFqTDOf5DWcyN
         h2DQtlauiqMvvve0ZxiSG2bM5Vm1uVO1iG7mvtLMSvW4yrVdCdILUoZxWPLt5HAkci1Z
         G5w9oCoPIn+gBgTObeYYD99gIFmLldXL3zCOQIc0aU4wUDG0ikRCYRIJmMpX9MGgrZ+Y
         XEPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790952222; x=1791557022; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=;
        b=uCF3L400Mw41pP+ID6dTCrQn/Ou4FPEJbBHdeII18Hoz2k1k4rre1rJFIAO6bUlwre
         z6gRPhTpXcPlz3nq0557AFvFh64IkDhE8gu0hkTjEtYc2AALo8ve7aHeBWZgT9kS+qGm
         Aahd4jObOdGpUC05G+dt5DQuF+dhHOuKKmZ6W24WpocQRINW+cTk76pKa47/8kSJj8hq
         vlvzoyk+5wxSfN4jV0Sl34fdQ36egSdDouJplkpNq5THjyyVeVWZqvL8by+BiUPNF7Xw
         3PiJS7vaaBE6zz6Q9K+202iOt1HVPlA/GK7GXLGJs75ihgepxby2XEeWJJsV23G3G3Nd
         ThfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952222; x=1791557022;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=;
        b=YnElxvhE69GZUbUDY6DqA5CPgPFImDXk+BU4lmDKAzwg18thV+avNSqMG4Z1JE/OcM
         SbwNfgWXc90TdF++12SQPjsBytJe3H0/fDGmApm55KZtQxE2GG9YFtzyH+d0rivkdWui
         GkJe0QVUmYVz69K2vq0/486VAakFJnVxhXnoeMAPbdpbL9zxp7IiaoglWLh8eDXmxsEO
         DDwudGOkq+w7poMdO2wOcfN/KuiFrbyTnbp61gA0uvEn8Gi77Wj4R4vwhty+Gq5+3/Wr
         fVdIvyQ1/YSaZJlN95L+ElmBzGXA3+rPmBXBi4ZzAj6Fr4T5XTzER+4BUVP9Mhh4OIJu
         w8Cg==
X-Forwarded-Encrypted: i=1; AKwUvBzeLh55LZ5eCSgKvGKpGUWRY9x50xC7qTT1GbhDJjXDuguu8cMMGk0UUyBUW1fjjxCkGTxB5rvVlKnA3/GJchFFAg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIIL/PuWWOiyhkTTAzxsrX/62qpig7Lba3hEfLgIunc9Ve7vCrI
	t7grkHBF3A5rsRwkv902+20cTN6pI2hWNGEqSnrHG/MrGojHAh7cXN7XFMfXJQ/7Vp+j4eiJwE7
	Yq0QOWQYcfne4XWt5dRAAepcnW22+MC5U3t1f2fAU/g==
X-Gm-Gg: AYBFou3a8O8Rp0jf8G098MWs9zOgFACldmHqgm7xbG3KHhfSa+qBgDd1mUfa7J0O+Hf
	nw7tUPF8/W4nOs2BRpivkcshnlRzzuvOhH6/zQHrK7pZTacibAN0zFRy2v3oKgDB60aczQvsOcf
	J/Poar4wPP2uQV9PjqO5kiwCdZ7XNqo30JGvXibPbmigaMBk26zjBMGCkH0wXiXsPIoiDjm3X3F
	LUbnb0Bvkf5mydaxCk2qf/Pxoih+qyh6n+GSaV0XvGXGR3l9BgtlO9+UwVzpCbnuAPSMM7/efEg
	bu8+S+qUgNcl+Xn332zl49s8d4Mii/WKPDcL+SEn97OWRI8jcPQN/SUd3Qws38JI+Ev6USbnHDe
	f2t7Ctu5Se7Olwrq3cZu+eoz1
X-Received: by 2002:a05:6102:f9b:b0:7a1:f980:e936 with SMTP id
 ada2fe7eead31-7c0f51a9b92mr610476137.18.1790952222091; Fri, 02 Oct 2026
 07:43:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:43:29 +0100
X-Gm-Features: AclHuK-HUUsrOdFljkk42xven02N-tiuZrJ__yBG6xUzcagLPJ7c3UWcflomjnQ
Message-ID: <CADrjBPqi3RWdUy-S2Vn2-E6h0OGhrFPWEcKcarswivOdPzFTKQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] firmware: samsung: acpm: add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 03:11, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The Exynos850 SoC contains an APM co-processor. Communication
> with this hardware block is established using the ACPM protocol,
> which handles IPC messages for clocks, power, thermal management,
> and PMIC control.
>
> Add the "samsung,exynos850-acpm-ipc" compatible string along with
> its associated match data. This includes the specific initialisation
> data base offset (which differs from the GS101 offset) and the
> "exynos850-acpm-clk" device name required to properly instantiate
> the clock provider.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 942a2e9f02f5..5a16665e941b 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -39,6 +39,7 @@
>  #define ACPM_POLL_TIMEOUT_US           (100 * USEC_PER_MSEC)
>  #define ACPM_TX_TIMEOUT_US             500000
>
> +#define ACPM_EXYNOS850_INITDATA_BASE   0x7000
>  #define ACPM_GS101_INITDATA_BASE       0xa000
>
>  /**
> @@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
>
> +static const struct acpm_match_data acpm_exynos850 = {
> +       .initdata_base = ACPM_EXYNOS850_INITDATA_BASE,
> +       .acpm_clk_dev_name = "exynos850-acpm-clk",
> +};
> +
>  static const struct acpm_match_data acpm_gs101 = {
>         .initdata_base = ACPM_GS101_INITDATA_BASE,
>         .acpm_clk_dev_name = "gs101-acpm-clk",
> @@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] = {
>                 .compatible = "google,gs101-acpm-ipc",
>                 .data = &acpm_gs101,
>         },
> +       {
> +               .compatible = "samsung,exynos850-acpm-ipc",
> +               .data = &acpm_exynos850,
> +       },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, acpm_match);
>
> --
> 2.51.0
>
