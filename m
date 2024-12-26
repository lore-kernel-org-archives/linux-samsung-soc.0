Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEBA14600C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 17:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735234204; cv=none; b=ju5DM+ZmrFGoSSGI/0d4ora5Kxha0tD+cuxyv8pB3fqMlSdH202umUMI8Y4K5S3/pT14D1cS/SOViuINDXlRmhUmpGk7i77AnpjFeL0lNzD97b9ZrWdbKKRAEYs4+L6PsioL4Zi/sd4Us3FJ9EoIVx7w4hfs4n79BE0mcFicdmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735234204; c=relaxed/simple;
	bh=TvLqtG1WDIQ9YSnqHOzsPIYzQWTcYYy//PzbG6PEb+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcOipHOqRk4dIpU/E2J4/m1bwEj2nUWW8CAiITgVKhuuFhJoU4ZX5iPO1fsxZFCBIfKj9FNGDgtg63le03wzplQxh8pn30r3FhWrdShSVENEn5g3nOkn3MTE/IHdu598vFQDlW+xbFKgA2gDwgf+9olmxApO8GTxS0Zrty95Vws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VrLJp2AG; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VrLJp2AG"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2166651f752so86416155ad.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 09:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735234202; x=1735839002; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iOKmxq7sfOT/dN+VcRhgWDRuv9FZCWqojz7j41kMClM=;
        b=VrLJp2AGR5bdOUSJ65vhahrMbeg6QyHlWMhHM84F0k0TvLi7fjexqvVLtxQZY0y9JC
         G5/zKkucsYLdeoEC0cFyIWGgC4j4/KBtWPHiBTsnXP2F0413O4/B6KiEUvdnhIZhvs47
         nyPg35ARMQ1Pl2czHaCnZ9lnmIVpqZegSm4Utl4WrC+tsUyVuFtnE+CeXaY55xwsopjl
         i4O7p5hWP3SB4STZFH4icov6ix1h0ABQy8hXv9yjHY2A3m5+uw6OwU2yvLJBVYoffzWc
         xqtq9gmB6lz5N2uKTne0DLQZS6YOFFHMLfHWn3PqrvIkSlc3ePha0HBZTNc3sXs6ykBg
         yijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735234202; x=1735839002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iOKmxq7sfOT/dN+VcRhgWDRuv9FZCWqojz7j41kMClM=;
        b=XoUY/JRTcbweDP2P9EiDha1GXRZ+898Cs0SNbLHxHpcOT7JNMws9OOw18opl4Ks9cQ
         RsmZio8s8ExBUsDmVeWQ7huPLN5bFWWop7wBSjc8edR9jwhlVs6Lf2KdnVHd/gb3CB/7
         cGU8EALOlztbI4cn5KLAbHhWXuhmWBEeWfK1OUjIs9B6RhS5vdTOkZHfbMwSSb2e+aDG
         KpMI52yPSGCQaBKcu5KlmrpITCkBAFu0B+kOXmEARQPe1NMcRhro9j41PCYD4/FvxjYB
         ++GIFGangRag/r9T2nnPwmAfGBBFkKJ10vOy468MoyR46LNHnQR3NLmuhK9Td60d0sUs
         2EJw==
X-Forwarded-Encrypted: i=1; AJvYcCX5h7XRnd6S1ncDJHLVtUVJYG3PhuiNg77aylixhjxX19lAAy0X/wmhS6RlVA0HyJWea5nU9Ky6J3YWW69NmKLLIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBfzkm9aHtzLsL7QOBHT6r6ov4fREMbbnfXA4zlVce11zC8sm6
	iDMbVEzNaPXsvJHD+nsqK50VYwrjbQNiGfBh82zt0pUnwLCK26VUeqTRfvdBfw==
X-Gm-Gg: ASbGncvS0Kv3vRLi/dlkOBuw6nQLBVAzIJYQUnfyzPJuEMZKxmBVccTdA0jn7qyLL8v
	NF3gKzNggyoz8/619M/HziTTWJpEKtz+zCOaFaM5dQ3hHVfNu+jVUsc8G6NIH2sm7rnEYMJOFvr
	UJPFFltIX+JuUEJk0p28v2HfpyeWbIfgMw9jRTbfceDaKzCOSNUW2Cf3rDqYd6SCL0v2U6WUhqt
	lXxneUIGCYLnbCnenm5hu7dy9Wmu8D00Mm7cEZS5vPEUrKILGFSu8vtxOjy+TqDlR5xiWpT3YyU
	c5IpJ6+rH5pmMLbDMHe36OVd
X-Google-Smtp-Source: AGHT+IG3DI35X7q9+bCJb3UUFJu2GLGQZKsBEiV2vr18nzsLloa/+8mEp5KjjNsc3tnSau1Pvhjxmw==
X-Received: by 2002:a17:902:f652:b0:216:4676:dfaf with SMTP id d9443c01a7336-219e6ebcb75mr320751155ad.34.1735234201256;
        Thu, 26 Dec 2024 09:30:01 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962961sm122281025ad.13.2024.12.26.09.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 09:30:00 -0800 (PST)
Date: Thu, 26 Dec 2024 09:29:58 -0800
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
Subject: Re: [PATCH v4 3/7] phy: exynos5-usbdrd: convert to dev_err_probe
Message-ID: <Z22SlgYsmFbezV-0@google.com>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-3-f5961268b149@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-3-f5961268b149@linaro.org>

On 12/06/2024, André Draszik wrote:
> dev_err_probe() exists to simplify code.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

<snip>
