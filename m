Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F62D2F5A13
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760105441; cv=none; b=MBnhbs5nvUrL1OeFT8qUk+Av+sWtOMZHfcQ7O2F4ejDs9hQLaHVkSFjl3WpBs5ydLXez1Ng/3dOrI80WUMp4q4S94krEC8CoLVUo9aKLl+fYnFHBeCMRkRU4zJ8toAqwcnRndv8W2OqMSIwY+gjsj2iZdJJX6lUtHy/v3jnS/3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760105441; c=relaxed/simple;
	bh=BVqR6BSVlRCmZYhYYZFBvrAOLZNktKtRyNOjkZoSw50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfFkc51KrbBguCLTWh75TK2k0z2r7mVj9ZU07e6CSX9npzukEKy7nUeadmRYYamNGB3M0Cz26iKDYq10OBFNfEW8qHcgpytGMUgAQNs2cr48DsP2lrbHIw8fzrJBjGnlwTeosb/JB2z2LLRMWXLp9C7qmD6nrMOYrot8Azi2OBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtCKZR/M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtCKZR/M"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6WguF002283
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 14:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7wkzrxKudGSviXsY/mtwV95A
	pO2/F8bqxrMw6rKRUQs=; b=YtCKZR/MKHgtOZi6vcOxpQ3qKxJqn0UgdFTNCXsI
	sJVqDaRakSag7bU65LgFJK+ZEtLghWpshoZQpGdcZbfU69ysSXSVY6nMYoup7qmn
	/S69nHAvpHOe+A8qTrFDRHds8Q2JVhmmPdI4LK7R7iLVuFXUhxD0dtlC2opfsn6f
	CiCfBvQ5lcF+SNXOiycOUAV0cDzWQGeUdCd1qpJ6PjWBMQVSLtJ1NZBmDu+ihbeB
	2JvToGRINChtwlpNekLtlqubx4oYd1oDeBN5FvHJ02rIK8AadmMX7M1YJz9aigBp
	U9tuzgu13YAiJua6n3sRGlt4YTW02NVsgH9Hf0qjdcTaJg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49pgdsu402-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 14:10:37 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-43fb0e63b9fso4477732b6e.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 07:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760105437; x=1760710237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wkzrxKudGSviXsY/mtwV95ApO2/F8bqxrMw6rKRUQs=;
        b=QKACRFVzyrQWv54ymiLMjJOqM3bhLl15j3m/CDHbr8RiaEoR+MhgvRnLEjm2oBzxJO
         +9D0Seq6J6bcBf/nnJxetUpbuKJUhlop5nY7KtSbAjipp+rBQgObSmHd9KZtjKYZy7Do
         wJq+6lthrwpYdR8CI5RCWzHogfSG/B+Dpxgt897zhgcs76/UGIEwbroNKoJ7/EMGULNt
         4T2mCUGwunZHIdh+PYYhd3TeKpiuOqiZaTbDR4MFisp4OsEDjqm057C9tKI2pMF3Hyjg
         qziGwvt0erko70CDIQ/CEo7XpDwoKIEdgYy7llgPHpsImP10nkQJc28ssRNSkROSUZWE
         LhvA==
X-Forwarded-Encrypted: i=1; AJvYcCWYmni6YAnDXoBSoCBQFEpjww577pDWOvFqk8XS6er0TMyCOc7c8Lp1G699Cz+kEdIoEpGcUkiEsmGYNLwokToQhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5t/PZ/iWTYiciiTNzc7mg6ZHwBIY5NbLFEHaGZA/HgpB5dIi3
	nwClTy3kLa4CG5JSJqJayyobqzAhyZ45OJe1Xv41jzknijUpikR+e0kG5i5uidjiCgRmA6rP/ph
	va7+r4QoIq73WugSVvEelSy6L+zEmplccvZEk4DeRDDDRx0lRmLtbjuqsA0uFoQ7V4FEMdyj/xA
	==
X-Gm-Gg: ASbGnctPi44tkJ5YZoW8rdW5+u1NSpig66FVethBFmwHHMxeuu8z7D1Lim5CgyYh2RP
	RAUvdl+2yArt4iCCjemnn2I6QKsiP98XTDojOeDyE4XkcdH7xCdjxP6x18qqbCcSU98iZDEPrx0
	TMqlIPIS6GytzF/Jv/+MYt/LCd+MBCik2u+YcOSb9i1ztVbS1e7DKlEkp3HCPI5yV+X1cAZcydR
	fcs/TPoV9C8NGaBSadXPtCSTcGkVyWpre4A8FK1KiagfsPodASwsDeHc3SdXzE6vkrzC0P08IUX
	UyNrnHwoUrG7Zg22TXe9/LA66SNuRGkxkR9zCbMD8zNFu6yKgiw0l733kZd2sRRx8g0dR+wyIUb
	GuIOARQsf1zgnp4rdA2HniQ6bf0RDYl24UWQ1zrK4A9N22T7JDVcG
X-Received: by 2002:a05:6a20:12cc:b0:2ff:3752:8375 with SMTP id adf61e73a8af0-32da845f843mr16839559637.45.1760104966498;
        Fri, 10 Oct 2025 07:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx6lmwhdGB5tiz/Bc58mePgSBZ2wqdgFCoifjtltdKT0RsIy6in4D98ACg4FIrT0oC09J4cw==
X-Received: by 2002:a05:6a20:12cc:b0:2ff:3752:8375 with SMTP id adf61e73a8af0-32da845f843mr16839190637.45.1760104964177;
        Fri, 10 Oct 2025 07:02:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4de3sm909304e87.1.2025.10.10.07.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 07:02:41 -0700 (PDT)
Date: Fri, 10 Oct 2025 17:02:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
Message-ID: <dkblceiweall37j4anpgkumizxc5zni3axnxb5hyokv2jlsta5@immpjaczktnh>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-12-damon.ding@rock-chips.com>
 <20251001180922.6bbe42ac@booty>
 <a42ebdca-1cbc-498c-b859-336557823f26@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a42ebdca-1cbc-498c-b859-336557823f26@rock-chips.com>
X-Proofpoint-ORIG-GUID: TEIedl0A0QRYumBinzP2jk5xjiRwzo57
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA5OCBTYWx0ZWRfX7+xFYKmgIKaB
 8Sz5LiLhZP8HEwmt/T9InsfQL+BcJb7r5ESQglY8lBKeu/aKu7fybKNJWcbm8ZHkG0rrTOueve9
 wRZAgEs/T9umsq3mdt3ipkJaN/Fhj+568PFxRLRjDr8L/sxWzt6mxw3kRuV6yYup8G7gMZA2YWB
 z9aSg9tsNn2iNlZcZ5jvA/0pLGGKECR8IChcKIMuJ1JndZkk0sxkXBN8FXamwQFh4b5K95sEUQ1
 0kThA7uaOJhJ3Icm7jk5m9EFsUJszFmwXaf/2D7D2M7gZdZAYy2mwxxb8zP2Yr1JNX52ViwoGRT
 JiKdKm2aWxsLpTHpOubMBB5cHBHZUUrT0gBZaTn6HSnFpsWuHuK7DtTjv1RvzupkNPAGgB35fz3
 9wEiC8Yv/qYltERnAi0zg7NHiOIjkQ==
X-Authority-Analysis: v=2.4 cv=DISCIiNb c=1 sm=1 tr=0 ts=68e913dd cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=s8YR1HE3AAAA:8
 a=Y6CNJq9B8L7KKZcxe68A:9 a=CjuIK1q_8ugA:10 a=efpaJB4zofY2dbm2aIRb:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: TEIedl0A0QRYumBinzP2jk5xjiRwzo57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090098

On Thu, Oct 09, 2025 at 12:10:42PM +0800, Damon Ding wrote:
> Hi Luca,
> 
> On 10/2/2025 12:09 AM, Luca Ceresoli wrote:
> > Hello Damon,
> > 
> > On Tue, 30 Sep 2025 17:09:13 +0800
> > Damon Ding <damon.ding@rock-chips.com> wrote:
> > 
> > > When multiple bridges are present, EDID detection capability
> > > (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> > > (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
> > > determined by the last bridge in the chain, we handle three cases:
> > > 
> > > Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
> > >   - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
> > >     &drm_bridge_connector.bridge_edid to NULL and set
> > >     &drm_bridge_connector.bridge_modes to the later bridge.
> > >   - Ensure modes detection capability of the later bridge will not
> > >     be ignored.
> > > 
> > > Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
> > >   - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
> > >     &drm_bridge_connector.bridge_modes to NULL and set
> > >     &drm_bridge_connector.bridge_edid to the later bridge.
> > >   - Although EDID detection capability has higher priority, this
> > >     operation is for balance and makes sense.
> > > 
> > > Case 3: the later bridge declares both of them
> > >   - Assign later bridge as &drm_bridge_connector.bridge_edid and
> > >     and &drm_bridge_connector.bridge_modes to this bridge.
> > >   - Just leave transfer of these two capabilities as before.
> > 
> > I think the whole explanation can be more concisely rewritten as:
> > 
> > If the later bridge declares OP_EDID, OP_MODES or both, then both
> > .bridge_modes and .bridge_edid should be set to NULL (if any was set
> > from a previous bridge), and then .bridge_modes and/or .bridge_edid be
> > set to the later bridge as is done already.
> > 
> > Does this look correct (i.e. does it convey the same meaning)?
> > 
> > > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > @@ -640,6 +640,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >   	struct drm_connector *connector;
> > >   	struct i2c_adapter *ddc = NULL;
> > >   	struct drm_bridge *bridge, *panel_bridge = NULL;
> > > +	struct drm_bridge *pre_bridge_edid, *pre_bridge_modes;
> > >   	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
> > >   	unsigned int max_bpc = 8;
> > >   	bool support_hdcp = false;
> > > @@ -668,6 +669,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >   	 */
> > >   	connector_type = DRM_MODE_CONNECTOR_Unknown;
> > >   	drm_for_each_bridge_in_chain(encoder, bridge) {
> > > +		pre_bridge_edid = bridge_connector->bridge_edid;
> > > +		pre_bridge_modes = bridge_connector->bridge_modes;
> > > +
> > >   		if (!bridge->interlace_allowed)
> > >   			connector->interlace_allowed = false;
> > >   		if (!bridge->ycbcr_420_allowed)
> > > @@ -681,6 +685,44 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >   			bridge_connector->bridge_detect = bridge;
> > >   		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> > >   			bridge_connector->bridge_modes = bridge;
> > > +
> > > +		/*
> > > +		 * When multiple bridges are present, EDID detection capability
> > > +		 * (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> > > +		 * (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities
> > > +		 * are determined by the last bridge in the chain, we handle
> > > +		 * three cases:
> > > +		 *
> > > +		 * Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
> > > +		 *  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
> > > +		 *    &drm_bridge_connector.bridge_edid to NULL and set
> > > +		 *    &drm_bridge_connector.bridge_modes to the later bridge.
> > > +		 *  - Ensure modes detection capability of the later bridge
> > > +		 *    will not be ignored.
> > > +		 *
> > > +		 * Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
> > > +		 *  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
> > > +		 *    &drm_bridge_connector.bridge_modes to NULL and set
> > > +		 *    &drm_bridge_connector.bridge_edid to the later bridge.
> > > +		 *  - Although EDID detection capability has higher priority,
> > > +		 *    this operation is for balance and makes sense.
> > > +		 *
> > > +		 * Case 3: the later bridge declares both of them
> > > +		 *  - Assign later bridge as &drm_bridge_connector.bridge_edid
> > > +		 *    and &drm_bridge_connector.bridge_modes to this bridge.
> > > +		 *  - Just leave transfer of these two capabilities as before.
> > > +		 */
> > > +		if (bridge->ops & DRM_BRIDGE_OP_EDID &&
> > > +		    !(bridge->ops & DRM_BRIDGE_OP_MODES)) {
> > > +			if (pre_bridge_modes)
> > > +				bridge_connector->bridge_modes = NULL;
> > > +		}
> > > +		if (bridge->ops & DRM_BRIDGE_OP_MODES &&
> > > +		    !(bridge->ops & DRM_BRIDGE_OP_EDID)) {
> > > +			if (pre_bridge_edid)
> > > +				bridge_connector->bridge_edid = NULL;
> > > +		}
> > > +
> > 
> > If the above rewrite is correct, then I think this patch can be
> > rewritten in a simple way (build tested only):
> > 
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index a5bdd6c10643..bd5dbafe88bc 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -672,14 +672,18 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >                  if (!bridge->ycbcr_420_allowed)
> >                          connector->ycbcr_420_allowed = false;
> > -               if (bridge->ops & DRM_BRIDGE_OP_EDID)
> > -                       bridge_connector->bridge_edid = bridge;
> > +               if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MODES) {
> > +                       bridge_connector->bridge_edid = NULL;
> > +                       bridge_connector->bridge_modes = NULL;
> > +                       if (bridge->ops & DRM_BRIDGE_OP_EDID)
> > +                               bridge_connector->bridge_edid = bridge;
> > +                       if (bridge->ops & DRM_BRIDGE_OP_MODES)
> > +                               bridge_connector->bridge_modes = bridge;
> > +               }
> >                  if (bridge->ops & DRM_BRIDGE_OP_HPD)
> >                          bridge_connector->bridge_hpd = bridge;
> >                  if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> >                          bridge_connector->bridge_detect = bridge;
> > -               if (bridge->ops & DRM_BRIDGE_OP_MODES)
> > -                       bridge_connector->bridge_modes = bridge;
> >                  if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
> >                          if (bridge_connector->bridge_hdmi)
> >                                  return ERR_PTR(-EBUSY);
> > 
> 
> Yes, this is correct and maintains functional equivalence with the previous
> implementation.
> 
> I previously attempted to implement this feature by modifying the logic in
> this section. However, that approach would obscure the explicit propagation
> semantics of the bridge chain flags (OP_EDID/OP_HPD/OP_DETECT/OP_MODES).
> Therefore, I finally decided to implemented it as a specific check after
> this code block.
> 
> Dmitry, what's your take on this?

I think I prefer Luca's code, it is simpler and easier to understand. It
doesn't need a huge comment, something like "leave the last bridge which
provides either OP_EDID or OP_MODES" should be enough.

> 
> > Another thing to note is that this patch conflicts with [0], which I
> > plan to apply in the next few days. The two patches are orthogonal but
> > they insist on the same lines (those assigning
> > bridge_connector->bridge_* = bridge). Not a big deal, whichever patch
> > comes later will be easily adapted. Just wanted to ensure you are aware.
> > 
> > [0] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/
> > 
> 
> This is indeed a clever approach to the managing bridge resource cleanup in
> drm_bridge_connector. Thanks a lot for the heads-up! I'll resolve this
> conflict and rebase the patch series.
> 
> Apologies for the delayed reply as I was on vacation. ;-)
> 
> Best regards,
> Damon
> 

-- 
With best wishes
Dmitry
