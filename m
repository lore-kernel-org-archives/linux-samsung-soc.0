Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D2037267E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jun 2026 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124809; cv=none; b=letaIYzZAiRuGtmKrtcLNS2hMjHMznj8q73sdfMvr/PZAqyRDe41gvuxKernpnsIjnBjrf/eBhUJBLvAwIxY18lqSIkb1nstHWOpacO2OgHLIS9jgmHBHAXNx/j8YIhFWyA86dobZ51Ygg3i51QqXaV0pTEGrNdPXZS3k13Hs2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124809; c=relaxed/simple;
	bh=CTQXMUV+/UBVnNjzgtkJO88wjy6FOPIwK3y5DrpmBBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iq4BSv9W8A2KQnOh2M0EesHp9OA35Yv5NiJyB1xHpn+PcGb3ArCDOoBQ9X61Q1FMZfKZX1PmBl2YKLtGzed8tRwPWj/kqV37p0YBf0UIqDjiVsYkX4uVqVxq4vnT6bkw1RGdM3Of+boh9BmRJXVzZM98LXNv9KuYfxV8ZbNrzBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c6d31bfc8aso27576685ad.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jun 2026 03:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782124808; x=1782729608;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sEwup8vrGtzg0eQ+zIA6Kd2oTy+XBY9jxS2BNcFzC0=;
        b=roeGIg9D3+kj21hwEda8+QtRKeH6t5OoE12Sr/FCZUTBjMu5+rdbi+mVX3GckoLM0H
         1q3UmBTAaVmVd7B3t6AiWAnwRv/NH5q5FshlZ30t99lV7UkmY2M7ApLG2ti23olY2FHF
         q9qNzr8JNyZ+ui/z14W2GL4URKbpiTkBL0rKuG0IpS++1Qj98P0cDMG9ZRiZlmB4t6qK
         MKAHM5DoUCn45hSdrNCnUW/tGo0CeUvmzFu5SPT4zkAINKtmflfM7HJo8zq7viRezQ5k
         LKkxrR4kpHsC0xzPPLH8g/vJOQomS5mHDChSNFXH9dLRkKQvfR7Raz/0oQcC1v6rOSB4
         nc/A==
X-Forwarded-Encrypted: i=1; AHgh+RqWB6ExZboFGEZJIh2joEwZLc5CWbde13QhRqLxkw+IJrMsEUSemDaQhGW6JR0Uzs8+cNWDHJWNG/nKuyv8Zw8CrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyXnDg890xsfRo92U/cktRbAt5ZcrBLaN+VF1SZ1Zjscpre+rk
	RHy84lzdoYz/Uf719b2CnAJ99+WL6tXof/qr6hTjvxmw0CcZ1BRnv05BoZkBb0S6
X-Gm-Gg: AfdE7ckss3Iavq/nCVkJ1n8UUjfagREJLfpbqLizf7MEJ5F1We5eaP+lTN0mSJXHGs7
	0JCivdvGe6clNT8mvxvEoauN9TuUbHB0rPIFpMSuPh4AY++X82zbUC36z0t/QuMGZWtg3jsr89e
	cG7z3yJ+1AvC7s5tvygjdN+dpSA3RS7VqQCR3Eg4UR0XtF6AWjhdbgQeHP7MfDUv1fCH9Ekgu6Q
	qS+8X93wkC1Y6UPidjCbwf2YmZBuquV2A78zx7eqzkDSqbKRGAINMZz/Iw0YsNAEPwOl5UCOpF6
	18H3HFQUT29/VQZnCKEsM497VGAW/9IQjE5uRBltrWADMe4FUgjogty1uJNdkFBNxaibi4m/ivR
	+YGYECc9uqUwauy9tgNdsNdGuhprhuuN+ZUI1n4/jVAPuvk2hfXMc+s46i8Dk3sX1jet/0PA+I5
	6gMtI3fz9cCa4Je0cyEyYV6Oekc+1+bSxpiNSd2YQoA76Q3StfCu1iqFKIccU=
X-Received: by 2002:a17:903:120c:b0:2c6:b40a:d0c7 with SMTP id d9443c01a7336-2c718f1f0ddmr153184145ad.7.1782124808141;
        Mon, 22 Jun 2026 03:40:08 -0700 (PDT)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com. [74.125.82.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444aad83sm73515475ad.79.2026.06.22.03.40.07
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:40:07 -0700 (PDT)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1384eb94d20so10102079c88.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jun 2026 03:40:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+CA/lH1uOhLmfx5Rmr/05iVK1ac5wZgxmyuBRJRYqx8FsPZ2Xa/xrAxVJRN0tfUP07t5eWmjVJaK0SRcRpcRfZ2A==@vger.kernel.org
X-Received: by 2002:a05:6102:3314:b0:6ef:f6cf:1b32 with SMTP id
 ada2fe7eead31-72a043c9af3mr8022945137.27.1782124344043; Mon, 22 Jun 2026
 03:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622101606.485961-3-krzysztof.kozlowski@oss.qualcomm.com> <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 12:32:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWw4+-YZRx2icp_t3OQt3cb9osjac7gziiyRZcHa3zMbQ@mail.gmail.com>
X-Gm-Features: AVVi8CeRh5uGKoGdWXUVe0e4sYYTgs7H91cw7cP665l5Rz_E8v79r8eSiiAY4SE
Message-ID: <CAMuHMdWw4+-YZRx2icp_t3OQt3cb9osjac7gziiyRZcHa3zMbQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: Drop incorrect usage of double '::'
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Georgi Djakov <djakov@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Linus Walleij <linusw@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Javier Martinez Canillas <javier@dowhile0.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Jonathan Marek <jonathan@marek.ca>, 
	Taniya Das <quic_tdas@quicinc.com>, Robert Marko <robimarko@gmail.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Stephan Gerhold <stephan@gerhold.net>, 
	Adam Skladowski <a_skl39@protonmail.com>, Sireesh Kodali <sireeshkodali@protonmail.com>, 
	Barnabas Czeman <barnabas.czeman@mainlining.org>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Sricharan Ramabadhran <quic_srichara@quicinc.com>, Anusha Rao <quic_anusha@quicinc.com>, 
	Luo Jie <quic_luoj@quicinc.com>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Chanho Park <chanho61.park@samsung.com>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
	Shin Son <shin.son@samsung.com>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jacek Anaszewski <jacek.anaszewski@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Alina Yu <alina_yu@richtek.com>, 
	Andy Gross <agross@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Jun 2026 at 12:16, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> There is no use of double colon '::' in YAML. OTOH, the literal style
> block, e.g. using '|' treats all characters as content [1] therefore
> single use of ':' in descriptions is perfectly fine, whenever '|' is
> used.
>
> Cleanup existing code, so the confusing style won't be re-used in new
> contributions.
>
> Link: https://yaml.org/spec/1.2.2/#literal-style [1]
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> ---
>
> Intention for this patch is to go via Rob's tree.

>  .../bindings/power/renesas,rcar-sysc.yaml     |  2 +-
>  .../bindings/soc/renesas/renesas-soc.yaml     |  4 ++--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
