Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EBD3DA7FB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 15:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790696886; cv=none; b=TivaZHvKF2uk8n0YQwHnbWGmIzHPIij46Lr9v8fLWiZ1pI6FH5QH/pXvP5derAXTtnYF8OeJPT7VX7Gt6QZZeqRfPLEqVYw9hpof6q9OAK5yd2enVx0Ahdz9QsDMSpV4/9ZqGPCDrUxSVtBs12U18wyfbxK95jN70flioxZIOlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790696886; c=relaxed/simple;
	bh=vzU0w8F+HlGmZx4KQqQBaCbBovkeO3I44GgdCcYCp6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lJiqi2dHpfelGfzQUvWfedKcn1kvKsrVOb5v+8yrGEhuO2YyZtbqXFq2a4pFkeCWsl+txQPohHDY+JuzzJBQneTRFGz6AW/IcZ79311B7aAi3WeYewmtIhQeuAKyuzduAgeBZAfLIIV4RCZ2/RrPN2J82s+WLP0abq9OAHLtKRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YKp3oUT8; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YKp3oUT8"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so661975066b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 08:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790696883; x=1791301683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/dZbuYFRWaYPbHqq2vBKMBfGE1dD5iM+GHzPgRrdI6c=;
        b=YKp3oUT8PgJeH41z/KRDWqZ/fPrrzK9p1AHXStTDoKMc+WrjMHycoa/CDzaCEe1MgL
         VmHyMygz29VRP4QE58Qp2SUtYaFz5Ng4TIZnYkgzO0PWR4ZwihK5/uFwMnrm6tDFHdVy
         sL/OVIC4I/QrkvXJqQQgQmcc0+z+45WeD1KHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696883; x=1791301683;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dZbuYFRWaYPbHqq2vBKMBfGE1dD5iM+GHzPgRrdI6c=;
        b=bzyIau8N+LAV6P9/Yr+2uIOGHDfATfnqYuCtLKCTkdMHJyVsDor9KimvUC2J4bWWga
         Xv0HbBlSxf2ftSoDmD50Ep6JdwIIqVWdx31cB6TkYgpDdRm7jnksuk/+V9T3fQWqaUOs
         VMGT3lYB1NoRSMqZqq45RU+IHRekMla4ww99g/mlmW47t5fa9XPamsFAIV0NH84qS6B/
         5O6gzWXLTK7pc6x9SSiDHNRQ9sos7rvcVgaVkn2s7V9V78IaUimBVq4qARn52Nnr+9JE
         wEsDG3e6rBD2KFK5BUKq8Gx9I1utYCrgpigdXLp2Wst9BHMu6a4deTg4gnCg2c/Ngemf
         IvkA==
X-Forwarded-Encrypted: i=1; AKwUvBzGRrBwB/IgjSQirxQOxFGSJdJ/V5WnaUMhTujYHFpsCXp0cOxKeShzT+xokSapXsAgAuQXko96IRAkxGwhZtfUyg==@vger.kernel.org
X-Gm-Message-State: AFuF++mdNhBdrnHHJF17TcwdH4xHGYYKa63dwhtmI3Idc//6e7VQvY8F
	Be0U538zxwizGb1rRmYDTVUpG3iIT7XEGZ30/x/R569rV2NN0vy5eN2ng3DLMTZBX70RhgMNQOH
	NtQRTUXQG
X-Gm-Gg: AYBFou3xW/iEBTEPjYxIHVJ4NQkqUDsbl55rY8YfQfzhyIY7zo4x6JDvySmakS/4YmT
	uH7SpZsaZ3qmzxG9n446wRvy8Blvcd17Dv7fWa40RqGTP5sRUDFBp/Lr5ppWAUXCUhhVI8dz0dI
	hMWgsbI7M1Sed+hXo3+iIMLLkLGtQGAdvfQFpKWOZ5irYlnq52CHC1zwO37GgoeGQAV7XTWxxCR
	zBhvWyBwhYWCLLZ7pCrPOyYrYvH9egHlF6E9dvbd5FI4MRg5D8RBGNuitEJrI4aeAHpdnEGAF9O
	aRk79scgLDtwkd8TE6TwXLxQKO6EJ+Q/7lH5o0Dgcwc7SpOl7zC03xihOzOCvUGRr8E5cWTLxcS
	RaTYIJuSzWx9qqXj3pau073p+ewpycgNOtLyYTbtSQW1LBbgLYNYSmHu1B7y5ptrjM+ZVA9rVvq
	MegH+TFtvneeJssR/q5UWbPRTmaB2dY3MQl2yGc67Gz62pgWGwDNYxg8XB9XDVjXErzt5rKQjol
	w+Cq2xcSN1kdH6gPtlD5q1SZ08U1k3kgXhrxGU=
X-Received: by 2002:a17:907:c70c:b0:c25:c7a9:7b8a with SMTP id a640c23a62f3a-c2ac230b0camr1428139166b.12.1790696883159;
        Tue, 29 Sep 2026 08:48:03 -0700 (PDT)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com. [74.125.225.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e12cac279sm1743366b.23.2026.09.29.08.48.00
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 08:48:00 -0700 (PDT)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso41071895e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 08:48:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwNDatbyZazzcTumeEm4aYFomlXUCbcGvGvv8wVY+ahksaP1EXKeUl9M0iNLytnNR8vWu5cRu3f0TzyT5THAYw8kA==@vger.kernel.org
X-Received: by 2002:a05:600c:310b:b0:49f:bd3c:bc18 with SMTP id
 5b1f17b1804b1-49fe66f4c72mr292995155e9.19.1790696879396; Tue, 29 Sep 2026
 08:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
In-Reply-To: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Sep 2026 08:47:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VAiHf0-9sPvgGKji4j47rL38Ja3S2yiEfztubgZqBpjw@mail.gmail.com>
X-Gm-Features: AclHuK_dL-VTDHnUEUTR3x2HZaC9uQoYf0vNl-UJk1UZAv-h2C9KslcOuDr2aQQ
Message-ID: <CAD=FV=VAiHf0-9sPvgGKji4j47rL38Ja3S2yiEfztubgZqBpjw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: google: lga: fixup #size-cells DT warning
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Juan Yescas <jyescas@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 29, 2026 at 4:11=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Fix newly introduced DT warnings:
> Warning (avoid_unnecessary_addr_size): /soc@0/interrupt-controller@588000=
0:
> unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
> child "reg" or "ranges" property
>
> Fixes: 80f23487d554c7 ("arm64: dts: google: Add initial dts for frankel/b=
lazer/mustang")

Is the above git hash correct? In linuxnext, I see:

54edd8698bb1 arm64: dts: google: Add initial dts for frankel/blazer/mustang

Other than that, this looks fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm64/boot/dts/google/lga.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/go=
ogle/lga.dtsi
> index 26a14b3a1b190a..919ee6619d9ee8 100644
> --- a/arch/arm64/boot/dts/google/lga.dtsi
> +++ b/arch/arm64/boot/dts/google/lga.dtsi
> @@ -370,8 +370,7 @@ gic: interrupt-controller@5880000 {
>                         reg =3D <0x0 0x05880000 0x0 0x10000>,
>                               <0x0 0x05900000 0x0 0x200000>;
>
> -                       #address-cells =3D <2>;
> -                       #size-cells =3D <2>;
> +                       #address-cells =3D <0>;
>
>                         #interrupt-cells =3D <4>;
>                         interrupt-controller;

nit: Leaving "#address-cells =3D <0>;" alone in a section, with blank
lines before and after, looks a little weird, but it's not a major
issue...

-Doug
