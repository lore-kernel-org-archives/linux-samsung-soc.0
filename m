Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1143B52EE
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Jun 2026 16:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590674; cv=pass; b=ALT7EQdlMUuSoAYtNCNUw6vlgxycfWhudxrZtPVmmEchUmNB1Bfhgk/CgIwvBQQ227SfOpKnz6s8wMNH/NwY5lq2hYo2doawG9cbSc/gTApXvfOleUd+UVjl9oAHnUTGn5L/H4jCQ5nJzLFVHJk5GCqUDgCVFg5cKn1uwMVY1Ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590674; c=relaxed/simple;
	bh=bYQz5WGjsDPNgjJtpHPvb9PJr7MMreR1r3TlgYR8Xgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5lq7jmVWjaFgBSy9RaLL+7rO6Ou1ubCfWxKoMEWk6OwuEHfy5cj9BFXmfKqK+9NVBHtUc4B1X/hVK5aUCZpMADxgSJYMo3Lqx2ML9Ww8uSPEGGRqzcCfgidj8VExq0/bm1nPsEW1yYvZvT+GPQbejNUz0v4yRJINhsibPRiDUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LYizWBKw; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LYizWBKw"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6877c719cb0so1313591a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Jun 2026 09:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780590671; cv=none;
        d=google.com; s=arc-20240605;
        b=QAJyb3R5fIux+jkBfS/yZ2R/MtzPD7ZUlCNE4zw57NLDDBON5NZqBcqHjZhnonPv9O
         lTkViT37MNpMj3Kuv8AADqFgFzhNUz4/lgkJN02ii+MbL2o0m9Ay+WOpyR2mQq0CVHJQ
         0CPrA+/GH01YekOdjakFYl5umI7CbGLc1lUKCLmypHUluNbn+TOMI06rhRYwmw2FJaSN
         +NmlvJmRlOaOHnxlk3vn+aL+iNvmpnTTv29a2So7RMEXVOHdKJ8D5wjj5PFaKET6XPfM
         rNvy2CnXI5XljyrWDBNKYIhJ7X8kKnQOl9EPWuGafG/aiR8J1zOvNmjE8cP+9Npwd9l7
         cATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bYQz5WGjsDPNgjJtpHPvb9PJr7MMreR1r3TlgYR8Xgc=;
        fh=kvSVM0FwhGzFBtx9e7TMhh0t3Lq05XtjP8Rt4GgzQyw=;
        b=lIg9KXSe6JCqXIqPm3/iG40aWve2rq/B5G+WqDq9k2PHJ9ULe0OheziCCvJ2oOBhf4
         46qOmev3emNNzbs5V7Aya95BQf4fsFPNqV5/cBte+k1GVFlJzXS5oytemb6fPwxdww9X
         Wmw5Mp1b1GOljBInZSuqbMyyZDZF20dRRJ0zS10DO8SEKpV4x/YiPhLIufOLcGtP8kIl
         E5EEGgOmoQrLv4HPVgJ+o5ncSySqBsXV/asnYvWW5h5TxC+ZNPdP2CWUbBGsTLWWmKme
         843nrm+EmgwKCFlTBS+ZPgQj28znJxxjMc5oqPYiCEf/spyAq3vkbceIoCGoeuqKYI4l
         8skg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780590671; x=1781195471; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bYQz5WGjsDPNgjJtpHPvb9PJr7MMreR1r3TlgYR8Xgc=;
        b=LYizWBKwjoen9RbPlZkKqVX9HO4ohwNYKnGU+2Q+9RjwmmNdoOktu4fQ5uxRDDajqB
         JqvjdzC53gLKc+JjhUzLqrcRERtB4d1WOkPgm/YeY18fypdqw8x4vfGp30qDadQFg+mz
         3menY9qVtgPdGY3X5rl6F639jENH31rWDQQcJzfsLyqg8cD+EtYv7kKJliuvNEbdZqhS
         aqdvEPZY13QDBE3KtMnin02ngDuXdHXs4Aj/y7mBKBgixCgVmSKkgsEs9z/tSMDYdAN5
         PZspOYoGtFfvUL9v1bvQSMq9dXRTaon4BybuK0CmCpAfUFbHN5URmAZ835d3n0w9JhWf
         3i6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590671; x=1781195471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYQz5WGjsDPNgjJtpHPvb9PJr7MMreR1r3TlgYR8Xgc=;
        b=baICN4xucWyuXXBw3VqXuBY/9jwNr5BZgC8hSXtzyNYjJ96uOOuV0I4/EeyEURXZMK
         hEDq53+Fn8wNCDWWemoyMkyDk3z29r3cloF2vjPP+63keyBzDHqNmXWD2zIAI8aPX63y
         mTh1vQ3G/nZh8IVlK8zZeBKVDOYi8rOJSlKLAwgF182GHkFrRDpqyOttyZFADGPWaPPv
         fUiiL3QvpLOWnipZF4DTtzhQGH3wT2bt35JDg9f/B26urtRFx57KswFVNIWRwIW7qxg+
         fVYdoQw3C2yJUUf2zzOMiye+pRfMiojt1rmv0ESgG1DbfdMEB1eurkUkRK1Js9FcNyg0
         ycrg==
X-Forwarded-Encrypted: i=1; AFNElJ/OFu8YRc6CxGc42mqQbFwXWJ+UttY2SDhupUzZPqtacz0n72CVBlaBTJJlti3jo4ncFghZuz8mR/M7IZWSJYPM0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YylkTNI6Tp69YHAb2w5fB8lOAWli2CRhWC0TOlsTw0i+zlKgMaP
	9BQv+yAINwpY6JwjIzKZzNqNU7sFu1YW48smDRmoD3SPYdOqG//MjA5P5UxPp3ihpM0itsdKqZm
	JSUNW4a3AjkEFaYe4N+IW4GO4diKBgTZIaj787lPxXg==
X-Gm-Gg: Acq92OEsMlQHvlEE4PsWGaIbhRvnOzdhUjXOb8XQHbOncYxqInrIcKzoCip+jsi3UmL
	ceCfdxq1Z212+gj0hezCZQ4V88OQE62xJKvjSw6u7uGKoAP+PMHae8McZYPNTJ5YrxK6XNkv5KR
	H9OHuDg5qN6G5WDZuu8IHrSt0Mwe7cmRE7YJnUb62XwVPjU3wiN47HOfHvUuqqg4FxeBEDZFtmk
	c4BwQjbbw7KvJDiftKDhtUgYuGADrryEGKkcRjlG2Pr4/eNUlslU640EES+yoIG8MIGwpsc5Bp4
	Xo8x2WVPWs5QMEjaK4G7fdWMB1SGqqJAwfvbUCVAJnqQs2Yx
X-Received: by 2002:a05:6402:3215:b0:68b:539c:d269 with SMTP id
 4fb4d7f45d1cf-68e710ebc51mr4808114a12.12.1780590670971; Thu, 04 Jun 2026
 09:31:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org> <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 4 Jun 2026 17:30:59 +0100
X-Gm-Features: AVHnY4Jq-Cm1FpMQ9NjMzo61aJ4t188OLXQIR-HELOPptilenf70Fcb7QJeV21c
Message-ID: <CADrjBPoHXi5hp9T=z97k4LKNKQUEnJdN4sSz5g+NgKAGC6jguQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/5] thermal: samsung: Add Exynos ACPM TMU driver GS101
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, jyescas@google.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 14:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Add driver for the Thermal Management Unit (TMU) managed via the Alive
> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
> the Google GS101.
>
> The TMU on the GS101 utilizes a hybrid management model shared between
> the Application Processor (AP) and the ACPM firmware. The driver
> maintains direct memory-mapped access to the TMU interrupt pending
> registers to identify thermal events, while delegating functional
> tasks - such as sensor initialization, threshold configuration, and
> temperature acquisition, to the ACPM firmware via the ACPM IPC
> protocol.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Acked-by: Peter Griffin <peter.griffin@linaro.org>
