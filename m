Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D847E28EA7C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2025 16:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751300801; cv=none; b=THtJjkuDYfndTDUMFLbrA4S3xCem5AG4lgdoTsfFe5IgkPeuQBo0sQv/LhxSmIOx5ty/1PWRsyfvbL5mXA70gfwfGxWU+xrAn0G65qVcN4pulc4rGW7tF6tPOt2lmmOMIm97kxAkP/Hc86oMsL2HIX8XK+HvglFk8PdXiwTXDNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751300801; c=relaxed/simple;
	bh=ZYMR7z5T+7I0DbIT2AphsLI9oq3i24aPeQXV7iyq+7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IY36v3kirFPhCZYhCfbA9pmf6hme28yEvDPfL4kgJaBVVr165zDUs9/hVB2UADFXdkYcn5Q19KMovHVpDG7h7aeWuWonWbrPmGzYwJAT5dcZT9UMTAdztuk/GoffEywa4n+yokjRWPNytosKc4JAoLFPEYza01NAIjRtRHwR4qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OFO0IwV0; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OFO0IwV0"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so4997080a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2025 09:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751300797; x=1751905597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=535W8k9pU5sUVdNwdQXzTxnf8TouFsbPOMvqYlYzbaQ=;
        b=OFO0IwV0VDUks6qHfeiGp1/dKfJCKWcgO6RWOtzyf71T9imsy/Hm5ed1RYAH24S/Ua
         36PyhOXMeqqgmJ1UDvTm2nLjBqt/X9bux4SwYum705Mi/TpWCcx1hTP+L430TxsnOX/x
         YOVEwWqQBzg1+7kAyTrKv4M3BX+nvwLHkMnFQZlUxHxqQ/Hk/NyGOsWLtcaY+3WIH4N6
         Hy+c4A/cErKg0i2kRQnxa73hhiXbVI/iqRLBx7SdsXHXAYXgphVe6c8kTPBqXNm2Z5/A
         tgicq+SED/IdcMFLq4rAe1y6EpWNjeagJ6u63YiNVFBOPhOS4y7bLjrcTYyaHs+B4PYK
         e76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751300797; x=1751905597;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=535W8k9pU5sUVdNwdQXzTxnf8TouFsbPOMvqYlYzbaQ=;
        b=ALLwTkKceN2lk3xEHQc0ugAOZyQIMQfxve5qU500YWBRWzfF8HkCQZlU14stSZdGKi
         lm42u5yC7VGrgvoxdemXxANy0qsPqj7t9kEDx8h0bRF4gY65QPve8BVRNouHb+aUC9pC
         SuQ0dBiy8Svx15GLdbQBCOHQ17Bx9dG4gLrhPs+pVoBWcXcbxYge8aAdaxLdjmyXXuse
         lVNg1Ru22xZiR5YeJTQnOrYnDcdmKq+SLXuTNMdWnJ86mBlT/YF4xfKoh39eVJSLa1aU
         a4dvJYaWJJGy+AXezkgktLgGuOC3KDAbpqoDyMbtYKAvg3mhhU2m1oXNwdtvqifYqH3U
         mWeA==
X-Forwarded-Encrypted: i=1; AJvYcCVYoCSElCdCxAdK2/t+8fNnNdMpUAsIX4kAk3b7rqIFUgKj59+IuNBZ1YJnvDttsd5VsVj2wKGPLRe1+9Bf8ZqOOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9wKc/3hM+dVd1A/aYCo6gnQnvZs5RmRcvtTVL4MkJWebNapXx
	gx55amS0D/mQLa7cI0ygjsU+U73ZRJj9dgrJyL3ux8Pr+s+NpU4kkcfjXTZ6tQPWs9g=
X-Gm-Gg: ASbGncs+CKowm2m3o78gebGQ4kryPLBe8lj3M5AZzkNOic7zv+5Mnylx4ppIppckw+2
	uPTy6GCDhj4CVOKlctIu2rFhjuJCqxLHuX1i8aoCCpqXrdvy7xIdjA42ZEvp4xRu3T1AT2ZuCHG
	ORrbZnlGGxIGHuq5sI2btA3TmMV5/vKy2vVJhJtw9ByK6+nevXTBD3zkbKWMu1lKqo0l1JGep/l
	1jBwX5uGX4mK3hxSrcDuVw7zPpFgke3piaEyur6XWjXS2Fvz4bdLlOPy9NlY8N+2TvVLpFqQWkl
	CB/UpIK3qvmf9aPapxlBNzW1LFamT8R/pg7FQEM8tnsGT/BILQrf/tyqHqbKV6gyJzuTv+EBieA
	ur7Y=
X-Google-Smtp-Source: AGHT+IEZUFYK3OlqCsPYEUjbY6KleNynpLo18SzDo4cGFtE9VgvfMNqI4nas16gqs6EKpGcliuTGQg==
X-Received: by 2002:a17:907:94cc:b0:ad8:8719:f6f3 with SMTP id a640c23a62f3a-ae34fdbbadfmr1268647466b.22.1751300797043;
        Mon, 30 Jun 2025 09:26:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35776d0ebsm685350066b.155.2025.06.30.09.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:26:36 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:26:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shradha Todi <shradha.t@samsung.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-fsd@tesla.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, vkoul@kernel.org, kishon@kernel.org,
	arnd@arndb.de, m.szyprowski@samsung.com, jh80.chung@samsung.com,
	pankaj.dubey@samsung.com, Shradha Todi <shradha.t@samsung.com>
Subject: Re: [PATCH v2 09/10] PCI: exynos: Add support for Tesla FSD SoC
Message-ID: <5ed352de-8319-4e3f-8cce-43a4bb332e66@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625165229.3458-10-shradha.t@samsung.com>

Hi Shradha,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shradha-Todi/PCI-exynos-Remove-unused-MACROs-in-exynos-PCI-file/20250626-104154
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250625165229.3458-10-shradha.t%40samsung.com
patch subject: [PATCH v2 09/10] PCI: exynos: Add support for Tesla FSD SoC
config: um-randconfig-r071-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301329.VWoiH0yn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506301329.VWoiH0yn-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pci-exynos.c:621 exynos_pcie_probe() error: we previously assumed 'pdata->res_ops' could be null (see line 609)
drivers/pci/controller/dwc/pci-exynos.c:655 exynos_pcie_probe() warn: missing error code 'ret'

vim +621 drivers/pci/controller/dwc/pci-exynos.c

b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  595  			dev_err(dev, "couldn't get the register offset for syscon!\n");
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  596  			return ret;
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  597  		}
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  598  	}
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  599  
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  600  	/* External Local Bus interface (ELBI) registers */
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  601  	ep->elbi_base = devm_platform_ioremap_resource_byname(pdev, "elbi");
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  602  	if (IS_ERR(ep->elbi_base))
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  603  		return PTR_ERR(ep->elbi_base);
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  604  
10106d5c1f9cee drivers/pci/controller/dwc/pci-exynos.c Cristian Ciocaltea 2024-12-17  605  	ret = devm_clk_bulk_get_all_enabled(dev, &ep->clks);
6b11143f9344dd dripdata->res_opsvers/pci/controller/dwc/pci-exynos.c Shradha Todi       2024-02-20  606  	if (ret < 0)
6b11143f9344dd drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2024-02-20  607  		return ret;
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  608  
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25 @609  	if (pdata->res_ops && pdata->res_ops->init_regulator) {
                                                                                                    ^^^^^^^^^^^^^^
This code assumes pdata->res_ops can be NULL

ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  610  		ret = ep->pdata->res_ops->init_regulator(ep);
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  611  		if (ret)
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  612  			return ret;
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  613  	}
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  614  
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  615  	ret = samsung_regulator_enable(ep);
3278478084747c drivers/pci/host/pci-exynos.c           Niyas Ahmed S T    2017-02-01  616  	if (ret)
3278478084747c drivers/pci/host/pci-exynos.c           Niyas Ahmed S T    2017-02-01  617  		return ret;
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  618  
b2e6d3055d5545 drivers/pci/dwc/pci-exynos.c            Bjorn Helgaas      2017-02-21  619  	platform_set_drvdata(pdev, ep);
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  620  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25 @621  	if (pdata->res_ops->set_device_mode)
                                                                                                    ^^^^^^^^^^^^^^
But this dereferences it without checking.  Most likely the
NULL check should be removed?

b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  622  		pdata->res_ops->set_device_mode(ep);
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  623  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  624  	switch (ep->pdata->device_mode) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

