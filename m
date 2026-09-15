Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241B4489861
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 14:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483588; cv=pass; b=oB3Zh6M6b1zra/yR5hVl1KXliWIdLG5veK6BjCdb7GE7ZERSHZ/qHZTZiz8YH7q83n7SF72qtZQtqCti2SfPJxuvJoU/5RuTaaONvZobzpanZrOHby612j972vIq7mehNU3cabn0bysGCJzry+dIrK1kLyxQ7oFZ6bLn5bAkmFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483588; c=relaxed/simple;
	bh=IB17BlzL0mRaevlYv9G6gaKy0+hTRBKqpj9qTU+0O94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PC58j2Sop0byGt2BvGiFot3seRmD6Z5t5L4TaPwgyQtgLbhQFbz/AWJ96jfqw8+Agch3lGtSta7IPrU/ZW5gCKJDRCHSxtu3Axu9wbJ+A9tG2PyviIIhX054bWy/mtKrQkVsCi/e4NJVz1x7omIwMmhdnvCSMQpTu0cBuMrsOvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oEvzidqw; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oEvzidqw"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9adea43b6so4494854a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 07:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483579; cv=none;
        d=google.com; s=arc-20260327;
        b=GUr3WU+ziDC5cbcsUSTDxVMZRFzELyOGgVjq8ZAmSRw14dS/ondnhz41/oKkY62/zk
         R9Qcj3qZ9VnF/p1meDr5eQ4gvfV7lNU2M7/szMUn7qhlmX+M23kbgzFqu3c0ki6/CMR+
         RDihN3zQL213gnKT/kYpe7BrIyrWjOWBFpbxhmhJSNUHppcndeBSllaQaxQuu06deEK1
         kyMshOM37GTlacCjCo45QCyV3RKTJTwfVboMMzu9OuQaYdr236UR1BVoujF/crJRALbJ
         Sl4TMF1jPdjaU8aEyY1KQVNUzHk9888B7H0QlOa7+FG06PNdJdSZ3790gvQXo174MqVS
         JUMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UKh8ftla6T0xr8WeFwrWgAx7L88zh6iqtsw9KBnhX0M=;
        fh=7bQvZ8jO/bmujM3oOaaqtuiHHu/COfNfd4BkxdQJwco=;
        b=lSq6iMXoU8/mkgonqGbpwFvWazJ0YjKrikiSLxJFZaExP3zpAIEnW7d2FLYMA4x2Zh
         wAW9+wSVKJnuNM1RnhCCS5x5feJ4TfDMqf7PeDSTzDLDmF7ZRpX+uC3N7UuLqhLcuoM1
         ZDU9eEeAvcbSjBxf5TBsWAN3K61tUHbraeQ4ci9hUzRxTN9p7k3DrWB/UAC4FQ+y5ZEl
         GijV49KhrQphO0BVaBHwi6yIRXR1N85LwWBXpIpGS86dYL/Amkn5HxhgcS2vswe9EZ7/
         9yroDkL8SikPrp/mObhyNJV2vv8DMHKuShYSohdrjhwEBNcd5o0fD+D0WNrCFZ3MhGx8
         kgtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483579; x=1790088379; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKh8ftla6T0xr8WeFwrWgAx7L88zh6iqtsw9KBnhX0M=;
        b=oEvzidqwsukw0WQPlBFVQpFzZ4ZYUtjSuti/KYZqYPX05+1v5ll0g1/9wlmgypPFRv
         yyenRv+dw2/ifxXVPnNuL+LdcgepILojZAM6pKhOOzSVKtk/6NSQTsw3+FcwvnkidEt0
         3JyPw2RqWe6NwP1sko2+yab+CfiVpl8MYyftVAevzTTozpwVduyb0V/3zb5uHIgFgI8v
         As9g6/7ELb8cQ7MkIC47ydib8bJxU5i7SdGFLGKqi9hQDexpYFOYBwpE6w/gfQ5TBeuv
         ydZ2a9Xhr1wazG0pjuGpgAZ2/ZCjoNYXjKO//TQgSciRddnwZsnr82dmVM1SMjzEaBUd
         LiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483579; x=1790088379;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UKh8ftla6T0xr8WeFwrWgAx7L88zh6iqtsw9KBnhX0M=;
        b=d/X2ScAYrbi3PSU127BWLU7twMO7IR6dLMfiOb9jacj2YnVCzYClrxmJb2NL433iGq
         hqXn8MLiTRguSiXehQu2FokpUuZ062RqXp+a/donDA4SLCp//dCdWVHFT7dWYsm1HcIK
         EpW9I8xDZVnGaXF0TvD1oxdGZqZ53xxpUYbiSZUD83AdVMvfyAHwKmxLSrA6NAhrkwBG
         3fpd4nw5Xd9UZ+wpUmM1aCgAlg0iWY3o+2ImaL6bwFVzCuppyES8IF+b+c0AJBNUMztp
         1h5IsSlfeo0KHW07zwIqhkTys7Qo7hqhq5BajA8pmSw6tFd7SakHSjgzCoUWuVHYSdHx
         OYNA==
X-Forwarded-Encrypted: i=1; AKwUvBzBH61RTcpXYIrn39dywsYdiOgrcleRLls9D7147GLQEMdQWo8W8l8TgEXAMFksl9qm14YjRUXsx0Q7OJgohn87FA==@vger.kernel.org
X-Gm-Message-State: AFuF++nnFqcGtbGZcYCtuneJqmWpwGR98hBI0lWgl3qmLfANIhmvE0vK
	/+4BaHqeknxZocDiKuoZcmFRjwK7adIFT4Hs6I2uIDjz72oi/UGsjTN6l5Y8U6kQMv2sGqG/dxS
	03q4l9byba5uEGn0KFdgb95sO47Am0tnqHNoJvZzECw==
X-Gm-Gg: AYBFou04W1ia55QfH2PaLCQwR19zAMf/7h3l9FYJPq4avt7yjG39G3XsKvrZR99YBD7
	yJH0aEcTzXsdDGTH8W4XTcdVyq1UY73E7CjCKWWuofzWs/vy6AuJ1uK7KxTxrRq0aj+2Pl4qakC
	E7+9gYNv9fudVcL74lkuSaf0hbnj4DVoz+oQR0bJR/GPkkqdcJ4oAwuTs/CMzbawxzVqOJHuhL/
	18L56VpU4E/RYE5jECqNBdQ3fHqZ3oP5XeAHzDuVwPhy7XaUnljZ1cfoIl43JhJmp+K+UCb53uu
	Viigs/DrIWaYtT3brjWtf13+HCiLMscDge4mPMWlIPovj60g/hjFaASGLUlhFkMYaRmGqYmqx6R
	bgHLrMRpCOlDoXQ==
X-Received: by 2002:a05:6402:541a:b0:6a9:acbb:437a with SMTP id
 4fb4d7f45d1cf-6a9f6264d4amr4709617a12.19.1789483579261; Tue, 15 Sep 2026
 07:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:46:08 +0100
X-Gm-Features: AcwNN1Wim9K-brFBMXY9henHTcNARzZEbkYderuFVS29rKbsh07RWtUUnTNerSs
Message-ID: <CADrjBPpMdKVmPq2Dzbdt_kPHxX1m6nDczefHNRY6ZCPx3DyCTw@mail.gmail.com>
Subject: Re: [PATCH 00/10] arm64: dts: exynos: Few strict dt-style-check cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sept 2026 at 11:19, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Not yet complete, more files will follow. I probably won't re-order all
> Exynos5433 soc nodes by unit address because it is way too disruptive.
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (10):
>       arm64: dts: exynos: axis: Re-order nodes to match coding style
>       arm64: dts: exynos: axis: Re-order properties to match coding style
>       arm64: dts: exynos: gs101: Re-order properties to match coding style
>       arm64: dts: exynos: gs101: Re-order nodes to match coding style
>       [RFT] arm64: dts: exynos2200-g0s: Drop chosen address/size cells
>       arm64: dts: exynos2200-g0s: Re-order properties to match coding style
>       arm64: dts: exynos2200: Drop redundant blank lines
>       arm64: dts: exynos5433: Re-order nodes to match coding style
>       arm64: dts: exynos5433: Re-order properties to match coding style
>       arm64: dts: exynos7870: Re-order properties to match coding style
>
>  arch/arm64/boot/dts/exynos/axis/artpec8.dtsi       |  36 ++--
>  arch/arm64/boot/dts/exynos/axis/artpec9.dtsi       |  36 ++--
>  arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |   8 +-
>  arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi |   2 -
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi         |   1 -
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  93 +++++----
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 232 ++++++++++-----------
>  .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  39 ++--
>  arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts |  34 +--
>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  34 +--
>  arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  |  35 ++--
>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  39 ++--
>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 108 +++++-----
>  .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  40 ++--
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  96 ++++-----
>  15 files changed, 421 insertions(+), 412 deletions(-)
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
