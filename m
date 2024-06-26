Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837681922FE
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2024 23:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719445212; cv=none; b=Lhht/QUKtLlrJTrDiW7LgkV76hB1SA+TQiLjfGPPJUc4VVINg8uurRYTmWOE73z7gp+U6SB5089x0RWHNJRZN41z9Q8FF6bK9GACeXJXzaLBU+9sak1EkxneU+OfhXx0TBWDUTR2l/meaSBLGM2PJAzoB3/mB54n20bRk6aXfvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719445212; c=relaxed/simple;
	bh=019CaFVh3lhoS0w68HPIP9ng8eI8idSw76yT38lMbnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUyhe38/pIimbfk/vvXVIqRSVxAXbG4mg222tDGxa7BbNe9hagIZCD1D+zirlj9Gz2899As7vqT+OuzX+wAu305pR0TGblNCVe6B19D3JA37F32Eg6R4UF6z4lqVz4wfYmQU8Skl9W3hwCC//gFQam31x0mGK/pLyeSNS/aTqcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iRXaG7j+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iRXaG7j+"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fa4b332645so40135ad.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2024 16:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719445211; x=1720050011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYUt50CXgSrSaz+HXS9uk+LgKfhLcjaXpXf0DU8eqcI=;
        b=iRXaG7j+1XO5wSVH1ggF3Hk1ivlNRrYsOVzBOY4GSdqQ2D9W9tOFGubX47Y6t+coDo
         KvUf/2TygQAptptFsYn5OwjFPr739t8h/eEn7Fxht/K9Eue1Vx0NVezGkCdmVnITWA3Y
         GfzTjK9HmAH9+LMVYQ3LkQO8kMJ0Rfa8/FBJFf4OGXdb6Vd70UJ24kSbMlY+qegx7C4E
         Cxj22dgWVi7Tsp4frCCvw+v90w6rIZPjluEMKDBOOjksQVV++Y7QdP0w/hxdTEAZ1kla
         /uzzYawBQ8+zN8tFUwwwST9rgR7O7fCihtauBI5ZkxcEEXcLyhOAa0Jfn6kLFSfhNT/I
         lQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719445211; x=1720050011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYUt50CXgSrSaz+HXS9uk+LgKfhLcjaXpXf0DU8eqcI=;
        b=dfPszT1m0J0bGsJBUmKJ4ZjyW5GOGhy4gCiM9VUUPUMqwWgmRhVmyZYzRlhWcSrYed
         LxROhdKOcYPv44kVCGY1tQUAqL1qdDZKUpB60+r1b7TEXdAB/ktbxLbfwgi7M5kkefTn
         rdRfPB1yLgFKyZh/7ZGorQ1J79VlL+Y30//t4fJbLymWt/kU/2e8k+UlxHVruHj9FfYD
         GR5oJscmSIof8hM/KTBv4BtcecjERgbdLXyVc2C12obiC9Os5YeFWH/pp+ZSc2bB9ptv
         mE6LzZru6d8UMRNRFh7G2WW1E0RkY8SgIvQYhr+UhJxD45qi42ln00x4/tt7D7UTMIpN
         s+3A==
X-Forwarded-Encrypted: i=1; AJvYcCU2IYIP1jD3mzpp24yVzy98OOQpOkUzO6E6NliVWIALDqcwVQtLmNh+4hwGY8+qzeSpF9ZjBVMv6o5qf04+OEvZ5luMhKw7mx4po9rVRvRiu1g=
X-Gm-Message-State: AOJu0YwQHQ/fnhc1qRy+YI0D4m85X6f3UAMoVoXr1jHWTu518Pxc7PcJ
	xKDuLjUr2D+LAQ1TaleIGk9RSd93DCEFXBppTqfT4+nSaF+DLQxGkT1938olug==
X-Google-Smtp-Source: AGHT+IHlKaAmURTLh3ZeZvxHBLbh/zTd2wDSCpmqMl4TBrZZ7NKfHf0vVsBEj0+hsbeFfCuPgzzyhg==
X-Received: by 2002:a17:902:82c6:b0:1f4:7db0:afbd with SMTP id d9443c01a7336-1faa999eb47mr1582755ad.28.1719445209827;
        Wed, 26 Jun 2024 16:40:09 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac979499sm514875ad.144.2024.06.26.16.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 16:40:09 -0700 (PDT)
Date: Wed, 26 Jun 2024 16:40:06 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	kernel-team@android.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: samsung: gs101: mark
 gout_hsi2_ufs_embd_i_clk_unipro as critical
Message-ID: <Znym1qR9hyYwy5Ll@google.com>
References: <20240626194300.302327-1-peter.griffin@linaro.org>
 <20240626194300.302327-4-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626194300.302327-4-peter.griffin@linaro.org>

On 06/26/2024, Peter Griffin wrote:
> The system hangs on poweroff when this UFS clock is turned off, meaning
> the system never powers down. For the moment mark the clock as critical.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>
Tested-by: Will McVicker <willmcvicker@google.com>

[...]

Thanks! I verified my Pixel 6 Pro reboots and powers off fine with these
changes.

Regards,
Will
