Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B1739A81B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Apr 2026 14:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178482; cv=none; b=Nrw/fN58uIZEPLdAvPV32zebvejrdJs6313cX6K9jNKB4e2tNYc/FqmxBz85TL7/YpN39/uyHZNVhHf6l4C1WE2WXj7WV6UkaTspKAVZ8USTZg7eDV3krcqqHXO7ae4CDwin/UZNCKRGZSpwiaLfEnYylaRm/TXI0D+wwuEQ93Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178482; c=relaxed/simple;
	bh=5NFk1FU3zQgLvOHWY85ctRP96qkII4yfyH1qndHlnw8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uVyYerevlZsqED4ZhMKsQ43ketot/QXbNusGJqrH01+E+k2YJPDvWxE9nTZas/TV1u+nEosgyy4t85Ps8UVWTuhI1AE0+BWYCqdWkPTSWvtGAMnbBg8wvsYjEvfSGwKQj0pAjsZ5lEk7AkwYcs3T8fgNpPXanyphlzsRoJLPsmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZL7SlzpL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZL7SlzpL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso66553075e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Apr 2026 07:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776178479; x=1776783279; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAo7ya1UV+iUteVyqPUr+hg05LINCS2Wr9p6hmA+q2Q=;
        b=ZL7SlzpL4lw6cNHWWZFtDY82Iw+2NnFy1h1Bsp25pbtWfADIvhOgDpCqms27LudOzh
         +D1ycQIxgsoJ15qcrbXSyhjEEEFUa7vC0wIFRUw62TKgASrzizNOc0cljyMgpsly+EMh
         0IWzC8hJWZGh+Y76WMjGukD/cL6RFRdcPwwQh1/xJMstBxz2yzCh8TbjnEZ3TTuwrl93
         s2bum4hu4eHk6wElPmIjAKNmOGa5DMHKwqumMNV2pZitqcZQkPfxG+XOjMnhUj1fplae
         Tc2vokHwgRLZ01iF2uvXcCxVpin/m8FSVEUKb6M+zsRsUSIbSJFS51GOUl/w8KEhrpkV
         koww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178479; x=1776783279;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PAo7ya1UV+iUteVyqPUr+hg05LINCS2Wr9p6hmA+q2Q=;
        b=O6I6hOzS4yORJzL8kxScdBoF46oohP4OFSVSjgDlQGJ/db9tKjTsIGpDIXDy+46/Wt
         YICrZz47gjNoRLFJc8ddMNHWNBhnrzLh/X2zIwH2ps0gcoOApL4o2THL+DG/hz1wnGRD
         WNCxTqGmYzTlQdNis+P5Nqzx43De0Cxr+0DuGpPw8rh50qaEVTvRqXRCGBfhBeKwG0u6
         5FXdXK7FEtWDiZfTIOHRjexm2Qimlwh6FpCZl/gLjStsur+/6rYgZkNLkrKPftHTVez+
         TQ7r3057wiZGp451s4nyVL3/Dbl9WSzLOfC0Yln2rkYv5+TSjmSfKAcjsNgu+kthDcHa
         6Hrg==
X-Forwarded-Encrypted: i=1; AFNElJ9xKi65NNG8B0rRbBlZHVXDMFh/oq8UAzNVBqUCdRz+RKGxZ3c6mDFgP86QD0QnqUF+vzJCzUqgE+4DseBSswtOCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0YXCm0hBFsV+6dJY39WpamHAFhS4ff75Co9dPsZsfoiBVA4Zm
	L4FKuYRuGYMKScBU5iMZqYJ3NPlc1RjHg9PhNJgb2QWKJ0gJ37OkTL2iEkq1vClDpyE=
X-Gm-Gg: AeBDieu5uhpiGBwXtuKnm4k+EaMukp9nP8X8wVHBZhXJTca/cO2Tq7mrK3gVcZAN8ep
	40gKxjjuQiadsZgRCSNx8s4XOz0VSZYykFqFgWhsSs19JGRDb6B2EemuawORSTS1VdoAGA68ETA
	vFAJW1YekBPIs3Hntn2SyEURlIH4YiBVP150B8HI5UCEPtz7qkr2owCLVfohidoUYLP7j9o7/O+
	8fa+knIIKwsj/537ZX5gL2lyL83YMZIDgZ739X+eKvDa+3HYWJP1xLUG/y4aBPULuTFQ9lwsW04
	rI341mvXX8QWYYgVZuwepKeGUZ5hlqX42OXYYqcnmUa27cLKjNRvRW8iJ+BpMcagyuVoBx5flIq
	5KUQxMKzy532Fteuxc7aWLNinvsKXeiTS34HGTcLC4LR5aGB109zcABcDt+yj29zTF+ZL7QTMJm
	a078tMcW+8AvH750tl1lIDgXJoeKhznCGx5820ILnCepY0W3VZS4fMaNCy3cBvzR2naRtbOtn5U
	ODzcXJnVlIIxpcJ2g==
X-Received: by 2002:a05:600c:1391:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-488d67e6a48mr259531285e9.9.1776178478697;
        Tue, 14 Apr 2026 07:54:38 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73e36e7csm22002840f8f.10.2026.04.14.07.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 15:54:37 +0100
Message-Id: <DHSYQ027GZGC.4I9F6TPPMBI5@linaro.org>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
 <20260413221638.GA3624532-robh@kernel.org>
In-Reply-To: <20260413221638.GA3624532-robh@kernel.org>

On Mon Apr 13, 2026 at 11:16 PM BST, Rob Herring wrote:
> On Wed, Apr 01, 2026 at 05:51:55AM +0100, Alexey Klimov wrote:
>> Some Exynos-based SoCs, for instance Exynos850, require access
>> to the pmu interrupt generation register region which is exposed
>> as a syscon. Update the exynos-pmu bindings documentation to
>> reflect this.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml    | 18 +++++++++++=
+++++++
>>  1 file changed, 18 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.ya=
ml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> index 76ce7e98c10f..92acdfd5d44e 100644
>> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> @@ -110,6 +110,11 @@ properties:
>>      description:
>>        Node for reboot method
>> =20
>> +  samsung,pmu-intr-gen-syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to PMU interrupt generation interface.
>> +
>>    google,pmu-intr-gen-syscon:
>
> Does this mean the driver is just going to have to look at both=20
> properties for the same thing? If so, just use the existing property. We=
=20
> don't need 2. Yeah, 'google' in Samsung SoCs is a bit weird, but that's=
=20
> Samsung's fault for not upstreaming support for their h/w first.

First question - yes, look for both properties. Using the existing
property is even better, I don't mind at all. Thanks for pointing that
out.

Initially, I added more generic samsung,... property because I thought
that device tree style prefers <vendor>,<property-name> semantics where
<vendor> is actual (real) HW vendor of corresponding hw block and it
should also refer to the first/earlier hw vendor in terms of the
timeline.

Using google,<..> is simplier and I don't need need commit that
obsoletes that, so I'll rework the series in that way.

BR,
Alexey

