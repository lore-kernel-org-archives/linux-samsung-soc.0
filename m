Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765232D29DF
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 08:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457326; cv=none; b=UaijFVFpKsnuZX8YVGv3ty1EGQfgNq0UoObbeVX5EqHOirivSit1PVIfi/Vcw5CKaMBGhCkSt4J9F++Knd4jCXi1BxdkythWWV3aZlzBr+W6q3cHGvrapIKpygjDEuLGTMICzrLpFw2cTtPLeKUG5n7Zys6ijDP2OKyNAIoDQyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457326; c=relaxed/simple;
	bh=U35e/E8q0I+gH4p+LPvs4gYYi3QH4Uu1M0lmIoOA1sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gs4NIivVno4WhQq7ON8TTgeam7bw48sXi+eRz/G5qwpvMFtB+GyRrhRWx7y4BR6ZMtPT8dzTzNLskXh6j68TzCPEmz7dWTP6sxrYnDbHdiu/q0+1eImKhMI4Cz8LtVI8AoL71MBix42YiVYmTqblDCc/HhxElcl3NNfaI7d+nDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O171H4Aa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O171H4Aa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85Ppf008020
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 08:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/5pBODwspf82fhKHX/+Qq3M8
	oCn/6yRZrJbLU7BeMOU=; b=O171H4Aal17R09DovZSV+f7s9mAfCdAdtrQVTFsl
	GQlxb/LkQrUq/6+/W0kU6lq/0pofV7O7pLQhM+o1+aXy9r4fAPkuYL2MXiD4siQs
	g1Na+02TxmDq29fo1qK8CUsEFolUHv7Tc/CfS4QJaFJpsGjh9LlP/jSUXO0lRmWZ
	/CEbX8JaAtsj2hyphwKEMHu9i/NeKTePzqcndXiJ2Ty5Bd2R0/1PdwworLi+vW8J
	VU+zqzS11JwUSpjblFP44O2dPwkJuocpegRv6CbYE+UMyxnMNW1agMiKOmNwftF9
	j6bgIpa5uAUClt6tHX6mVrzhmjzjmE3cf5qsJHFYQFAZGQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpf5nc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 08:48:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70f9ef271a4so6806226d6.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 01:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756457322; x=1757062122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5pBODwspf82fhKHX/+Qq3M8oCn/6yRZrJbLU7BeMOU=;
        b=a50yBrruFMz5iz9Xw++gxVn7NMRfhuCxpnJMArDONV5uOXOx9HPGoCvKhc0QBIJwRW
         b7HSP4qhAR/jObqNYi79/chUcCcLgrwkA69heqG2izDq9U+ITAvEpRxMVkcv3Bh10d0E
         EOW48tf0Z1xKTPTzVc+zdQX6Ja27g51dSx2AqXPmeFH9dI30KQ+b1mVhSDpM9tMcdjQg
         O4lNxwO4mou96CI5snd7PgYowwQHeLPNu0LvVdeMO9fNdW+iDPAGLK4PbjDtCPgrZcjr
         3TW25Tm9WqNfSeyGg+ygwNoZCbH3EjyMpQu18tiC9BVMVWElJVMDi9iOIKsDxdmU+PJc
         Ecyg==
X-Forwarded-Encrypted: i=1; AJvYcCVQATauFn2m1J6MYwafk46EXQKZs/z0KoxprOZevL6TleH/qo/EJQxXMSaRl9wmBSipp+ymmjsO15LFraQgm6x/gA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyup5HoRaFvryu7kJ40JXEtb6+tm6Db5EdXFUL5UCt46NL9SX18
	ZDmgz2f5zJ5MzjjXM165ZVRL/F/CL2+W2HHfYaPIWOwHkpe8oxqWm2lwcHiGU3DCVZu79Z3XRsH
	v1cLZrySkKwVLCs7zGkeCqWnqGcoLh9ue2qm+gNN4o0eRQOZpWbxaH/Gh0kY9fgJqhch5LopugA
	==
X-Gm-Gg: ASbGncuS5yyq2Bz2Y36MiNjOyDGSrxT8T59xPpTfPI6ONzaJAB2ZJp2lJVzKzXcCdF8
	uss7h46odHvxiDj/hQIK9D/TsaQC2vxvw9LYo6F6KUBF1knwA0HBDJH+PhaJvnZgInWzuKiWxC2
	Z7EqfXMpwuSRt50VNIYVA6ws4ClFQr0TCL1pE3AGQsS0fP7N60HsfbuweHlWcb/OdfdJGc518wq
	cYeNLbQxEevIY6TVwNGPJT13TOAmw486Bb7WHd1FhiDvI20lfLtOmSFThNAqz+cGiuMm9TM7Hus
	dpZzpf4x60QmPrldc9++HnyrNwYRX1eqZODZf9EEh3ciIWsHCK2L22k5PDpy5Z0AM/OJU7zIyYP
	jVVwbziLR7/xdLq3HlIFMBC2hcGzWNznb0TdcNHuiQNRtbUiu2FZw
X-Received: by 2002:a05:6214:5186:b0:70d:b3de:cec9 with SMTP id 6a1803df08f44-70dd59c1196mr125891016d6.22.1756457322319;
        Fri, 29 Aug 2025 01:48:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq1ezFqcENyB1YLJXTV7TThom8X2IGaTOdTprgqE2iRpU+3lXQDMjeVPvPOaC+kNzjQAaeVA==
X-Received: by 2002:a05:6214:5186:b0:70d:b3de:cec9 with SMTP id 6a1803df08f44-70dd59c1196mr125890886d6.22.1756457321839;
        Fri, 29 Aug 2025 01:48:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6784526csm461424e87.84.2025.08.29.01.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:48:39 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:48:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 07/13] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Message-ID: <ghp33yxo24gaubn6pijks3wnuch3fpbmi5z27cq7pk3siffiox@jb2zw3lt35hk>
References: <20250814104753.195255-1-damon.ding@rock-chips.com>
 <20250814104753.195255-8-damon.ding@rock-chips.com>
 <incxmqneeurgli5h6p3hn3bgztxrzyk5eq2h5nq4lgzalohslq@mvehvr4cgyim>
 <62dfbe1d-3e36-4bc5-9b25-a465e710f23b@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62dfbe1d-3e36-4bc5-9b25-a465e710f23b@rock-chips.com>
X-Proofpoint-GUID: P7M17wYXuChZIWqk-UqWZIGbRHAcxPdc
X-Proofpoint-ORIG-GUID: P7M17wYXuChZIWqk-UqWZIGbRHAcxPdc
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68b1696b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=g_3uhpjf_u-dzjrkN2gA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX7+6Y2CLkPxz1
 mHk2Pm+haIC+HRQQledho7M0TYFgq8Chxs/h18u+vcZzeuXAQkpGoQC4NSSJCW7pMn1psj2IwqG
 yVsWFhX1TWVlfiJrLaSdgDAV8BXZUIYZEptGwmBfQ+gp9ye8Lx9q4J5inIqPbRIGksjMiuqYB47
 WxtomPECw2ZJ8ji7fVr+5B4/5jKDhVNl5YTEC3oZQnGb4/G5zmPecS75e0qwxOt29LH3YZXu/hV
 YPWY7vFd//yHZ7OjeD7PBsd2kWnRVD2lbhxutUBBW6Bjsd+r+HeOyfgalRZgSAdXp3JHRPF+Eh3
 68lcF7Ps1ev+OixL+SuLCjGsnJ8XOKm/JbqYESQOre9wm2gwiLzfKaj7yice3bxh209DAeGxciG
 U+YWnImn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

On Wed, Aug 20, 2025 at 05:18:13PM +0800, Damon Ding wrote:
> Hi Dmitry,
> 
> On 8/17/2025 12:43 AM, Dmitry Baryshkov wrote:
> > On Thu, Aug 14, 2025 at 06:47:47PM +0800, Damon Ding wrote:
> > > Apply drm_bridge_connector helper for Analogix DP driver.
> > > 
> > > The following changes have been made:
> > > - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
> > >    and &drm_connector_helper_funcs.
> > > - Remove unnecessary parameter struct drm_connector* for callback
> > >    &analogix_dp_plat_data.attach.
> > > - Remove &analogix_dp_device.connector.
> > > - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
> > >    &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
> > > - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
> > >    &drm_bridge_funcs.edid_read().
> > > 
> > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > > 
> > > ------
> > > 
> > > Changes in v2:
> > > - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
> > >    DRM_BRIDGE_OP_EDID.
> > > - Add analogix_dp_bridge_edid_read().
> > > - Move &analogix_dp_plat_data.skip_connector deletion to the previous
> > >    patches.
> > > 
> > > Changes in v3:
> > > - Rebase with the new devm_drm_bridge_alloc() related commit
> > >    48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc()
> > >    API").
> > > - Expand the commit message.
> > > - Call drm_bridge_get_modes() in analogix_dp_bridge_get_modes() if the
> > >    bridge is available.
> > > - Remove unnecessary parameter struct drm_connector* for callback
> > >    &analogix_dp_plat_data.attach.
> > > - In order to decouple the connector driver and the bridge driver, move
> > >    the bridge connector initilization to the Rockchip and Exynos sides.
> > > 
> > > Changes in v4:
> > > - Expand analogix_dp_bridge_detect() parameters to &drm_bridge and
> > >    &drm_connector.
> > > - Rename the &analogix_dp_plat_data.bridge to
> > >    &analogix_dp_plat_data.next_bridge.
> > > ---
> > >   .../drm/bridge/analogix/analogix_dp_core.c    | 145 ++++++++----------
> > >   .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
> > >   drivers/gpu/drm/exynos/exynos_dp.c            |  18 ++-
> > >   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
> > >   include/drm/bridge/analogix_dp.h              |   3 +-
> > >   5 files changed, 88 insertions(+), 90 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > index 7876b310aaed..a8ed44ec8ef5 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > @@ -947,24 +947,16 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
> > >   	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
> > >   }
> > > -static int analogix_dp_get_modes(struct drm_connector *connector)
> > > +static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
> > >   {
> > > -	struct analogix_dp_device *dp = to_dp(connector);
> > > -	const struct drm_edid *drm_edid;
> > > +	struct analogix_dp_device *dp = to_dp(bridge);
> > >   	int num_modes = 0;
> > > -	if (dp->plat_data->panel) {
> > > +	if (dp->plat_data->panel)
> > >   		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
> > > -	} else {
> > > -		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
> > > -		drm_edid_connector_update(&dp->connector, drm_edid);
> > > -
> > > -		if (drm_edid) {
> > > -			num_modes += drm_edid_connector_add_modes(&dp->connector);
> > > -			drm_edid_free(drm_edid);
> > > -		}
> > > -	}
> > > +	if (dp->plat_data->next_bridge)
> > > +		num_modes += drm_bridge_get_modes(dp->plat_data->next_bridge, connector);
> > 
> > If there is a next bridge which provides OP_MODES, then
> > drm_bridge_connector will use it for get_modes() and skip this one
> > completely. I'm not sure what's the value of this call.
> 
> Following your advice, it is really a good idea to distinguish the
> drm_bridge_ops between the panel and the bridge. Will add it in v5.
> 
> > 
> > >   	if (dp->plat_data->get_modes)
> > >   		num_modes += dp->plat_data->get_modes(dp->plat_data, connector);
> > > @@ -972,51 +964,39 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
> > >   	return num_modes;
> > >   }
> > > -static struct drm_encoder *
> > > -analogix_dp_best_encoder(struct drm_connector *connector)
> > > +static const struct drm_edid *analogix_dp_bridge_edid_read(struct drm_bridge *bridge,
> > > +							   struct drm_connector *connector)
> > >   {
> > > -	struct analogix_dp_device *dp = to_dp(connector);
> > > +	struct analogix_dp_device *dp = to_dp(bridge);
> > > +	const struct drm_edid *drm_edid = NULL;
> > > -	return dp->encoder;
> > > -}
> > > +	drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
> > > +	if (dp->plat_data->get_modes)
> > > +		dp->plat_data->get_modes(dp->plat_data, connector);
> > 
> > 
> > So, we have DDC, but we still want to return platform modes? What is the
> > usecase for that?
> > 
> > There might be some, but I think it deserves a comment in the source
> > file.
> > 
> 
> For Rockchip side, since RK3588 and RK3576 can support YUV formats while the
> other can not, the &analogix_dp_plat_data.get_modes() help filter out YUV
> formats for some platforms(The YUV feature support may not be fit for this
> patch series and will come later).

Note, get_modes() here adds modes rather than filtering them. You can
use .mode_valid in order to filter out YUV modes.

> 
> For Exynos side, I think &analogix_dp_plat_data.get_modes() can help
> parse the video mode set in the eDP DT node when there is no available panel
> or bridge.

I think this should be handled by a separate bridge. E.g. see how the
imx-legacy-bridge is implemented.

> 
> I will add some comments about it in the next version.
> 

-- 
With best wishes
Dmitry
