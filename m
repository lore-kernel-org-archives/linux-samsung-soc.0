Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180306;
	b=rmr+TwX7Q/OIZAZ5rKhCCL8fqP0R1/xVsr6aMLXYRmMvaFmAZYqGG6HFNHHaDCQNkQSU
	 S858XOGen+L/5U1LteIKt1hMmbWlT0VhiOP7dlVpZQGDwrhe+ku8/c33zyZaGhjdq4717
	 xvzzU0eElghbr/35/bbvGHxPzifL9VAU0B0+0oyh+ptT9mLyMr+eWxeIwc+2MrzFios7i
	 yiD4cGzK8oShiXHdR8SvKNZ6a/qxVrBvFGBf19mSA3A0WcbqOI58Hrf8ygP4ZzH+3LbXw
	 dBws6tN15wEKMQswf9IUwylg/vSUYY+JubWHsDzmI1c4C/DDceuFoPHhZ8LNoW1DeeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180306;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=wOpo207OEwIctZbL0yPki45XtYqA5r1JdptjDpx6mIo=;
	b=TeUEbr5XQG3YDamFTvkepcHYxBdjvfhgKSu2Xf5jub59as5dJsOkE/kbrVppQw8e1u1M
	 bn9NTEhIlM0qWIYyp/mZvLUpxWCk9aXpT9SHQPNgDmJoFtjnZIHsApwru/XnVDGSOpFS7
	 eoAR+GfF209di0Rhaz86xf47yqjfLxuIfmbsbyIO5XsLitPTL51wMxXp6P9sgPDJ8V8dR
	 bept8vB6S2k8kAhlI1Anta9XJ28+lGUwRUxrMWKtCXwWEIaOFpgFSUb8+u+e+L4JG+3mF
	 JJLTUUCwNcHwWlT6EC4SZ5m1PcKj03GO7rydwe56JmN2VR24HrurtUygIqCz3kO2YXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTz4ccFy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE64606A320
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2026 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTz4ccFy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDC61F031E8
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2026 09:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793180305;
	bh=wOpo207OEwIctZbL0yPki45XtYqA5r1JdptjDpx6mIo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=fTz4ccFygFqrLoGtnIUHOqwYAG6fYE83eAzaKKKFTGrFdbqiyeG/xOdDlpbWljBj5
	 5V6xdBINwYU5kocYciXsQsl86nG4vrMADyaBoGICOH5SM52l6lMFMVsUuePcwpd0nk
	 dqsLjl1bgVEXkSKvvBlyt/4fvoEGoZPymlRX6HulIa2tbiCQvsXUeYPp4K3IUVrqRU
	 pYkgAmPxiymSttYf90sD3iHqe3+rcjhblkBwBr3nhPmk5/7ostKSP2aFHP8Aoo6ME5
	 BA5mvwUjZk8wNBLra4DsKT3qmgjZC2uJF2DNqeQ9/eHo66ETgnyVIkVrdJ4CTpoy8c
	 oOvJG1pWVoFTA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a9787a156eso6176541fa.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2026 02:38:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz80JlLklz+EgFM/McUKHLP/fY/SIuvzUvNDAKvNqx1iXDG0SN3ZEjholKS1FN6Sut9V1KfE3vAAUQGv5XljEy4Gg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ88yJC4xpbODXI+CpWqXz3Gi+8prU2zyJxGXdDbL5m+Gg+blBd
	TmkcjJHL7DG4hQ3RGTtNuZnOoxctu+AlpP043SLSBfAwL7iyJLfclap+V4gCeyfMSeQOP1/Lmq5
	YFQaLiSEgHWX7s5XuGTPJbOqLCWJPw3xvOXkEb8P2bQ==
X-Received: by 2002:a05:651c:1593:b0:3a6:95a:52a6 with SMTP id
 38308e7fff4ca-3ac9cf82d06mr3952511fa.20.1793180304502; Wed, 28 Oct 2026
 02:38:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 05:38:23 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 05:38:23 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com> <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
Date: Wed, 28 Oct 2026 05:38:23 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mf9fcYRZcqGnNeg+sz4bo8n7AngbWkb8jPBXKwzUqpE5g@mail.gmail.com>
X-Gm-Features: AclHuK-0IY-K4Sj4xF2g0AMS5-uqQjH_1YFYYyMfdx08al6vG1--BGlVHEhA67A
Message-ID: <CAMRc=Mf9fcYRZcqGnNeg+sz4bo8n7AngbWkb8jPBXKwzUqpE5g@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC regulators
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Mark Brown <broonie@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Oct 2026 06:03:12 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Allow passing software nodes to wm831x DCDC regulators via PMIC platform
> data. This is useful for non-DT/non-ACPI platforms that want to
> associate device properties (like DVS GPIOs) with the regulator devices
> using software nodes.
>
> Add software node pointers to the PMIC platform data and have the MFD
> core assign them to the buckv cells.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
