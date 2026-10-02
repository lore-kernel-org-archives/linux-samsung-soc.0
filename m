Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E14A1E14
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2026 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951574; cv=pass; b=sY8+MvzDqR/K/kLJvDa+h1geY05w1UL7CkfzaPg3OfSNHEWO3efoKtbnnUQUTK11At5DLW/UP1ohJmpFcLcgfBm529ZOaKEYObgba+IXOS/qp/1YMakEhJDWzN+QGlMxVZ5odLqSKFS4086y6x+r7DfWzYwA9BYhC2Fi0h2E22c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951574; c=relaxed/simple;
	bh=bZmAl6ztxWgtImD9IPg8gArzLJy06elWJ/9P6bULdpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7rEiPVMNITVBTh1KKQm9DYwM9hN++R5ckw6fq1ejpsec6QgHDVo2DN5Tkqr0WE/QAMft8L3rV8Hj3QWa3cKWfy3vQVrcxn1g7pOlR9BKVdOBnD4t5JyJeZeZNbisBYUzZdEZVF5NKJ1+B0IhaiAzwG0Vy/YXPheeeF1hKo3qQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ql6oXgmJ; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ql6oXgmJ"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6ad186afdf4so6172660a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Oct 2026 07:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790951569; cv=none;
        d=google.com; s=arc-20260327;
        b=eq+ynZo2LM/egXymgVcMkGeZA2I8Ox4R/18iBjZkeph9wxK+G6+pd1Z+0/ZCP3+lyo
         6yFYZXTdHIeGOv1U8jZ4FI5AK8a9WXvhmoyrprB1XgQou8UuBYpIwcKNFIxNKa4gnMUN
         Qnv63+xZMQrip3qTYsszU05Eq0ackvGG3/vhzhAmGgxinHKGunQqXH3t+9EYAMXioKzs
         8oYY9Eu8LEsvk0WXvZnItbc53GUZtohhcm4scQHfgflMYzFKlGXG5jiognWa7SYMJhK5
         c8eTOaWtUWlMZXmswquDRpkWjFNr3U6HcQ36hzckAO+MNGT5Q9ajlyjPJjuSBt9lmZEn
         0v7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WVZnneXo79e+eMoEqif/HgEGGF2FDvOfyTIiKbvv9fg=;
        fh=acELkNYQ6Cg7m3di/IG4uTpKm2hy44oJjdIcvGXrw2c=;
        b=kOC72Qfv7eWV3088pknBSsATtlpyR0SoOG4QPDitYmCwW6LxwzQK5/Dubyk6XX+0co
         RAA54JwTmIZyxstulg85eOhQgT9Z1lF7sEbzc8I5e3+zM6pkoJLvhvPENIeGTLmkLzhb
         C/BIQYY2sXf9yxz0DW+tKj/FQKoAqd81zwitjvxWlxVZbl5E+/WE5BMYEGzwWa2HHKrS
         Giwanm3e9umgiyPETuMxXGtyRXmDWh+boKOtiRkhFloqDvU1gZL5IXEl1zHviNeUx/qC
         KCkX6uzLWC7J1Nxc6XFURiLAoDk/LpwoB9pR7nLu4nf73GtTWVaF8oOxPBmr5dnomiXx
         FlTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790951569; x=1791556369; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVZnneXo79e+eMoEqif/HgEGGF2FDvOfyTIiKbvv9fg=;
        b=ql6oXgmJM9iQfN4Vl6JClWkyeDmHrS99BDRebg3wSUSBZ/4Icllt0SjezxKw9fEXP8
         i7rYiI9wU06tpHB1bSFmznJUzwjUir5yHQGypE0QOWL+SPF0x4aulwQh76qe2MyVCFlb
         Zq4c6VcWPj2RRIqMCVDkcnQjKN8suo3g2TlWoVt2GgukMCkh0/JHJqcvzw6rNIoaXcO7
         zYYMf+8pwFF2WTrZPxYCHogXKW42s0mb8FX5FtPN0VkbP71r91+c3MaDYhAVbtNAWP5d
         9vmUYNTz1jlgAsyEKZ/uM/g9IbN/5sgElzuk4zUwFv4F4Ebh/GYLHPeuKDfv8i6Y/3Jn
         ZSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951569; x=1791556369;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WVZnneXo79e+eMoEqif/HgEGGF2FDvOfyTIiKbvv9fg=;
        b=gaZ7w2pIu9sKLQSn+ZZAVHxF8jvKlf2DlKDR51S1OQESWiGV5aAlta/EhvetgimDqp
         LAlnO0elMhQ7DqpH6st2haY+XVyvf96b3PE6i6yR3nZ2b0gKgiKOdn/egOH1J9WpFhgL
         Zxw8J7QNQwalr2zc30dtJurYcZAobz8hdLeTn7SDqYlzsp2mD/Y6Y78pRDmfbubx5259
         AsXa31wgXQewqIvKvWQGB0qNhzV7SKwNCUGrU0zAGou3eHsOoCxgyUQncQWr0UN3rJjk
         0iqqBniMJ9bYZ22NB6rCHCYQI6Wcj9qCeDJlPg+u6oUZUxPVunzKQOZgWJCfuwYoBUdL
         2m0w==
X-Forwarded-Encrypted: i=1; AKwUvBzBO5bkH5Ttw9RpHVIxvdN0rEPwhRLtmm/OYVcifq/v2Cf9sPut+3pyIdWNxjkLltq98JlYK7m0lA4KThmT/lis9A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJOXvAbAzhBkyS/jnrEzWRLHNMLgVw+54QaIcgt6Od3doFkm+8g
	vgEMnbtmu48mNhiCBo5JShABgD3WfRki2aLI3oHd4iPVLkF9oDQjapRgnIGtpAlQgIfROcJ9Enh
	Rw75vqViDKA4arthKWXuWCHhEoAZCnRklF911sDGncQ==
X-Gm-Gg: AYBFou2KTi0TvcUCkDEBgP+gYivIFboWeImNsgWELmS5DuIWmysvr9EQxgwEMVXHe8w
	YjlTxlbiQjqpkPLcclKALCSUFzfuMBDj0BgI6A5QRGyl7HHqNOCHF9fCfgVhMQYWokROvWVWTP/
	wFY+k9AJJjZLrBkzeniFOcY1XdRvpAWAjy8sNMAX83oY6B06ZeEo9wQoi71erQxXdk2pYizf0Fw
	62tU6sllJgooF7BmxlWHvpQHYeK++fwGl+F7HYC6UsjQED74nUqvGKoVOzewMXqX6IXMl80ymjv
	8/3mYJQDTfidSMKK0DWyFSacLgMt7C3tuPwlzkwnQNXA6rgHkKgLGkeG0mND01xe1OUdfmohR7C
	emMFTeGLNx2ncZA==
X-Received: by 2002:a05:6402:27c9:b0:6af:9dd5:f524 with SMTP id
 4fb4d7f45d1cf-6af9e312059mr1764408a12.37.1790951569540; Fri, 02 Oct 2026
 07:32:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org> <20261001-exynos850_adc-v1-3-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-3-791b3516bb9d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:32:38 +0100
X-Gm-Features: AclHuK8RgbuTKFPwHvZ2diSbOtgklcZExTKeCVUevkgRzFlX0CzGjFVcTRb15lQ
Message-ID: <CADrjBPpOcpgLeRBYaf=RtLecjBEWK32icf8DcY5d1F4GQJ=WVg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: exynos850: add ADC node
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
> Exynos850 SoC has the ADC controller within CMGP (common GPIO) block.
> Add DT node that describes it.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 8a4771899a8e..eb87225a756b 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -355,6 +355,16 @@ cmu_cmgp: clock-controller@11c00000 {
>                         clock-names = "oscclk", "gout_clkcmu_cmgp_bus";
>                 };
>
> +               exynos_adc: adc@11c40000 {
> +                       compatible = "samsung,exynos850-adc";
> +                       reg = <0x11c40000 0x100>;
> +                       interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +                       #io-channel-cells = <1>;
> +                       clocks = <&cmu_cmgp CLK_GOUT_CMGP_ADC_S0_PCLK>;
> +                       clock-names = "adc";
> +                       status = "disabled";
> +               };
> +
>                 cmu_core: clock-controller@12000000 {
>                         compatible = "samsung,exynos850-cmu-core";
>                         reg = <0x12000000 0x8000>;
>
> --
> 2.51.0
>
