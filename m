Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FCC26A0A4
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221837; cv=none; b=FTt+eKspp2Y7NqCPliUux9IA4WZ4P6OoIgv5p33uHoqPDS17JP3IIRLOuOiFOzXXQf2IWGgrxUQ80zgSgWEb9ZXBk3HlGZIw3UAw88M1lL1m3FyLhPrxmLngFoG1g7A7yAiUCJ4Pfy1kvMeZvgPxqePKztCxikTtyVldCqZmyb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221837; c=relaxed/simple;
	bh=tx8YzHNBUj2kXpeOe64RZVIheqYx8JBL48xF8A/l0Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/1g/tVcdTMcwhLXIdPdngjVj48CQMoW2Xl382wcGW/EaDrO6zjE3hl1Hv7sE9GsMDJ/FY5NgJUnS1RV4lEwcnelZCr6spyNSVhJ1q1wTZqz+YNAzLn8N1IBTG0bi6o41N77YY5+I7FepSTNenki1rtIDhtT9UXnFS9R/qzE00Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CifpsKCr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CifpsKCr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-442f5b3c710so3476745e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 04:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747221834; x=1747826634; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PqwsD7WCcNuEv2WTK4iZPHlU9QaOgxXWeL2peqyTOEE=;
        b=CifpsKCrJBJiAVrvwso4NA8fFFwDFo94V+mnbRYznzJ0XoIprLJ3N+y5ht9jkHDViL
         KctlCTvlv/BRnU5y1fyffDWoztowmALzV6dvBaQCs3yNX4RxGnNxM6htFnY8QQKitUEG
         ElTRImyLAkKA6rNQpXNSbkRKw7TnQ+/3NkKvqVAMvaszbRIN/NpSVpilrE9uAaAOkARH
         W4LN8LXN/px+KEaPkKBWJKV4n7amQcffOZpbiZQWH/QHC2sBY99SA1NLtnVlq8/SIN7d
         Cjx1xxltAYRc8U08Ji3DK1wAi5qaM+KKL3eAi5QdK3ZIOKdGT4glG5FCVssKPjt0E+JK
         JEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747221834; x=1747826634;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqwsD7WCcNuEv2WTK4iZPHlU9QaOgxXWeL2peqyTOEE=;
        b=oMSA+kXSo40vsRVUKKQabhH3Nw5uGYMU2U65XOLZmkxKyhkJzvZJOBqAWWRmOEzJLc
         Spk6+a0Ug7DvYAQQZSHITBQDN5ykySSMPySGQc0b/0in06mULZYmSGyEG6eWWa5W6uvR
         XUCAR/lNCr//0qN1tTWikuyJXGB388DVuAxXp6EAMjTMTxsO284E87qyFtczo+rg0LbG
         HYr2il2ML8P58s6ObfOuol/88QoEBmWD3prBnaY1SfyTpwyKnW7QMwKqBBKQ0vorZB68
         GR9DzD+mIWeMxiNcO+62zsqBYRJy4Qmpsqq9IW5CKoaJLm/sk4O4jydNTOrTehCifHOK
         uKHg==
X-Forwarded-Encrypted: i=1; AJvYcCWEx/Fu55kQs+L7lB5HGOLQGHXZkBKyQxPr2NUN23JyrS1ULaAtFbVFTOj39US0HTT0HF31u9Pff4EXlk+/FTuPTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLzNzwk/AW1y0XxTPBG6xh6P7wJf2eUFMYMSLJW6mStlC5Y495
	qqqaZN4BNdyXUbR3y9TzsrrFwOpk4IVLLIpaNX8njsxj00V/eUez0t7SsQNliKQ=
X-Gm-Gg: ASbGncvDdr4gBibTbs4yGNDq4xjUttjYrML+c4Y9CISY4ZClWILpXKLxBl0iH2TGGxd
	EiMzaFzIOZhwK4U6b3JsQ+Armse+23xiFKxshhuI6D9Z3LSSo8rKLrsR9BjSgcFIp89BSCCw/6Q
	G/TyBXRTohCiOHPSDnmo+cFI7frCboJ1dUeuHVelmii1/MajTSFjtI4GkKm0TVo16kiO3HiSZ7+
	ke3+8QTHSHyHtZqfENWJDdcVBq4/NcnH/RSRRoGEBkdQ8+abgzvR3eEmi19oJj31YIRrXz1n+rC
	w0y2gaLCeCCiCDscIvocPAliwpiv7z5yyoUTtgKx0uq0QdKdFcr+iJ9yqvLExHLVRoDon7C45D5
	qy/nRQjf4pOFbLA==
X-Google-Smtp-Source: AGHT+IHd28mYJHFkZ2YC/3FfmJfsWok8nxf/8sbB3FWwSEaJKR0MYxIrlFfEdGODFNdqer26tUf9qA==
X-Received: by 2002:a05:6000:2506:b0:39c:13f5:dba0 with SMTP id ffacd0b85a97d-3a3496a48a7mr1875484f8f.13.1747221834230;
        Wed, 14 May 2025 04:23:54 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2b02sm19714077f8f.51.2025.05.14.04.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 04:23:53 -0700 (PDT)
Date: Wed, 14 May 2025 13:23:51 +0200
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
Subject: Re: [PATCH v6 0/4] Exynos Thermal code improvement
Message-ID: <aCR9RzGMWEuI0pxS@mai.linaro.org>
References: <20250430123306.15072-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430123306.15072-1-linux.amoon@gmail.com>

On Wed, Apr 30, 2025 at 06:02:56PM +0530, Anand Moon wrote:
> Hi All,

Hi Anand,

if the goal of the changes is to do cleanups, I recommend to rework
how the code is organized. Instead of having the data->soc check all
around the functions, write per platform functions and store them in
struct of_device_id data field instead of the soc version.

Basically get rid of exynos_map_dt_data by settings the different ops
in a per platform structure.

Then the initialization routine would be simpler to clean.

> This patch series is a rework of my previous patch series [1],
> where the code changes were not adequately justified.
> 
> In this new series, I have improved the commit subject
> and commit message to better explain the changes.
> 
> v6: Add new patch to use devm_clk_get_enabled
>     and Fix few typo in subject as suggested by Daniel.
> v5: Drop the guard mutex patch
> v4: Tried to address Lukasz review comments.
> 
> Tested on Odroid U3 amd XU4 SoC boards.
> Build with clang with W=1 enable.
> 
> [4] https://lore.kernel.org/all/20250410063754.5483-2-linux.amoon@gmail.com/
> [3] https://lore.kernel.org/all/20250310143450.8276-2-linux.amoon@gmail.com/
> [2] https://lore.kernel.org/all/20250216195850.5352-2-linux.amoon@gmail.com/
> [1] https://lore.kernel.org/all/20220515064126.1424-1-linux.amoon@gmail.com/
> [0] https://lore.kernel.org/lkml/CANAwSgS=08fVsqn95WHzSF71WTTyD2-=K2C6-BEz0tY0t6A1-g@mail.gmail.com/T/#m77e57120d230d57f34c29e1422d7fc5f5587ac30
> 
> Thanks
> -Anand
> 
> Anand Moon (4):
>   thermal/drivers/exynos: Refactor clk_sec initialization inside
>     SOC-specific case
>   thermal/drivers/exynos: Use devm_clk_get_enabled() helpers
>   thermal/drivers/exynos: Remove redundant IS_ERR() checks for clk_sec
>     clock
>   thermal/drivers/exynos: Fixed the efuse min max value for exynos5422
> 
>  drivers/thermal/samsung/exynos_tmu.c | 100 ++++++++++-----------------
>  1 file changed, 35 insertions(+), 65 deletions(-)
> 
> 
> base-commit: b6ea1680d0ac0e45157a819c41b46565f4616186
> -- 
> 2.49.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
