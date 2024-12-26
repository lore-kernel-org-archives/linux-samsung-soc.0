Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6307A12F375
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 17:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735234322; cv=none; b=OMwRfiqrhl13onmOn2vHbE4cSbjkArr8sJmXwkQGXQ7LK0k7Jo4SKytykkdoCR9Ev9uhKbpOs5rfXr6rJ7fI7+Px3Tr91jZukSwbSeMS1rkHEwTw+RNa+L4Ip4oYrKCwu8i7wjLmgGhwDYK+vZqZDSpZQWNUjjNb32UYfxZb13c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735234322; c=relaxed/simple;
	bh=Gjg9UKzv9LuFKKvRutPMZcvVc5g/BOCV0ghr9SuGXE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qde//wpLJAyqFAWxKDmnQJBIvJU2MmzLoe/0XqujXtDWAgtOp2KMf2mdpnJXVPXSK6lbh5cHbhQNV33sfgf44+DKTidENYSupDXd8n8gFovbZbLNsT4/xnZjP1LhlgkBRDxtzoa0pnS18vv1KjY4tGc+0+3Pfw1zZy9lkWms4sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dAzV0VrH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dAzV0VrH"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2165cb60719so78151705ad.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 09:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735234321; x=1735839121; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fZq8gTOhd/HrF2N/ypBV//FltCA9lQr1B5nofEk6FbE=;
        b=dAzV0VrHLNkBl+j4otwJ7aUvs8XcBokA1ppWk4oLQLYU+sPtyIdu6PS2SFY78YfOW9
         fxpb3NFATphIp3IfZGSQtThxmsAhhzCp2XkfrxRjZSgR2RclH+4G4AXCI5PfVvI0RUOG
         5iMdHtCFCTMpRhbYxKx6NxQ7T0z38gshnIVu6iHVcY7Ug0RCCQGDWirwzJuWBYnlBdXs
         RQ+jDXpdYM8A4H0rpg0F/qGFIozRIR3dhUYQqkyANMz4e3OvsjjeNLMfay/Wa/Sbv9Ak
         BX/S7W3nbDIR7sJ5iaJC6gfEB2vG7C94L4DjD1HFOImy8Wl7jk6CYFw4E/5QY/+m9DCN
         PZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735234321; x=1735839121;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZq8gTOhd/HrF2N/ypBV//FltCA9lQr1B5nofEk6FbE=;
        b=NTdJ3G8ICbqO7InCAdg4ORBHr/qF+sqgY5EzGiMDG3AB+TIM4tqS6aD5Y4qc42jkVR
         bihNlzw7feZLDuutu5E0ne7Vd/EMa0RNZOzmbZwoFR6xBuR7VzvfgwFUu/Aj9OfemMnc
         qaEzD2m8MwyHGSZT3dRS27XpJiwBfvZsdGuJQhurBDIYwZCVZc4/H/J+gRIIpvFrPuva
         noZDttx5VtMSMOn3dflKz9pH/aVkZzXUSbk2wMRgTrwcLl0TRScYgPaROdRQjbacchq9
         aq4MQGbI1AWc5g+LZ3eVIk9lpdDh7iFN0/jlP5DwaEGNaVA9DhZQxArYrtMt+WDJ3GTg
         DjSg==
X-Forwarded-Encrypted: i=1; AJvYcCXsEKVz7kYXvcuOGOOJtEn7j8GpXscWJ6w4nMrCk0GhR/dzIjBFcBBxq+k65qJqWEa1jvcwY231xAVEap8tRHdAlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhl06sd4ekZI9r/QiyPGedOQlts67IstIFTrFnnAGQUc1RcJka
	JVeolnKjzOIXJ5qQBrGHMD7YUWHMatfp7QgUXgG86D0iqH3M2Itd53fu5mlEmw==
X-Gm-Gg: ASbGncsJlQ7vmFV4kOhRs5L2PtWjUihcDoBDIFGhmuLl4d9Ka39RslclWRJ2rKM9Aus
	lpMjZ3utM0kZkP6IkGPfy7MxXWdpcKyanANilnqiIdU8KoEQn3QSVMAEjaJcM7usc7XBNFWu/CK
	SpdxFRI0abq9uGCHW5TBZ+D7ZYf56hdeCE08XQIXiCZnoP4nGDfjdbpie/gqEcV12VGILvFGnef
	7BpL0HlNCx9qjnAYvTF8oiySS9h5BtgsS0feaLtxlQgcyQM59AYRKjqDpeNx9JVEMw3twvJuRo2
	2jVmIbl6G+f83dqN29K+HlMS
X-Google-Smtp-Source: AGHT+IGMiawar/mU5KvWb2BzVuABUtr4oiv5toBR6JEErmfnPl/aBnhoZzQMhDzJD2wfGufTegEhmw==
X-Received: by 2002:a17:902:e802:b0:216:5e6b:e23 with SMTP id d9443c01a7336-219e6eb6305mr303933895ad.30.1735234320475;
        Thu, 26 Dec 2024 09:32:00 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96e94dsm122897285ad.67.2024.12.26.09.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 09:32:00 -0800 (PST)
Date: Thu, 26 Dec 2024 09:31:57 -0800
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
Subject: Re: [PATCH v4 5/7] phy: exynos5-usbdrd: gs101: configure SS lanes
 based on orientation
Message-ID: <Z22TDXvD3AKdhr-S@google.com>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-5-f5961268b149@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-5-f5961268b149@linaro.org>

On 12/06/2024, André Draszik wrote:
> USB SS lanes need to be configured based on the connector orientation -
> at most two lanes will be in use for USB (and the remaining two for
> alternate modes like DP).
> 
> For the USB link to come up in SS, the lane configuration registers
> have to be programmed accordingly.
> 
> While we still need a way to be notified of the actual connector
> orientation and then reprogram the registers accordingly (at the moment
> the configuration happens just once during phy_init() and never again),
> we can prepare the code doing the configuration to take the orientation
> into account.
> 
> Do so.
> 
> Note: the mutex is needed to synchronize this with the upcoming
> connector orientation callback.
> 
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Tested-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Verified on my Pixel 6 Pro.

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

<snip>
