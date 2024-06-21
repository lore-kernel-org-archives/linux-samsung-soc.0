Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE00616EB76
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2024 23:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719014242; cv=none; b=doH0h1rV3VFoqK5c+78ZwikNYBOLGr9PH/Z0/swQ85jDnDp/OCpBC/6ohwOK6GoysxDUx0ferEVvGlNq7eFxuIK2vD/Bup574jReNT4v3SCCNrRLisNGwc+uCww5JVlH0yUuj1CDs4OIHWJU07yBlZvoX4Ji+DHy9rkpG3PBnZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719014242; c=relaxed/simple;
	bh=KX1PujVhCoV8MnBjdZUd+F+4LKQJW3MTNIjFLr0gXEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFI7m/WTOwUxQZVFVeDSUyfS57zUBDmRg9wYYXa6ucB7zrf0gJU9uomdbijZXlHSZUxQxbi9j+BgyjLhjlFufElTEtwKitvDKUgUptcILlWTsd3VEmpWUm0k/Lx/MNtMnmGWz/Gr0UjrPAv1r3q4yBYGd7DuYWJvVpx03cK1Yb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hmf2cQr5; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hmf2cQr5"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-375fc24a746so150895ab.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2024 16:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719014239; x=1719619039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y7speCYjhq5KhdxCXThLCw9rUBn42IJVbtj/2ApzxBY=;
        b=hmf2cQr5676UzMrKTZaZJX1EsAUMKfrhY9ecmGIqSrsaiYnkMUhbtJrhuHdxApczmk
         dflt26/MXPrkeUH0BbkPS1fDillGv7FG8KOwV1LR0V0c4FMohxg/Cpsu8UdfxFDvpGUU
         08W81yXpm8tl+RW+O1zCGz78AQGCxvHLmCPt9yir8qyQ+/I85gKgTPmEUphbdN49W/X7
         V0I3GC7VWG3W2iQTZY6ZlLN1MybWfGYtIEg/vte2J2UOR6wCOHVRaBb6Hec/Y+xI60vh
         A0hUturedOkDhcRGI1r+rLh4e3gqhMIRD9Pyr8mS3d1sFFUlR8rEdMCX420HIsXyM0p3
         cQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719014239; x=1719619039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7speCYjhq5KhdxCXThLCw9rUBn42IJVbtj/2ApzxBY=;
        b=VmynyIR9xwM0UE6LbUOo6Wuu86KlwG9iy2cO+IWZqbaVidUT9BSRhHlWjctO1NTTf+
         JA7ZKj3VRmmwfVNhE5Qbjgxk1gmkolRD0UldH3Gu5p3YtNR8mq8elUxxL0IT5OVoVCs7
         DVp+O7dyTCHlXpY3ViU1zXcl43ZwnSG8KHMN47pshJQMSKUkabw6g62GogQwdEyE0ErW
         91BjpX/OyIBG6cRGu+k/8z1i+TvOMS+l+7cU8agq2/Wv+Cej1jh5EJkF3Vs/oB9vDEhi
         YXoARpIiUvyNy+fuETtWnBmhonuQmK81RtquG5KSjm+iOincqkkkAelgi0mTjmWD/2ox
         LmKg==
X-Forwarded-Encrypted: i=1; AJvYcCWLoxphIq8fR1Fab5lES8kc9dZTV42r5zWr+WbO99CpKJlT0v9ioNyM28GYJ8O2duWK/tcDaQUoAnI4w5QJp4sJszTfLBi5/a6x5yG2fjIA3Kk=
X-Gm-Message-State: AOJu0Yxfuq9JUSJ4eracn8sQhdD1NzxjO+QAJEcsgblcmCGDhf9Ye83+
	oenU7vtpBg6tONOhw8PlgBm11NjEXrsvIoAJY5XMvh5rt5G/bKl7z4HM9O2cbQ==
X-Google-Smtp-Source: AGHT+IHOsaE9nO9D4eMKQ/XRoEQaprJMzTKXWCBqJFeFbpuDRNTK/tExVGVOs8dWcboI/E3+maIdtg==
X-Received: by 2002:a05:6e02:de2:b0:376:30e6:5c07 with SMTP id e9e14a558f8ab-3763810585emr723025ab.12.1719014239219;
        Fri, 21 Jun 2024 16:57:19 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9f1e2fe37sm17364975ad.69.2024.06.21.16.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 16:57:18 -0700 (PDT)
Date: Fri, 21 Jun 2024 16:57:15 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: lee@kernel.org, arnd@arndb.de, krzk@kernel.org, alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	saravanak@google.com, semen.protsenko@linaro.org,
	kernel-team@android.com
Subject: Re: [PATCH v3 2/2] soc: samsung: exynos-pmu: update to use
 of_syscon_register_regmap()
Message-ID: <ZnYTW_XnlcWAwx-h@google.com>
References: <20240621115544.1655458-1-peter.griffin@linaro.org>
 <20240621115544.1655458-3-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621115544.1655458-3-peter.griffin@linaro.org>

On 06/21/2024, Peter Griffin wrote:
> For SoCs like gs101 that need a special regmap, register this with
> of_syscon_register_regmap api, so it can be returned by
> syscon_regmap_lookup_by_phandle() and friends.
> 
> For SoCs that don't require a custom regmap, revert back to syscon
> creating the mmio regmap rather than duplicating the logic here.
> 
> exynos_get_pmu_regmap_by_phandle() api is also updated to retrieve
> the regmap via syscon. The exynos_get_pmu_regmap_by_phandle() api
> is kept around until fw_devlink support for syscon property is added
> for the pinctrl-samsung driver that also runs at postcore_initcall
> level.
> 
> All other exynos client drivers can revert back to
> syscon_regmap_lookup_by_phandle().
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

[...]

(Testing details in patch 1)

Thanks,
Will
