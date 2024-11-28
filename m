Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD35158D96
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Nov 2024 10:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732790993; cv=none; b=VkIGfylF7kPkGSv202PxDyBZril0ccbvoUtVRisSGROxQs3VtHMVQDkXHQvv88lJ3oDojkMl+8y3vr5BXS4zE34estaNcRHlrSRhnaqlcO0N3v2CHlUh1FCKbSf3QD2poTcp1hEprkSqF75IiDCAb6jSxcuK3scfK1dURUJQB/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732790993; c=relaxed/simple;
	bh=S+6oOaM0s6Tu6ZxZFSf1VxM7YfIeZpwsBu0bRCHSjm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8oINAlNF3LJm2qoDITvFPPXtK8BOfnJSl7AnWEwhcvXTYUXHmYBOqPu1mr4fjrNETn+27GjXeuiqfCfFFJUWoeVUx4X2PWAPGFRTzR1eG5u2lDb39QgQPF1egWdBzZoyOOcQO7ZBASLFvn8mLNFVE0uEES7U98ZQiPNnzbUNEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EMkBem3L; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EMkBem3L"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-296c184ed6bso459185fac.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Nov 2024 02:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790991; x=1733395791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+6oOaM0s6Tu6ZxZFSf1VxM7YfIeZpwsBu0bRCHSjm4=;
        b=EMkBem3L6R0fo+5kuXSurd2vWNU1w+wY/pQ3KTyRC0sZFTY76LPLkMOsNvpw+aUPXx
         4fwNg0Zg6vHfjXXluu9ChGYJKlt3nc7P/m+GaKthL3Qw25SyzQC26MHqYJZYq/6lFTs+
         rpYzqo6Yt25Yg6xYJ02qcxCO6ypxE78Ff34efkqpTwFZ+ildJcDMGh0HUp2S/aOdr5gb
         k10l+KhNiPjWTACWY14TpIvejNNZj1pxugwVxlIezhH8uwYA6XlmV64cSm9L2gz09WJ+
         B1ijILoIOPg3OKLrdvoGXpSKmsqlf0PFxkBT9J3RAiFwJ2teAcV37S/erZVp+AAzCzYv
         UOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790991; x=1733395791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+6oOaM0s6Tu6ZxZFSf1VxM7YfIeZpwsBu0bRCHSjm4=;
        b=iTirw7wPgSpBiBiuaRWsUierYM0NP3pjdYT8Z4KdiwwonpvE5LTpJV6UQtT/i4hKmV
         OTXqvhYUEcbCv1jEJ7Ys/fJccn30aMThvGM/PoMFnlfHEN5Y9SjQq4eb5Ob+t2iFyBWf
         g0iYa3uBY4dFfkqiPef3o2OOucFcFjsqYbBWF+JS9wIkjfzrmFHUykf05HLIEFC52+/H
         /YHF5TqaxiD4O6A+lH68yjxbscSOHLsgSwDRDoQVlnuJq/b3WHyMkS1LKaP1zmh1dAsE
         N5hK/XCFcZZSl48qJHzfqslc1y1a3//NBWbe0hj+m6FeNzdxDbnGlXEWA0OgxQetwiV3
         odCg==
X-Forwarded-Encrypted: i=1; AJvYcCV0g7IYtBgIcXIphdaqSNsQW2HMoe4Ycw+KPYeXLLpxexoQoEqDf0i+INkaSFgFeybBVPFFHCzUeH2OdCh/WOMJ7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUh+wSNCugm+JJ2nPHFXxcON/SNxXz2LwCyWVyJyJXJBzhRCBF
	114et6skKBX729Z51gdZpfJbBqPiRZx350ET5yfnKy+SPeFp0joDR7ek9Dv9ZGY7F7M1m8k0u5k
	XgeTYjB9fB9ST2g+my294io5WdzM4ktC9IHuvcg==
X-Gm-Gg: ASbGncsLSXZRDNjEd0YZVfZMGKMuQQKEECwLvyyqwjMLqh9ZnNI6VF68yyK9VGwBpFB
	kbVXot/W3fACXYqkbw9c9fEBtysh/mEUe
X-Google-Smtp-Source: AGHT+IHSW4AauQXzPQcYvXTGYQGOqaCzi/aJx5YRC8Z2JJs3/8I5KClVLNxBsZmq2QaZI74lTF4hFwtZQD27MqcFr60=
X-Received: by 2002:a05:6871:e7c4:b0:29d:c8fd:cccd with SMTP id
 586e51a60fabf-29dc8fdf378mr5912643fac.2.1732790990078; Thu, 28 Nov 2024
 02:49:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
 <20241127-gs101-phy-lanes-orientation-dts-v1-1-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-1-5222d8508b71@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 Nov 2024 10:49:38 +0000
Message-ID: <CADrjBPq3vJmHh9bnS0u=d_aTeaRH8Z00JqgBfkqjQQ_Fv14xxw@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: defconfig: enable Maxim TCPCI driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jagan Sridharan <badhri@google.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Wed, 27 Nov 2024 at 11:01, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Enable the Maxim max33359 as this is used by the gs101-oriole (Google
> Pixel 6) board.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter
