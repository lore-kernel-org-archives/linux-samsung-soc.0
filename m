Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0249F27979A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 20:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778273403; cv=pass; b=BkertplNy6W1+/QkTpc9TWG3jd5hWZ08e8x76Jg/PXC2bJDdEQY0cz2NMs1LZd5498bCiFHVvVq1BMRq8dzn5+1zI/ieJV5DYyUxbmwt9dguAD6pPj5vfA1KFPU280G6Yh3QXTDQYrXfGqgjAFxXaNSinxTxIG5knorf+Ovcylc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778273403; c=relaxed/simple;
	bh=fdyYtJLtjKBQJv4jqRopDa32X1ZpejqoxxymTnmIn78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+SXm9sI1sFFPHfvzv1WQtBSXL81LfB4SOOpVVCNe9wmsqHso9caWPX9OT1fMcXnFzHLeLhIdsbyT8/Lag+Eg0wcWygs4R0sUDAjIPYoKYLT8kY3CD/JGJ+GZwgiyWWfjruk1gNm7q5zsns7VKh58sqDzMVN+xT5esR9tKNJCBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kcP5rIBW; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kcP5rIBW"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso4063341a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 May 2026 13:50:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778273400; cv=none;
        d=google.com; s=arc-20240605;
        b=ENhBFzEtTUa9xIgUB0vtfqo5QLMjJgSNiU+83XS5yYnDuFyKnKPRCkpimPdPkOR+kk
         mto47oONiGvI2DYBkHbiGpdjQzXsNCb8cmER2XIFvwr5cuIwJgBUM+GR/4SR6NowTyfT
         l6ngk4dQ67uw22IcHJg9i7JqBsD1Hh/p1hsGIMn+rjiAxmXFSLvKFesVv3BZLt8l2pI/
         a7V3+pb9BG8zXCUOHmO3Ddjyb7qqMfBUzegpEDhLA6+66ZJ2/rqs/z9DCzNNJ97h09Dy
         IYo8K/hOWCpWXAzvDMPb2kE8wY9EN4VamX7jp6cNEwJKp4wek4nO1OIr0czK4MLLRoKD
         y2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zh/wQFPQhzkWv9+w9rGw8P4xXokXo+IJUUz/nVEgQFQ=;
        fh=XzVaDJVlK94KQEzH3/kBLYsnmC14wu9bpG/A2+N0Alc=;
        b=HpFE/2JKttNKjCbhMF1bfrVVPTtt72272m9YznDI5J4XJBCzXpSyiRnJTe+7ONGszU
         gA3IRoBtoj0D53J46f9v4nH38n+b/o65buo6Wn8DKmvdLzw9g4ZQn9wPCchodFW9Ixfc
         TBeLicYfmYcwhk4Fno5JHGq+7gUBNcr5WX4WJiwaX7r8Ug8FhDXeUkv9pe/TPh7t3A/k
         zsTC3uR9SIAOCTnwtoJGprxaFMazjDUIONxvw0teLksnQYd5HdgfgGRQgXXL2p578mPf
         XEuo+8calgJc8pXlxUtuKqNwHVFtYqjdhhQ2Toq/sv3u+LV75MKCQdwNPPTkkW+sXMB6
         O5Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778273400; x=1778878200; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zh/wQFPQhzkWv9+w9rGw8P4xXokXo+IJUUz/nVEgQFQ=;
        b=kcP5rIBW6gqOiJl5twjlvffUxmDWx7P3xNydjQnO6Ii2QVeQ5eG5HdMM2IJ+84qUq8
         66jGN8pkwX3RIbXR1B5DSsE5vS3bYqOvlNhP8J12UG0nxfrFQHLrreMTB8Z5S4E+VDj8
         1JALz3xtPNLEWP8lU3HIXF2Bo/97fx6JzsMUuNW9KOlCy0L8P94UAmw+zjfyU4li9wCS
         fs8paWrwXOAqA1Ag1YWDDN4pKoYyIYwFeRYzVK/HfFoplfLQIsldygHE4pq4q7XnmshT
         1bgZoloIZcOX0cqMxSbxtdZwq3yTlYzR6llq53IvBIqwuhxGUmfHsRYuuAJvnUt0kZJe
         nEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778273400; x=1778878200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zh/wQFPQhzkWv9+w9rGw8P4xXokXo+IJUUz/nVEgQFQ=;
        b=h4JMOfX1ok6SXwHSEU0nyz+gfrFMoOyysCNnOUVzakqLuiDttQ+3ruVqSAdIxC44yV
         Rb6XHLmfCpeYJplyEug/NBMffYhLp+nTQ86Ccl2Nm1nUkTTJ0RL9REjyh0UhBR36x9dV
         nTPcQdEJsUIpXZBR3bBj9+fc+1XxwAWYXaoKOsESQ47sXfCbDcOAflfFtbZRUOiQ2g6W
         JNvKt57EI2XjcV/Wbk/QtDiOJFVM4QUGKHELGzZv4YsRFQvRrDTzz32ph4lwAPI166dX
         r++RgAD7fZyrliBSVFTiGbdWT/xFg87V91A5KK8A47VlwP7ETpPWbpWi+v7U5OnS6EPn
         40eA==
X-Forwarded-Encrypted: i=1; AFNElJ8t/fzsiJBtx60ty5lEfXfPDsPEMUpuQRPRbn5L/2Xd/N703funrM/ovhMRhZLVs2VccoJl0c7VD9blLNnjKfo5HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiL/KYOCSZ2im7jyKFEyx9BE99r3SQ39pyAwZyPfM6PqGVA5NC
	T/a9Txh43hQFlRmUkfoaObod/WBCRvI4Yuk1CgbG40zcFgNEbkEdbluUaPSc+CFTZ63hfwzqwkg
	ESSzhFMXNGIhm8CGOhB68WHo1hGZ/OTIFfe90LyvBMg==
X-Gm-Gg: Acq92OEJmVCSmoYyv+cWJRd0kDKlXWfUR52ZD1oKYzLl2Q8LdtsxcFq2aQ90w8922+X
	8JdOxlK66NIPTZN2G5JPA95ROVpwZ8KVJT2ad4lmSBD7N+nDdr/mIA+Rx+PgjEwXtcP5fcz82tF
	qnlTnF3OWJzT/ZHbAJ9qbXHnkzz7BVHRFRMaKHXmGvenu3b1LVM8S0Bd7PMb83yaswuufoMJ95T
	syUM50rrHg01h45zQv9qkf6quoXSFR4YDYiAv/xXrX3KvG+gEWh8M2JNd2x3R4naECe9a7f/PSE
	kEMsnFiyXmiR/Oj5AsrtJSa9dkjOnwh9DErYL3VJbw==
X-Received: by 2002:aa7:dacd:0:b0:678:960d:cb34 with SMTP id
 4fb4d7f45d1cf-67d63d85428mr5050590a12.6.1778273400285; Fri, 08 May 2026
 13:50:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org> <20260430-exynos850-cpuhotplug-v3-2-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-2-fd6251d02a17@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 21:49:48 +0100
X-Gm-Features: AVHnY4IaFcTZPm9giV6Jc_QJYDLmEM1tYy3GvJxgbZ4vj91rTyPTj-YVRCvMm3o
Message-ID: <CADrjBPoSiZU_BzXxQiU8unJNSqE8EFR1YPQe25rN7fhfLP2DqA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2026 at 02:56, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Update the Exynos PMU schema to mandate the 'google,pmu-intr-gen-syscon'
> property for the 'samsung,exynos850-pmu' compatible so the driver can
> obtain the necessary syscon regmap.
>
> The Exynos850 PMU relies on a separate system controller block to handle
> interrupts generation, similar to the hardware design of the GS101
> SoC. To ensure the hardware is correctly described, this syscon phandle
> must be explicitly provided.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index 76ce7e98c10f..6550c3736a3b 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -182,6 +182,7 @@ allOf:
>            contains:
>              enum:
>                - google,gs101-pmu
> +              - samsung,exynos850-pmu
>      then:
>        required:
>          - google,pmu-intr-gen-syscon
>
> --
> 2.51.0
>
