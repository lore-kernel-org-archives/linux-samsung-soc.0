Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E147D2BCF5
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 17:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735234266; cv=none; b=LGTKZrPqXo6ppxBFBzzIaLz7qWhBnehK4jPEqT+YWyFcr3kjAR3s+Avg9ZgSXgjQkIWrfILS+fpFVQAn94wHH9CRxi31mCbf0d2fFxNHRGiVRaKAvMjHRGnQ9I7zNJjFMXKpnUSOQ7MtXEFFRvA7uGPEvqYj4FsIZXioB9e3JMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735234266; c=relaxed/simple;
	bh=MQT//z2Wu44VlEXRV4yVNgPQ7JEgbiqZDnefWFzQiDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvuYbDIdtLy8s8Fo1m78p8uCGQMngZUEL1wsmy5MsDBwU6Xyzf8sjQH9/bgJqF/btH5MHHkdq9rln38yETqukQaBFZn8w71gMKk48gjHakopZAEoB9iDSj24cS6QvHy+iclsDXZu+coBxSFb3Z7egof/ivQduM/TZEClZVLt/II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nUI/H2sb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nUI/H2sb"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216426b0865so75304685ad.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 09:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735234264; x=1735839064; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xcUZWE3ppguCfT0Ghk6RY8lNJANWnC8EbI6p5AXiKeg=;
        b=nUI/H2sb1ht/SUn0+I+AZmHp+JXhR5+i8btbVjpEhjmuGrFVeKTRn4pnByQaQw9YfL
         Zms0hbpmMoJclnOZzWBUej3iQ7w3HafJu0ftx7e5Zz2XRBb0oaVp0yTUTkyrD0nYrB7f
         YDo0oWN66TftFRQwIZPrrWhouvkqleCol5csBA5dm9TnxtuuQLK5q0sDRJAOHFgOrFvW
         FE5iQ+/wcS7lgS9PtY3FIQq4/JzNM/h0KPFWI8VdRK2Wefo8C6dPVW3r2pWpgZa+TO5y
         RyhlZ9kkMHu2s0zmnscsKNRcTBjLUdyATnhZsGI/xbfZrq1T6hew4pvEi364mDUd9ksj
         bB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735234264; x=1735839064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcUZWE3ppguCfT0Ghk6RY8lNJANWnC8EbI6p5AXiKeg=;
        b=WFBMWFGEYNxE81DC1XlJOJfL2Ymtap9rLHLgBe6tMQ002PIa9NsbnqtNTuPlliQRoV
         NU+laHL691q4vRCZ96Kb2yLPxBGwCZnmnM7tSCWfFVqlynm8o2ip3GvJtqhl99iVDpX9
         W29jE7VJNtWdt4BxCO+0BmGJLk2mMV3cgZmDGukHc13QbJRH4mx+VEwnV3QFawK244r1
         CUQ8V1Ga2yqL4xEcLK2L2rRb1OqLsFonYBk/OTexzwJh42PQ+ggrL32zE5dLgeztO/Io
         dDnkrKQRr2TfMQGbrjcQf6NZa3igFGEDfqWRyT4kT5uelj1a7tqkEJgDO4AtHg4L3kK/
         kHNg==
X-Forwarded-Encrypted: i=1; AJvYcCVdjpVu58g9y+UkxrsUlngcwDpYcAPzjF24BOKHORVazfNCr6tBkxMQ3jT713DwxzjorPgbJepFt6ceBkxUOhhKag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmQ2bz8p3p9eUNv95J+vfVfG4DCgxfp3zs/oDRsuJY9MuC38kB
	0AtzchhYIOstjkNZNtrA3VCpkdOz3BHNqDRVyT/zW0i7ScibCRP6HuCARQ5o4w==
X-Gm-Gg: ASbGncvbblEj5RKV7A4jmUiVTn9Q3EJdWX2hs1CcrYQu7JNbkz1AmaH+2PmH3DtoLgb
	fMb3kBNVmMrBx9TTEDeC+6z3UIDzymKhYajPN+Sty/yqA2369GpnUTOFlkzE/P4C7Xzo2UALy80
	oHdy19wZ6rJXDS9msbBziIpiTP4fn2mDOhShNmX3sUFnZ86kcEeG/wWOSRkDvQutjl9am8PMVFo
	76StvsKLTj0a6l9YE7WUnw9vjbTjNy5yhP8sriwd77S75oLMfN6VYgtf44F6CCHQ0pv9KyVH5mA
	m+/hHCX9/EDMA44uyc2eCCPG
X-Google-Smtp-Source: AGHT+IHAfn46MsITOFrPVZJ4vXZEH6EHEc/IQOmoCmQiapMunnWTNeZzpppaV467WwIqrvzfz6A1dA==
X-Received: by 2002:a05:6a00:414a:b0:725:96b1:d217 with SMTP id d2e1a72fcca58-72abdd7e0e5mr28935333b3a.9.1735234264082;
        Thu, 26 Dec 2024 09:31:04 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbbf6sm13136269b3a.111.2024.12.26.09.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 09:31:03 -0800 (PST)
Date: Thu, 26 Dec 2024 09:31:00 -0800
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
Subject: Re: [PATCH v4 4/7] phy: exynos5-usbdrd: fix EDS distribution tuning
 (gs101)
Message-ID: <Z22S1PPAQ4NKdrrY@google.com>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-4-f5961268b149@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-4-f5961268b149@linaro.org>

On 12/06/2024, André Draszik wrote:
> This code's intention is to configure lane0 and lane2 tunings, but for
> lane2 there is a typo and it ends up tuning something else.
> 
> Fix the typo, as it doesn't appear to make sense to apply different
> tunings for lane0 vs lane2.
> 
> The same typo appears to exist in the bootloader, hence we restore the
> original value in the typo'd registers as well. This can be removed
> once / if the bootloader is updated.
> 
> Note that this is incorrect in the downstream driver as well - the
> values had been copied from there.
> 
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Tested-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Verified on my Pixel 6 Pro.

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

<snip>
