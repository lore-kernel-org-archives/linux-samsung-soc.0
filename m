Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F7B3603DB
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jun 2026 01:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782351159; cv=none; b=dDgJxz9LUOqOz7rsU7Ccq5mpj4RLcAprDVYMkiGtpoCHO/6u3p2/1mdDmxnCsEArmoveujJMF2/xkhmV+GpX4klYvZv02Bny7rVMm6Lw3o+bKxBkgFAZfpGwl+txNxIYAg29OBaZRNq9xxr9Dfbvzlh0GDGj6vqpFy9IlWmWqiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782351159; c=relaxed/simple;
	bh=n9pgwAr345LZiOxzhaKVl1At4IuERZDbIxjK6hWBcqo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GcXPH8SH6lq2QctXjg5n8qPy2EE7zHj/9+o2aWBBWMQ2neoscUJZlvIoMpZDCHBKSRCN0D3Zx16CJsuNmNlwjH9AQLK4l/k7vvM0GPOxPvp9+TqlzVqXMFwl156FzOQuZyvYs8CXVhtBFzXDDnUyr7vlwDL9bmC16FVxoxv6GBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0iR779N; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0iR779N"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so16703805e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jun 2026 18:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782351156; x=1782955956; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pJmX0R8PC4ckpLbRYtZu8jM9oRzly5QdgHVSm/L6aA=;
        b=c0iR779Nk2ZAtj+OcRVN8FBcO947YPZs3ZD5ZcnVT3r8vbC4+l+eLlZFjUo+shhY0Z
         ISCYxqX76nCWDLS4ci5lgWKqA3jaC3HX0Tq9MsREGSrZ41LJaOKtHINtUMJrk/9P8nMA
         8P40nF1nJhjF5VJnyYYkFE1oYdR6QYm5qk5nj1+TFm50f2wmErcjNyqLQW9xpM89cmay
         PPYdPIi37KoJgQrwcTHM1WxeFZOa9nb7uOa8brAwXcqEWlYquCjnQ4RR7Yf+dadMjCjn
         Lk9NcXLJrl3UFD0gCTw1QhFDREk/fA4bxs7PbxwBiUCvigwcyZf4574jm7xF7S3kriGX
         W+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782351156; x=1782955956;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pJmX0R8PC4ckpLbRYtZu8jM9oRzly5QdgHVSm/L6aA=;
        b=H3EyehQSHjSUY87buzg7DWg68DCRGdWc3Yw/fZ0pOiBUM/v92eXG/Sn5dPIXuZKPQz
         pnVCA24l6035qXIy8b+y8SWX3rVxKa/N+hewwoLaZbLl93RSWsEymiZmdy4iD+Ud7gu4
         so1eV9yMyqtIuu0SKouSHflqsZ+5S7mWKEW/3o9CQ6zay/LPXbwC4np/rTNbhV+rFYbS
         G99FJayAZCR08ybSgjDmgJHJLa3F7Ixcszke5TsVxe2mT/b+AJZfqurPUMUAzTdbLyv8
         rYy6QHZLNuKjSYQVzA5xkP5OLU0lBjnm7UFsa8+ox3urct0OWQH3oinclBYdMEIl1ZIC
         TNGw==
X-Forwarded-Encrypted: i=1; AFNElJ9HT4wY+Ef+cI4C7iCXSQL536Hf1s6VuAw+hShMA2wrADVPH5f+TA/a3Jj3LThIEGa4+/wc/gVandA0479lOR3q7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOZPM1Hvb2CiwcTSE82ERmzn0psqrUJLYWpoXiVFrWa5Xgg5oQ
	FH5Q/BVJDTrkg3eWQqzVJM0dkX+BeI97ul8K8aPidIXS61gF/jPiQjILOPRU1ZQ51So=
X-Gm-Gg: AfdE7ckjO5+yAfMnARXFQBKSqtmD8VFQ4j3KwJeyrPQxTTCNv+npRkLoU0j227JkNLs
	vp7XkWDBaDvKvoN9jrMtpj/cCIuLLoevqoExKYIC3g0lUenrwCDDlkTWe3zTAuG5CkCJITGD8KK
	3kakSo0/nBGxawBTJ+mWaHOC6+wXlTFr9X7YNr916cr7juex+Svl81t4nzitv/6umxpWvxf4Hri
	nwnNLx1YXSRRo0v6V7nMdhcPckoaCuIakZgic1oZUnmu5RyT3kg689zxvida7hDnBYDCz6rsco1
	S5O3kjSW5DqqhzSAWRhk1rVR90DgnV/a/ECNLq+/R1W1SDm1+X+sS+aURRw1YoN1+niSLPBI49G
	lcQ1Y+ikEXJ7xfJTmeI9FG4N7jdxr01P+xYO0PyWMPEx60Rvfk34gzWjtu0+hZllovkQfNiMY/Y
	q6+OceHNbpUN4UqHaI47LVdMHN5EgN7aBGRYFtu1GB1yMuRvOZdVOrKJUTt8UOFOiS7ciZ+QML1
	g==
X-Received: by 2002:a05:600c:3e8c:b0:492:4a70:fa9b with SMTP id 5b1f17b1804b1-492668985cfmr2555955e9.24.1782351155868;
        Wed, 24 Jun 2026 18:32:35 -0700 (PDT)
Received: from localhost ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492660adae1sm15090735e9.4.2026.06.24.18.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 18:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 02:32:34 +0100
Message-Id: <DJHQR4IAYPDF.2BOI33M1O4CMO@linaro.org>
Cc: <jyescas@google.com>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/5] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@kernel.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Kees Cook"
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Peter
 Griffin" <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
X-Mailer: aerc 0.21.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>

On Wed Jun 3, 2026 at 2:00 PM BST, Tudor Ambarus wrote:
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

[..]

> +++ b/drivers/thermal/samsung/acpm-tmu.c

[...]

> +static struct platform_driver acpm_tmu_driver =3D {
> +	.driver =3D {
> +		.name   =3D "gs-tmu",

Should it be "gs-tmu" still?
https://lore.kernel.org/linux-samsung-soc/56c1bb6d-54e4-4977-bd88-9ce7a6086=
b1d@linaro.org/

> +		.pm     =3D pm_ptr(&acpm_tmu_pm_ops),
> +		.of_match_table =3D acpm_tmu_match,
> +	},
> +	.probe =3D acpm_tmu_probe,
> +	.remove =3D acpm_tmu_remove,
> +};
> +module_platform_driver(acpm_tmu_driver);

Thanks,
Alexey
