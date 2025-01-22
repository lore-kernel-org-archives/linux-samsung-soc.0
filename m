Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032C81B4F3E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jan 2025 06:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737529120; cv=none; b=Ulhph/oG8HuG2bHx4lLXm4+YpYRD/ySNVOxW59Htz3J7+1zRnQXJU1MfeKram1Uj/1zgTE9v1p4+n4xsUrvsWxXFzd6OzaqETkJUWa8H8ya7AYgTi9m0NJnKibNqEcKAyYraWeLlhdRoxv2RKCjyJG8tB503667Y6570OCkCP1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737529120; c=relaxed/simple;
	bh=9oSExSdoybPi+Uw9osvbFjCTKI2I/ihwNaxi67HaoBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIE6Ii9y9P7sdVQf4RHIcuFM+3n4c/sKGpgmGBSjr+PqHlTJ+BW1FokQUqyAbOUUVcc98itnzI8/t9mYypl0DiqslBwqEtu1D/6QQX8s/vWvEFLj077TLCCAntQohqeVVGSzgf8Qp5bvuICnlmTQ1ivNzDwZL5n12QU6U2UwrFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bAaO/DVT; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bAaO/DVT"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21644aca3a0so147003625ad.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 22:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737529117; x=1738133917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=98nwCRYv2SeYsyOZNSoNm6lFlX/EwFYW68/vkffV1uA=;
        b=bAaO/DVTNOWNYGUUmNgOq0nEU8mDdv4D6wyhRLjfKaA0D19ZNnBthCl+fpfVF6rGlZ
         D0B7LHW3IvwR37R1fifXG/tWHLEwqcou941pjUCOcy17P+/7LQjwiQQssXhET4zA9GId
         cTDMjrdBx+9xJgb0QFk2Ovn7TbaVZ3PqPoMO9HeJHr2PgYoA1tv13KI3aHYnHSXSiTmm
         pKH6mup9NNe3AuTSS2JWJG0rjVpl7zWvS7lIe5hddub5ct3Nx7MyApPES6nyvxlBWVMz
         TxaCxBBcEM+nzK/kftP+BWnasLrHgnLrPgljB2w/maULEJ6mbnvY6sx+rOU9dN1kWyl+
         9SpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737529117; x=1738133917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98nwCRYv2SeYsyOZNSoNm6lFlX/EwFYW68/vkffV1uA=;
        b=aKKcX9gFjxcvhDmGgshKcyaOG8H/kmdz2w4/uNXj3v8zMNG5MDDz/a8Gt8Van3FJET
         ngp2Q6MSn0NF0qRpxXPGOKiJ9IM5+grRfmnrQuUzamiFB5C2E0dvtgwx1Xcdqz6yCbXA
         YKeFJNWr7onD3mTEVfScR2ix4izYN2BJQuhjeR+f3VDmfZk4+URX8nMZN3gQXoR8s6w8
         se7s7aUTK/J3kL2O+DyJpDFJlCQQ8rFKBLAgsR9rgNc8uUa3RGebVb+v/SpRyq7Q+N/M
         3bcyPtmRXZzkvK1oUyOIa7dktq/Z96BfjWXLF+5b7TZycqRgikX5HCvWGGJG4IjWFpcv
         TQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxQ8+ZutmxUwQrsbPiO523ef75lhOil5bSuf7YSgX44w5bMpqeD6r7W6Te2q9LVnemYhRjG0c1czctaIqC6Y1Ifg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yydn5nIUO/itjYde892j2JTE4q32g8C/h4ln60eqIgYIAuf78YK
	sDIDJbDCdFGgTvI7z59r5PXMgXqNMsKBIh6ERX4NtU72hDVBwD5w72SS1A5TKC8=
X-Gm-Gg: ASbGnctkQDWq66GFUxvJYBKzXaFinu8g2YbSMOrHRxkz0344ahK3+vDHBqda3CuVdG0
	R2O+FPMbCIOsZqLxZ/NVc0ybdcyFhZlQiUh0KueeI7xS12UBxB3JCJxOUC+3KqEw5wMDHgxPqki
	mN4XRMGc8nOOKd+r1qgVFZxyCiDegJ1NldVcONhlr9saXjAMqWN2miOgs3KBJzBUU/JQEnAi3SQ
	HgJ3jQZGoO3NWHxNXLwIlFi7iL6QpP4NgphZQuBW2JNj4MHrtZ4xxD4SJhKU+1zmPusxDwO
X-Google-Smtp-Source: AGHT+IFlyQTrbWJ70KA4F7+yV/Afg3zlHDmPMltEFy0yFNqRhEfo+qrlLDzqJAfprSQh6gV4oL8egQ==
X-Received: by 2002:a05:6a20:9144:b0:1e1:a9dd:5a58 with SMTP id adf61e73a8af0-1eb215ec11cmr37960260637.30.1737529117262;
        Tue, 21 Jan 2025 22:58:37 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9b9b1esm10519029b3a.99.2025.01.21.22.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 22:58:36 -0800 (PST)
Date: Wed, 22 Jan 2025 12:28:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: s3c64xx: hide unused variable
Message-ID: <20250122065834.c4va6uwjrfny2mfv@vireshk-i7>
References: <20250122065216.1371158-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122065216.1371158-1-arnd@kernel.org>

On 22-01-25, 07:52, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A previous compiler warning fix extended an #ifdef block, but that
> led to another warning in some builds:
> 
> drivers/cpufreq/s3c64xx-cpufreq.c:27:28: error: 's3c64xx_dvfs_table' defined but not used [-Werror=unused-variable]
>    27 | static struct s3c64xx_dvfs s3c64xx_dvfs_table[] = {
> 
> Add yet another #ifdef check around that variable.
> 
> Fixes: 76b218721e5f ("cpufreq: s3c64xx: Fix compilation warning")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

I too have sent a fix this morning:
236b227e929e5adc04d1e9e7af6845a46c8e9432.1737525916.git.viresh.kumar@linaro.org

> I wonder if the driver should instead depend on CONFIG_REGULATOR
> and drop the #ifdef checks.

The way CONFIG_REGULATOR is used in the driver, it seems like it can
be used without regulators too. The initial commit also confirms this.

commit b3748ddd80569ec753f62e709629b8c639143222
Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date:   Mon Jun 15 11:23:20 2009 +0100

    [ARM] S3C64XX: Initial support for DVFS

    This patch provides initial support for CPU frequency scaling on the
    Samsung S3C ARM processors. Currently only S3C6410 processors are
    supported, though addition of another data table with supported clock
    rates should be sufficient to enable support for further CPUs.

    Use the regulator framework to provide optional support for DVFS in
    the S3C cpufreq driver. When a software controllable regulator is
    configured the driver will use it to lower the supply voltage when
    running at a lower frequency, giving improved power savings.

    When regulator support is disabled or no regulator can be obtained
    for VDDARM the driver will fall back to scaling only the frequency.

    Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
    Signed-off-by: Ben Dooks <ben-linux@fluff.org>

-- 
viresh
