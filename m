Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8574F3446A5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Feb 2026 18:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771439370; cv=none; b=QjzYHfqG7N0hyBx60usyHTQAwxuC0pI95SqjfG69f4X/Fnw1LWFifNyWKk3uOTdEe/UreMjcYMtfc8Z1t5MctiHs6ak9IuFGETjhkVi4E5p7D4dOMWtiIY5puhY4ko1RXWzYbUcoA+lAOdLk8PfhsOvuHkLyxnY+DdLGdgtj2Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771439370; c=relaxed/simple;
	bh=eZnBqrWtQXg6JjfPWHTRiksi0baJe5tMKs5q38C8B/8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gNaR9FAZMrztRYWInJSFPxmlRuMu55BIUOPAev0CIulc958xb2hfkV8Zn3RN3M1ROxluxqO9sZ1yYSY5yyvCBZlE9caAApnrDw5yYOMQCPT6bZhKfJ+jLX98BMuGNs1bKT0VvYkIx48dcIlTycZ1HTaOi0o5X1kw2rqiLv8+JIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CTnKods6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CTnKods6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48378136adcso924775e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Feb 2026 10:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771439368; x=1772044168; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2HG7dMgFbjsQ2a9OaL1N2Qu53e+VsL6dqqrCn2unbo=;
        b=CTnKods68RFkYQ+DXwha5Qz1xJXqCTgoi53KBg6U+pJVI+PjOEHWwkDR5nprqpNob2
         +L8ReFYcSknBNYMswj0DfzKMCmjliOW6gW52EM/5/Ch4C2Q0UTG3mwn0hQPVi/AYeZ96
         sYTXzswQ2PNRtkYKpqBTG+9DP1o3clh5H8c0stxyBkQ6A3fxe+/h5FuC0CLOrDhxjFqy
         bxmvL9wUcTbUNkJYTMkgQ7pFnCLEa4OkqucF/kh5c2zpnuAZSfED83P5vQbup27KgV7A
         2h8dgyAQtMWYc0HtgrzLuO1a3sdEBNxVN0aUSp4mMMJc+WRSL2lv5bIutzybd/Juc7MH
         FFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771439368; x=1772044168;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2HG7dMgFbjsQ2a9OaL1N2Qu53e+VsL6dqqrCn2unbo=;
        b=IyzkQudynGlTKdwvXFLOTGze5ArMz3gSzf/fDyl0pDulFHAhGKyEWBANL1OI9ISJVk
         uLu8KuWWvp/8nUXtw23mRf4BpkADgrSWnWK6QfuPt1s5CCXgYGDaSQ/acgvcNYwuFs6F
         6WgAdoHnryOreJ8b39MrujoxhB9Jp+UEPDPpZxuaADBMoRao52A4nVjrVdBdjQcrCPXB
         wDOpVHBMRBEmeTrQxBCP05BGYAWztBBXCjnM457rMjCeuUVqixU6L6Aqd+nyxWx5KYTP
         0QQKw7yE8PF8LKnkqASltDb+xErR3CSmkf903hsGNBTrGVjjSZqxQB81YBEJZ7ZOCDeB
         mMWw==
X-Forwarded-Encrypted: i=1; AJvYcCV5clNS6mQYO3mAJk2NJ3epkwrIBWlI//yM7l9RPmFLXlXHSc+MAuw16ZNjssnHvLPIhuZLSqi6pQ2CyLalv1IYdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxomYn8dIRtAkzdmrtBDuQQ5hb/WFvRLCatxOCkkc/UAZkC1Pjg
	sDXlrfbhSV0AhGRet6XUIbT5hcuMJ9tgC4HIRvcPs9/IQs6j9DG/cfbXGMIJOyGsTOY=
X-Gm-Gg: AZuq6aLKj7xkQ5R1C/Sajq8HHTPXaMHGZpvNR9oNA6xGfISYRP/Xf92jIURc+EBl0F8
	J6FA7bnEp6YvSrebEeNPL8kak2S9CAx0+JOffjgHNaTDTejG/VRd+XHLZVi4R5/SrawNKZCcjjG
	PdHcNEctMhR4PkFDjesYNGeuc9yPTmeiVgu7vkL5TDmEpxp8zP1RgvZTPQtWjRdNInf7DfBpAL1
	6StocIW9J4LtUs3Hc4soXXdsIAhFhf5ka9oplS5Wd80EK2YCGvku7ESAy/yFBEuNxahGNM2AMLh
	z5vUmMmmDEUGAw1paxXUSk80JUAQ41UpoEJgpgzmt3S/K1z2ncO/Pg/n55vT/9uSEo9lS9ek8FX
	/s64WBuIRbHrqY9P8JuczPsWQGEeJeJziaoBvtFrSikVhpq67Rx3hpAr2HJPVOQQzTE7z78kYW1
	4pjkb02s4FanE5RiHy60uLs8ja0XwIaEJthVZYzpsVyfnkmnrAZ0vRNQb9dsd6HYZkO0Ozkp/at
	1aB+yrilGhQO3YCaw==
X-Received: by 2002:a05:600c:46c9:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-48379bfd71cmr230436375e9.19.1771439367849;
        Wed, 18 Feb 2026 10:29:27 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:17bf:52bc:6ef0:a984])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837e565f5esm439288555e9.10.2026.02.18.10.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 10:29:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 18:29:26 +0000
Message-Id: <DGIAUIFPUHN8.35B5MNEUK1JW5@linaro.org>
Cc: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Bartlomiej Zolnierkiewicz" <bzolnier@gmail.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, "Zhang Rui" <rui.zhang@intel.com>,
 "Lukasz Luba" <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 "Anand Moon" <linux.amoon@gmail.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4 0/7] Add initial Exynos850 support to the thermal
 driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mateusz Majewski" <m.majewski2@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <CGME20240911121149eucas1p29b9ccf99a545cfaa924b122cd8dd3183@eucas1p2.samsung.com> <20240911121136.1120026-1-m.majewski2@samsung.com>
In-Reply-To: <20240911121136.1120026-1-m.majewski2@samsung.com>

Hi Mateusz,

On Wed Sep 11, 2024 at 1:11 PM BST, Mateusz Majewski wrote:
> This series adds initial Exynos850 support to the thermal driver
> together with its requirements (sanitize_temp_error fix, adding the new
> string to dt-bindings), while also cleaning up a bit (improving power
> management support and removing some outdated information from
> dt-bindings).
>
> Changelog:
>  v4:
>    - Cleaned up sanitize_temp_error a bit more
>    - Modified exynos_tmu_update_temp to match sanitize_temp_error
>  v3:
>    - Reworded the commit message of the dt-binding information removal
>      change
>  v2:
>    - Reimplemented to use the Exynos850 TMU clock: removed the patch to
>      make the clock optional and changed dt-bindings change accordingly
>    - Improved the Exynos850 implementation itself (style and one correct
>      register offset)
>    - Removed conditional compilation in favor of pm_sleep_ptr
>    - Shortened dt-bindings description
>
>
> Mateusz Majewski (7):
>   drivers/thermal/exynos: use DEFINE_SIMPLE_DEV_PM_OPS
>   drivers/thermal/exynos: use pm_sleep_ptr instead of conditional
>     compilation
>   drivers/thermal/exynos: improve sanitize_temp_error
>   drivers/thermal/exynos: reuse data->temp_mask in
>     exynos_tmu_update_temp
>   dt-bindings: thermal: samsung,exynos: add exynos850-tmu string
>   drivers/thermal/exynos: add initial Exynos850 support
>   dt-bindings: thermal: samsung,exynos: remove driver-specific
>     information
>
>  .../thermal/samsung,exynos-thermal.yaml       |   8 +-
>  drivers/thermal/samsung/exynos_tmu.c          | 237 +++++++++++++++---

I applied the whole series locally, it applies fine on 6.19 but I didn't
check linux-next; and tested it on Exynos850 E850-96 board with the
following DT node:

tmuctrl_0: tmu@10070000 {
	compatible =3D "samsung,exynos850-tmu";
	reg =3D <0x10070000 0x800>;
	interrupts =3D <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
	clocks =3D <&cmu_peri CLK_GOUT_BUSIF_TMU_PCLK>;
	clock-names =3D "tmu_apbif";
	#thermal-sensor-cells =3D <0>;
};

and thermal zones as you mentioned way back. It works just fine.
Temp goes up to 48 C with a loaded CPUs and settles at 36-37C when idle.

So for the whole series:
Tested-by: Alexey Klimov <alexey.klimov@linaro.org>

However, do you have plans to update it or re-submit?
Or any other plans working on it?

Thank you!
Best regards,
Alexey
