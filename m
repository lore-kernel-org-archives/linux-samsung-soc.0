Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11344921B8
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Mar 2026 15:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772552843; cv=pass; b=DPn8uaJd2UMv9DzlQtRY7yAuBzA9eatKyXNUlZ+Puq9xTDaXLTmaJF85G6SlgQ9W1xY91+e5l4wf9013Lud/cf3vQCobf2+xcAeJiCwIBYytzYfkuC78WjZ/DNQVvycUFSL2bFTALu/KuB0qGlvGDJFW987LhDiLoPsrtlHmYQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772552843; c=relaxed/simple;
	bh=wZgekaKjKWhcsnBGlJkXxC6z3jyfRnUew/OlprWLgK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYvwPlVveWZUB0TvUkb4LaaVZaCubQRMOnhqb7wvnlWr5H3JqWFaL+GyXWunh+h+a3G9j7btjJ2BZa9CnrffVVnegVbDV8X3afz6xsYmjYrk5a8oUWqFNe8HAMMcTwTh+iZeKpMeuSnp5PBRcAMlqAemOZ/pAL7cdhImSWlh98Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ItstUBvQ; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ItstUBvQ"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3870dec27f4so37217601fa.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Mar 2026 07:47:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772552840; cv=none;
        d=google.com; s=arc-20240605;
        b=aZ5pwEMuG5AfsxOpMFH3wAH/prJdGOFlNaXF57m3Z18U20x2qXN5N97Y2Sekvgippg
         xUdsg8tl8vNA8WKog/QRHkaSiOHhEP1eGa2BRRelgMfQ5UYTo5yTYIkkstNdTZB6tNW5
         lMJjcLB/9oalyP5/URiXM4LcidWSahQtgrGNb2utZF379R5YJ5MR4cW56YNVw95sQkBV
         YORsX1Gh6spHfQcH1qOvh+FKl5wdPIcX53D8uqFb6Bw5uV4XXpjyMSBlSZQCKnMOmGhZ
         nAIlqlvD1sWqgas8/Am+tvtEeIC8IZnP+jbSTD+Tk4RyVO8RN4/EC8qlSgTnwE34a+bB
         YJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gD2a6WR3H4tVJC77g+1awJLOtzCGL8fqkwjycUOG98g=;
        fh=Wup8G2RJy8WtlnF3oUKDloevZDM+EMhu3mTYXCw1PgI=;
        b=Y0BPQX3wbWDPxh9f7Z8VqIH7Vt07naqHNO631qEqZEOoQ20XHvHeL6c4Ps6db/cCI+
         kKLl/LkrIG7lXP5MwJFiy+jT2OOEon3757iNoRFBYo80ULIjEUE5cF8IhYXohZTgofr/
         y5yLUd5IQh+7zD2Fu6F9d51F2i6pB3ULmS5T9OV9DVn+36KjmeWocMCnpzNpHQc2LzZu
         xMzCjCjxRCTnWTz/cj7ZPrbnmrilMwXPkvQ/5Xl7+8yPs2RmKezHRM0xUMHrvZhCClvZ
         WGUD+R8cizDZRXK7VDGAtTtCp8ft7D8uQ/rxZbWV75QlkRYNNhL5u4rQif4Xb9GlpIcK
         9Nfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772552840; x=1773157640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gD2a6WR3H4tVJC77g+1awJLOtzCGL8fqkwjycUOG98g=;
        b=ItstUBvQPLKoIc/LO/7+6ZRCCMedGbCw8BYF/81GD9AZhQniBlrS7Yyd0RnUwmO4CN
         ipY73t7d9Z4203zs1Ep29oGkAJWNn11oZvpG3vfbav+U7lHt3PFeJ0lR3QSnFrncdL7I
         7UUjU/vtUCjrOCAU7gQpGH+24seBvDtvJ+I9d75bUE8s3U5NlJEbrX8baSGFBfuBAn9C
         iJwp/6jmyx+nRfBRPz4X2hcLZIYK/Dl6Dxz+KvXxh78SBI4t3BmaFUuLOC++V6cb+AUm
         HFgipBNVyva/IOwoRtZjT7y0gkVTL+/X8O92I5kR99zRFZd+eOnS8cabzea0e12XZTbI
         hjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772552840; x=1773157640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gD2a6WR3H4tVJC77g+1awJLOtzCGL8fqkwjycUOG98g=;
        b=R8MFRMQfrcDFw0xbdXu8mwL1tMcUXZK3h6wwOhhBPoRNeUcYGIzRzaefeZc5hMuWKU
         TnUYCIMmx38O5DMV4ZPggWtxdHdUudENTnQqKu7s+wHIqx4Ez5slxxWis8UZw73KdxFu
         QSIswKaemw51Vy+AVC5qj7iP0FvfA2mGGMhGPw5t6GV97AQXpZZyEHtc7hdcEujQBkfw
         DfwtZLHFGakq3weWwA74btKMvH9whZBU0elnYgJ+MTQRwfqUIYW+TC+2ylnECZlFoKCg
         pVdIU4d9lz0+16c6Jg8nNwvoxKtrwtn1n+zKYt+aXeWiSDp+JsmSZ6i0MERuVQ3npxmg
         3Uqg==
X-Forwarded-Encrypted: i=1; AJvYcCWYAo7iF8rxPXXw6fY7/2igfDEUD1XbKgiMwYtWKvy1cQW4hHovhUjmklwCUazfhusSSY5DJpeFCmzmJHjRWR0eWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS2ofHdQ+W1iZqblHFYLq/j7YgogI0IIoj6YQx00NmIK119jTQ
	1P7Aot50mcKEuy11cSgqI0DQYk+VOg0MoFL/Jjaw1nQRv4nMn/DKt/uW6XWLrCiUIq+w4n5NtvR
	wvzO2RHLh9Ss4duXUt2IpYvNtRAt3xSDhKVvhBLMitw==
X-Gm-Gg: ATEYQzwwIoJ/mDGmDpWeHEzihGRTizZdNtnZriMN1RBIDXLugAIvLDgmbi2y2xRtp2k
	4CIqrb8zt+HmSCzkrffvHbQ6SyWXysP0TD19F3gs4xOivcNHsHITXPCemNkxf8hdVL82noDUAGu
	1jASfgx8BywJ/JTXAzTbezKtGAp2BU6QlPD1JJ6wYTCzgvgK7zPGV2M5Bve7hzh06KFXkqjEdbu
	QEe490GPjFAzERLItsM8edePRvbKRwxEgKd112UgTtycdLNzOX74TktEopXQmy1JCKTvEeR/Ah0
	7RQpD+k9hGBtCPQrEPA=
X-Received: by 2002:a2e:ae0a:0:10b0:387:a16:ee83 with SMTP id
 38308e7fff4ca-38a1c40121emr16229581fa.11.1772552840006; Tue, 03 Mar 2026
 07:47:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
In-Reply-To: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Mar 2026 16:46:42 +0100
X-Gm-Features: AaiRm51Gkmd1147qVAzeBw_Z4HEuTsOKVPJKFQ1XaM2VqwFLZ9phmWOW4SQBHOY
Message-ID: <CAPDyKFpCCoCH+z8MGhf84zLQbQB-UFa+JxkxMCGxcHmcT_1M+A@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] pmdomain: samsung: add support for Google GS101
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Feb 2026 at 22:42, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi,
>
> This series adds support for the power domains on Google GS101.
>
> There are a few differences compared to SoCs already supported by this
> driver:
> * register access does not work via plain ioremap() / readl() /
>   writel().
>   Instead, the regmap created by the PMU driver must be used (which
>   uses Arm SMCC calls under the hood).
> * DTZPC: a call needs to be made before and after power domain off/on,
>   to inform the EL3 firmware of the request.
> * power domains can and are fed by a regulator rail and therefore
>   regulator control needed be implemented.
>
> Bullet points 2 and 3 are new since version 4 of this series, and
> related changes are in patches 1, 2, 9, and 10. I can merge patch 9
> (SMC call) into the gs101 patch (patch 7) if preferred, but for now I
> kept them independent to make it easier to see changes compared to
> previous versions of this series, and because patch 9 actually applies
> to not only gs101, but to many newer Exynos SoCs, and to make patches 9
> and 10 themselves easier to review and reason about.
>
> The DT update to add the new required properties on gs101 will be
> posted separately.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> Changes in v5:
> - add domain-supply to binding (patch 2)
> - Link to v4: https://lore.kernel.org/r/20260128-gs101-pd-v4-0-cbe7bd5a40=
60@linaro.org

[...]

FYI, I have reviewed this and it looks good to me. Although, I am
awaiting a new version/confirmation about the last DT patch from Rob
before applying.

Kind regards
Uffe
