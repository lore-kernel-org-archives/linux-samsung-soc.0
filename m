Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794567470;
	b=QvpLPmHNTEOMjHn6aYybEkk2/vR7Zyu3j4WjJUXrOh0TlglIO9DOyp/Dq0Vt2FWaBd/e
	 iqKLtmCsajgVmBotdSHVOtXkmNiapSsCS56Q+VHHIKfKAe7gQLdpjlb4bMbHtR7JH4pqf
	 dcoOhgLHODouqdE+gMfQ6Gdm1cK555QELb2ZCLsHV4k6FE4G0XCRCiy+PF8eT8lCCwb7/
	 Q4fuG+bsyrHBkzXhIRW0W3zT+ppy8t+JwuD/AKJMoMwxy7gN4cKymtfYvlFz/KVoQ+JjQ
	 egPsYkHBFjb3tqvYVr4dMklEzDzRINK4Uhk1ElWj6D/dac+gxH4NBGNhzgQlgeq8BIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
	b=5jWUudoI02G96M333nnGT9Sleh6tMHDO/Osv42Lp1zXXPYQdkN5IHAbjUppb2BCY3sri
	 XAmhEHwXcFVLj4yW59NkXz38p1BWFt8nyjPW//zTg+e+ZX9joN+cu6HHtV3xGOFr/sGH4
	 +oNpUQ5glXWGUAfrZjm+3L+Sram2fyPUDVPDUEZ23mLP1wFVD0AvIY1yBQKB5oTlUMwkG
	 m2xGBYu8E1olzfPn1aL2jDGkgdH3/7x94WU6dAcTS8JhFj29SLpkqF3xSSKQc9Emqdor0
	 ATNgbu6yHLjdzZnWx96vPTPHkNrmOP3RUDE9NssgvutydcY7qDK6lNfgQHHE8mB9hYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AeF7+1yG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB22B606A8B4
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB22B606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AeF7+1yG
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so1479953a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 02:57:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567468; cv=none;
        d=google.com; s=arc-20260327;
        b=qBbQSxsnizlC7wXjCHonZuwPQFXrSMN1GcysVhG0J0Vv1tP9uNhI8eOx5flzR3NQEt
         zmFqAIezzBn3WhqDXnnRqxPVST7Z/2XhEhKbVjW4di+kBpIXqc6gTZ0hXaStXF2jzIvP
         M0Oht/GgNhmr/H0/iP4lOLXD10wGY+Mnu32SR7sAchzV2BsnC0t7yveNCEWxEK3IX0Eb
         9cRrjFW4uvkGDWVa7LxHBuWwbFxrvV+deGCTIOsBF1QKdxMeQNCbbI7sHxGrhkRw9O2w
         xvx94JUyfRaMF81HtU33pDkeS4VSQDApIIVIMKf68IrLFkHFcvbNlvWrQ3gmEhx4KM1t
         /rog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
        fh=mEYpfMKIBf6vacIY9JLXXieozSM3D+9xCNlWzwzwLws=;
        b=Us/hfv9+Ainau+pCDsc2KLxRCNE6q9UQSAvaINjWydLqHk6StCjiUzEoDdPkkxlflI
         woh5wGQ5deim8np1CzN3fE22SQwbED86r0MR3WuaBxY1rW1WqyvW8QXAnsDwLhpO+oE9
         fCj8SNWKFjE3CTXAN4oR6BE6f/On0wtfJoygZPdSeqvU9DxuA8VxLQS0GIHNkmXX6VoW
         QobxMq+sobLBefheryHjYYyupBZVwKZDHFxrhCefbNRl6IStCyasu82nBj0OB3E5Izmd
         APObwbctJLqqR+s0d7pK8UO+H3bXBlCScD1A/MMHH3X0JNCv3MwAP+IcQAmjlewjgzdE
         RQ3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567468; x=1795172268; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
        b=AeF7+1yGPsZ3QmfWQDKuaH4XlBf4fgKulM1JWAT7w6hasBaoiDc0GGcbM20gyy7oNO
         j21U+7iUbis+Xdebn4EYFBsDglN772fKbxdeaNCqRrdckQJ+dnZpTw0UbxbUXvnZpwLZ
         TPrEWOrDkwKj2jh+YC1sLLS3RqspzA0MaL83n4vmbczTHKfypWXugHYAAlWxLriOhkHQ
         e2Us+G7V8bFuYV08OM4oEXyilnNAwYBkC5TnpOtVOQMrLx6n1DKbY94g5Itgp5Io33rO
         OAXb5K5AuaxWrM9wvYxoqazJJK7V9ATH6tH2LjM3Anjr5F+ht0QWFpjenlkz5qwjM/Kq
         URkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567468; x=1795172268;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
        b=mipuHFCvm9Yt/BoQjN8tQdGHkXwUzZOwoka56s1Sc9cxDG8gMHP6r2F5Q/q6azSC8j
         2UMyaFMtL+PEv0FVPjeW8eAL2AMhO1sEgEB3b9oZHcG/TePM5igzVl3XyLNlwpU5gsMr
         EhaUN7P5f99VIn9g5h1fH+LqpO9qXzAi2H9fkKO2RU7uD7vppmKIceIhyNZR5D+xNp4R
         rr/HXSY8umkKUZiQ7iEe23FfHgImIFND6TroYURt6y1VLEyf/dPyVRq+ps1Ct/GhwMru
         KK+Ci5UoHcDdvIftq5/qXEhMkmmDYSCm+9T0NJot1n2B+klBTlZjU5L2+JQkae/HF5i4
         dZFw==
X-Forwarded-Encrypted: i=1; AL+hErFAapLrmzECGY2KMuFF1GYLxpfLDPeXyPItt/QviIYDQYahwO07kKBJpO6Yygrn0HAt/nQW4IQ8TvZjele09YJiUA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kItISfI6Xz9ZAhjzvtXA8uuef2B1azlTxqOifjZRjxaWMkuDS
	pYm/+MEuViybor5i1Ei/mT08F0FlIMhQQGqb/8WmC4Kmfa/gpCKoIIcoZwqAF3AWorYRGK29PBy
	A5qkEDRvXgtTXAa94WTstoTUeozAzKn2O0Jw+0+GJ4A==
X-Gm-Gg: AYBFou00SRIEvbU4H9ETOygVhRDJYlSCrjmp1BPUBY8v5/WO82WaeWVz7ObVagnbcnD
	LImwlZTouR0kkjwRJWQ+emwwcLoPTXzpeA9du2ctx+o6WUungGx1uksjeEob+WYbTJiwPg72FaI
	UGXxNQ4GoHFeAMznH1jD5HaDNX74ljqiXtmg/juM75Uvl1hF9C0kNiqs45nXkb/IXu/TCI16z8G
	Fz+jCzKVf2oon8sWvVnSLDr15IaVJw8/bVL9c9atGImD/mI2RC8CVnAE9ZEqIY2fWsYRnMbhMAN
	4fNyYjQjhy5hoB4eI0Z4oFFkl1CE5jOPhAQpUtkae15hlCnfpYP6PqjVZ2Ljjaav96DBaVj3kqt
	NvPQfTG1U+HNJM5eOCKZIMd+c63ep5k0tqWzjTdUiZSxxodkSn7YdOEcMxjCJP00flqHUC/TZ7j
	IU7E1QyLNZ0PjubNo=
X-Received: by 2002:a05:6402:1ecf:b0:6b7:bffa:6f24 with SMTP id
 4fb4d7f45d1cf-6b7c05c0611mr1899644a12.0.1794567468098; Fri, 13 Nov 2026
 02:57:48 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104832epcas5p4e1e9a3dedeb0c9c60cb80c23eb5d930d@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-2-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-2-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 10:57:36 +0000
X-Gm-Features: AclHuK8LZ5o_QWvk6RKRY0YNYG96oQjtDx2eCj61VNIttrc76E2ZwU1wIUFE6TM
Message-ID: <CADrjBPrwZ+dH3==Z46PwEVtYR4xWdzS2T0ZFHHWR4+g=a87cTg@mail.gmail.com>
Subject: Re: [PATCH v3 01/14 RESEND] dt-bindings: soc: samsung: Exynos8855
 SYSREG compatibles
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> From: Alim Akhtar <alim.akhtar@samsung.com>
>
> Add exynos8855 sysreg compatibles in bindings
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> index fcdb9ffd2644..845e0caba15a 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -31,6 +31,10 @@ properties:
>                - samsung,exynos5-sysreg
>                - samsung,exynos7870-cam0-sysreg
>                - samsung,exynos7870-disp-sysreg
> +              - samsung,exynos8855-hsi-sysreg
> +              - samsung,exynos8855-peric-sysreg
> +              - samsung,exynos8855-peris-sysreg
> +              - samsung,exynos8855-usb-sysreg
>                - samsung,exynos8895-fsys0-sysreg
>                - samsung,exynos8895-fsys1-sysreg
>                - samsung,exynos8895-peric0-sysreg
> @@ -103,6 +107,10 @@ allOf:
>                - samsung,exynos850-cmgp-sysreg
>                - samsung,exynos850-peri-sysreg
>                - samsung,exynos850-sysreg
> +              - samsung,exynos8855-hsi-sysreg
> +              - samsung,exynos8855-peric-sysreg
> +              - samsung,exynos8855-peris-sysreg
> +              - samsung,exynos8855-usb-sysreg
>                - samsung,exynos8895-fsys0-sysreg
>                - samsung,exynos8895-fsys1-sysreg
>                - samsung,exynos8895-peric0-sysreg
> --
> 2.34.1
>
