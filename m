Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285D81A4F1A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Sep 2024 14:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727188599; cv=none; b=cOryud1ShQF/CB8n1CLUuJcFFke7qf+yIUr+0CBaPFsABnfbit8ipWliWkSbCJYzWXh9jkFHKZwaLT0N8SK60rBLjLCKUfXoPgZaioIjigu2GehRon7BCp2XLxVJ86ho0bFDnW/gm8W5QZnoR9IYX1rz8opL9OsciA+ACPCzMnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727188599; c=relaxed/simple;
	bh=cLcWPN+PccGT2ROUb0f3XJgZE+53pErMvAAijrqofjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qo17dMUbnGISqFkgQU49vOzwux1PNrSpbHe0sxozfJwe85ZnFLyHpqvVBdPT+j0RxpyHKQS80TTcEQpwlJ/Oj5gg4WKIomBzKMDOApDBT2kba+MceHqSxF6hvaZ/zO7vMceawmt9oyzDiDHrvcBcWrhiAg7sScPPFqkiYiXHNT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fE0x+ley; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fE0x+ley"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374bd0da617so4005740f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Sep 2024 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727188596; x=1727793396; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hsQoCD7nt+kXzq9WRw11BBd3dSUqlfD/BOkGLN3L+0I=;
        b=fE0x+leyuT6P8sWmbJ/YAA0FNayw0C13wT2uFUTbBnku1oQfdig5fGxNtjepx4Qbv+
         f4ZNDyUFYUEPwgZ+07Ij7lxyVep1iMmwMmgoesHTN28Jqs0W5CdZAYNnDlK1Y2SLfBrG
         jWNJc73L2B4v00QOLhPoLC7wxHdrHevIKTc+Vf0+AnjNkoSqwaiTAV6te2j6bTZGSR+V
         dnEX5zOuc+6BgwyTe2uYSdRznY4F7f696cwM+plt/KXbGIDm1+AuZ9ZGzudWcE8hIErU
         I+McKWv+F+ySB1QXKSf86PbiHzmnDzMy1rBN7e2mqpb4yL+5j1Rwly+DW+zQ1mnYWMjf
         Y01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727188596; x=1727793396;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsQoCD7nt+kXzq9WRw11BBd3dSUqlfD/BOkGLN3L+0I=;
        b=k8Pug5gsBzWv6JVZ+pjr/mUOtvZVulJfmeSjs60qxVmpxSsovKy6b/edZF4EDCyV3r
         +6o+i2hy63hwykrlWrImEMcDKgP1Ph3aS05mvXdnC9H806hccuqVyKfSt8rMvc3GT4ZW
         E/hMntYq8BLIB4zBBbqDzzwzmrH57cJdcSwVR/yImSX6IJsmCj+K1MgrL7Z2echjhUjL
         8jpT8Od5eIM6r4tTRoaz1j8x9A1ehFex6KzFZYeGGAJ2FldiMF7I3YpxgI7E9OQdVvlW
         vntruyZRyH4Y2ZBruou4LApgf1VwvKWT2nIbooxhjHTvauzfh0sI3jP5SGPIKvuT0iSb
         U6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUbQigkzVHpLYfAruOr+9osDZbWFbafqCNCXEAQQPHr2M1wjvhp+e/KmetO6pcf3IY5JZM7iIay5mYKUkgusX62Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/JSPVd3OoeLPulNF0fwjvQh3h7OHAtT/BLxDVc5cjXaNaEpw
	HKmyarZrC5kSqASJlNqo7+J7VgQSWxatZGmj+wFI1Hj5fPXR7OTlRARSWShPIQ==
X-Google-Smtp-Source: AGHT+IFN85rvCU/A9zmRJhSH2USWFhIw9IW1vh5sN+JWuThrPkD39MtliW2jnnO6qPRDmIjAZMG5dA==
X-Received: by 2002:a05:6000:151:b0:374:b71f:72c0 with SMTP id ffacd0b85a97d-37a4227805bmr9321610f8f.21.1727188596428;
        Tue, 24 Sep 2024 07:36:36 -0700 (PDT)
Received: from thinkpad ([62.67.186.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc3187a4sm1763135f8f.90.2024.09.24.07.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:36:35 -0700 (PDT)
Date: Tue, 24 Sep 2024 16:36:34 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, kernel@collabora.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] Provide devm_clk_bulk_get_all_enabled() helper
Message-ID: <20240924143634.pqpdsewoqxn3liqi@thinkpad>
References: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>

On Sat, Sep 14, 2024 at 09:04:53PM +0300, Cristian Ciocaltea wrote:
> Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
> clocks") added devm_clk_bulk_get_all_enable() function, but missed to
> return the number of clocks stored in the clk_bulk_data table referenced
> by the clks argument.
> 
> That is required in case there is a need to iterate these clocks later,
> therefore I couldn't see any use case of this parameter and should have
> been simply removed from the function declaration.
> 

Is there an user that currerntly does this?

- Mani

> The first patch in the series provides devm_clk_bulk_get_all_enabled()
> variant, which is consistent with devm_clk_bulk_get_all() in terms of
> the returned value:
> 
>  > 0 if one or more clocks have been stored
>  = 0 if there are no clocks
>  < 0 if an error occurred
> 
> Moreover, the naming is consistent with devm_clk_get_enabled(), i.e. use
> the past form of 'enable'.
> 
> The next two patches switch existing users of devm_clk_get_enable() to
> the new helper - there were only two, as of next-20240913.
> 
> The last patch drops the now obsolete devm_clk_bulk_get_all_enable()
> helper.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (4):
>       clk: Provide devm_clk_bulk_get_all_enabled() helper
>       soc: mediatek: pwrap: Switch to devm_clk_bulk_get_all_enabled()
>       PCI: exynos: Switch to devm_clk_bulk_get_all_enabled()
>       clk: Drop obsolete devm_clk_bulk_get_all_enable() helper
> 
>  drivers/clk/clk-devres.c                | 30 ++++++++++++++++--------------
>  drivers/pci/controller/dwc/pci-exynos.c |  2 +-
>  drivers/soc/mediatek/mtk-pmic-wrap.c    |  4 ++--
>  include/linux/clk.h                     | 12 +++++++-----
>  4 files changed, 26 insertions(+), 22 deletions(-)
> ---
> base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
> change-id: 20240912-clk_bulk_ena_fix-16ba77358ddf
> 

-- 
மணிவண்ணன் சதாசிவம்
