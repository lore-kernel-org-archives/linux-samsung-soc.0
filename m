Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C5154747
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 11:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711452278; cv=none; b=DpK063y+KnNqg82A/N40qbh1oZzaab1uY0D7AiEPlu1cJc/wYjBeokzNS9TpoIJVFxQrscyT5cnepNoeY5J4QSscgOGjXTGiB+lsQE5K1V5Mf/YjpUY5uKgAhYSueBkpOulfdeCJZNFGtnYn9MhB6YnRSC7S96kXyge8iL3DbeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711452278; c=relaxed/simple;
	bh=SFnUOfDdBU1QEnc87WhWOnlkhgpnUSM/FP3ES0Az8rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SippxVOZ1gw0L/SRlc1NEV3H2rT7mMHElFJIIjeLfQvoO1yVvxCBraIzuGQD4O1xqgGIe0zX1on2I/+C/J3LE25B5ujK/uoph1NxrybgA7t4OjO+SeEVX4pNP0ipA8OKzn7PQ3wEnsyv6dYpDWIz6yFQLucIStai4u3xdJ+qpTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fb9g8or3; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fb9g8or3"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcc73148611so5955067276.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 04:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711452276; x=1712057076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFnUOfDdBU1QEnc87WhWOnlkhgpnUSM/FP3ES0Az8rs=;
        b=fb9g8or3i8CyS2mKFX3yGqLgarHFBOjrMMmE8G+Ne00MpHBYFtziUfS6zCaH+RQb05
         xZibK8d4kIw4XPMBpKhh5b1CnoBSKjM5RbTQf8yx/wyDgaPjwV9kttgCvU9QM3OUCqtn
         qkMJogc3rC3Bz+5raCX4UclMTjlDgMk4WLUSvS1eepTzs5ME3Aif/4qloCeRIVK2+vjp
         20gKj4Y0T5zNpM5eONMRDowFGhlijWNTHJdy/7lwg8sdw4rZJGSP9uUxAEeCytOENK8t
         SfVmtgUleGPeMcYeqCcvh89+Xb5MUoryOqOAkHJ3/KSdUy/q++rVjtV0mXzNwyDtC18/
         3kmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711452276; x=1712057076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFnUOfDdBU1QEnc87WhWOnlkhgpnUSM/FP3ES0Az8rs=;
        b=isNKGyCPLTfp6U5IdpSKln8svlMRq9lF5CByCrOHvY4qNxi2GPuXJK5oUQ87d8wAOy
         Tdj5TnZQszvlaokHxIMaDdT1xX2jutc6+VBhj2u6LevLaURZQpOEzlcL7J6X1Ti7qqEP
         lBhuEJXM7OVvwRXadWFy2ayJrkKw/rf5DSI6E8uHuL2y804rXLv3Whl0ATFr1eqbv1uh
         TU5NyRbJ4Pym6Nc3vMm6vOW9u5e2cj8Bus5FMZCkIOec+4/+RRgPAz9JsCWB1tbCBJAm
         Uz5toZRKJuOg3ZTHr0HPywvxU2Z2DLnIxKpHQZuEYtNVUicTY+xzNlyyUOCqsEZZuXUi
         BbYw==
X-Forwarded-Encrypted: i=1; AJvYcCVV2luV3rrb2urAtGj2Zsr+06RwMpFkKWPVO12B/H0GY+MybOhobQY2+NRXRe1bbXB5U8hJMdBQBeQo6jCqHCaQJOB02ka3i8bRRG0CQZ+nMdg=
X-Gm-Message-State: AOJu0YzPwV2DS8B74Tc2yPoXiTt9MkJ6nOY4wQzyiu/UCTpPNUcT5OPZ
	qgotykFpS9I9iQbg0O6wpE23BFyEhDfhxpAPuDxaTumMn6kAor0WNKomyMjlBzLCroXOwBP7eot
	q291V1ivQUuvMlPBPjBst7MNLnexju2WhMpn+NgRj2GGTD6/68vU=
X-Google-Smtp-Source: AGHT+IHVA51kd6vokBv+tMXjaQ8yW3caIslHt2ATnAepJP8JfNzsuIR3AjQLivmAMwHIcOsMZds4lgdKs7qsvmS9Vlw=
X-Received: by 2002:a25:26ca:0:b0:dcc:99b6:830b with SMTP id
 m193-20020a2526ca000000b00dcc99b6830bmr862332ybm.19.1711452275673; Tue, 26
 Mar 2024 04:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326103620.298298-1-tudor.ambarus@linaro.org> <20240326103620.298298-2-tudor.ambarus@linaro.org>
In-Reply-To: <20240326103620.298298-2-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 26 Mar 2024 11:24:24 +0000
Message-ID: <CADrjBPoGX7Ot=9esu_wFbhuqiVO+anr-PnpxGjeXFG7NR_kP6g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: exynos: gs101: move serial_0
 pinctrl-0/names to dtsi
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tudor,

On Tue, 26 Mar 2024 at 10:36, Tudor Ambarus <tudor.ambarus@linaro.org> wrot=
e:
>
> The pinctrl nodes are coming from the shared gs101-pinctrl.dtsi,
> thus the pinctrl-0/names shall stay in dtsi. Move them.
>
> While moving, reverse the pinctrl-* lines, first pinctrl-0 then
> pinctrl-names.
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter
