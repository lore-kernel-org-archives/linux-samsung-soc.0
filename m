Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78484252912
	for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Aug 2025 10:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755340304; cv=none; b=c4iRPRlNWkgJJZ1o5//Dt5SF+/k+upFuO+6zL3AZjj98tORIejuSsaRytgFnsjFzxZ2AwiPHv7lfMOOVUf0/mGTdfp5mJd3pqNU7vocs7+j3psh0asGSCRPEy8nC6Xe/UOxDvVL4Wi9xxuzhNcZsFKTkPW6JVdf4s1HC4Vi0P1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755340304; c=relaxed/simple;
	bh=9q+EdYEF+i9ct0cIBvf4xx15eZEUGANEZ9Pba+20CS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=sX77QIis8KoAoPdohARdkm047CAQtoS8l2pR8TEKHEdDB+drcIl/70SDWeT+fL9ZXLIxi1KMW48wR6diN3INfMZvF4mS82cGPFx7uiJfjTsAzhIqUA0eoUa0FUeJ9wRWjZZZXKmNPxYgBjKa2Om1trG7VeOq7JWz2Ntuy1202gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2tYr16S; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2tYr16S"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b0b2d21so12212495e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Aug 2025 03:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755340301; x=1755945101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e8x7+nGgNL/S9BgtpwRdqXmLHGlwLdc6y+hYTmxtYuY=;
        b=S2tYr16SfPDdCUmR2kCFz2w2XTJkfzIgU7Ut44eDQRy49jD1s/ksSi9KScDk/lNC9K
         wT46OwU+19VC7WT+D3zYNoTalai/2qA/oKoVerYT3A8pQvRTETgdQW162W/RrcO9jQn/
         2sHIary1WBfrO8Y9m0Lw6GUKp896CoZ7yR4ZeX08zpKwWYd4LJ3bsi+uXEYZhDi34FVs
         FS7ZT3DOupTWZdF9G9qGSnV46WYNkuSiWgFahptSQHaO4AoYLPBKizt4irtPJlX7va2d
         zRnREOVeJuWDdWJibPBNoC+/ztNuVm+Gsll1Nyi84BKsrt6xbhv3eVnEuMDJet456iXx
         TR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755340301; x=1755945101;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8x7+nGgNL/S9BgtpwRdqXmLHGlwLdc6y+hYTmxtYuY=;
        b=j6p7/VJ+GdBusZTOmv0ayWprbffbDgvZLF6sXXqt2GplnJ25/7jddhPgaPgpt/5mZy
         mm+VdDc9KmDpkp/x+er7k/82Hg44pwRuRbrhVUEx+FYT4AXaalj7n68b++9JhT4/hoBX
         ctWARIx2FFYi0yGeAwXy4f/k7lgrIeQmMUi1duzDT+6X31imxEBDT4fKCUDZjd4gIpKy
         uGi9NyKKR4CcEz2Nwb5o6B/euSWJd4my3ceeaF7CXYunYKHCEkP/hIv6Vl5yjoHl+U3I
         bHejzg/4qrVk2/QHHdqSCYddIOyNbaLOTVM4hoUsgmLVlDcspwV7PirIlKphPqLETPGq
         qqQA==
X-Forwarded-Encrypted: i=1; AJvYcCXGFbPgWLYpZYwrnxdw6B4pDM2cT70S5kQ7fs0nmCMaA7maZQCp2Gykyx8ZYBKnp/yUG5fOrsKEjPAebxvhBERL1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww1HnAhvgsNFXRkhTCy9HuaPcUvUPWe5v4SeUu1q9JkqEjkujV
	fhHnf4R2NbEltu1INPHSuu9dORC0bqGjNy1z0fZ9LJ40kdtPFPXS8QJzgf4Ix/HXIa8=
X-Gm-Gg: ASbGnctYWKCUVhC8X5cM2Fk/7aCvYA+EyX6Ou2dx6Y5UbiVqlvpdDzJ8qGdqpxRIK86
	6va+KwUSCRCpLYaf8B8tOQXvFH22ZeV7oW6yl24D3ff1aS/391/aA10Y5jBy4OxMTUrVRGPC4t3
	WGIqh3CG//nxbLE9QUSb+lqQivzKSfUEMISnBozEw56hBwbBElLsW1gHiIjR7C1gbKhawat3wjH
	rHB1Kq6Lc1D1YeuRlEmIuOCE+yzRsCqr9cP0FTAUk52+mHKG2QSi3vKn2bm7Yuf8EPpohpSea8F
	rR/1WdxKKMpUCZK8wtAhhxS/+zaAMXU1hMJX52pYEvj4YuOdwHzHuD4sx5HaCFc7Zd0XoJAI/4f
	YAVvoHJxTcF4Ox9bWF6NjyT9Bs7Enc51AARZXcYo2QSw=
X-Google-Smtp-Source: AGHT+IGVWDeZL9smLLF1o3RVvY86c9i6C0MTi35gNvuamk+XUR6fXJiX36W4beKN48vGdOJoWRLrlA==
X-Received: by 2002:a05:600c:1c20:b0:456:1e5a:8879 with SMTP id 5b1f17b1804b1-45a217fbe65mr38114945e9.9.1755340300623;
        Sat, 16 Aug 2025 03:31:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1cc22739sm96669115e9.27.2025.08.16.03.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 03:31:40 -0700 (PDT)
Date: Sat, 16 Aug 2025 13:31:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Damon Ding <damon.ding@rock-chips.com>,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
	sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
	alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
	andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
	l.stach@pengutronix.de, dianders@chromium.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v4 13/13] drm/bridge: analogix_dp: Apply panel_bridge
 helper
Message-ID: <202508161345.sfsLHzY7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814104753.195255-14-damon.ding@rock-chips.com>

Hi Damon,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bridge-analogix_dp-Formalize-the-struct-analogix_dp_device/20250814-185009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250814104753.195255-14-damon.ding%40rock-chips.com
patch subject: [PATCH v4 13/13] drm/bridge: analogix_dp: Apply panel_bridge helper
config: hexagon-randconfig-r072-20250815 (https://download.01.org/0day-ci/archive/20250816/202508161345.sfsLHzY7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508161345.sfsLHzY7-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1595 analogix_dp_bind() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +1595 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

152cce0006abf7e Marek Szyprowski 2020-03-10  1560  int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
152cce0006abf7e Marek Szyprowski 2020-03-10  1561  {
41dc71b87962d41 Damon Ding       2025-08-14  1562  	struct drm_bridge *bridge = &dp->bridge;
152cce0006abf7e Marek Szyprowski 2020-03-10  1563  	int ret;
152cce0006abf7e Marek Szyprowski 2020-03-10  1564  
3424e3a4f844c0a Yakir Yang       2016-03-29  1565  	dp->drm_dev = drm_dev;
3424e3a4f844c0a Yakir Yang       2016-03-29  1566  	dp->encoder = dp->plat_data->encoder;
3424e3a4f844c0a Yakir Yang       2016-03-29  1567  
6cba3fe433415b2 Lyude Paul       2021-04-23  1568  	dp->aux.drm_dev = drm_dev;
0d97ad03f4220ca Tomeu Vizoso     2016-08-24  1569  
0d97ad03f4220ca Tomeu Vizoso     2016-08-24  1570  	ret = drm_dp_aux_register(&dp->aux);
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1571  	if (ret) {
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1572  		DRM_ERROR("failed to register AUX (%d)\n", ret);
c71db051142a74b Damon Ding       2025-03-10  1573  		return ret;
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1574  	}
0d97ad03f4220ca Tomeu Vizoso     2016-08-24  1575  
41dc71b87962d41 Damon Ding       2025-08-14  1576  	bridge->ops = DRM_BRIDGE_OP_DETECT |
41dc71b87962d41 Damon Ding       2025-08-14  1577  		      DRM_BRIDGE_OP_EDID |
41dc71b87962d41 Damon Ding       2025-08-14  1578  		      DRM_BRIDGE_OP_MODES;
41dc71b87962d41 Damon Ding       2025-08-14  1579  	bridge->of_node = dp->dev->of_node;
41dc71b87962d41 Damon Ding       2025-08-14  1580  	bridge->type = DRM_MODE_CONNECTOR_eDP;
41dc71b87962d41 Damon Ding       2025-08-14  1581  	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
41dc71b87962d41 Damon Ding       2025-08-14  1582  	if (ret)
41dc71b87962d41 Damon Ding       2025-08-14  1583  		goto err_unregister_aux;
41dc71b87962d41 Damon Ding       2025-08-14  1584  
41dc71b87962d41 Damon Ding       2025-08-14  1585  	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
3424e3a4f844c0a Yakir Yang       2016-03-29  1586  	if (ret) {
3424e3a4f844c0a Yakir Yang       2016-03-29  1587  		DRM_ERROR("failed to create bridge (%d)\n", ret);
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1588  		goto err_unregister_aux;
3424e3a4f844c0a Yakir Yang       2016-03-29  1589  	}
3424e3a4f844c0a Yakir Yang       2016-03-29  1590  
dbd8040a6d0dedc Damon Ding       2025-08-14  1591  	if (dp->plat_data->panel) {
dbd8040a6d0dedc Damon Ding       2025-08-14  1592  		dp->plat_data->next_bridge = devm_drm_panel_bridge_add(dp->dev,
dbd8040a6d0dedc Damon Ding       2025-08-14  1593  								       dp->plat_data->panel);
dbd8040a6d0dedc Damon Ding       2025-08-14  1594  		if (IS_ERR(dp->plat_data->next_bridge)) {
dbd8040a6d0dedc Damon Ding       2025-08-14 @1595  			ret = PTR_ERR(bridge);

Wrong variable.  s/bridge/dp->plat_data->next_bridge/.

dbd8040a6d0dedc Damon Ding       2025-08-14  1596  			goto err_unregister_aux;
dbd8040a6d0dedc Damon Ding       2025-08-14  1597  		}
dbd8040a6d0dedc Damon Ding       2025-08-14  1598  	}
dbd8040a6d0dedc Damon Ding       2025-08-14  1599  
dbd8040a6d0dedc Damon Ding       2025-08-14  1600  	ret = drm_bridge_attach(dp->encoder, dp->plat_data->next_bridge, bridge,
dbd8040a6d0dedc Damon Ding       2025-08-14  1601  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
dbd8040a6d0dedc Damon Ding       2025-08-14  1602  	if (ret) {
dbd8040a6d0dedc Damon Ding       2025-08-14  1603  		dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
dbd8040a6d0dedc Damon Ding       2025-08-14  1604  		goto err_unregister_aux;
dbd8040a6d0dedc Damon Ding       2025-08-14  1605  	}
dbd8040a6d0dedc Damon Ding       2025-08-14  1606  
152cce0006abf7e Marek Szyprowski 2020-03-10  1607  	return 0;
3424e3a4f844c0a Yakir Yang       2016-03-29  1608  
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1609  err_unregister_aux:
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1610  	drm_dp_aux_unregister(&dp->aux);
f0a8b49c03d22a5 Marek Szyprowski 2016-12-30  1611  
152cce0006abf7e Marek Szyprowski 2020-03-10  1612  	return ret;
3424e3a4f844c0a Yakir Yang       2016-03-29  1613  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

