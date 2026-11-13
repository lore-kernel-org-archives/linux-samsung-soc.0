Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574856;
	b=5E3iLY1pjiYo1hvNRQANWIUG21hSl2sqljdHf5Bsk+Yh9/Xr+VjLT5r9sTuubm0dhsRr
	 sN0l7rT+UHBk0hALwIg6XaqpcYIAeaqtFjmeEQShrtnvepWXadYw0kZMxfODodJx/gWCA
	 FjbvtT/BjU/b2k/Mnz27VymQNJtMUAAcEbdqIi8kHDS0hh5VTP1bRPl9Hl5HSM6OytEhn
	 OI+pPzjGxDOU4ip7EpZg+KPPRA4uVyLcZy6WOzd6AInuVWhZ0Q0rNQJPL0DO6bbK8PG+E
	 aRCqmgxJ5apo7oY4PJ+Ns4cBd1JXQekWe/nfmAeIjKogv39t4fNPGkw6UW7T6N+vn1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
	b=tjp1bHy6FyWItgOj6uz5xeaatWW3MEMPXlhSOxELZQq+b2K8xJQ9R5Fh52cdGSkA2nWl
	 LIBtzgq1FE083QxaHM2ZU/RwV+vAAzW6BnWXO3wafL2xO3NpnEwekmE897N4S1he81oPd
	 WEdpSQCr2oeExctuxyvi+rguUgBFJLAa/MF9ZqJub7ckRA1GkMPz28qE7d3WE+6RD/u8j
	 GLlqno05uK/0Qf9JX4IQ2kdDV22q0o4L6lb4s/Kzi2blhlbuaiXcVeWVo/h9Yt2QKzIOI
	 W9YRNocuCML8ywVVGxb9sWauIlqjzs8Y7mtHwQJw0z2mjveEHdx1o7i+2wJOzf140Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jnm00dpe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90A5606A336
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 13:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90A5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jnm00dpe
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1360767a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 05:00:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574854; cv=none;
        d=google.com; s=arc-20260327;
        b=VJ+KLzl1LDaYkmKf7VLAJ2ETzvL1ygapEOinWBOCNKcNXiSsNOVMLBjGDf6LWFONBV
         WjE0nHn/vaCQx+aPHzvXzCsGAauaph/D8Bib/7D6CvouQ1JHGWUEeCbhTRlJ6S3tLcGR
         YSr2iJ35s1YVdwW8AxWoIyCleoG9sJkCkOBxSiYuz2/tJCEamgzdk5zuo/x7AbrRsiKg
         XTX05neNc/UW09rjgNZ/GJpKFoGKy15qkP1y9OfFY1BWWcAKGe+lSvgWi6KFvs62mSoP
         YCqfW7YE77/CjDE373CgMaentxg8dBdHLkZN+VWvKOhkhSlFiO1aU15bbbGv3e9eBOhd
         fsww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
        fh=M5W9onMA0p0Lu4Nz+bX9kdXrSNqVxTffdpx+UJJBY9Q=;
        b=ARFVYs3lrQEtdwssPM07F6VFfEttmwLV4GjVmEs+PDKK0kjXtiQEkqJPT5soecAM8y
         XZl9bWvh/D4JDl85LHxhWNoFLB+LEefkxuj+x7IQzn7jAvbHyz5CfWmXVdBWLiHbhbyv
         Bo57JwBKJ2jKXgewcZzxCQlfX+af2RdKiZqDYNxB2juUbR0v3hXxseo5zCwqXk9F/crW
         2XyxfCNRw3PoGOThFBcOBnCTesZZXjs/4X3d5PN2xTgi2DNDlUgXSoDfjjzocvtXBe9u
         dnr5Vvaergek0zWucOTgZkC9WQT0Y5xxXqvqpCsM2S4fbb9YTv0vf92eAMU45Ev8w3Uu
         Y5/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574854; x=1795179654; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
        b=jnm00dpexQcSPfGZxQphnKBSd17bh5Upe1ySHaJZjd3SRylcfmGBl4dkJu33zlmYFS
         IK8hqMGUDl1UCPZ8ZrJ7+cPX+7adIw6uvi7+1wSF1E4uPoOASKQqKtMVltRdHOGxuoLJ
         HJBALf2AkIm/5Oc/99i93CWinzFErZvMrVFB0BPMBtf/hNO6A+9FDjSO6bCdzdapFF/1
         NbOfWZ0Vyez1mjQJ1sEMXA3/cp4OI8aKne4ycJkA00biNQ8w1FHmhwmQ6FK4ZHWkNKPh
         k1yv9/YvgPomizwtcLEFLtNVP650OM0e1LeUivUAFjAeZyDo+gcaD4K6as03xcz+n65y
         Yedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574854; x=1795179654;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
        b=Eo0C9pPrPGu+WXn5gCwkUAET2cKHHZIYGlZv1VgyMAclIlaO+r4zYkS0oSY1kPa6pq
         yJY3NIG20oS8g8I7rtw3rhyLftZ2pmjfpj5FrwgujBTr99RCpeoUNEccNyo1SAnXm7bm
         NHbgeaLDf9TSmD7rdNwgrT6Cxy7I3/12l5X1afVkwIemqQGhI2YxW6m+M4gedzwgH+PU
         T8MuMkI7o8gjeATClbHToX9RSUO8VKxAwaR1WDjLrxktvEC83uf6mMJv0UaTEqen47n0
         rd+3G7K7FGP9MtS4CRI0XWEd1ZxGuC/Pv0tNloaCZ7XX3i3M+k6ZEholn0fxvDz9qCH3
         CntA==
X-Forwarded-Encrypted: i=1; AL+hErGIDDFats9DIClwvCDj8JDxjbqc+s4avIUsu53J6oT2fO1rLS57Ljm/oHRVD5gw191/XAFX32mPf4fiyLyCI+M2RQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+4BP4EEEcolnEzONoKnRYsP8h8k3wlwIcFpmz/+lBcse8+kLcr
	83JU00nSTYRxlF1ZqzlmS9RMtlHAU5hVkUGDkb5d5RYSdw12PsFxsoKp4W/02HvMFLFJ/b/Ed00
	TtxxJIJpqm4uIJdlV5EDE/obFn8QqfNJBfzpEOy94Rw==
X-Gm-Gg: AYBFou130xh5bbN6kIQva2fZswwRh3yZYqKLP5QHAtFAojacwnlt40QpwUV6m2WYG81
	JEoRIQSbBIIgM95edXsUmVs7Aw74+uQ/ObEyO+9dJyeRUEZkQJ6Cby5ZUQEW+ZKyUFhhRbk2I7u
	WcRXiuaCtom3CvlazIxQiLdNNjJpT/05GYYtYqP6qtYBgkvvVUut/QLHlcfksTyqChSIajgayWS
	Izkbpa/1Rk2tevoXxip6eCm4/asGLzIX4ezWwBoMoyb/tXIXbjSmDX1TMj1iAbbuNn11KCsOMmC
	DDAFI2b0kTpNninWPEAcZjRMO3fajlI+JuV6yWN6X6kJAnU7nbV5gqqbYQurxMGnpxnu6MdtehK
	ncTNhza9TAEozjbcS+ZXp8EOxkS8HZyoebqBTsGtQGNjCxJoTihwEATc0mPtxgPi7P3o8tJVuXw
	NFN9LkwP6/yGX3PXI=
X-Received: by 2002:aa7:d1d0:0:b0:6b6:face:56ff with SMTP id
 4fb4d7f45d1cf-6b7c0c1cecdmr1756365a12.33.1794574853723; Fri, 13 Nov 2026
 05:00:53 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104904epcas5p1546fd543fad42a61f1a70d4fd55ac833@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-13-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-13-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:00:42 +0000
X-Gm-Features: AclHuK-Gujxl0bdCqN1FIJbWWs5SjHt2ToZTIgj-Ln1Yz-sYA3apmJelY48JkxE
Message-ID: <CADrjBPoSV8uOqX2tkVyEdiZi7NEOJAb8JsxkvMqUn9+wF5Jc8w@mail.gmail.com>
Subject: Re: [PATCH v3 12/14 RESEND] arm64: dts: exynos8855: add cmu_peris
 clock DT nodes
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add required dt node for cmu_peris block. Also add sysreg_peris node.
> sysreg_peris contains DRCG SFRs bits which are used in clock driver.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index 2e5dc79d66bc..b461de6a7548 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -146,6 +146,27 @@ soc: soc@0 {
>                 #size-cells = <1>;
>                 ranges = <0x0 0x0 0x0 0x20000000>;
>
> +               sysreg_peris: syscon@10020000 {
> +                       compatible = "samsung,exynos8855-peris-sysreg",
> +                                     "syscon";
> +                       reg = <0x10020000 0x10000>;
> +                       clocks = <&cmu_peris CLK_GOUT_SYSREG_PERIS>;
> +               };
> +
> +               cmu_peris: clock-controller@10030000 {
> +                       compatible = "samsung,exynos8855-cmu-peris";
> +                       reg = <0x10030000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_PERIS_GIC>,
> +                                <&cmu_top CLKCMU_DOUT_PERIS_NOC>;
> +                       clock-names = "oscclk",
> +                                     "gic",
> +                                     "bus";
> +                       samsung,sysreg = <&sysreg_peris>;
> +               };
> +
>                 gic: interrupt-controller@10200000 {
>                         compatible = "arm,gic-v3";
>                         #interrupt-cells = <3>;
> --
> 2.34.1
>
