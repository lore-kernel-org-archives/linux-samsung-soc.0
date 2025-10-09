Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A0F450F2
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 13:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016778; cv=none; b=GFiGvlsrQNLE4wUGHxakap3XedwNFYj6Q5H9BQgPHrDrVk7QmbWzZT+pHm5IMlGyHlFRJ5j1MgLnCt2R+KCYsku+8ABvfFuwRbueG7blPyBD80qmuSXOO+ozQnyC36KpdyXACyWwDVWHm04Ju128jAThj0gqoj4x40fpv9z6pzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016778; c=relaxed/simple;
	bh=6ta58I6Q1aZWuHTt+8vwHZrputBGhleQ9DK0QH2ht9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZZKUThRAkqRk0TB6F4kO3Ozu0IfOvQy5SeuDFFcSy6nBNVQ8EqC31+VnJ4Lu/OCZwJkh2s12mzlZeA/0jKwwHoPbqDUDWgdLLEomuW3kiccj8F6bof0PvpYHpRytlysW3lnKYB+72UHjxFzsMYp6PfrVu2ff48+tMf1YCwIo1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSgjC7lf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSgjC7lf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EHIV012280
	for <linux-samsung-soc@vger.kernel.org>; Thu, 9 Oct 2025 13:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RRr9DsOTbQL+IhH2cQUogvPD
	iLS8DNEDEbNUEWkTRTg=; b=NSgjC7lfbBgTxi4WQX3tdtzkY/WqL0mozpo5s32Z
	E/wukCkntqZq08uD5vOClESI3KnKzb5bsudg3ABvfFY0HOpSRctfklIdnhQTUW45
	MhfWkYbbM102O/ipBVg9zILkwap0aipTxBcPTcPTUOFrRoQRBOKDJ1nSa1KvFcMj
	WyPpeV/dOst/tb/kSGtNjerKKCelofJuz+VsmLKB9JHUclgjriAnvsvR84HbdOPg
	Kfi6UDLynP12r9cZITunI4XKApAChyAmtES3Cy7iMbnL9h7+RSTii5eTrjj9CxWE
	94Xt4f6BGN37Z/Nu27kDJckZyr5bMurQdBo9ytUJNm5mDQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kjyyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 13:32:55 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-54a887b39b2so1861372e0c.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760016774; x=1760621574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRr9DsOTbQL+IhH2cQUogvPDiLS8DNEDEbNUEWkTRTg=;
        b=h4mBxgncYLMDrXuMx6Dn4z3/9oddeX1iXQBUS6WMor+a6xDG2S+drmWONRo0XdpIWA
         JjwrC77FLRUnMyaVOpYejgtxn2JJyYEM/nXZqwYvVNFbuuPXQVH/y259tPL8cuio8+Od
         yfPrN6ko39tAqAsxd0xZXaNDU2EUkb2EsVCklEuPpG0EARrFYMxWMXf6NugTQpJqcuaN
         lkJeHguEUpL66jB9PQiqAwLIe/0Kl9vIMjJFAfK/ufY7esmASEAaqEzYCR8zg6s61yEH
         cAlxqQSfpnrxOh4ABPjcIY6Mnj8kGCJ5xf8+os6l6BIoAwF9URmC/0xE5TmqmAfqiqGd
         Io3A==
X-Forwarded-Encrypted: i=1; AJvYcCWB+e7g0ip4BXOb2avOrHEh7hfu21OBtjYZuckLq0g7CX45VN8pUWVeaDISpzO+22k0f5rflP6mo5tj/y1K3+p+eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjKu0vonlKQQVv+ryJA3S3tUrwLjM0GzNxUn28Nocp9uCCVBkU
	3i+Y/TbDEOAbupiNjfHACH4m57jYIZ+UgdgTb69LP7f15BEbiwc7GUFPaapbLErp8JvOiTRo8U9
	csIrBBFFVZUoRsYHr3pei/QfzFxoECVlRYR2b5qbpysaVN1zTNmDSzE0eIOeHrHGLlQP403EwAw
	==
X-Gm-Gg: ASbGncsqa36NBY5H3HfSob4gN5MOFiimiFqiIZiTNQWRg6X9pywxeWPfyj2rweZ/sxd
	+P3JEgBOMfqLyBNlf/Mv/S+ugNdGCNlC5kDMEdPVUw0SjO1r6GNft28lgIQZ+qKyHUTY3wL3ym+
	+thakLiVzQ514uKsPxFkbrAgLasEQEuws89UZvmePWrJyg04dAXXHU4LfguLDzLjn4hs+fOhKpa
	itb+059AXM1HNwp28DEZAvsV/kuRHEhg1nTRxsgxV4z4EVdDQKF31qxDyqefcqpKIsaM43+C7s8
	4VsGD0NbXl5qkMaGpTjjitvN6VUWe/9g6jmXuGsvut6otTZBJejC2GCnFYZU35U+XmztrFMt3UD
	njowZKGbxEHwgOuXpnjN2VWw1ye9EF1ELsEwUSoWcizdWDG/1zgRJm7B1dQ==
X-Received: by 2002:a05:6122:169a:b0:544:79bd:f937 with SMTP id 71dfb90a1353d-554b8c23f89mr3464557e0c.15.1760016774170;
        Thu, 09 Oct 2025 06:32:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF11oySDBoem7xTkH1oLPUQwPCox0qjhESMy2x1A0tSRyY/Tw898j/talcs/MTKAv8Q9vNTjA==
X-Received: by 2002:a05:6122:169a:b0:544:79bd:f937 with SMTP id 71dfb90a1353d-554b8c23f89mr3464505e0c.15.1760016773679;
        Thu, 09 Oct 2025 06:32:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adb1268sm1047769e87.90.2025.10.09.06.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:32:52 -0700 (PDT)
Date: Thu, 9 Oct 2025 16:32:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/4] drm/client: Add client free callback to unprepare
 fb_helper
Message-ID: <w23s7pc3diq742biiq6sah6lkps6irejtkvcwvyotbaty37hvj@j2nheyk3ir4e>
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-2-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009132006.45834-2-tzimmermann@suse.de>
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e7b987 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=463TWv_Jhf9JylTOhJ4A:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: GTfoRWJb3ffoyl3M4rsGHSDbiW-I3l0T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxka4DR4oaPCS
 in9rWlPdIok/XxdMvy79c33CUq0r9ba4NYtfApiWrL4+HGZ4YXL9LR6tdISI90mG9Pb5mSFYo4O
 StOkPLvHHI9M4UQgXF612i1LzfZPsvBhxDc5b4ihdvOeLPXLwTdCNxjJYBV72XoFdBTS+V+5yls
 8lUT/Ur63V26ZOtbaRpUkVeyhLmbiC4KkKpBrht6nPwqSJtmy0b9gqm9maUqSE1IoeZv5R8YBax
 2lHgW7bjLamgmFfy/SmFBdS3ODWB/csfQjohbyrjuFfioMpZRbLc7HaqxCKV0ZOkU5QT3a45Utu
 bveFz7wi95SkBoi9RHfP5lViwHVGy7nrSBeQOQ6z6fzbfR2ZoHnLQLPmyiND3Pl6RBOEZ/TwI6X
 mj5SWy0ugQHKl8LHleJx8tHlGUWrAg==
X-Proofpoint-ORIG-GUID: GTfoRWJb3ffoyl3M4rsGHSDbiW-I3l0T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 03:16:28PM +0200, Thomas Zimmermann wrote:
> Add free callback to struct drm_client_funcs. Invoke function to
> free the client memory as part of the release process. Implement
> free for fbdev emulation.
> 
> Fbdev emulation allocates and prepares client memory in
> drm_fbdev_client_setup(). The release happens in fb_destroy from
> struct fb_ops. Multiple implementations of this callback exist in
> the various drivers that provide fbdev implementation. Each of them
> needs to follow the implementation details of the fbdev setup code.
> 
> Adding a free callback for the client puts the unprepare and release
> of the fbdev client in a single place.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/armada/armada_fbdev.c      |  2 --
>  drivers/gpu/drm/clients/drm_fbdev_client.c | 17 +++++++++++++++--
>  drivers/gpu/drm/drm_client.c               |  4 ++++
>  drivers/gpu/drm/drm_fbdev_dma.c            |  4 ----
>  drivers/gpu/drm/drm_fbdev_shmem.c          |  2 --
>  drivers/gpu/drm/drm_fbdev_ttm.c            |  2 --
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  2 --
>  drivers/gpu/drm/gma500/fbdev.c             |  3 ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c |  2 --
>  drivers/gpu/drm/msm/msm_fbdev.c            |  2 --

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # core, msm

>  drivers/gpu/drm/omapdrm/omap_fbdev.c       |  2 --
>  drivers/gpu/drm/radeon/radeon_fbdev.c      |  2 --
>  drivers/gpu/drm/tegra/fbdev.c              |  2 --
>  include/drm/drm_client.h                   | 10 ++++++++++
>  14 files changed, 29 insertions(+), 27 deletions(-)
> 

-- 
With best wishes
Dmitry
