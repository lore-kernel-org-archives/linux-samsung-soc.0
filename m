Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467DD14EC69
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715075023; cv=none; b=EasDA9QOPJhYbiby4iI1xh/L6dp9pwoatFXXyk/EUEKIQ8ETWJ2RZwfAAHCp/aJRUe2T/FqJBFzcoVhwHO5PAlYSXmoDY5SodWkEtnoZZrFSOP9P+PJIsn/US1l1Fc9I+fXgymqf/XIR4ZeCNY3Wua0h+xmye7WBg9fs/ln9hEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715075023; c=relaxed/simple;
	bh=TIxu5CXQag5vSF552a9NObD/7GpXLUkpUNqx8KK1M5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FdyQdnnqAymxA0M3m3yj/9g2XPcDhL0LOBrrAvu2NU+CYTogVew7HY2Y9W2u1V4Yf0OfU6l7rir5HVLLoM3pcuyoZReosV7qmfGeQjZqgo/kR+GaeRFTlR/mPVfbdlIoGxTuUDZrlT5vcAUWzBWKIwsRw6s7iWHCefNj+jMgTpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fbJ6et/U; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fbJ6et/U"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5b215ed1e42so1064128eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2024 02:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715075021; x=1715679821; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WAXawuu5D8QQ2TYYAPKkUCb+rSNneu0ioxRT40xBXrI=;
        b=fbJ6et/U+wc6TnrYH7HV/d2oc2jKp9K1xcbdpOypt0bcip/CRScFoVuuX98CInMHkO
         uitpafeR9ZD0a/+b2jzpe6l/TchfI8hMGwEFib8s/K2NrFUwSsahE303GgB/Spe8gAIO
         /Q87IgDf4Wjtt9ubfcFAXszSvzr6tmY2EW6lvBPopEIOcUDRbnddx8J46+UdkzbxvUql
         DEGmxTIHL65yzLj6/44xW9ukc7lLnu/t+dzAemfTrXufxOa2IsAA3FNDRGTJlZQDF4yJ
         Xn+7dyWjgOIspa7E5FOEKyTq+e2M4XqlitrTJ35q7QjqnoQ8xqjB+WKcbpPZfgabozKH
         tEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715075021; x=1715679821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAXawuu5D8QQ2TYYAPKkUCb+rSNneu0ioxRT40xBXrI=;
        b=ELnf+6DUYuYEnGCr3RcKKjtZvpaAK1MSCYCpqc6DHmHpRNXoKJGpJ4QJkSzTYnf1Jk
         qaOq/o5E1+AhwL2pI4fRLBAoDo7EbmyBcbUr//wWVEVhyexlyPHNUjj7IwG7wP3L8v+Q
         halI1ZTdgPc2qD02k9Umvuea/DNz8gnvbmEsVMD3G2Yd7ELCKcSc0INYsX0AnGFnKoNE
         o4yzPV6XARBs76SliEQOBgUJQtvnPg/jBVcNQUglug7CylGG46t2pqhCfaD2vZ7gnp5f
         PSkzKoDqSBYb7Z/5lk2ajoIrdkp32Kq2c+78aC6+xxMvFOqfyuky3mMVC1wcN3fflDPq
         iwEg==
X-Forwarded-Encrypted: i=1; AJvYcCUE8IW4Lf+qlsLhE1x+l//adEut1EvvSQFfxGiiA/TAPeesIE/QUrl0qkzPMp2GJQLfy6CzySRTBGMA8iFbjnPo59BhyztrQWzU5VcpThd0dVs=
X-Gm-Message-State: AOJu0YyVm1fNcUcK6zWETppD+2Cogvw11JkGmX4DiHo1mVSBZCH+Gks4
	UbdqmlZrkvUpdI/JWB6mP5NadMcXhhFmbQTifq2iNGuXiBU+PjfSLFQtrU33c3N63SqVnZOZmpQ
	gECFMtTvPfZ5Fqyuc1erHlWmK24EfjgTP6iRHgQ==
X-Google-Smtp-Source: AGHT+IEP48wfgx6CdP8hMqXLTcM/sINVEeKxbBEY+Ym2IiGsz9vT7W4IRWdx50FNfNNMTo400zHDOCxwnh6BJm9rM78=
X-Received: by 2002:a4a:5ac1:0:b0:5b1:b8a4:bce4 with SMTP id
 v184-20020a4a5ac1000000b005b1b8a4bce4mr11914180ooa.8.1715075021361; Tue, 07
 May 2024 02:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507055948.34554-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240507055948.34554-1-krzysztof.kozlowski@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 May 2024 10:43:30 +0100
Message-ID: <CADrjBPqp2ZaB0_J-rAZ2+A7BMHjW3o+rYSqMFgpdcbLausqL3g@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: gs101: drop unused HSI2 clock parent data
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 7 May 2024 at 06:59, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Drop static const arrays with HSI2 clocks parent data which are not
> referenced by any clock.  This might cause -Werror=unused-const-variable
> warnings.
>
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Closes: https://lore.kernel.org/all/8bf65df598680f0785c3d6db70acfb9a.sboyd@kernel.org/
> Fixes: 093c290084a4 ("clk: samsung: gs101: add support for cmu_hsi2")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Thanks for the fix! These are actually the cmu_top parents and
shouldn't be defined here. They already have their own definitions in
the cmu_top section.

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

Peter
