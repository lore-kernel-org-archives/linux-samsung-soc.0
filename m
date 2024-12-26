Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7361E136353
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 17:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735234133; cv=none; b=mnkIzX+yoPx9+ruPO6WcekOzECsGqj1b8Rw255hXmZbKUptSqVGNzc+l1ynGlSHAJX8P71o/XnldWNVSU9lF+KAZ7XQvpOc1Krj1xJ5mG3DrGUdgRevNZLUhb3XWkoMSKa71MosqKMXjkY5dr7SHzecJJA0NlHasHsljoZA0PNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735234133; c=relaxed/simple;
	bh=E13a9HFey797Y+DFAx0KL1ZPpzzo0Vwzz0tfAjklBIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgf8BQQbJ0e9z99Nme+SOp3MoCuQj+QSGY0fZ+MWZxjVBy5pWl7m88Uy9xIXBtyg0UAaQ78ZGsRKruOtWCX/LbOXXEcFFqjuu9ajEboCup+SuqMz9MC6lhrC6BoyiFuRyyMn1cDcR0hQtk1CT+ANT/WVdZmpIWKnn2+L/lRvjvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0Owm/Hcu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0Owm/Hcu"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21634338cfdso110448925ad.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 09:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735234131; x=1735838931; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MZM4CEUh2HGYEJA81GK95AB62iIhj0se6/I95TBn3+Q=;
        b=0Owm/Hcu7bjnYuz098HKYwzySiwVoB4Ddu4QmHMTC9/waujSc9QAR1+fBOhQ8x04mM
         oYldSU8xdKdiRC+Bk19V8wSANKIVsTd6Gof/uni8ekJ5ZxS5ok+DZYQxjBlwiiYx6vX2
         6xfKnK9tmi+sGflzCrejXQXHbp42O+kTOPbjtcUHyCZYq4wqsE7dgBEL8JVMBY2i3LPv
         3rs+X7oyDm91HCJk0YAsEQeC+bUE6bT3eFtLHPoU5bLkdwTaLJMNrmIgJHchq5WbHCoV
         F9Y+PZ5d1vSqSNYk4aSAY5PgTvFE8f5rgI5Sg+BIULz2MyEYSkH5nAyfyms0EcJOAHmi
         fzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735234131; x=1735838931;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZM4CEUh2HGYEJA81GK95AB62iIhj0se6/I95TBn3+Q=;
        b=mX0EC+YZlpvdQW66p87SNdrs2ImmkXtL6rpYkKEQQS78W494kCASxQsOGm6Ny483sD
         pamMEzRsG/r4cPAMNLRADqfo0vfiefTejEtAXs1fUdkacMpmmKSTtRd/3Aw/cy6E6+js
         v4AVwwd5tVpJJxZnNT53YQwJgUTA8kCI6LGYnSmd5wx9OsbV3cCdp9gPbElwOlVOfY0c
         Yj3mHsHaZu9ptR7WqrYcpKf93bXYJhg8lcoViqfAUmHiq5HLg4nM96cnaa2ZWUTgjj8S
         KPerwGJjtmIcIuHwP0H4pHehQSqLjAZQpJ2VbrtvRmtRgWmQKCffs22R9S5nlNITPtQa
         lLJA==
X-Forwarded-Encrypted: i=1; AJvYcCXL0hkG/4oymEm2+Um+JDT06E06GahDHCSxR/3JSukdSF4+UTWDqEtgpRAAhlSQZFdJkk4OrMVApqzG2c1Ko0xPWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRs2XqPNwPSYl1rVDbI6ebqo+rTVY7MzEetDq1dCXQBaV0VQiw
	un2bf9l12clZluId3rxGjnUA916ULPTpeCtcP2OpAYamBlfnAVv19S+gE6N+CA==
X-Gm-Gg: ASbGncuy09chCV4z7rb7+/KWORgYvkbVznRoJBXYpIvkyrEzcx/rsbWOsTazD8s9IuJ
	TGuMhFkDMhhI5D69u48fxzv0z0eF4L2bEhUa323AV87pY907SD0FdvwqKygrOmFR8pFLLhPicAu
	mzmmqq50K9nJLRXciZrufl4Ryt6oK+PxMAL1aFP1y9FFg462hvhcUREIrEZmoXfrEPpqTERdt5P
	om6fMDf5jihly66+kCkj7lWobahxx+7naGUwuIDIYDnHbrof1z6CLScdpC97annRLg67mladbGC
	Y7zuQQNZTkeP5zkel7yHyOSG
X-Google-Smtp-Source: AGHT+IFBYpPcdLPqV6zNyGAlMP+fcIVUdggCbxsnyGgouqIm8mTzus1DxDfWnUwkq2+QguJv2z5GcA==
X-Received: by 2002:a17:902:d502:b0:215:94eb:adb6 with SMTP id d9443c01a7336-219e6f2605emr383250035ad.40.1735234130575;
        Thu, 26 Dec 2024 09:28:50 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962c05sm122006295ad.43.2024.12.26.09.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 09:28:50 -0800 (PST)
Date: Thu, 26 Dec 2024 09:28:46 -0800
From: William McVicker <willmcvicker@google.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/7] USB31DRD phy updates for Google Tensor gs101
 (orientation & DWC3 rpm)
Message-ID: <Z22STiGYnLdSkNnW@google.com>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>

On 12/06/2024, André Draszik wrote:
> Hi,
> 
> This series enables USB3 Type-C lane orientation detection and
> configuration on platforms that support this (Google gs101), and it
> also allows the DWC3 core to enter runtime suspend even when UDC is
> active.
> 
> For lane orientation, this driver now optionally (based on DT)
> subscribes to the TCPC's lane orientation notifier and remembers the
> orientation to later be used during phy_init().
> 
> To enable DWC3 runtime suspend, the gadget needs to inform the core via
> dwc3_gadget_interrupt() with event type == DWC3_DEVICE_EVENT_DISCONNECT
> of a cable disconnect. For that to allow to happen, this driver
> therefore needs to stop forcing the Vbus and bvalid signals to active
> and instead change their state based on actual conditions. The same
> TCPC notifier is used to detect this, and program the hardware
> accordingly.
> 
> That signal state is based on advice given by Thinh in
> https://lore.kernel.org/all/20240813230625.jgkatqstyhcmpezv@synopsys.com/
> 
> Both changes together now allow cable orientation detection to work, as
> the DWC3 will now call phy_exit() on cable disconnect, and we can
> reprogram the lane mux in phy_init().
> 
> On top of that, there are some small related cleanup patches.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> Changes in v4:
> - separate out patch 5 'phy: exynos5-usbdrd: gs101: ensure power is
>   gated to SS phy in phy_exit()' from this series, as a stable patch
>   shouldn't be buried inside a series like this (Greg)
>   Link: https://lore.kernel.org/all/20241205-gs101-usb-phy-fix-v4-1-0278809fb810@linaro.org/
> - Link to v3: https://lore.kernel.org/r/20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org
> 
> Changes in v3:
> - patches 1 & 2: update as per Rob's suggestions
> - patch 7 & 8: drop init to -1 of phy_drd->orientation (Vinod)
> - patch 7: avoid an #ifdef 
> - Link to v2: https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org
> 
> Changes in v2:
> - squash patches #2 and #3 from v1 to actually disallow
>   orientation-switch on !gs101 (not just optional) (Conor)
> - update bindings commit message to clarify that the intention for the
>   driver is to work with old and new DTS (Conor)
> - add cc-stable and fixes tags to power gating patch (Krzysztof)
> - fix an #include and typo (Peter)
> - Link to v1: https://lore.kernel.org/r/20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org
> 
> ---
> André Draszik (7):
>       dt-bindings: phy: samsung,usb3-drd-phy: add blank lines between DT properties
>       dt-bindings: phy: samsung,usb3-drd-phy: gs101: require Type-C properties
>       phy: exynos5-usbdrd: convert to dev_err_probe
>       phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
>       phy: exynos5-usbdrd: gs101: configure SS lanes based on orientation
>       phy: exynos5-usbdrd: subscribe to orientation notifier if required
>       phy: exynos5-usbdrd: allow DWC3 runtime suspend with UDC bound (E850+)
> 
>  .../bindings/phy/samsung,usb3-drd-phy.yaml         |  21 ++-
>  drivers/phy/samsung/Kconfig                        |   1 +
>  drivers/phy/samsung/phy-exynos5-usbdrd.c           | 202 ++++++++++++++++-----
>  3 files changed, 182 insertions(+), 42 deletions(-)
> ---
> base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
> change-id: 20241127-gs101-phy-lanes-orientation-phy-29d20c6d84d2
> 
> Best regards,
> -- 
> André Draszik <andre.draszik@linaro.org>
> 

Thanks Andre for getting this working! I've tested this on my Pixel 6 Pro.
I was able to verify runtime PM works in both orientations with high-speed,
super-speed, and super-speed-plus. Feel free to include:

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will
