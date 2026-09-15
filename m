Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E6539BFF1
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 14:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483032; cv=pass; b=sF2cFnxWHapdqNIM3eLoqDJMkvdv2YWORr0Uv0nloSoFnCCZFXiPQELwr7L9YK6XNTc9s0iJQsuPQfLCxDl5qAKhBWDJZsoh+31cSMAseE5Gt2pw6agkZm6vzKZOJOfThvy96B5ERTETxQdD/QkN+jjWT9NbIa7E9ibZq1nQ2UQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483032; c=relaxed/simple;
	bh=s9zHSd0QhzvZUu3ozdcfCjxb9AQPmCffjwKW+F9l7K8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oln70YnBNf5XtV6YdbD9h5W6UPlAGttqFOFAsj/4hkr6jhWvbGghY7RNfx20C1W2R7T6ArlyKZkDfmP8TaHTQj6iMzb1TiPG353DxITrP+84ucRFs51/WVWioANolp3joEjuTiaH7fvZ6rRuTQ2Fa+z+i9h385/NX0pmsgUZGw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zfz715TX; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zfz715TX"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso5282903a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 07:37:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483028; cv=none;
        d=google.com; s=arc-20260327;
        b=gZp5NxZ/iKr+fAYQp2eOUVlOUHeWJcEYTFObMwBmNHJweeFmenfrYQQMZ9JY0FqbYD
         LDkKfg49wA82I1jSsbreOWVSVHCybsXJVmkNGXwO+KqEYaL/fqAIMLJKWTzHY9VzQ7oe
         27tFP28rU5roExPe/RCV1iqYRkkzscj9iUo4csC/nlEVNu5HIUC+US1T7nm5c/XffGkv
         2lNwyElu9NuvkFQmR68GoJIAV+KP89cK9OwZFEfLMJObfmU84+aVeA4wX+t4I+MkRRuW
         Gmp4GsZeHJUwy+aH1JKzu4jSUkA/aVBqcJrKg8bWzVx7yP6ok7Rf0i4visdt9FLHgB/S
         v7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D77DzhDZ72+rZ/B0lquPWAieMQAEtWanQKfhdNjgaGs=;
        fh=wtI4uC+fk3Uyo9RMPT68Qr8HYGjES480L63kc+6vTl4=;
        b=kL85+vuhuyMfPFDalVTa3ZvVbkb7jtesTrQ5+PUYR0wKWZ6ff8MO41nuX4+4vhPCH2
         WV+qAaWoJAp4urgi3rDHQcKEE1sWgNB0qHX6juVs55+3pjCzab/U1S1THVhMDo4WDTIf
         UFLOZ/GykpDaA5MfC3TSs8QGswFv9K7nxCb1Yg5eqpLjciI734wLtFPXj6nifNWbFrna
         E4tx2JoJFBULpY7uLcERyHyY2v5uMS19s1DJ9/hsv0x/5MSsKII1QyBpXBdw15d9DwmP
         2P7JVS7B3fr0x/Z8zWnZ6Qskik8cXb7HoW2tTB/jCG42dQUVgQLyTwl0PsdNQtBvwnT+
         cRlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483028; x=1790087828; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D77DzhDZ72+rZ/B0lquPWAieMQAEtWanQKfhdNjgaGs=;
        b=zfz715TXNoXEV9KaE3Aaj/3yTGBhUmh2AosnAcRP3TcD3JDi7lUcg3gQpW4mFVOjNB
         iYJyjdB7oPf08lCBQmz9tLR40AIGJP3cGrX93fbToI5O0rFxf1L0UZNVgy3mmMpHIwAT
         WvUYcil2fwHN+758ozC9LK4mg3W5vRTSVTNMdff5BSdwoQrpOvCtgPdCpqizJ9efC3Aq
         tRj4QczYOIMq/COov+mQ8au+EYGGxz5QC5oLz4vvxSGWUzmxrQPVsyzqLFGSg4/dSK/v
         PsrPZzmNvZ0UYYu3RKtT2YWTe8SzZ5FgsfxWm+HokKMCiO7mPXu+yoKa30Hhxqe0wqt9
         6P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483028; x=1790087828;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D77DzhDZ72+rZ/B0lquPWAieMQAEtWanQKfhdNjgaGs=;
        b=YBKPa2G2yPfRQTgw3YoAH2VQP3mOQRQKWPExxxuDof8baRI9L3sFVXlE7mXfnlv4cp
         tNu2VXe72eqGZMZKM0Da7usLmPfkOKUHCCAeRoL9MNsT1JUUjBfKvYAYcedEGv9gzhtK
         E5kLrxWfo5x9lujsaFpsVJzf2Yw4plNXL50g1V7/MAnIvLnMjc+9xIHnvKCjQlH2Dgz/
         Q9W6yBPBRjL9p0B6yvPw29jKXUkmHwtzcKprfdTfQGZo50Em9XUZs28Lq9guIe7bgEdV
         CCQEaaxUgDE0hv64OoETt7ENKjMLDNQHYq6VemmMagghalOL4vevM3ZPel9luit8SVSr
         utFA==
X-Forwarded-Encrypted: i=1; AKwUvBxxBBoUrAM61XDDfvrSyM68tb9r7YhlyPSmqdo9mS/z1wxs6/uA6dOIEiLJeqytb0CIHiatYBljFxl8/osxFWekKw==@vger.kernel.org
X-Gm-Message-State: AFuF++m4ZGeGm5vKX3WymqTR0RFApUlU9YbMqDAB8Hs2LTPOmrxX2uBM
	lb16GLxA7zKRGjRZyyn8yGQRR6VwqEA4fGPVWyltudlhffwoZdkyyUXZ5U4AnlI7n2DfO2WZEjM
	DKi55eaOTuL6HF1EJXrWN0k2MNna6E3E8PCcrPG2y1g==
X-Gm-Gg: AYBFou3ROs6ebMg/44Hvq7lsG1SlwWDk8YrPoiX7s7Ltwce/QrZGIScj6cp4x+UuqfG
	9JOGXRmbxUJW3tDV0bsLN1xPMU1Q+X00+0Dpk480B5SG3nGJ5baXhg/I/ITEOeevpqXdA7Uv0du
	7gN3xAo8sy5GxaI7zQW+XqQ/6glv9jQYe0syv9bKxqXPV633/IeHYcxlLipghLUsLpu4ZcE8Jkg
	fMXFIb/bLvZLj1S5nkovSRDipWuyv3JRsBrVbKLMepWKdQtdAdpNQydZqSrazvWnP3wC4iuosb/
	gN6gXXbP0loZfKIPGLKgDPFBxgJparJTKu6KMfOCmOjjIN/RNyVfA9yCoCGolQ4pEQOf2tbTgUH
	kStsIttNc6gs4Bw==
X-Received: by 2002:a05:6402:321f:b0:6a6:32fa:54f4 with SMTP id
 4fb4d7f45d1cf-6a9f62147e2mr5365012a12.19.1789483028305; Tue, 15 Sep 2026
 07:37:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913123740.203698-1-tturner@lineageos.org> <20260913123740.203698-2-tturner@lineageos.org>
In-Reply-To: <20260913123740.203698-2-tturner@lineageos.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:36:56 +0100
X-Gm-Features: AcwNN1UA7ww0ycDC66g2CaA2kAQpsW144jRswzivDAFwsftYfjODQouGwyp4baQ
Message-ID: <CADrjBPoud7_Bn-BgMX4+MTOyk9Un8M1B-nR1RX3SO3avBqv4GQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: samsung: Add compatible for
 Samsung Galaxy A21s (SM-A217F)
To: Thomas Turner <tturner@lineageos.org>
Cc: semen.protsenko@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas_turner@talktalk.net, alexey.klimov@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 13:37, Thomas Turner <tturner@lineageos.org> wrote:
>
> Add binding for the Samsung Galaxy A21s (SM-A217F) board, which is
> based on the Samsung Exynos850 SoC.
>
> Signed-off-by: Thomas Turner <tturner@lineageos.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> Changes in v2:
>  - Sort via alphabetical order
>
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 753b3ba1b607..021250497da9 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -232,6 +232,7 @@ properties:
>        - description: Exynos850 based boards
>          items:
>            - enum:
> +              - samsung,a217f                   # Samsung Galaxy A21s (SM-A217F)
>                - winlink,e850-96                 # WinLink E850-96
>            - const: samsung,exynos850
>
> --
> 2.47.3
>
