Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DF22E3FE
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 00:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789086544; cv=pass; b=uSi3j2/gE+3XgBOREDljRYIJaIFr8WW36MwOOFKkRcRT+8TNRIDwndObgDCN8LXyXNn1Je5sXaoL4xi1STOBF8e2vWoWoY5AqUSWQUkscGRWGdQdSumMnSpfov6l8siXKPN5GH7tU0/5rtRmq6C/wXlxszh7wgmN9jMKtPhAb3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789086544; c=relaxed/simple;
	bh=CA+fAMW6xZEkmh5ZL75MipQ6Llb2/zi+5i1YmY8+u78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XyvFBUKUxG1om2PbOgtImb1Ywhu74gwjrWhaMNpvEOSAn88x6TzFY2mpjDUvLtHWe7yPvQBAsiLunPKNKWZ+61bH71VO/RWS+KWsPJ6WL/CCspfF1fMFP+SbfUkIa4NqSAigJvYc7GjmAxKa1cgtXJUPRVK+HjuxpK3W1Naphwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uRDTKmys; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uRDTKmys"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8200b55dc47so3486287b3.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Sep 2026 17:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789086541; cv=none;
        d=google.com; s=arc-20260327;
        b=lvIh39CmLZmyRO6o9yOQp/40vNPVDspjgjs56uRwczP/iYjjML3ym+2qtLC94rKVm3
         6JfgPpi7hIKCesNRGyBwEgSDV3QXowq7AFBDaBIDsbAE/CAfMUSD9X733snJOuI/cROn
         Exd9Z7jqo+EXWOOnie/fzRvnAGPuntj2b2UP0yu/oqmEzVYwREZhHVyKGjER2J4eay1Q
         rP1t121aAKfmfmF4eE6qeO7sg5bEC1ta/qXVprS/dNibIDzh5RPAqyuZXm3vjvAvlReJ
         bLCWZmzU02CNMPAAsRGVUTAEcZ2PQ16orIVL1WZlKT+e3z3aR1GCWXSDP7viRysVP0vP
         QT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UNaJ99P89gFCs2TVtBIq90Gm0zDitWd9KVflfuv/aNU=;
        fh=omyb3zu6+4roKEb+gPVunSU8poHSkvoNwtY5IwYBr04=;
        b=g/B/bJ5z4mraHhTC5HErOk+QZrQPjiR9C+fb9wMFXzn5K9eWzdJVBVMvEWSyAPO8OM
         IBLmDQcagu7VEIdzSLivXMwz4A2eyXFZiDA7wBs1VOskmr1GmU5KNezBHrGy0+8IVgGg
         js50dmP2caIblNZmsLz7yuWM6G8wbJ36C5tJALgUKI6JENA9ONdZMdv+tKkWmq6a6l4c
         aJfRtvxDqyxi5Te7A9zYcK2tt+ZYuLV7ZW/IoR9x6FX8BbiEQuvV3j22wDarP9OBkbmC
         4mJ1I6aV2pZj5jkh9WrlmCvMO5Os6TTSFV3EVaICqsiHJmkwHeIovgQQFFxPo5Nood1R
         TU0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789086541; x=1789691341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UNaJ99P89gFCs2TVtBIq90Gm0zDitWd9KVflfuv/aNU=;
        b=uRDTKmys62AZQyCrwvHqMtVuMQsbm5Y5hzwsaPqljHYaWF9yYbs6LYi5Y3hPHyn0c5
         itJhPWxRd4qFlqmKPlp4n/GqRN73hCN/VYkyQXY4OvQLZafogsurHnZqoGKyReeslNHg
         Rp+IP0JDeAQ5duvGzuzHTveWebWdMOXUVBNohIZ1jWcvqb6HXvzWbVtlcQU3t+mKJSmP
         ZXTQBUkjxp9x3pAkkPzfNjLKlVehAftUh1tFtb3/sST6hnwXluQqVsctSDq5kFRNVhOU
         w21VwHhxcJIu9yTaFxGjlndW1MU1GOwkk+nMrue1Equ+BudNqZgTJenJYb8JYUSiQXyQ
         8Wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789086541; x=1789691341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNaJ99P89gFCs2TVtBIq90Gm0zDitWd9KVflfuv/aNU=;
        b=jfYX0rbsexd6CiqTDrbtxvBfGHH+dFwpoZ8qJslrLp4y627edZLroA2c0w9MQgbNtt
         cqpUsKDPzjOrWyTz5nJxNJbwd9X2Ihc1osfDdAuulqzddMHY3632W0+bv5dVv7KgUYrf
         6X0evtR+N0wQi4zH5sp5ifOJZYP10bTbcgm5Rl7FNECaNptwwJA7qjgx2qpUo5OOlT6K
         qnqeYXb1zc//u0a2V5ctNkqKKlMxxRceBeCJ7Q0iLJ+QECzc6VVJ4RGEBJXNZZc3Dmld
         A9fIhbLg6DdAw24b9k+Eh0RBp40dvg8fqemSN1XjQB80VUcWUwjCBzbW4T7n9XqJ7bMi
         yCuw==
X-Forwarded-Encrypted: i=1; AKwUvBymVdIG0fOwSvuJusUPQA8bCutGLvWpWP5Mz+Cal5Y9jdHqtSTCdVtHOZFBz4UD2Sxyzpnc3pB99vd+jdGg4pMNsA==@vger.kernel.org
X-Gm-Message-State: AFuF++lBG9sXi7cgdV5zdmab+qlJ4/gTMPctKPhnQznQDsmpq4sYg0JB
	K+yrrs97NdKu6CRld/FwrQPLyEjHjvRtRoJKZAGEjBeT+/gbdNc15dDuO4L7WhHOH8vHY5eHod6
	czHFjuXQuLlNbNLxMsyH+kkjJcYim1IsYznp86n17yQ==
X-Gm-Gg: AYBFou1rhYkXpSl6dXyzX/qjEILWpsxAx8pZRxG07O2ocrMp1hM2kAzPck1sW0UUhHC
	SRYuPLX7PEhT9hsVN7Gwunx2gbbnzPRLGWtu3Y2+QyDsRHme5XHJyPZplxVXGtUH/XU29GGR5mV
	wM0A4vLwDA1OubOZBzCOpxgBsud8Fmv4klF5eJ6CoYtJL9xIP5e9KpS484l/RkbglQGykomZZnJ
	lRFXbKa9YVa4MiBUTaByVf6WSPLgb/CmRufuWC0GlI5M1M9zbipLZ+7TQee1LlwMaAl/U2KTjNM
	wseuBsbZxcIxhn20fYY3CtTIkTYDFpFJKtomKhOrjaCVVuI61/svZLbp2fJRo/Ar66EGUbhj2YY
	IVfskBvci8MP5oQ==
X-Received: by 2002:a05:690c:5805:b0:869:adba:625b with SMTP id
 00721157ae682-884af36088bmr6196187b3.25.1789086541234; Thu, 10 Sep 2026
 17:29:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org> <20260727-exynos850_sram-v3-2-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-2-8627a49188ec@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 10 Sep 2026 19:28:47 -0500
X-Gm-Features: AcwNN1X6TqUaxW2SYT093nOASK8ddNR0F67KzkQysIy08gGg7L37ANaw7yFR2e8
Message-ID: <CAPLW+4kBHV=pcK1WyEerQ=yg-_XcR+FMXe1W7OmrMX3hxcXo_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: exynos850: Add acpm SRAM node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 3881f573ec08..0b614caa411c 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -163,6 +163,11 @@ soc: soc@0 {
>                 #size-cells =3D <1>;
>                 ranges =3D <0x0 0x0 0x0 0x20000000>;
>
> +               apm_sram: sram@2039000 {
> +                       compatible =3D "samsung,exynos850-acpm-sram";
> +                       reg =3D <0x2039000 0x40000>;

Why it's 0x40000? I checked the TRM, and it says iRAM APM area is from
0x02039000 to 0x02069000, which is 0x30000 (192 KiB). The downstream
kernel (v4.14) also say the APM SRAM size is 0x30000.

> +               };
> +
>                 chipid@10000000 {
>                         compatible =3D "samsung,exynos850-chipid";
>                         reg =3D <0x10000000 0x100>;
>
> --
> 2.51.0
>
