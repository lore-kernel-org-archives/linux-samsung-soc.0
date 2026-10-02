Received: from mail-ua2-f41.google.com (mail-ua2-f41.google.com [74.125.226.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F06A47FAE6
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2026 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951616; cv=pass; b=k2x+GRc8P14/AoyZJa+vLs5YzLJ4/ppZ52MgewCPjCBZSeVp8ouQFJS5YbiJE0gZUkM51ItXf1DXkujVvkV6WO1JusawwqPJigJLBQmMvv/BDx2q7ovu5lNZalQWAHo1f1iYR0tR+4agPr9GrHj4U29fUcC9l1cER5SddtcbyaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951616; c=relaxed/simple;
	bh=PNbOBNyXkRISuH2zKHNjb70SO7pk9MOzRaXz8icfJsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGzCeImxUVXS8SELdgk+GaedZ6z2VewSKInGqFvXvPkF1PIltMcODsK1rYQL0p7cOitXHrc+ddZRptXi3hhddbtlka8KgYKD0hSJMDHkEZ5SreCnXYFiLjUGmaQXuRG4e828wbjJflTxuH7sp8XAM6VcLNLicozuzmLyveDxHNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UrmKBOwJ; arc=pass smtp.client-ip=74.125.226.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UrmKBOwJ"
Received: by mail-ua2-f41.google.com with SMTP id a1e0cc1a2514c-98c54a0acdbso11888241.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Oct 2026 07:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790951614; cv=none;
        d=google.com; s=arc-20260327;
        b=MaB0Gml1rNf/7bT1KdZbEBjxqr550sM/oxX18Ea5QWzNUvcv8lV4PXgYSVyN8lx8t6
         Uk8cvWCicxUO7QauV2LtMhKKuzZIQIQd5qsvjNJZWrssycfbo4QSTzsa5qt4CG7yBzrZ
         d//+5xNbH6JSNWguA6Vw91SHVjx9ycl49HlKV57THwvnnFTYPqho2AaNjcsVK/UECSDY
         vKMYTkCR5diC/lwvzAnNDgIEiRotjs1lKPnvzhxAlOBR/8XOF5wavTd76rLmdWq4wwfP
         3raQO0TW9uhYN+XTwXFil6WqODgvrSn7mmM+MBcbL0x5e3elFVGCoaaajCCvn9VvZuSF
         7WFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aMvSO5P24Ym2wFibt0ipNlW23D4EQZ7yzqETy/c1yNM=;
        fh=5UjiJDbhrr6eEOsdVHpVvfPNhhjujGz1fCKX/DO0o2g=;
        b=UIblcsv+MUm+Z7O0VFUBGKq/yRlzBwayUX2yegb06elVSeYezNHlLZGgQKNArpnOil
         mLS0cNT0++SyGk8fCza4fw+zy0P3mW2eaqU07noq43C0SZ7KRYG/1OLq8LBZHktvHnTC
         xOzAYS/kpstO1nvzrmWFBkHs+oykTtc7+UTCvBbU9/S1Pa+iRgK5Eg6y2b/dXcorWSO/
         1ftjzhqd0jWBaamZgU0e1ukpzkLTcNvHUzFP/I05jgM54AUJLhh6cxJuc9k3c6t67XRB
         uqbZc5jr0ndki9jvKs2sJLJo7wQ2lha2qxb0lSt5q8mqBUss9UXkq7y7QKMBLBXWILMI
         QffA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790951614; x=1791556414; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMvSO5P24Ym2wFibt0ipNlW23D4EQZ7yzqETy/c1yNM=;
        b=UrmKBOwJD7r+45MqNt0a/8g1jZY8qSEomvYl7QfBvV8EBMT9kRew5q9MpDrDD9Bpqk
         yeB20MD8lwLB9OE4YFHjCxacABO3b/wfK52/hBDvzDUTFvFE+q0ZzuyZNlyDx424lF44
         5e4xW7nymLZWDYyG0skw2xLMMWQpS6pU/KbjdgDPhcqMdQsCgNYVr+P3VZoy7FhYX9Q/
         ylhtD5+bWWKNXYsPx7help9iNcNk8B/p3pqGRDXdh+ztRffT8MPwYJTx4yC5rpzrH3Rp
         XLm/6WWydqOk6WsIErXf2Y1khklK/xWEHnwY0bemZcwwbhjzAVVHckmxyLAa5y8zMsz0
         NkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951614; x=1791556414;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aMvSO5P24Ym2wFibt0ipNlW23D4EQZ7yzqETy/c1yNM=;
        b=KBIVNMtSB19UfcVloXH5qVfhUe5cZfwjxy6jRVW0afHY1/QgAmYldqzWIuB43Dokm4
         VzRJISX3XzlO//H6ifwy97tGzBFxGYmZwOlM1SGrEKUKibG5E+y0R+Qk2sC5aU72avaY
         78xCbVISH4/aSqrRL5Ixwyzi9PaGpEhNIZn+xkZPtx3yBenLEf5uWVtFCct3CvLTZV7o
         TU5TdGT/kRxr2BZ269YTEFZ3BD9lDIGYazd2twfm8R+zTQEtQPTLEZau9MLobuBSiZLb
         2VcWBYpWa9xX4p/vt+HsDYT6d5vZFWPZH3gOyDao+Kipkfg77BUFXJRsnG51xQpmV6t+
         d2Ww==
X-Forwarded-Encrypted: i=1; AKwUvBykv6nJUWJJyx6ZtEsla7y0jPsnfd1q6x69zr9kCjyFQc4nK93syV6V0jZFTsU3u3Ah7DnEdC5eGpsLyxvV4sG8Cg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJT6gTxvsBBH5dxlhcM3DPNfhtU/59EWJjCfGUA/rVcaof1KbgX
	BjQ6uqsWxX5iGB8O0tZ/0e63KKERiIQmugnmhzW2wPEIi44bvsCb2qWzFdmrRz8WEI0L2kDBkqd
	XMKEVjSh8bVIJJeAO2787UsHUQzWkMDgMhqmJyxvA9RX6VjQ1KscYZEg=
X-Gm-Gg: AYBFou3BwY33gZEMnhQeIkXzWbZFyqIOYi0TjHzUeZkudPA0SvyGGahQO0XQcaBmDv3
	brkizZj08J5FpGTRjLTKsQPouFdElWA8+X1qqGijpJhAOWdfolZjTlPUtODIeEbB19U5uXvC3NY
	Cw8CvxKepMx6K1/4njNEvuL+hlMRJn7NrneDIAbKK/aLiWmWiBGilosH279hMVVeHPUNNpUd2bz
	YRMzZk+62I7YwTX9y9V3A6I1G/3d2/CRfhhfuZCjeHz270mudNBVu2GrQQH2My/li1qHQKJAYkP
	2tipVEnnIUfAUWtKqAmcRCksXhzahVq3zSgnirMz8+kG6wHruI378APU1i7nRi4wk8fS/22kRtC
	2PLOYAKKcaUovjQ==
X-Received: by 2002:a05:6102:6444:b0:7ba:ea54:65a9 with SMTP id
 ada2fe7eead31-7c0f42731b5mr647395137.6.1790951614035; Fri, 02 Oct 2026
 07:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org> <20261001-exynos850_adc-v1-4-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-4-791b3516bb9d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:33:20 +0100
X-Gm-Features: AclHuK_nlsYCw4TsUB6KsMMTGZlzaoT0nlgKI-1tdzuxscLcNJSDMijcKeaoSvg
Message-ID: <CADrjBPpXvW1RVGC=mTO9sQncS3w4zAMKekwVa7Vbrq5OszJMwg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: exynos850-e850-96: add soc thermistor node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 04:09, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The WinLink E850-96 board has a Murata NCP03WF104 NTC thermistor placed
> near the SoC package die and connected to channel 0 of the CMGP ADC.
>
> Enable the ADC node, define a dummy 1.8V regulator supply for ADC, and
> add the board-level thermistor node linked to channel 0 of exynos_adc.
> Regulator is represented as a dummy one because we lack PMIC support and
> should be replaced with a real one when PMIC support will be implemented.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> index afef32ad4ee2..1abae8b9fa49 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> @@ -126,6 +126,14 @@ reg_dummy: regulator-0 {
>                 regulator-name = "dummy_reg";
>         };
>
> +       /* TODO: Remove this once PMIC is implemented  */
> +       vdd_1v8_dummy: regulator-1v8 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vdd_1v8_dummy";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +       };
> +
>         reg_usb_host_vbus: regulator-1 {
>                 compatible = "regulator-fixed";
>                 regulator-name = "usb_host_vbus";
> @@ -166,6 +174,20 @@ rtcclk: clock-rtcclk {
>                 #clock-cells = <0>;
>                 clock-frequency = <32768>;
>         };
> +
> +       thermistor-soc {
> +               compatible = "murata,ncp03wf104";
> +               pullup-uv = <1800000>;
> +               pullup-ohm = <100000>;
> +               pulldown-ohm = <0>;
> +               io-channels = <&exynos_adc 0>;
> +               #thermal-sensor-cells = <0>;
> +       };
> +};
> +
> +&exynos_adc {
> +       status = "okay";
> +       vdd-supply = <&vdd_1v8_dummy>;
>  };
>
>  &cmu_hsi {
>
> --
> 2.51.0
>
