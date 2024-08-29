Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FE6189F31
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Aug 2024 08:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724918927; cv=none; b=YXDj5k+JqcDv2ZF1mHMdYd3fK+z920eSiKtOHkmuFZy5ro7dO9zGrSSdP1+kLfQ7dVsnzIVmA2mlv5vAwNEKar/oZB5MbzlzM0WG+9t+B1+Vp18I8mBHMDUF3eTHNSYBBuXO9Mlbc7w7N0Yi8W41/lTt8dtgnF8UfX1QJ01sTkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724918927; c=relaxed/simple;
	bh=0/9pzeYLRdS8zB2Y2FxT7S7A9LvOM/8Gj6nTQAlPhG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mruBUbNIBnbZ+bwLHSOAm6WzRFynoM8Hg22P32TLujDSoa+v0MaYEtFebhcXbM9Lc+6X8lUwEImIgfnnHQ4vnoFOGj/kr9kile7ty2NdSRhPSWQtpO3uA58PPl/QUbM6awdJ83cIDGVKo15WmOPNc2WAEXQoTZYAuCrb+Nczzhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wZyaHPkZ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wZyaHPkZ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-533461323cdso467366e87.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Aug 2024 01:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724918923; x=1725523723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T4BmdnrzBdhHgzltTkpUo2txI/5MakiYPq5y08PZ3iA=;
        b=wZyaHPkZuwlOGp0iunpaOknMyf0WyHC9wRgSIYzy+TpzomJnZ+Ws7znVeJARtzvPsh
         OutWYQSTBSd+8uo9Vl2zDINhaSTi1o0ir1ed9eizWn00nmOaw8aC+V4T3Zv0fLQXWRfu
         wgJIMA/NezdkSG0lEdbHoJsdTgG5efBMoCRoEpcbQ4nPJRelShyFOf+FwR+9WQs1z/3D
         4gqcQWslpdXnaz5mX1X8ZOCKg6E0oZq6tIwyJyOhCoQ+VsfC5f6udZOZr5qAuS0nB07m
         FKlgfjQnMGwVE+ynN4XWoAkP8hlE6iUm2HKM+lsT255Oyd1l17UXKhe7E5wKmohLtjID
         jMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724918923; x=1725523723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4BmdnrzBdhHgzltTkpUo2txI/5MakiYPq5y08PZ3iA=;
        b=eostxq4QaB9IgawlPvQQQO7jbdkhhIypb91hGUCHpPecssMSPp9xDZtENYBDkYrXlE
         GN+e3Zws2oM1c9ETxo/ZTcX3z2W3NBxlPuYpnkX1hpGl8iEeLF2F9E+o0iaJjmOqKPBR
         1skbjJJDot55pvbxNL2JITS5+WDypS4cbOCXZusla2MoQY0p0TK2Kg9bC0K1bjEIiokm
         4vYlS4xpe29DqK12lj9zVBjzZ/pLh+IbSIQtXNtMYbWTZrnsbx7VSVHkXpvDBWe/POcU
         uHK8l4IcxIXFhk4C3PAcYt6K+I1r1Y25udVKjrbLyvIf3knlEtSIzDpnzDgynKPqmkpd
         J34A==
X-Forwarded-Encrypted: i=1; AJvYcCWTas0IXi/GMhIsLUBpb51GlcNs8H9F+Nf+YrddnSiOl/HWZ+uPwEHytEvlVbJOVxps2DfeAimqUzTCIwrLdLmTBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YycrzYm7Ji58fxsUBTg7QPj/GYe8lvlFENTQmwQH4ZUwuRwmH5F
	x3REQ5yIaAyL3sM1tDMAQ936ifMIQinAwMgoWix5z7RrY8k+fQ1zsvK6XR1hIyw=
X-Google-Smtp-Source: AGHT+IFTQjqSKFSw070YjNsOEWLTFMBsy1Rq3X8Pmfp9WqqZRc0GHm4rRo/dmxH9UycESrTXamJ/2A==
X-Received: by 2002:a05:6512:1195:b0:52c:e159:a998 with SMTP id 2adb3069b0e04-5353e57874dmr1271656e87.29.1724918922593;
        Thu, 29 Aug 2024 01:08:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540827759sm86257e87.158.2024.08.29.01.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 01:08:41 -0700 (PDT)
Date: Thu, 29 Aug 2024 11:08:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yangtao Li <frank.li@vivo.com>
Cc: vkoul@kernel.org, kishon@kernel.org, krzk@kernel.org, 
	alim.akhtar@samsung.com, konrad.dybcio@linaro.org, liubo03@inspur.com, robh@kernel.org, 
	yuvaraj.cd@gmail.com, ks.giri@samsung.com, vasanth.a@samsung.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] phy: qualcomm: phy-qcom-apq8064-sata: Convert to
 devm_clk_get_enabled()
Message-ID: <fngnwis5yyf56w3vs424clfuqf6qvaquq4udipqidco7jmr6fx@ijledjmr6apj>
References: <20240822084400.1595426-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822084400.1595426-1-frank.li@vivo.com>

On Thu, Aug 22, 2024 at 02:44:00AM GMT, Yangtao Li wrote:
> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 22 ++++----------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
