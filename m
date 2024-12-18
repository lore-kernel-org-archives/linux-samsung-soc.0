Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02551990C1
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734520142; cv=none; b=I8Cz3UpQoFsvCprEVfg5MqfaKIoHhFc85tqOInRgD0crbPu7LZmqiXTH2inDT/ylM6bkubOPFq7N8kB4WHU0IWDkDqLbcqUYdcvzsbg3iVjz9Mq6iKhZ0/eTfqXOE4Aop4RzN2eoMSjqZveqVKIB0bwOdHlse5QwpzLvBgklzgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734520142; c=relaxed/simple;
	bh=4/YYiE8DrfDSJmT0Dm8s6zXYaOz1sPe9FboUtUKQues=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cdQZFkYAKN60Jy+zaJ5tdw3sTe2QBbPRGKBtFMzQxxKdqgvOz+r7MT2VAmPXhajfaENu2HfqpuH4P57CLecYHNZd2eg7//x/sN+tDC7EQ5fPVHWCf7+t7G/LFUMJynBga+lD7DvRuyaTXyqtYOQzknIT07UQA3ny71NWeNSzObg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zWtI40d/; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zWtI40d/"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3eb7e725aa0so2929654b6e.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 03:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734520140; x=1735124940; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4/YYiE8DrfDSJmT0Dm8s6zXYaOz1sPe9FboUtUKQues=;
        b=zWtI40d/znsrTkKctZQkBptvybgcJKhgOaglJ3kDQso/gUD1w3adq2fRcTVmL/pGV/
         u+o/xwmkuytMemRC66QYkpu8OyVvjgN4beMpd9AieNvMgXC3LnbbG/2pnDrcgICss4A7
         xDj3g1avPciKT88PzRsgkFiSn8HloCDqRv6/QTudzFLeUaQNwDMwIj8Fx8NQNiTp5yzU
         FP8KKr8PaazgZ50PCujolEiP+tyibI4znXYaI93nQYt8nX7T4dvbSuRUpnwzgO/jmMrV
         4b56/W48xG/I3sVrb9GrzcaKBNarrXNDW2Ikh36CetyKSkkNzAqcDSofe5V5zKA55B/A
         PfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734520140; x=1735124940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/YYiE8DrfDSJmT0Dm8s6zXYaOz1sPe9FboUtUKQues=;
        b=e+7AZCMuikDhf8JfwpRZjAyJMk7nQ2o/4wlk3I8HN4/wda6YwDPb0taaVTCf21s4M/
         IRQcWZXkfw+CnfXVkf+2cLf7+WYaJqzTHXriqHiT0D3Ez2hgavXDfCF8dSJz0p35HmzW
         v7pWmZaBDL7q8IBeIwg8wnLBkH53BFDAEI7VRJ9OCqDnxhn3FHRzqTJV037uw23qdN3H
         feSCG5EWhHGuj8mlYUvhSzU0xwGHsyt4eIUEkIhqaaVuPJrPcF1QpxukDTRNPi7IXGAZ
         PLzp9gxGpMRQCXmRG8e+60ODZ0DyRU+GScZCO6je+GLp9Nq6vg11SIIAS2vydT49naNx
         gp5g==
X-Forwarded-Encrypted: i=1; AJvYcCUBdY24pTmd3UaxnagZBXkBHdWaFB/iKEBgBJa6IdNLd01o14Klk9yr/ZzO/X8rjNcmpLaIlDcz1stOQ/UsyPrlHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJkh7ckOtlSZZTiWIJTRp2wu4eRy+cG/ZiGVYvUL1yw/NIRngm
	GVEYlR6C2v1Wo3+SvEEktLVf5lGsWVtOZmIrMZ/5l5EjJvZv2sg+4BItKqauYB5kagthuctHvAK
	+h0YSwucpZBMcbGqoyegmIpYiaKsZ6CY1GhWZGQ==
X-Gm-Gg: ASbGncuprnXfDAdoW0npU1TamwwPMxj5VubG/3QuaTKhoXAglnnWPCKrl3yU6AJ/MLJ
	/NOw6yHGnV2S2TmyaHJIK90yLpXE8BSb1VZocwKY=
X-Google-Smtp-Source: AGHT+IEFgoxKdoJisFUM5ICD9pBhU+fG3s7zPXYhJrT/VXlT7HQqFQRQC9gMDg4S88yvTnHjNPAX6OW7RBGF95100H4=
X-Received: by 2002:a05:6808:10d5:b0:3e6:580b:d7d0 with SMTP id
 5614622812f47-3eccbf9189dmr1697114b6e.19.1734520139785; Wed, 18 Dec 2024
 03:08:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org> <20241217-acpm-v4-upstream-mbox-v5-3-cd1d3951fe84@linaro.org>
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-3-cd1d3951fe84@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Dec 2024 11:08:48 +0000
Message-ID: <CADrjBPr82hvSSyULxi0k08ts2d1vO41qXvmr08+9wP-MB9fhvQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] MAINTAINERS: add entry for Samsung Exynos mailbox driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, daniel.lezcano@linaro.org, 
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Tue, 17 Dec 2024 at 09:40, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Add entry for the Samsung Exynos mailbox driver.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
