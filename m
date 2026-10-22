Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682972;
	b=E2ipajFeH5ZiDmQAvcvNT4mUwk8jtMSbGeja6aFv1DmK895TGKoS18lzlbsQcQqFRbkp
	 +IKmIuuzYQZXOIVQPbp3GVXuKW8fQ/Lu1Rgl6frjRI5/tQD5uzSEc3xcUJQAKT8rDFTPF
	 8yH1PUDaCXo4/CHDVGRRM7yMPwWIk2QvvpPSvJJN4iyr4BAfph3LqJ1FLqQRVnrArlmnq
	 pdTorbAXs+tnnvWKmyerf+TPmI2QfDOMiOvt1Q9fsSzt1K5/+8csergKBoBeBsjur8hl7
	 ZCt3uwFAvk69pULUGlLbZg3mvQ+DGzAHFHOLLO+1tdPyr62t1NwQQCF2DQusFr/KZEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=HDlAEt4y4tSaN1HUhuY/PGYkg3Qd4cTO/TkXeJAfzWw=;
	b=0EWQTSocfj8poytOa/cl+4wYVjmzBbKTkQUKTDNscnrDRCQhy48YkOcYY/lObPWbE9Cv
	 SxU84sWNwpqnwdLirHKStyg6iF/OBsW7rwujQuZ7zqRw64pILT5Tqxl1XRjrXCPGcb9Ni
	 bbiHDdvvYRIwasYUE97GidtAfN9ywg6vra+SPSrXuOBu3eHTI82bTpLqaiuuH39u8sygx
	 IZchkNu8SSu+0gL//h54AaXAfeDlhkP9uxAbx61c9+oNWiFfqHuv5/SCPRyk7GGAs31xu
	 Pv2kd9F6iAlUHTzXBY/r4mQWyYI/ZsMe10pJLB6a19RXnRkG5MxC2wAF/7P6sR015Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QpJis2sL;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EEF606A319
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Oct 2026 15:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22EEF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QpJis2sL
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a209a7fd1bso3945245e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Oct 2026 08:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792682970; x=1793287770; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HDlAEt4y4tSaN1HUhuY/PGYkg3Qd4cTO/TkXeJAfzWw=;
        b=QpJis2sLxK5hhv2ZYmKxn0Z9+ZS5AS6kmVGUr9nC5CC1eoXNJouRCPyReQA0DRNM5o
         POTICEpdU36CEbd9PNahL2LQbmDQsD9jCOHEQwYyJvq5532A22K/WFaUkqVeBCUk7tSH
         sl9tVjNA9B8F/8UhHYYFXE1d8i/yP5uGWRZuihO4B1JGZ4pPnflpvFB0yFkhFw87IPzm
         qmqvnMZsEd8UCKYGVEN7K6RVEHA8wUkGILf/Gv6S6zaXsAsAd0kIUNdEtFM+XKqvD7jf
         qJ9KY73vEkgLeP1V9SjhnQuwoZNvv1rySfnr/PnBPNrm4rWMEyxwgflEW3u/Z1zWjhJO
         RzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682970; x=1793287770;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDlAEt4y4tSaN1HUhuY/PGYkg3Qd4cTO/TkXeJAfzWw=;
        b=DELE4gDp1lNpIrZvj318G5GBahoTJuVkafQclNhHgUhQHMOTPLHc8RKvPCe0TTvl+m
         X+BytS7hwNhD2R2Jr0Fns5fgG1CrgW4Sy37m+ESmy9ZgMJQOZdO4258F60VHO3JwV20i
         xJ4ImepF/7ZoF3wefbd+KVu8IERHZS5GFiEODKpFsl3ZXiObDPCcS+b6R98Qc+1NMnn7
         zzOl4KzncUzBuk9uq4KzEHFYbeDE1G17rPhqPOSw731Xqfgp/DHLa1nHQKO9TG/yh+a3
         uHbE43PHxnL6j9170YTrSBuZP00Y/XZjdrz37p/Kgu4AM3r+Z7cN6dkyleaTkkP14Vv6
         Cc3g==
X-Forwarded-Encrypted: i=1; AKwUvByA1NNy7unyyWAX0Q8afY2zUteuQNmA0wk7GWvk90ofMFt4XHeQqPmK2boOsfmp94bUMqgOGmH+Nra4Gh4rtWe10A==@vger.kernel.org
X-Gm-Message-State: AFq9FYL6lR6tVbIp9ISBhsfgLKPmglJfwcGYHdvgj7QWnShUMPpvq0t7
	55Yojxkp9lXjyZ1Xtq0pWZg1Y9Z9/3YGzJ3dVvNc8rGucNYBeB203fzjenqiY2fLB69rgz/kEOy
	0o5reoaI=
X-Gm-Gg: AYBFou1IlzPgcW8AgJ83ikMR6fHFI1XFcRC692WKVeAV3CQkLyq0zXm5n4Sedniml1j
	aRcUK/Xpmliy0Uk/2lsrjAhrpKP/YGOPrxLwJPspwVksgrM5Wm0b+rH2DVaqwxTFM0kMFYqnXIp
	7Xevl5VKUACtJuxbMyS2Ii8yMfXBI3PNif2EPKsZ7QAWTSQqqEzOA7IU6sCGCvm17JvMMJUJ5PN
	bIbNVUQZQtAs3xLOin5gLH7LjEm+zVG0y2IZISsKGUtaMUeqKu597lT2ymTU/bpNX10aa011i5N
	ZQpLL/byGNTR9JoGLb/k7N22Z6rhj6tVH6FOdixsSoVIbQXSEQaKDnHsqeXwdAIo78pfbRq9r4S
	4fq0sL/HITNbsyVJ2i96QFUAoFfTmW8yH3ntNBIapYJY6A66ng5eW49Bp6MSvsCDx5dqxb6PKhi
	fHKBjf371y+a5923ANdrZSphDOQSqgzRrRUyZGaDHLz99O+7BilidJCRSPwVyJYoAdm1OqCRuTE
	mZmmsE/d/1CZCtbrpTO7wjk51I/YoKvqMjjZZWn5vicpjZapIveyIHBB5+M5A1geXQpwuy898io
	jPwOFSTZW6N5x7JmMrD39pkF+/ReYFJaePpOB4CIvl1TKQ==
X-Received: by 2002:a05:600c:1d0e:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4a1fdd44ff6mr114656205e9.24.1792682970343;
        Thu, 22 Oct 2026 08:29:30 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:41d2:e95a:b320:711e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210361ad6sm3270335e9.7.2026.10.22.08.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 08:29:28 -0700 (PDT)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Oct 2026 16:29:27 +0100
Message-Id: <DMBH2Q4ZU6KI.18MV6V6TMVBNN@linaro.org>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: Drop deprecated regmap from reboot
 node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.20.0
References: <20261015040601.30049-1-semen.protsenko@linaro.org>
In-Reply-To: <20261015040601.30049-1-semen.protsenko@linaro.org>

On Thu Oct 15, 2026 at 5:06 AM BST, Sam Protsenko wrote:
> The 'regmap' property was deprecated in "syscon-reboot" compatible and
> not needed. Remove it to keep the device tree clean.
>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 911643008b9f..30ae952083cc 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -236,7 +236,6 @@ poweroff: syscon-poweroff {
> =20
>  			reboot: syscon-reboot {
>  				compatible =3D "syscon-reboot";
> -				regmap =3D <&pmu_system_controller>;

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

BR,
Alexey
