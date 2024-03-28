Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A487EF00
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Mar 2024 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711625789; cv=none; b=AAlNET3ICu+gA/DquxNDDq8XBt/JaXZ2Mj4R6r2MKdQlRgx0D9/VbFQ05Hre2jOFCQqK3IQz0zcHe5NGzgoJL9oAsO7mNucGb4SIHS7U6EfzUYh9+OBwznEXj/YLFL4RWYZ3OMoCCKGzGRj3Y4vg+46hlu+H5r6bAf3iBUvoAY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711625789; c=relaxed/simple;
	bh=ilFiE9F2pbJK4CUMlqxrCeQ1cVjq7bZKPhWVwfSrj9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VoJW4sqXWjpYHJkvtCBqqvDszTztrU3ibEBbkuYrxFmaWyHJgaL0kvneTqgM02NU1LeI13/oqpUWvduUl2l6XzNJGbxvMlBJZjDsbazaanLTWQ123kNiqONxzYXpS9EMf+NiNYN5+Tdt/uvLmoWiY/d9aw06pU0W9gJnItkA91Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tdAUr0hF; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tdAUr0hF"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-789f00aba19so58640485a.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Mar 2024 04:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711625786; x=1712230586; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/prkjkwBayqxMQUYRG7IzJfpOCSd/2k5XXEN/lDQzgY=;
        b=tdAUr0hFkCKJHDI8qlWl6HmDvuVsRGRbk+cOnoNM0xtRJVUo8vnVMWnTq1YHS/Qnek
         0SKBtiPBIvk2jnoDiRajZAp/6IUnu9CLE613IGXZuuPOaYpdHRWnNlH2umhL+w4zUYeR
         npz7YouK6t2Us/FuWqUH4JeTDyyTPyyu9fxi4sOLpm4sZDsOAz33u8R9lFarj/qnwsg9
         yZh5EBQogMSxmQZt2kogAd40HzvtCo+ePt4wTd4CZqqh5FRx2VdqWv9gF3MPRzwuo8Up
         yVKUuDx+hgsuPaEr8FHyw76hUqhGOMgGsBITP+yTOJGJx+tZkb0IH+mAQGz5andLHwuG
         +YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711625786; x=1712230586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/prkjkwBayqxMQUYRG7IzJfpOCSd/2k5XXEN/lDQzgY=;
        b=YBsvTLEKy0GgY26LZwcZukBkDpR50P+gd7aH8i/2xiaRfZondWWJGWbZsVqZIXBXd0
         plZJbsfZdLiomYEnLzsfMulW78XYUl6zvBMPxrdRe9sANmVhJCg9RF0TpEtIl9MFo7db
         d1ayzEVSAcdjOdVw4r2W7o3VAJ7ih3FezncWPprB9BMNtdP0rdnebLKzYAjaNOcwwp+r
         Xi+//YBcFW06FjRpCo2fKQMgLcBrDHI5w6f6bL20npKG5vGq4ga/owKCOdEVy2kTW9QQ
         45+MzvnOMb3xvsp9UFg/+mAjbwzsvsG/+5tT7bSt0fRmQRLTJ68U0/CVdhW8o03tloHQ
         brGA==
X-Forwarded-Encrypted: i=1; AJvYcCXqzgnV6f+VzmBKrRNVt3gT5kYBvg210uJhoC43WWlDYtfOQMOuvTUxamCZeqR/Kqd1f/yZjrTp525NMlzG79RMPKj7YuGEA6ptsxcnjG6Tm3M=
X-Gm-Message-State: AOJu0YwJknx+2mAlHBv3ZMvrD7ty+O8y408ZR9YhXcCntb8ljPT+41YX
	FZScpiJbE3Ssse6KJ+xdiE9MXCAUzaWfi0o8K/+hChhRkq54b6fSltzUaQYQIPpAu8VQ6jRGEa5
	Ajc8dcgEU3U1dLpCUOAeY2wlpcumNaxAJ3pJ11Q==
X-Google-Smtp-Source: AGHT+IECGMP91OnvJpnEQBoQ4ZvbqvFkvhcH6wJdMgASlS9vR/dFRa/h/ehJAtH5CkKObHpqEYR5kJ/+W/XF3z8Eh9c=
X-Received: by 2002:a05:6214:14a3:b0:696:3704:712c with SMTP id
 bo3-20020a05621414a300b006963704712cmr1853382qvb.63.1711625786555; Thu, 28
 Mar 2024 04:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326172813.801470-1-tudor.ambarus@linaro.org> <20240326172813.801470-4-tudor.ambarus@linaro.org>
In-Reply-To: <20240326172813.801470-4-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 Mar 2024 11:36:15 +0000
Message-ID: <CADrjBPpjK15MDTcSdOhiC6FnJcofDGArEvrkhdz+CHoFzpFheA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clk: samsung: gs101: propagate PERIC0 USI SPI
 clock rate
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com, s.nawrocki@samsung.com, 
	cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
	semen.protsenko@linaro.org, linux-clk@vger.kernel.org, 
	jaewon02.kim@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Tue, 26 Mar 2024 at 17:28, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> When SPI transfer is being prepared, the spi-s3c64xx driver will call
> clk_set_rate() to change the rate of SPI source clock (IPCLK). But IPCLK
> is a gate (leaf) clock, so it must propagate the rate change up the
> clock tree, so that corresponding MUX/DIV clocks can actually change
> their values. Add CLK_SET_RATE_PARENT flag to corresponding clocks for
> all USI instances in GS101 PERIC0: USI{1-8, 14}. This change involves the
> following clocks:
>
> PERIC0 USI*:
>
>     Clock                              Div range    MUX Selection
>     -------------------------------------------------------------------
>     gout_peric0_peric0_top0_ipclk_*    -            -
>     dout_peric0_usi*_usi               /1..16       -
>     mout_peric0_usi*_usi_user          -            {24.5 MHz, 400 MHz}
>
> With input clock of 400 MHz this scheme provides the following IPCLK
> rate range, for each USI block:
>
>     PERIC0 USI*:       1.5 MHz ... 400 MHz
>
> Accounting for internal /4 divider in SPI blocks, and because the max
> SPI frequency is limited at 50 MHz, it gives us next SPI SCK rates:
>
>     PERIC0 USI_SPI*:   384 KHz ... 49.9 MHz
>
> Which shall be fine for the applications of the SPI bus.
>
> Note that with this we allow the reparenting of the MUX_USIx clocks to
> OSCCLK. Each instance of the USI IP has its own MUX_USI clock, thus the
> reparenting of a MUX_USI clock corresponds to a single instance of the
> USI IP. The datasheet mentions OSCCLK just in the low-power mode
> context, but the downstream driver reparents too the MUX_USI clocks to
> OSCCLK. Follow the downstream driver and do the same.
>
> Fixes: 893f133a040b ("clk: samsung: gs101: add support for cmu_peric0")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter
