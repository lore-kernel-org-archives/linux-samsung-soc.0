Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53611D514E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Jan 2025 03:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737689111; cv=none; b=Rm9QCvo6bjOlBi7U18sVjmMyjnc8ryKTulQigiF2qPStxyg8EO2c0G9E9WMWvvNzEmvB5TnXe5lrF0imQSI0mwwwXwe7qWsi/24VYqyaGklcLnVmjsFlrV6b0osbU9LeNk252e3vINkFMXSsZOO657b2az2XqtGOxmgNAafnBcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737689111; c=relaxed/simple;
	bh=7/SOS7HoIFwX/6lhvUTSOww4LUw/RnVOhKBKWv0uOzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCd2YorswyGW8leqcrKpcNvyL0kCyjny/bPB3hGg5Y2XzmzMiWCoRLJu2PO3Me+LX9wg+g8Caa0Ymel3hAzU05X1hX1MZk63Q1M1ZuSnCN9Dmke5KN5+23CXLvq25fpFYzqhGe0yZDZqHanv5y+q6r9+bCVqr9r8rXT2+Bp19oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KBXt9lEE; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KBXt9lEE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f441791e40so2392015a91.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jan 2025 19:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737689108; x=1738293908; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NZVGarXm8F3wmNaZlX6Uo9ZJAp39A7Hk9H8iGkJJROc=;
        b=KBXt9lEEDX1qM8TX+VH7jnl1qiF5d5ftEFbBOO2MoM7T592VsTequ9zGqnq0xQTLGJ
         xvg/8JFa/J7E06fA1V8+e6nSp2EhHjKM5cp6LCTOPr/SjjVHP15KhiELb8ECkbDw1dPo
         l12Kp4PDK1N1RzUBgvqA2MGAb7isBUmmIfcVx2IVwdtxuE35KgcFyADSIZ3wqKGpAS3a
         zbx2asG8NMgTQAbYa68mkfytpSJN9wrKUEn1h+qO0NGUM9zKXUjCOmAN/VywPVAmmyxp
         RTJDLuDos9gRmKnnlJI24lldPsjZodLHLbl2GegO12z9qzUI2AGCvJD7inX1bUK5tJ7D
         /zMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737689108; x=1738293908;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZVGarXm8F3wmNaZlX6Uo9ZJAp39A7Hk9H8iGkJJROc=;
        b=ZudjBwuBorEngAO+xyBB/+2cb185WCMl9ZvD3duiO9WdU8hTIUR5hnC/wHBQG999+y
         AOmOXybwopa+MEnkGPXkExU3g8JUsdmOUxiDWnBw0ZNiZnyh1f4cseusFMY7odjAaaMR
         +mx4HFRgVoaEgA497c5+9iygibDYpYn2+P0+mxXoljZZhbpgcQAYeNAWMLVtTGVkDLsR
         7MC/8FS4awq2ZDF4him6mf6ROTCN4l410kAzo52DQDlboFTab6oSKQWoMoJ16BF8Y/nU
         /5J+2I7cz8KZlFkiKtMNIW+mvkhfy2Fd6fqV7tHJ1wUD8RdvLBbWTlmxyrWcHQhBAyQg
         Oucw==
X-Forwarded-Encrypted: i=1; AJvYcCXm04yxoQ0Cne61+caPfBuIdqBzMZSlFpR6wg4F2zzemGNweoTJiA91WGqa1hjrFz48UBQoF7/7OPbeBh8fgFsYHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCKQADbOsWm2zCfgYxddoIRIGs5GnaUGVcIRrnHwev3Noob/Zt
	EDw3byePAX1Qe4wOuwy5syOFl6s9SuH8n495MA2ppj1okXj6SWh0nNAGVnA2fXE=
X-Gm-Gg: ASbGnctoocHcIwc8C0LKphQ5gy8wwv2r3snUupbgNcCxIsQY5yJOBabMO9/pKT5Q4Zj
	bPB8KRiH9uyJXDb6Ar6EFd4cglLoPVjjYzQXBKWlKSeOMZJbMKhaHW9b4EIDa6YlJoXQ6eOmsy2
	xfs0njmFFmkMuS+yoC6oNXNH2FVn8aIoLAy5s4ooSSx6iMekP+ZYn52wTzo/gNMXfuhyenpIhCG
	dLrvnywljItCv3qL+VdHX9TcXixQ8kGg1Mi6JS4LahVKIqqvNl1LP+rgztTWipiZ3AWqN05jjq8
	W2ao43E=
X-Google-Smtp-Source: AGHT+IH3EOFfjRy2pHQZCow+ihTX4jvDoolzW8UTSKno/rqcqAGRzh/TvGK8xVaNUiDNlVEdvHjT3Q==
X-Received: by 2002:a17:90b:258b:b0:2ee:f80c:688d with SMTP id 98e67ed59e1d1-2f782d4f168mr39207230a91.25.1737689107809;
        Thu, 23 Jan 2025 19:25:07 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa6acd0sm596795a91.28.2025.01.23.19.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 19:25:07 -0800 (PST)
Date: Fri, 24 Jan 2025 08:55:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	kernel test robot <lkp@intel.com>, stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] cpufreq: s3c64xx: Fix compilation warning
Message-ID: <20250124032502.nj25mu5mko36qjaq@vireshk-i7>
References: <236b227e929e5adc04d1e9e7af6845a46c8e9432.1737525916.git.viresh.kumar@linaro.org>
 <CAJZ5v0gz2WLtwJca5oAgZ23C+UmX18k9fvCbzRAEV6zZL4jiiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0gz2WLtwJca5oAgZ23C+UmX18k9fvCbzRAEV6zZL4jiiQ@mail.gmail.com>

On 23-01-25, 20:48, Rafael J. Wysocki wrote:
> On Wed, Jan 22, 2025 at 7:06 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > The driver generates following warning when regulator support isn't
> > enabled in the kernel. Fix it.
> >
> >    drivers/cpufreq/s3c64xx-cpufreq.c: In function 's3c64xx_cpufreq_set_target':
> > >> drivers/cpufreq/s3c64xx-cpufreq.c:55:22: warning: variable 'old_freq' set but not used [-Wunused-but-set-variable]
> >       55 |         unsigned int old_freq, new_freq;
> >          |                      ^~~~~~~~
> > >> drivers/cpufreq/s3c64xx-cpufreq.c:54:30: warning: variable 'dvfs' set but not used [-Wunused-but-set-variable]
> >       54 |         struct s3c64xx_dvfs *dvfs;
> >          |                              ^~~~
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202501191803.CtfT7b2o-lkp@intel.com/
> > Cc: <stable@vger.kernel.org> # v5.4+
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> > V2: Move s3c64xx_dvfs_table too inside ifdef.
> 
> Applied as 6.14-rc material.

Thanks.

-- 
viresh
