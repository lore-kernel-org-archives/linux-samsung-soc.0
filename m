Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05B6182CD
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 17:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735234460; cv=none; b=NmZ8xYEvywMnxLMxFDabuIf4JYtXbWsuxMTevo0f10Fu7NogF1cJ+N+SCH6kPH2CIQL7GTde43xTCGEHY4kqDWdLso+NqF9uhwrq1/D6+KnWm7nK9B8SzO+vRhkUof6Qj4kSCyUCArP/nGmW2Ap+GraXloksdVMx4VvjcZ1kVhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735234460; c=relaxed/simple;
	bh=AMjPKQDZOGacb5Qu4MGAGPFWMyLkIElN8jRxwuWk12c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnmLN2JWDNoav0Dm8eJ4ZTucnM4Tuu0/dZAmr2XAjZWSVQDntsWCO+7pN5NF9B23BiJrelTJAl4lDc3TsiUFNN3bZr5U7hkjDCtZf2RWCVN8imckb2l1bKldP7Cysjxtrq45Hb3F7zCXkjdsAJ8trQ+ZA1YW6lUzArkPqwrNqiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rPYTwTLr; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rPYTwTLr"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so5701415a91.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 09:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735234458; x=1735839258; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UpfjO3nCfSKSU/F6ZQHVcOz1mCD2+D/yZzyTSXWn/XA=;
        b=rPYTwTLrrjFiiNdJgC8ViSAhN7XFKB405/sdbcQ//iUm216aqOogFFPTM1qcWQfKwd
         K7b6b5Akwd3dNQQrhspwhfZyUHYPjCd6X+zrnSmmtWpb+OK1MO/Dxzzk00eRrWwZI+Mp
         sSFeoZDC1178AheuI3R2uNiGUPIsUPJ9BtGV6osfNsGnbwt/zRwwoiSL1BESC3lFA26D
         SQ16EshbigzzVrQpD80MpZVp/hhXigbuJSMG7kofyYU8vDuj3U6lm4hWALI/4xl0mZ19
         hShGNySZ5PoC3oGnuR+5IajdvTbX6LgmENor7O5ryWOp47YOS+B3f9/1k7W12XeqK492
         aB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735234458; x=1735839258;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UpfjO3nCfSKSU/F6ZQHVcOz1mCD2+D/yZzyTSXWn/XA=;
        b=GWuVWl4r4inoloTOCchJH9EhorCOhGr9uZOYeVu9GVwFxmOKndC6NllZuPDVObqk2q
         4R/lVEjkGK+xwdIPQDZxBlmfpvjHXI1+IQJiFbyJfco4OxLFtcVaqu59TKkh/qh9GV48
         xNUF0ATU49DnuANGXbuNmd+4Hi4z1WmvGgT88ii/yd1j5N31K5qBf9I46VfMKwULBrRt
         Fut1AIkZA/tfhXJtSBMJp/4aMC57Sn+UOokerTWqrMerAW+cdd8/Mw4w6wUmNyTIS2uL
         xZVwJCjIPGHRaN5m457H07TVlTAUBFFGhp8byfs/XWctXN+NCNPeenfPnhS8ExevFd8H
         Vwgg==
X-Forwarded-Encrypted: i=1; AJvYcCUQqISIsFllp9VKDW/3nrx+13etVlD+AIUE3n/YbGyqPlMl5oB779eLHn+PJFlSc/kTKn7YzfM+L1AHbCf6900Kxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDJDFXrqkXZHBWUhzFD+0DCmleGb92OMShnXUc1EXO+4Akfjv4
	8UhY1kX25r5qoQC2a8BBoM6TOHuOl3jC51yKTmsPLjMmHMf5blbq1nx8D1sdHQ==
X-Gm-Gg: ASbGnct6SIU3kV73kXSTnGK//oYzFK9FxYcphKNo5trcJp9z3IjJF36dZf+ceM+GwMu
	EAax5LKqnfaR10JwzghCAzSrIi8MHtQH9UiABkG6bJnt7NaIvEMA+KsjBvqeIkbfd7wlH3hEfhK
	6BY9OrrSKVkO8lAI808LOdz7VBm6zM1Dl+agXsN3HmAZXDGeAr4myS1bdsN0QOx6zhV3tr/nSbx
	Ui58WJAX+sk6hqHKnXwAaS+VR7LdCGFXUu7wLZT+OYXer3j+RmbHoFFfaHvPeLcDmupAR3UJ4rO
	yHb4N7oHpafnWy10aXU+Nk4d
X-Google-Smtp-Source: AGHT+IEXR2tW0UBVoELj4Ujtb5xezOwJU19NdsTJFIlGuhV4cKpQboh3iQ1wj0Q6nDV1+6ZatyEKfA==
X-Received: by 2002:a17:90a:c2c8:b0:2ee:b2be:f390 with SMTP id 98e67ed59e1d1-2f452ec3780mr32597910a91.28.1735234457983;
        Thu, 26 Dec 2024 09:34:17 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477c8542sm14223370a91.17.2024.12.26.09.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 09:34:17 -0800 (PST)
Date: Thu, 26 Dec 2024 09:34:14 -0800
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
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 7/7] phy: exynos5-usbdrd: allow DWC3 runtime suspend
 with UDC bound (E850+)
Message-ID: <Z22TljXrbBNazNwW@google.com>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-7-f5961268b149@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-7-f5961268b149@linaro.org>

On 12/06/2024, André Draszik wrote:
> To make USB runtime suspend work when a UDC has been bound, the phy
> needs to inform the USBDRD controller (DWC3) that Vbus and bvalid are
> gone, so that it can in turn raise the respective gadget interrupt with
> event == DWC3_DEVICE_EVENT_DISCONNECT, which will cause the USB stack
> to clean up, allowing DWC3 to enter runtime suspend.
> 
> On e850 and gs101 this isn't working, as the respective signals are not
> directly connected, and instead this driver uses override bits in the
> PHY IP to set those signals. It currently forcefully sets them to 'on',
> so the above mentioned interrupt will not be raised, preventing runtime
> suspend.
> 
> To detect that state, update this driver to act on the TCPC's
> orientation signal - when orientation == NONE, Vbus is gone and we can
> clear the respective bits. Similarly, for other orientation values we
> re-enable them.
> 
> This makes runtime suspend work on platforms with a TCPC (like Pixel6),
> while keeping compatibility with platforms without (e850-96).
> 
> With runtime suspend working, USB-C cable orientation detection now
> also fully works on such platforms, and the link comes up as Superspeed
> as expected irrespective of the cable orientation and whether UDC /
> gadget are configured and active.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Verified on my Pixel 6 Pro.

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

<snip>
