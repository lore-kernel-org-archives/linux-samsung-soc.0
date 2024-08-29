Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3FA189F31
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Aug 2024 08:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724918941; cv=none; b=MfATYGrQ334bbN1hjJmV8e7YWpKvyhn2LsHGENrKsT2LPtdwAzJ+f3mevksE5mA6ZiGnoSoZ05KRvB4QY65P8sMWjQD1iEGlOLBbaNYSlPXbrRJEgmdofQdYVtJFPKwJ1PznKNJKcoPY+P/rypxu+sZ9RcSN/4XwOeo0/XgXhng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724918941; c=relaxed/simple;
	bh=0e9bY22JQmIjY9HBX7LF3J4B5mh4hs3ZuYvXQ1yj598=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiq38Lt+20OO+e0X+sSTFldnXXfAHjsOz3gavlAJT2pZyWuPjX6l2h4WIynXsO9g4uVxwLKCDiawuELDtgF3hXrR6DIYlEL+TYhK764G45JgC9Wxp0m6RW0nNOSr9BCaSpoFpXTYZ+64TJhCBnH+/968ji9ARLZ0R15nZEvpUoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CbWCssqK; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CbWCssqK"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53349ee42a9so485570e87.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Aug 2024 01:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724918937; x=1725523737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rzdVHNvVFZs/r7z8d45DArC5y0n0ZEzQ/sfa0ZzJkSQ=;
        b=CbWCssqKoTJVlpVVJfkL53T94GUo7/CF47g1xobEvYBoYH1RkOVPwhv7cjujcMzr8k
         psvLXA5J1i6ci8Am9sxLVaHeNnLp0Rud12VknV4p82nbWFoNSsiVAcg6Lavail0RtaU8
         pe/aAphgF+e+kzapBUF4tC0mnr+aCruPpbdrwvUPFM6hlGA6mS35ozovN1diHDofbxQ5
         Eaj3mtFWkveoGxHbQdrhKSRNec3p9eRVxw1/oqSE8/WuwwVNkzlHkV2y3GOVYUassoPd
         6G5p3hMqCJm2ZSV7EMkvYpVX0nHEBFEVsBGyQBlKqnHPKDxKfqbB6XtCy4cjHOVk+q5W
         jdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724918937; x=1725523737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzdVHNvVFZs/r7z8d45DArC5y0n0ZEzQ/sfa0ZzJkSQ=;
        b=qqIlHmjwgsl15hjHJduaIiIaOq6186vE7OVvAgGzPlOGfv3oylQKzOdsSXpKNrUdgN
         IrQ0CkPn2DN38D/emZ7ytOpg+gyX+n7ErxFK3iZiODr81UkSxFvtXMZ0BT3KOkRMT75P
         63+/yjBaYSTQ6bE7YNuS5VMZZ110D1PbbOoqRXgLs+hwEILnbgOY5gCummrBbBDJCNBC
         ADnRNBGS0yNewsSytsYLjVWqgnCeU4ZZovfyIPAtx8h0Fd94vuKmKux1hbUtjNsEREn0
         4clMMqhNWX0tr5BlbI+lDnOYIT0pXEaLcSKtVGj4aQo6rZRxxTRO9L7l73AWf1263H3I
         GczA==
X-Forwarded-Encrypted: i=1; AJvYcCVHW1YNkRE6AtRkhlGTUqH+HC2I6o3fmitn+ZEwiDtgmnsJ/KWMI86bvn3uXLJth13VZBz4qw0uX66I3PJDoSB4gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcdM2ETTL0sp7kI2mgchND1ic6vCxikUwOept0fPoW0wSEylgM
	xd/NOEnfRIGHXiVbJCswSZDBjutxZo5h3g/c8OclY1tWsFLhetlX76sDxO5mzNY=
X-Google-Smtp-Source: AGHT+IFIE5FdgmQvSzVx3ReotP0YOU4OOkMPEDzM9mZ+yWZ3XKm1Dl6erwST516kO7jI6UlRoSAIng==
X-Received: by 2002:a05:6512:3e13:b0:52e:9ab9:da14 with SMTP id 2adb3069b0e04-5353e5744e8mr1286311e87.31.1724918936864;
        Thu, 29 Aug 2024 01:08:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084116bsm86523e87.214.2024.08.29.01.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 01:08:56 -0700 (PDT)
Date: Thu, 29 Aug 2024 11:08:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yangtao Li <frank.li@vivo.com>
Cc: vkoul@kernel.org, kishon@kernel.org, krzk@kernel.org, 
	alim.akhtar@samsung.com, konrad.dybcio@linaro.org, liubo03@inspur.com, robh@kernel.org, 
	yuvaraj.cd@gmail.com, ks.giri@samsung.com, vasanth.a@samsung.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] phy: qualcomm: phy-qcom-ipq806x-sata: Convert to
 devm_clk_get_enabled()
Message-ID: <bo3hx7ma3np3wjpjc3zmya7iagefnlkwyh4s5gv7jxhr3ompob@cpehveanuxmw>
References: <20240822084417.1596110-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822084417.1596110-1-frank.li@vivo.com>

On Thu, Aug 22, 2024 at 02:44:16AM GMT, Yangtao Li wrote:
> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c | 22 ++++----------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
