Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468643B27EA
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483202; cv=pass; b=RQoU0mBCAofcPzHYPuIgJSkGzhGcZ2KdyD8Bh0isYBreKp+rciAaQ6nGNTc40nMIR/TFXZ+1ITFrZwHNwiBDpDvA2GAY1aImNMNH8j9MjUaNoH4EXRMrEureAR3X+FCeZjjjx8gmiZPlz/8+2/bcwPsrXQoxCNFqOFgFbyD2OXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483202; c=relaxed/simple;
	bh=bxAXDKKvJla3W1iIKPwj/ImYJtcT6TODMkzHew3uDnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMW5qRCqwH6HcP8SLeSegj6KBpcU8pxijrLQdLhtaKUyd0TcyNvLcHI7dDYPbRNKCKVbqmtdkQf29GdUA2+uIzqkXysmrbn/6dU+0D313bscdEiNSIH0j8rabKafdJcCF802e78Q/P6qkUSdqj2tOTKe0i9HAYBIBKeXnbMnyWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HsfwtDDv; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsfwtDDv"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7daaso5259931a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 07:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483198; cv=none;
        d=google.com; s=arc-20260327;
        b=osorYitUMombiDOPOUE4JOcyENJHSZv+3LdzzusKOsPtJGNO26fhzx88Wy0mwzudkx
         rOqIsiaeKGrSx4VsdQNMNjBe8Qej46Ey/sWDzZsioFrFc9lz52W5+78556q5tPK2KITo
         kUtBC0mNc3vDgsu2keEJ81Ga4fYt2RQamW3ZysziWYg4dTc+PAEdK96IRZPaxiT7Sw5W
         tvezFmeoHPIQWtD0CPwJpoYIXesW0Yyjl/Svx10cHEV//VmcrM5vodoVqgkn0YlEdtlk
         Pv/Jb9JSNkFlbrPpmJ++8DTC4mw8SOePtMTJBIzySU/sm5o4aLN4oW1S+FWB5mMg8JX5
         QaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3Xwa5YtOq2I0pAIeBe3GC0dtIeA/uMMyehMpms7xKhI=;
        fh=IeeXQXwkHYgfxEsplTdrlC8fA/b5CMaXWRphByaWgL0=;
        b=l8pAAwy95DVPz/YvAh/++3qLWjIiFSFCOVhWIQownOC2/DTZ1WUQdVAQKxrfFXDiD6
         A//ir/0kr6WdDaC9xZy9ULTttu1dWEPFokGl8CHTBgppfDmbRgtCGqs5kdVpM16U+Fhg
         QxkHBaPlEFTmPEMlptUFq2SPy2hL28l+UxwXiUQBWEp2Kt3QmfrdSzY7hEMc+mgut7BL
         sqXEmKF8wHazDZz/tg+U7xi5qZrIkctJve8O9QRBrbV5XmPWI3UFmULqEL4PWfGe5Krn
         Dliw5I2FmAtki4CHesJCo4VUV23vYAT0IXsSrUI2MKHIIAvAs9KUq4rQzvSaaAR17aXG
         WMkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483198; x=1790087998; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Xwa5YtOq2I0pAIeBe3GC0dtIeA/uMMyehMpms7xKhI=;
        b=HsfwtDDvtnLaXd4IM5o8j+x+NH3OWLAiok1HXT7Wx6pKsPHwC3EFLXeGfKsjuA2Yo9
         09hcNWo0ov8EZRG/dc9I7GaCfMVXcABmOV2oqy+lnlrG4rg/pRFeKazbQRCUoozhF6mM
         fS0pQZOLLqgtI1X2M0On+TKyJqnPHu9BTxM6GVWvwt3Kg4IXnKaZCfN1XqV/MOB5qatw
         /RxAPExpFX+5NJY7QVEAkux1MRBvb0SvnK/4eefbDL2W+il+C+vDJu8AW+/+MamrDf4W
         Ug5meXddV3I8wewZDdSVOB367kQSZTvQirq+NGhZGdHkEUr8VwK4bO38o+xW4m0iGtrR
         kIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483198; x=1790087998;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Xwa5YtOq2I0pAIeBe3GC0dtIeA/uMMyehMpms7xKhI=;
        b=Kdcf/NWa4DVN4soHpo1UKWXEceMLVkJ1ftyndVXlurKhn/jZyGEsoeFjq0Tlb/JDX+
         ujP1vTLGnzZ094MPs5/j2gvFXDZBRvbsA2rnmUcR9fZMZxbBiKQOg9p359oz+fOsH/Cp
         EVxIhAcF0cQ1rpkV7kO9JLLD2Z92ND57fBckdp/GYvqU6igjTc5AnhAyZHvgsJHLzF2W
         Nv9Bc86S6GecjALFt65GN7Yf/iey2rxj91P1h7PHLJlU9Sdp1G7i/2BAwgnTAFGIJsSm
         2qD92SYVnSuwSNHhk8UeHF1x3jDr+dCSHZXgfI3E/54H/GC8Z6928aThkc1S4klYqdmd
         XrFw==
X-Forwarded-Encrypted: i=1; AKwUvBwRi9TRlgYcF/6OmYPKPSZkQqjCidHzSxfza2dXDalPZ9NoRLjXvHGfJExEjO5xJjXcMJo2cWpMChjTUs1rD0+G7w==@vger.kernel.org
X-Gm-Message-State: AFuF++ky8v/eVxYrCFpFKKjOJsUEq4RTTUqQfHZhdLQoXENTsYMOsj8r
	gkIKNtPZIKjlWwypwurFFyKryamYRjItmFczZNvZau+zaLenw0gMsaoaiVlabEfqfAT6w1JFUxu
	gfq9CsbWfmIXKilNKUh76jRIXwQhF273PFKZ+JGtuhQ==
X-Gm-Gg: AYBFou0+mCO2Tlu+3KdOIty7jUdCir6Ex/8GVzZPaFjyydCLOO4WTnyvLq9T9Hj5jMq
	bJXB5MoJhpX6MbRMz91H6pwEW79b/M4+yBii4dGmAhMMbDPIPRaL822oyzKAMSsuxvgmKG2/iHr
	rhUFKRa0HuZbO0sqlxZjdbipMBdmJDWhn5R8rcezxSXcXfFrF1neWYRvKj6KBIWPbpba4GTlscp
	PJzE/E6igVXblnFFb16RdxSqpNsBhkc5vaY+jtMH9UJYjwP+8rY27U7I/WmwSOOPVC3Sq03XaEw
	M/gSWQEQMX7v+VyD90ztCONKIsmSDBvqbtOclMwURA5DlIS3LcFUoMtxMdQD3+446is+KBA1J+G
	w7zbfyenRFjX3jA==
X-Received: by 2002:a05:6402:20ce:20b0:6aa:1112:62ce with SMTP id
 4fb4d7f45d1cf-6aa11126963mr2247651a12.17.1789483198039; Tue, 15 Sep 2026
 07:39:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org> <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:39:46 +0100
X-Gm-Features: AcwNN1UWbY0jLS0AasFyFQBRa0-ZrbV9B9Ct3OZ1vkaXc7hzdPFBJ52yoD3W0ms
Message-ID: <CADrjBPoEmxv=f9DmRx2Zn9cB40+V9DpruayEHFkAznbNeu7D_Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: sram: Document samsung,exynos850-acpm-sram
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 17:58, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
> for ACPM communication on Samsung-based SoCs.
>
> The SRAM is consumed as a whole, is not split up using child nodes and
> properties related to this are not required, that is why "mmio-sram"
> compatible can't be used for ACPM purposes because it requires child nodes
> to be declared, which are not needed and make no sense in case of ACPM.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> index b83fc6831947..b9c4d4f3199b 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -43,6 +43,7 @@ properties:
>          - qcom,rpm-msg-ram
>          - qcom,shikra-imem
>          - rockchip,rk3288-pmu-sram
> +        - samsung,exynos850-acpm-sram
>
>    reg:
>      maxItems: 1
> @@ -159,6 +160,7 @@ if:
>            enum:
>              - qcom,rpm-msg-ram
>              - rockchip,rk3288-pmu-sram
> +            - samsung,exynos850-acpm-sram
>  then:
>    required:
>      - "#address-cells"
>
> --
> 2.51.0
>
