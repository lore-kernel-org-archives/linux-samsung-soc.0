Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0560210F9
	for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Jun 2024 00:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719014577; cv=none; b=joKyAdAzl+0sfjtm06oyyaqia9D0z+gT7lAGo/vKXaYR4/epU/I7a26rLtMdZ83EN3vX9uDsQb0ZefmT27LQtXmO76G4HulxH8WqV5LIsRGbV9tvvIeKZnixkStsYOZ9T8rkubhwh9qF+kcVy5YD0QMnjGNb5tMPb2HZ3lS+8yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719014577; c=relaxed/simple;
	bh=tbwe90qdoGZ1seXoyhBZs0lRBGqbUa2Ye/e/uW0eUC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dB8oMACAVaDL1kkZrFv9nbiUplj8ZvjswDDvA5p50bC2eU7kV0xlk2CLYx0hU072L8vRleJb2WfTgbJm7wumAWzcG6FRcgdLQyHdCcjw9QrA6qciUeCudtdxPSvMwLz2OgZhp1Dl18PXVVgb4sNj9OjPrMDczsIoqA//OU0X/u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ttUUe6kv; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ttUUe6kv"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f991bb9fb8so232415ad.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2024 17:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719014575; x=1719619375; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZKL3Ob2WAKzLO04704Z5sQXorDiAFlpzm4XvX6LMpSo=;
        b=ttUUe6kvGZH2xrpc9ZxZRqR/SC6butwNKezMByWKjfZVELd7+XX7zc9cnWvwimPrkR
         mv3qGLg4eWRhzpd22XELVGaGvsRWVU7PR/LBFojXr5SpGifljJDe/VexksyS72Zj/t/9
         cOzzn3wDCIB66Wc4Nc1P/5NPVCBP5dqLVPJRapCi9tSWnDM6dNxLEBo4nUUUAM4L8dl9
         1wLO/nFi0K33Cotu9A6Doe1PvN5s65X6MPPcZUsiB6EvGkoT2FMj5yScP+eoL2B+Crge
         Aay6ekk+X3mcS77d10YUyCTc8tp5WAxPPigG56TtJ13io97tJ+WxJDCqCniIRY6PepXG
         wxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719014575; x=1719619375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKL3Ob2WAKzLO04704Z5sQXorDiAFlpzm4XvX6LMpSo=;
        b=QVq5zA0RIWqFjg3Nb2mMCMObz1NmpZ97gAGbFXN2t9+skJkvpQ0NIDQPGPufiPogU2
         sygXonj1PGndbnUGwB0HoP2+/etowWLdqZvJs2DhIJ9gpuKvXZYTj2gpWNVKdujVLNii
         rauWt2A1IJa8WJy187tE53DNJtrP2x8xvpSi2/SNYw2R9G984wThCgz4gLT+wLlIB4dl
         +zPwXa9OBf6GBgOWjoYs9T/gMXkT62VQUexHBGl0DLotQ0fDOWSoVOUNSQ5KuSPvXd70
         LkF3Fn5ZKWvxFlyecsT9oXHtXA5h4EyPYqSpz/X3QokCkeNkPVJS/VJ708hK41FfE9z9
         o/NA==
X-Forwarded-Encrypted: i=1; AJvYcCVnBAi13WRTgu8uNLBe98PB8rk+R/uETsmQa1PyI65zhXSRo0dD14NYS6G1C0dPGaxm5NciONdop3XaOEtISXv96HS5YV+khuox7NNeXcWt9bo=
X-Gm-Message-State: AOJu0YyFa6FLFyPdafa/BezGvh7n2TG1oVzJKdeu7nAcv8YjeeUbiWZt
	7ATizoxtr5cadmIpyjupMYw1gsebmrBcOcK1s2KZDlB+yLq5hIZ44kfdMhsPJg==
X-Google-Smtp-Source: AGHT+IHUFXeaQYF9WfXTaG7PWlBW0+51teEIBewQMLdSyL6bYHNzJ4mSmvAEU55XuWAiXYSbV3zMqA==
X-Received: by 2002:a17:902:bd46:b0:1f6:fe11:a7fb with SMTP id d9443c01a7336-1fa09ef386emr876825ad.9.1719014574664;
        Fri, 21 Jun 2024 17:02:54 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c6ecdsm19692695ad.136.2024.06.21.17.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 17:02:53 -0700 (PDT)
Date: Fri, 21 Jun 2024 17:02:50 -0700
From: William McVicker <willmcvicker@google.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/6] phy: exynos5-usbdrd: support isolating HS and SS
 ports independently
Message-ID: <ZnYUqpxvq5K8o6o6@google.com>
References: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org>
 <20240617-usb-phy-gs101-v3-2-b66de9ae7424@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617-usb-phy-gs101-v3-2-b66de9ae7424@linaro.org>

On 06/17/2024, André Draszik wrote:
> Some versions of this IP have been integrated using separate PMU power
> control registers for the HS and SS parts. One example is the Google
> Tensor gs101 SoC.
> 
> Such SoCs can now set pmu_offset_usbdrd0_phy_ss in their
> exynos5_usbdrd_phy_drvdata for the SS phy to the appropriate value.
> 
> The existing 'usbdrdphy' alias can not be used in this case because
> that is meant for determining the correct PMU offset if multiple
> distinct PHYs exist in the system (as opposed to one PHY with multiple
> isolators).
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

[...]

Thanks,
Will
