Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897A5AD5A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 02:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753323855; cv=none; b=FNbEvKeLuBvBt57hysHrj9V9pzRlYR9/o7yE1Nn6GNtj3SZ8cnxVw0ydoDA3DyNkZdQ/nNIea9+sKziZ6O3JWnhmBbHUHXe92ZqNew7JTLPDytvCq58NC1D0tOEHD6lmalrcLukHxm+nETNj/wsTPXTa24y4e0ACJNPD7wSRc2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753323855; c=relaxed/simple;
	bh=tOs4YYP2lGgetYVk/Z+31oGgEulwyZYfySAc44/5prU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ha/dSG2R7tw3/2K7ghjEW2g5ssS9stLTIgMeExISrATR27JIFsds0SzpQvVIsNZh5RBLbxEd6JdlfZ8lebPAFwtyfkDfKRCcKxJhM39B3gHDPsmgUgacqAvviJkMocnOuYpn8ZwNM4rVbSjPqzBo/18cRvFpRK49vMwG5KJGhMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aosQesvb; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aosQesvb"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7170344c100so5698957b3.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jul 2025 19:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753323852; x=1753928652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plbqbjhGD5ArB2K1OZe2qy+YoPX7JAw+94CxrkAAtgI=;
        b=aosQesvb1RN/bDlK43fg3LwvUKbEDliKq1AklTPGR6xjOoempj0Iwx9vkCg7oNC34C
         ZWLVP2E/dik3xZekAlijgGGIRtqh518uCede6KZxHcni8yQWbmhYbSeZufdoJEB/g1Ui
         izBexMdIgAojlerNAfPvFbl+UY4svhAK1jNokq3wNf2FxJBmc1FRDS0Mm9V6OnK85V+H
         c8b9syAyUqsq7YNwf8WKc+AQ4Zo8x43B0KYUBg20faKATnQt1ZQOOjXhnZOAD+lqvHfN
         2zOQaeEq7RUYDd5+IOL1yaNUuv31qfXfzpszgyBdDftUrA9Wf8i8+yrXuUjhk5VhXH1o
         oiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753323852; x=1753928652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plbqbjhGD5ArB2K1OZe2qy+YoPX7JAw+94CxrkAAtgI=;
        b=kqJ+1I5BAqnYq5Kq20esRDf720d8aSjJ5LYDKGE8wC7SvnmysQfkeGqBRf8CW9RSxB
         K+2RHkLt27OgxnnlMUEBCguGe/itqm9WAlDi7YZEUKKpBFjQk9tpcrN601SnKBweFVGu
         uzUnTG58LgAxkP+LQARjMp+LlluGmHzjsMVbtbsSGTZgkd5Th+sjmhNeyJ4xRHhmpgs5
         kfTJBcea5xtY8cVVaqxfMYFc8csxckIZw7jK12Hd5CJ5nkpOl/3VaqLzaw7iR0q0hBkB
         vPuSj7f+vO8zlJ1rmTmmSXssOfUN57RN89W33aAZjxriu1+OV0/cQoGLkrhoZpttPUlR
         Zq4A==
X-Forwarded-Encrypted: i=1; AJvYcCXuuTbTsBkb22559yxZAUk+jqT+REnwk2RuZHtCQzSkqMDYDaaAPe249on6hKPPu1TsPff1YKwsDYk6ohHgw4CY+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbXH0IYKWTtMJSA9caRpLG1ww9CGXLHsjoxNUDcEzaF/7Y/UVD
	7Kbs9uFN8iJhZGVRbkYoORFOmXIr6o6GvB8VnSXmFAXdhxwk/nj7OXuvaydw5J5jQNNXTgBoVPx
	5FItCNESxDc9P1V9RwPs7xbfnD54aC2zY8YVwyZJBJQ==
X-Gm-Gg: ASbGncuJsm478XIKLOHXzOEgB1tDeazhmQKvjgvKkOmFoPynR0p1Dt4TT3aLdnRi05s
	Z3021zDllxaotB3WL3yEoqwxUD7+qpDz1GT+AMNyPaE2nNlIDiCglBMauh5N2vXyaXpNFmQqR7o
	Ha7bvyzSIzPjOs069DrN4zONrLFdfKJjZGUlsyd7k54rXMBjGBUhBbtcUgr9aO3q6a9lzf0e8aw
	UXeJvo=
X-Google-Smtp-Source: AGHT+IFLCRGVWPBVKenBrgCb8KAsi3QO1NHPmUt4DTtA6N603DyqDpRgB5QVxKqVTa0yz2Twj20zCixVG7xRGCICKmo=
X-Received: by 2002:a05:690c:7109:b0:719:635b:a024 with SMTP id
 00721157ae682-719b414973dmr61644717b3.5.1753323852459; Wed, 23 Jul 2025
 19:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com> <20250722121037.443385-2-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250722121037.443385-2-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 23 Jul 2025 21:24:01 -0500
X-Gm-Features: Ac12FXxZX8EzAUJNlTWvjXuwV24vStrDA_xIZ9oDwGDZ1h66dojGNIklv72yNkE
Message-ID: <CAPLW+4n1kYpGDM=VLgcXU0acxgi_8yY7mv5ty_42fhCOoctL5A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: soc: samsung: usi: add
 samsung,exynos2200-usi compatible
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 7:11=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Add samsung,exynos2200-usi dedicated compatible for representing the USI
> of Samsung Exynos 2200 SoC.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yam=
l b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> index 4ce871676..bbf6d3b2f 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> @@ -36,6 +36,7 @@ properties:
>        - items:
>            - enum:
>                - google,gs101-usi
> +              - samsung,exynos2200-usi
>                - samsung,exynosautov9-usi
>                - samsung,exynosautov920-usi
>            - const: samsung,exynos850-usi
> --
> 2.43.0
>
