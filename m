Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF131A2658
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Apr 2025 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744964377; cv=none; b=nhQYLDJHfsjJy+wB7Vwlq3D6RCgrMLKq7tgdkz5b6+tvo8wYXn19KnDbzwIGFNxCC6QCi8kZ0C1C66mPz/dLp8+TEmKN1VPiW5aHkWC7rfJze8aTEx6QijEHq2pPvUwoYCoNQYOAjtau2WF1Hkw1CtbVq0Os4hIBk94+RjX5p5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744964377; c=relaxed/simple;
	bh=OyANNumqNGehMqydbT5YMfLr7i8JOGPuL+legh4Nnyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvGptbRI1oQjELurUQdjUn9A2PYGXy0lVf52hj5Caa9XRwcclbraIKGHOL/MYg5kilVCvGB2Bod7569OZ6wgJEpAleInpqw28ENJid54px9FSdBxn1GYztOj4c36Q9YejSecas2YAQ+D/OKJUZW7uif+sKOCvaaJLf9c81zFLdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YcTBS4l6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YcTBS4l6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso8047865e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Apr 2025 01:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744964373; x=1745569173; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L630Qky/UZ9kI7H0yEROeZ3XG2IusjzeuDyDM/AGMdw=;
        b=YcTBS4l6O3ZSPlDTtRF+jrzXv5lAIuT1X2lVKW5Sk5v1I4R4gi/8eIjsqyHymN6wZ9
         u5YzPyLDu3YXvOijF6POiBJvZ4DofWDfCHfz+/dxd653CUggHyKf5QIjN7FSrvUCdfi0
         x2CMz4ei3FTmVkLHcBto55wrwVdTWqAA76u2I+yV4GJNgb1bSTeoEL9C5PbrsYOOmqrO
         9E5VrCGu40v2eQrKj+gdgyRRU4BJLUBs/4SPRmejtt2ZcR/gbLDb2r5aC1f/iE2DEjfl
         Ga+0Ljm52RQ5sNzyuXO1vjsVkdQD7Ar4Me+4d3QuqX4Dd1V4OqPNgVys1+xkqy/KJREH
         36eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744964373; x=1745569173;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L630Qky/UZ9kI7H0yEROeZ3XG2IusjzeuDyDM/AGMdw=;
        b=GK/S7BYe9RSqGh7XI4jLb1j3rHTSZKkk476+HFYNMyBFQtH/criwDnYChhzBvbcE0q
         +9mm5fiwt9Xwj8iDTfzT7PyGdNH3i56UUzL/wubpBArzTOrn5Y/RYpYlsJMIwiAOy0Sd
         a2Pp5b+4/gJzUaKtWtATShbvirUksXQGYj9bz6i2ePYvrlbw8mlLpceM4LWCpFkIPFIe
         F7oI61X730FzFJoQO1Bl5KILaqowBBL8JcQRSXnj3Oo3e3Kebur7FuIGjZxZx4h81wTP
         Da//+NmCCTjHVcjUcbhM+SaOGX3agmgy5ykW9wdvSkBhVFHyZRds8uT4lSE7nfNRaUZQ
         oCnw==
X-Forwarded-Encrypted: i=1; AJvYcCXvTKhoYP+cHrFEiRRafnToUu4UdNU1m2kyA8U6oe9fQLfnNs9ThYqW1XK15ZZjemmKacwPRljOuBo786/g+n9v8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq/UJugjRvO3Hr3vtnTsHm1nh/cqN+KhwXLAseaeUdy0y6VZYC
	wZ+/ZVAzJ9abms/r+9llDmIsImxrklZ1jqDW34LUPrLHBFY7SlEX7gfYkU2/hKA=
X-Gm-Gg: ASbGncs+lLOKMXOO/e3tlcZKoES+CJSt7ajqGOQIkZQdUrX/aXTyBX9VuY0w0y/M9ix
	IuL1pFvWUioD48SNoaehX+NL67uwwXse+VmRzaOLjuGJPUgVZbp7sosrhp2vtpSxNu52RXTvU86
	HQg45el4imqzSD0zp+d1n8AV92aYfRBphYZ92QWhv5bvJoCgNUwyI7cpcj56VoKdncq4FNETVBI
	lhpeVLygmJD+6vdFL0oNxUDg1wRF3LHghMvpdvrUQ3g2dJaZb/D2u1k0cjgCq9VUFnSXCoAZ3zq
	ZCd7Q7Qz5wCyKXnUiuqP51QHa/Iwi824Yd6KnJIIPqCjVdg0/rV98wkyW9uVtzpm+5jAbDGbhAk
	bssk=
X-Google-Smtp-Source: AGHT+IHprYn4MpD5iVpcM5XtKPgBCL4PbwyZvt4l+PuNDtvWyynJ4XbaF2lxnyotFbTDZATgIX8ZLA==
X-Received: by 2002:a05:600c:35c9:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-4406ac412f2mr11115405e9.33.1744964373510;
        Fri, 18 Apr 2025 01:19:33 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433354sm2079318f8f.32.2025.04.18.01.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:19:32 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:19:31 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH v5 3/3] drivers/thermal/exymos: Fixed the efuse min max
 value for exynos5422
Message-ID: <aAILE01SjRR874jc@mai.linaro.org>
References: <20250410063754.5483-1-linux.amoon@gmail.com>
 <20250410063754.5483-4-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410063754.5483-4-linux.amoon@gmail.com>

On Thu, Apr 10, 2025 at 12:07:50PM +0530, Anand Moon wrote:
> As per Exynos5422 user manual e-Fuse range min~max range is 16~76.
> if e-Fuse value is out of this range, then thermal sensor may not
> sense thermal data properly. Refactors the efuse value
> initialization logic within exynos_map_dt_data function by
> replacing the nested if-else statements with a switch statement.
> Ensures proper initialization of efuse values based on the SOC type.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Same subject typo: s/exymos/exynos/

> ---
> v5: None
> v4: None
> v3: Improve the logic to convert if/else to switch
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index ac3b9d2c900c..a71cde0a4b17 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -899,12 +899,23 @@ static int exynos_map_dt_data(struct platform_device *pdev)
>  		data->gain = 8;
>  		data->reference_voltage = 16;
>  		data->efuse_value = 55;
> -		if (data->soc != SOC_ARCH_EXYNOS5420 &&
> -		    data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
> +		data->max_efuse_value = 100;
> +		switch (data->soc) {
> +		case SOC_ARCH_EXYNOS3250:
> +		case SOC_ARCH_EXYNOS4412:
> +		case SOC_ARCH_EXYNOS5250:
> +		case SOC_ARCH_EXYNOS5260:
>  			data->min_efuse_value = 40;
> -		else
> +			break;
> +		case SOC_ARCH_EXYNOS5420:
> +		case SOC_ARCH_EXYNOS5420_TRIMINFO:
> +			data->min_efuse_value = 16;
> +			data->max_efuse_value = 76;
> +			break;
> +		default:
>  			data->min_efuse_value = 0;
> -		data->max_efuse_value = 100;
> +			break;
> +		}
>  		break;
>  	case SOC_ARCH_EXYNOS5433:
>  		data->tmu_set_low_temp = exynos5433_tmu_set_low_temp;

Thanks for taking care of cleaning up this portion of code. IMO, it would be
interesting to go a bit further in the house keeping by replacing this big
switch with a set of structures stored as __init sections. The initialization
finds the right structure and does a structure copy to 'data'.

It is up to you to do this change or not.

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
