Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB8814659B
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720171510; cv=none; b=Fw19gi7EsdwysQz6JZ62+QX6gywBIJL8XTDA1biQL03U3I1Ed4LR+ZZJSpTc6BWU7bFXjZmvoSq0wcojnO6lAG0JA0cpOb6wYG2NNG9onEyTTzNCVXZBMXfYWuvwMbnfkxXQzOn5/1yC2Ru+UADA+MMHw++oYDuBLEmiM5rmp8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720171510; c=relaxed/simple;
	bh=RsoS0nj+ufOSr6mobWuEgTfOl/OfRB0o6jXzCW+rRz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QeBm2SMsBVAxk8+U9NcQ0MUSgLS24inI3ud1evwmT/uI7MvoQd6v4U0N0BX4NqxuVSZyuVglmtWmHjjnzWl+I1LL8c9hnPPZ4filXNZSHnJM/em9K2vpcC57f2UPH1h+3qkqH/407KIT3gAWQVuvxNyu9WVxnJRB7JzN6HY46DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=K6yQtjc6; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="K6yQtjc6"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52e9901f858so96141e87.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Jul 2024 02:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1720171507; x=1720776307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0LofcLSsp7M2vWIlVjbmMUO0qt28mhWGkIFJ9iz04Kg=;
        b=K6yQtjc6jHMDIKD1Iqnb/BTOOHJALAyUzM+0m2dEaVHVGcVYtTO/mAbRW+t4JgYkzL
         gBizruIvLmEeZsvBPzPdmk5zKc+4NPT1/poz79FhzmZEDJ/yte6lJq7NsGMxgQXSr7AS
         JMHa+ZGkQBlb4mAW85fXQczjYsb/8yGLMgD3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720171507; x=1720776307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LofcLSsp7M2vWIlVjbmMUO0qt28mhWGkIFJ9iz04Kg=;
        b=LneZgpsE8EH8DFK3+WiXoLo1ix39A0ixYvq+4f/z++8Q/aX6G9O7xszh3HRFe142AI
         QCgyG8SA9hm3ZtiCOtzgR7fqm8QB9jwVi72EAIEvt50vXzBo4XXxss6aEmd7Jpa/CgFK
         crGI+Wypxd02OCQkOkF8CIaY8HF60bkzV5yCsuR8BazQCdZbMXmsdB89TLuwiUvcYxmm
         rr2S0PkUdHOn4tEQfRcwEGsyl0jFYKYnJ8UaD7kGw0frKHfR7PcJg4mc8EXJ4ykWjq3i
         t/UPXQ5MS3M/DP76AHR6MUOMv2p7PAWdYiVKHT03HU4yDdg7MnDYPwbVpX1tcDYBUghf
         D3dg==
X-Forwarded-Encrypted: i=1; AJvYcCUU4i25JlS3bihgYuVayJXY22F7ICHv4k5cpEmk28wKvlUnKut8MUElekYceESl2/IQrTQngvfmVszDiF2ybOrgNk89rsdPctu6OjcreeQbnsE=
X-Gm-Message-State: AOJu0YwuMO9mrQhcr5VEg4WVSmetfijHxx/zgcMY/QrwbNd53G226TPz
	X1NyJJYmkR+eDGsUAHG0p73pcnmfDm+gDy74ZI/UNbcY4npLcd0omnt5ervjLwU=
X-Google-Smtp-Source: AGHT+IG9WLIjGrPIKZw7awcUYj3mj1cCFYqezpsQI9ScJ9txg2x0yGyZwADoFivFBKIB1nKx/Oq4bQ==
X-Received: by 2002:ac2:46db:0:b0:52c:d805:e8c9 with SMTP id 2adb3069b0e04-52ea0457d19mr2480287e87.0.1720171506765;
        Fri, 05 Jul 2024 02:25:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d509asm53809865e9.8.2024.07.05.02.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:25:06 -0700 (PDT)
Date: Fri, 5 Jul 2024 11:25:04 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Inki Dae <inki.dae@samsung.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [GIT PULL] exynos-drm-next
Message-ID: <Zoe78NeXT8cp72gq@phenom.ffwll.local>
References: <20240703075912.37106-1-inki.dae@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703075912.37106-1-inki.dae@samsung.com>
X-Operating-System: Linux phenom 6.8.9-amd64 

On Wed, Jul 03, 2024 at 04:59:12PM +0900, Inki Dae wrote:
> Hi Dave and Daniel,
>    
>    Just three cleanup patches to Exynos Virtual Display driver
>    for improved management.
> 
> Please kindly let me know if there is any problem.
> 
> Thanks,
> Inki Dae
> 
> 
> The following changes since commit fb625bf6187d97c3cd28d680b14bf80f84207e5a:
> 
>   Merge tag 'drm-habanalabs-next-2024-06-23' of https://github.com/HabanaAI/drivers.accel.habanalabs.kernel into drm-next (2024-06-28 09:41:04 +1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.11
> 
> for you to fetch changes up to 2210093478443cd57cff5950379fec31ee8a5f79:
> 
>   drm/exynos/vidi: convert to struct drm_edid (2024-07-03 13:00:16 +0900)

Pulled, thanks.
-Sima

> 
> ----------------------------------------------------------------
> Some cleanups to Exynos Virtual Display driver
> - Use drm_edid_duplicate() instead of kmemdup().
> - Replace existing EDID handling with struct drm_edid functions
>   for improved management.
> - Keep an allocated raw_edid or NULL and handle fake_edid_info in get_modes().
> 
> ----------------------------------------------------------------
> Inki Dae (1):
>       Merge tag 'exynos-drm-fixes-for-v6.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into exynos-drm-next
> 
> Jani Nikula (4):
>       drm/exynos/vidi: fix memory leak in .get_modes()
>       drm/exynos/vidi: use drm_edid_duplicate()
>       drm/exynos/vidi: simplify fake edid handling
>       drm/exynos/vidi: convert to struct drm_edid
> 
> Krzysztof Kozlowski (1):
>       drm/exynos: dp: drop driver owner initialization
> 
> Marek Szyprowski (1):
>       drm/exynos: hdmi: report safe 640x480 mode as a fallback when no EDID found
> 
>  drivers/gpu/drm/exynos/exynos_dp.c       |  1 -
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 83 ++++++++++++++------------------
>  drivers/gpu/drm/exynos/exynos_hdmi.c     |  7 ++-
>  3 files changed, 42 insertions(+), 49 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
