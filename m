Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55248158858
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Apr 2024 20:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712695296; cv=none; b=PfJyYVB4j6n/BE09YAwjY11Xy7BAAUODopAZdzlEuFvwflu6pG7W1P+EIlPgt+OYYpQ20uy/47MPrP4tPlKSPlWp2+jqTBsK+UfuQ0DV1EgHHIoSUYcE79lAK5TPDw+NkYEV8bnKvTS2fwfttjAeLLTUaPLAHub1eVtEh3oEtIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712695296; c=relaxed/simple;
	bh=wY3Tsys7No0fWkG23G2qBuXiDPpIozc4aciGCS5wmRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gn3X8wy3wSjjrQBYM0/H0JfIdh8fs6lEKlQbLmATpt7fX8WYaWIN0EadmWaoTatoVpTYEjrj2ztPLCliEaLvIhIXU0NPRLZ01V9cONqQJKzSLg6u8phqsalBGj54U6NjMUXFUG8eO8dHNv4bC1dtpec0+w0q+0e3cqUKfinwBy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=raknCfZu; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="raknCfZu"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e42a6158d5so12825ad.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2024 13:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712695294; x=1713300094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aBPjFQ8hMYlMnU6esFGPlUb9Zp07ztNfKHIa+vIGGrw=;
        b=raknCfZutyJ2aQjqu+natmuMmUa/Ps8jcdXRTZ5fNGzedj9Js1wpwPNDGniOfLpg8J
         GYXOrVFqP3DKFctIPHtLtahFJlRqva2kf/ZaMK8AzZjUhfGM4LWyOQEMd1buzz3FKYf2
         5Bg5IJi00dHTKOSXx3J9Oh+gEf0LdA7kGgmdOfNODaA9tfi9VOzMdRPdP9Gm8s1oeiw6
         Zz3vZBPmNUQASeT728Mkq4VjhLSOyA7s9uHZqIRHmaVI5JMwx4wXbDV2b7p9Ah1Bla9E
         iL2x0irOqvFygnCnn4C4Glx/OC2XFiIKjTl4UfRsKRQT+R8fyPxgvzI1ieknPCBCm5Qc
         Vk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712695294; x=1713300094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBPjFQ8hMYlMnU6esFGPlUb9Zp07ztNfKHIa+vIGGrw=;
        b=UgQgCctwZt1tHIH8kNW7iYW+1ePYrC8pNBkmHhlaFJPrAeIMWIzw/Iocv8tNYshx5g
         rFPw0GfGuUYfdqTHyGTorfKItPiyaJnpwGMR8QGKG7F7zYXZseuTRDqrkLjZsrZnKQPt
         wW0JJh6h42As4YvfdmMoE8+gkeyUSq70cQSt2IgYNr4YiUqHDzeG0OOVIbXnMvXwsf5T
         WM05EXMeiXF/tZPw7pxUaOp8+2iLPDBxmMgCJDGTkoMDM52qd8mRqJEaRc42pJFGHOFA
         4HT19XAL6zMqoaxLi5A6tXCql1FWuFz01+AKQ7GZQg+DHlkcIGyBR0TFxaykwEMBJzdl
         y/Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXynGBQ0NiM6Jy25HXeaNG5Da7rv4jO5NcGFHn5gNBLlyJdxWwDIRZxsZhgBXd1EVG1JGXBnWUFtqHTCau0j8c0Fbwwtga5Ezn0yTbXzaxRCUI=
X-Gm-Message-State: AOJu0YzZyZA3h9DAdJ90vzhnx2BUFdKy9QS26CHvf6R91VCalDNieLLl
	4u68SQvz0mRD1Z90GSV5a06q1iM78Yj7c0wO02WtQf2lfoiplUAzPaZf+NIKbA==
X-Google-Smtp-Source: AGHT+IGWleD6b0XLIiDlZ3DPfoEnHis9+A23HCbPUKH0mt9fVcwSxprCA8POCPYBt+97qwpMM8ZBaA==
X-Received: by 2002:a17:902:e842:b0:1e2:3991:9e9 with SMTP id t2-20020a170902e84200b001e2399109e9mr63681plg.0.1712695294230;
        Tue, 09 Apr 2024 13:41:34 -0700 (PDT)
Received: from google.com (201.215.168.34.bc.googleusercontent.com. [34.168.215.201])
        by smtp.gmail.com with ESMTPSA id ja21-20020a170902efd500b001e0da190a07sm9346560plb.167.2024.04.09.13.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 13:41:33 -0700 (PDT)
Date: Tue, 9 Apr 2024 13:41:30 -0700
From: William McVicker <willmcvicker@google.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Peter Griffin <peter.griffin@linaro.org>, andre.draszik@linaro.org,
	tudor.ambarus@linaro.org, kernel-team@android.com,
	linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] scsi: ufs: exynos: Support module autoloading
Message-ID: <ZhWn-jKhqSihx8qA@google.com>
References: <20240409202203.1308163-1-willmcvicker@google.com>
 <d9c5524c-afd6-40bc-bf63-10df87bcd952@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9c5524c-afd6-40bc-bf63-10df87bcd952@linaro.org>

On 04/09/2024, Krzysztof Kozlowski wrote:
> On 09/04/2024 22:22, Will McVicker wrote:
> > Export the module alias information using the MODULE_DEVICE_TABLE()
> > macro in order to support auto-loading this module for devices that
> > support it.
> > 
> > $ modinfo -F alias out/linux/drivers/ufs/host/ufs-exynos.ko
> > of:N*T*Ctesla,fsd-ufsC*
> > of:N*T*Ctesla,fsd-ufs
> > of:N*T*Csamsung,exynosautov9-ufs-vhC*
> > of:N*T*Csamsung,exynosautov9-ufs-vh
> > of:N*T*Csamsung,exynosautov9-ufsC*
> > of:N*T*Csamsung,exynosautov9-ufs
> > of:N*T*Csamsung,exynos7-ufsC*
> > of:N*T*Csamsung,exynos7-ufs
> 
> That part is redundant, you just copied result of of_device_id. No need
> to resend just for this.

Well the point of including this snippet is to show that it's working.
Without this patch, `modinfo -F alias ufs-exynos.ko` doesn't return
anything. I'm fine with not including it either way though.

Thanks,
Will

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 
