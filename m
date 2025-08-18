Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A20F1EFFB4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 00:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755477739; cv=none; b=o42hs9BIKQnhRfAT5qcUzHLfOko/d/CcYymI0Bv2Y8c5NmD5NH6mv0az4V42QW2THFetuqdhwMo79QYFHrX2+5QM0ayi1SCTFB4zpxvd3/DpaLdBVAuZzSTaWiyk8HEhA4GQ7SuJ+QO5PYCOuuqAw4kMaMUE059uSXmlPfu4BJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755477739; c=relaxed/simple;
	bh=bfq0l2jEO0lJYI6LUPTmA4Y1PemWVGgflNXu1DOPuc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qud9r+5cSUSH+UF8NylKNSYIL/uUEuX7Vpbfu/HPHcS0IIdnefUijS0p1jVAktVzJqLHO6ex19Kwz0eMPx7NndY/dyXPyl7elzFdWGQA5NUp7FLUUQrMa9UTdyYY/uE0JlYkZ7mz8MPscdR9TqP50cdinwupUAz3uduhTRzybt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDW5UKnb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDW5UKnb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I0UKo4026944
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 00:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TTIHaooodPnPN/uV4iXuYwFR
	FvxVYdQqEnjkEjkUyXs=; b=MDW5UKnb8wZXu3Rq3kr0ghlak3YhUwLOHMqkBlbb
	gCsLJSXJWev5fu5tMdafOzJ6PVg5cwEvCVpvdP2mqqbfdRkFxtoNHCaRHHYrRJ5M
	RdQ6EdgcgzlogYwr/96OA9d3y4zwCvzug81MFhlaj4vFZxVWdMgpbdps4ZD23+rt
	0FvPy3nCf4uZmk2vGaU94TXPtqJybKfKuRP8PV+/nv9jLL30eVT4hwXKMDiYx/yK
	Cfy/B6ZXYhgSUJBGutqr4qSc7ywUuCSKIyA4xEza+qHK/jOZC1U9PT7qBr3c4pVX
	tWCcFfN03QP+rg8PISsy8Oyr6idoFYJns/Cdiib1PnfPOg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh072ugf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 00:42:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a9f654571so93191216d6.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Aug 2025 17:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755477733; x=1756082533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTIHaooodPnPN/uV4iXuYwFRFvxVYdQqEnjkEjkUyXs=;
        b=LTsfucTYJOksKKVUOtiSfAhwx/sUR7TUJbMvj24dmmWHDiQx6/m8nu1IgLA0MPm+Mv
         Jj1uml2JRBYDKEGy11CaA6A237pK4wpEeQj/JN2nnBHfxNBmDvECCLPWSgGGIrg6LPS8
         4aQOy9whv1gsACmBoMnWNKDuRnhvxOLpGo2Y86X9uHSN0dLx5hAlg4lNIhw7AKics2bb
         UothRGoxpRsSUaTZlxhYQSXnB2LELjmAlLEeCr0bm0Nw7kbk2Oy9SZc8lD8XGNVD0NIz
         BH71Q4aQRsLus6lroiJhYz7ZI3uE0+0NNU3Dk2tcsICQIHTzm/01UI69bBaUbzNSVRo6
         aZ8w==
X-Forwarded-Encrypted: i=1; AJvYcCXuS5NVo/aR1/vikW7hSZ0yqIVqB/3loHDZ1pAqFU3T3rQFKx0SPfGa90ebG6gVd/hEK6ZvRERM9FplBAm8ACjiFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiBoiWSB7NQUkkp/gBE8EOMi6f2U3cvMncv66kFqfj+H3O6Fa5
	LjrWVuAH3I8f//P/lQc/8HLgZCzhp+FhMy9KciCuDP2H3oQDChXP0k724UycO9PBkGM+LK3PvfP
	uN+PMRuoyPjBlejahIeZiBX1eE55Gt7OhW51tU/hJCiKi+3TRL/QzBdtxlNn+XnHktabYkOmXdQ
	==
X-Gm-Gg: ASbGncv7dTHa2RlAPzycp+xntIRk40kEJ6o/TpRvuLEMupEsAlumO+Rl1SN8CDyWNi9
	WF7HZTqogVUbW6YMPiVDvKv9yj+xBwI3CkzetL2cL+v1/sRNS71DW2sFH6d4wunGnsV8chP3cgS
	5RkU5o9/t+jkgfOHKfBpr3IEwXgyQFC8C1aytP+iPBp9W2Uv1dyQ940XHTnX+S82Bh2DP7CTBPJ
	kB9c9DySKmCCKyP70AgOF+ZZtTBoqZ2ac/Z9XRAi3EY2CHVfwEdqHf4F1hzm+fIQuULR9zMGeVq
	eShaW49YTbmnMv2mCM/x+9Zp+PLTypGjzusgLkwnqOKwXef2U7ZBO8HsXRyUH52LWVGndzVFZiI
	ZrghnyfNxfbFJPKMoVduQDfSWGsSjABIr0tzHHGD3n+RDMGWj8k+f
X-Received: by 2002:ad4:5c42:0:b0:709:b6bc:f6f4 with SMTP id 6a1803df08f44-70ba7bf7612mr120609006d6.32.1755477733398;
        Sun, 17 Aug 2025 17:42:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaOFAA4xzAEpkq1pbcegEcpv96JKuWHG5xRULfd/dnlRxyzciJwghtw+nPoI3WDSgIvg3ZsQ==
X-Received: by 2002:ad4:5c42:0:b0:709:b6bc:f6f4 with SMTP id 6a1803df08f44-70ba7bf7612mr120608736d6.32.1755477732843;
        Sun, 17 Aug 2025 17:42:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a604690sm15654081fa.41.2025.08.17.17.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 17:42:10 -0700 (PDT)
Date: Mon, 18 Aug 2025 03:42:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Henrik Grimler <henrik@grimler.se>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
        linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
Subject: Re: [PATCH v2 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
Message-ID: <r2u2odrkzfezohq44nh4jw6oj23j46gohuzsh6k7jpwnzojxqk@vdus4jj5lv7x>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
 <20250724-exynos4-sii9234-driver-v2-3-faee244f1d40@grimler.se>
 <ldhyfuczwtwydwnvno4xn6ppjtt7mtcj35fp52xrqaajtfbtpb@2pgkytczb5k5>
 <20250808095259.GA31443@grimfrac.localdomain>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808095259.GA31443@grimfrac.localdomain>
X-Proofpoint-ORIG-GUID: Q80RXEDsCuI-ucmIEjABzmiVWBgFP3ea
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfXwynaq82RWACJ
 7rghbDcsp6d+AArALBKjN1dthiKv9snq3AmewtaOLD4Xx4v1vhPGWTCntDYacRCtdbQZfyuoOcf
 Oq5Mt5j4uTlnAblfZqMvlY2OjwIQht1mZg+fHeePdlqeHqEHhbxhzVFgFVhk6wXW/K4irVZko7T
 4LB+WfHA9Snu+2mOcz6d+QAlMXjxzVWoCAWr84580ZO1iOm3Y8FnKQKhHxNsa1m0sCZsm6c1y1t
 dgWvJlEUSDrA0c2i7Xn4rEAB+e5Ocr3JpLt4W5or+V2z8M3YsFmgyY+wfQEXYh6TkPuqtSeUuRa
 cyShifQNnw3rMPE70IA3EeRQJk3DlgBoqF7ZBv1gLhwwoGVvD2Ewg2qto/0LoWVtQhNxwm5+Xlw
 Y0/Ex+Ff
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a276e6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=ZUfLXKp3AAAA:8 a=QyXUC8HyAAAA:8 a=zbyRAtfhQp2mi0id9n0A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=RYC_AntYK8rCuVhA8xHq:22
X-Proofpoint-GUID: Q80RXEDsCuI-ucmIEjABzmiVWBgFP3ea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-17_10,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

On Fri, Aug 08, 2025 at 11:52:59AM +0200, Henrik Grimler wrote:
> Hi Dmitry,
> 
> On Sun, Jul 27, 2025 at 08:07:37PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jul 24, 2025 at 08:50:53PM +0200, Henrik Grimler wrote:
> > > To use MHL we currently need the MHL chip to be permanently on, which
> > > consumes unnecessary power. Let's use extcon attached to MUIC to enable
> > > the MHL chip only if it detects an MHL cable.
> > 
> > Does HPD GPIO reflect the correct state of the cable?
> 
> Yes, the HPD gpio pin changes state from low to high when a mhl cable is
> connected:
> 
> $ sudo cat /sys/kernel/debug/gpio|grep gpio-755
>  gpio-755 (                    |hpd                 ) in  lo IRQ
> $ sudo cat /sys/kernel/debug/gpio|grep gpio-755
>  gpio-755 (                    |hpd                 ) in  hi IRQ
> 
> so that is described correctly.
> 

Ack.

> 
> and in captured trace I see that on cable connect we get an irq that
> is handled through:
> 1. max77693_muic_irq_handler
> 2. max77693_muic_irq_work
> 3. max77693_muic_adc_handler
> 4. sii9234_extcon_notifier
> 5. sii9234_extcon_work
> 6. sii9234_cable_in
> 7. hdmi_irq_thread
> 
> Raw captured trace dat file can be found here:
> https://grimler.se/files/sii9234-mhl-connect-trace.dat
> 
> Maybe you were asking for some other type of order of events log
> though, please let me know if I misunderstand.
> 
> > Should the sii9234 signal to Exynos HDMI that the link is established?
> 
> Maybe.. Sorry, I do not know enough about extcon and drm yet. I assume
> you mean through drm_helper_hpd_irq_event() and
> drm_bridge_hpd_notify(), I will experiment a bit and add it to the
> driver and see if this improves it.

If you are getting the HDMI IRQ event, then I'd suggest checking that
you are actually getting the 'plugged' event, etc. I was worried that
you are hijacking the DRM chain. But if you are getting hotplug events,
then it's fine (and most likely correct).

> 
> There is currently (as I wrote to Marek Szyprowski in a response in
> v1) an issue where device screen stops working if cable is connected
> when device screen is off, maybe proper notification would help..
> 
> > > Signed-off-by: Henrik Grimler <henrik@grimler.se>
> > > ---
> > > v2: add dependency on extcon. Issue reported by kernel test robot
> > >     <lkp@intel.com>
> > > ---
> > >  drivers/gpu/drm/bridge/Kconfig   |  1 +
> > >  drivers/gpu/drm/bridge/sii9234.c | 89 ++++++++++++++++++++++++++++++++++++++--
> > >  2 files changed, 87 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > > index b9e0ca85226a603a24f90c6879d1499f824060cb..f18a083f6e1c6fe40bde5e65a1548acc61a162ae 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -303,6 +303,7 @@ config DRM_SII902X
> > >  config DRM_SII9234
> > >  	tristate "Silicon Image SII9234 HDMI/MHL bridge"
> > >  	depends on OF
> > > +	select EXTCON
> > 
> > Either this or 'depends on EXTCON || !EXTCON'
> 
> Feels like depends is a better description so will change to it,
> thanks!
> 
> Best regards,
> Henrik Grimler
> 
> > >  	help
> > >  	  Say Y here if you want support for the MHL interface.
> > >  	  It is an I2C driver, that detects connection of MHL bridge
> > 
> > -- 
> > With best wishes
> > Dmitry
> > 

-- 
With best wishes
Dmitry
