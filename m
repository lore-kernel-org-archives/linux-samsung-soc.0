Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328222C9D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 03:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758771473; cv=none; b=DeG5Bd9xl5eTU5O5rldaEGWZmQkjGgxvZi3CqPQA4Ct+2yqbzOR8j2m5+FsvpANgIZA/ZWMGMw9nw7dX0P/nEqyrBT/9N053xdZfzqmH6hjXKEW60ZYpvt5ul5OEazpDjGdHaF4+f4J4UysEcm4DEYoGwaCoSXfUhr4+b5ePIlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758771473; c=relaxed/simple;
	bh=SwJ8n9QRRLb939UHBqsh+5lwtzA2jD8olcgzZwVK72A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdD3bVPuUfLhTHImPxYBlFjfHn6Di237tYj6Lm8WEugD+0Pp3ptFihbvwLol/J+KiOzIF+6IdEGzQn13QJ8ItEF56xetsVEDZ7C9RJWLzv9leEH1iFtoqzG0J4PfQoENWSEk7UzmVDkRS/NUzqsqDKejlJkaJj3pMstGuN4L+N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgTSuc6K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgTSuc6K"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0t4L6029720
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 03:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n78nIIomQavWQosZYQPTeoTh
	4ytOcFS5L4hdEAU6XLI=; b=UgTSuc6KmCehqi8ARRkarzQ/yMYshdS5YZXikwc2
	7kEv0mWOqAoVbz2YicphPD1AnKPWlRK1yp+Fmhm3SFLF2E1yvaljAw4k8AtMELg6
	inG7Gz+JOnDV0mhleHIvoHBYxyJFyI7901v6BlbPPK5iouwon9LWTXsbaCKBEIOH
	eimYo1z8/aAmfxm60mIIoxRFz+QEjrkNqCiCRZ+GJ9ejdR8KsVANgS51pb2xPN7c
	PxENgsIhvFIwfVK0cSmGzFd+nlsjppggHlen3kj+tEcsjeH6bQCmWkOlOu5d61Zi
	ArtvXKWsEGrwwYRd1VJG9Jo9uQVCHTZDYJdJP3/srrRK0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fpgf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 03:37:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85a0492b5feso176353985a.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2025 20:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758771470; x=1759376270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n78nIIomQavWQosZYQPTeoTh4ytOcFS5L4hdEAU6XLI=;
        b=v0ewdqrpBg4ypntOFg1lgjCl8w+Qh781FrXdU6oYUssIHlL0/i5ze4IUZ9Vgbg7sWU
         0QcK442Z8j6c2AmIXtxNpToEZ3sHNvhpRwfjXn6WBqFXIgs0aqqD21ygaE6QgkS5MIxs
         KCbS/Ykl1d77plNWAbXST710ILnn5Z1okfdlBaXwTDeh8HKbJVz9nSNOXi2oeRFjW5E7
         UF9ip18nVuBh4FX7j32gkTeqMPcUQVceq5w9/+Ulqg4eGgk2Y2J/eYnK9u3aSS9mBsh2
         y8ZLxp7zSZi08kf5gXXyzekWGls9T3rSB7CKWb/xk2c6kRJ8unLKHcW12h9fqt/3Kkp2
         wODg==
X-Forwarded-Encrypted: i=1; AJvYcCVTCg6TLuWeNoLCOuHq0Bdu1AQmG0SMGCvtmFTl3asBl/CcLalj8hI+1SuAfn13BWPzFpR0/6mi0BYZwLQoNjiWhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy98B0UEvpwz5TRn6EHflK3iJykMr6CTrccFv8a8QME6Z6Xnscy
	bMp/k5geo/sjr6NRjMXqYxDrYCGgnHkD5+Ln6puxTXQ/i9R8uRaNJo5z/YjVLI1fM4iX3R5H5dq
	9OwnsdpamnYRfu0dn5NlMed0GMPbF3K03EYOpUYVo1gPHtritBnqkddCtzvWHeGpq0F8l1iaNZw
	==
X-Gm-Gg: ASbGncsCWW/IWP7pMxX+tuG6eJSZkvRRC5ucIUpjvuMe7MS3Izoq2PQf0UBRosq2hvx
	6S9d/Z4XyUyUFnE3A9Rg0sEfxYlDb29tgHsK9eqzvVj9z7Cb6WLJouJcetwn1UQIehvKndOu/xX
	ZMDRQp/tp4/a/iceKyEAP3VSgeozmOUClx6b5zFGZ0AgmB/7eFxYHn+hBQqPecPCxRgSX3ortnV
	SjqF13uuatFCZ/J/SaVBWOKQGPpdQk/wCVCJCrnr4Gw7QB5OrjvNkQUdK2dSKRmawuBxcLR+k5k
	iayuDEe9mbFqeX6dVXRZzClTx/IxfcZjNUtwVMXvx7Ke0F6qVC78vAhYVEqsZ6xvJU+DUjb0RiC
	aTnEYAz5hh7q60RbKMpyscwu9lux7RRb1gQd4rbzAxJaSjmdfm3IM
X-Received: by 2002:a05:620a:2907:b0:80a:72d7:f0cd with SMTP id af79cd13be357-85aed8cbc11mr225515685a.56.1758771469831;
        Wed, 24 Sep 2025 20:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/Mkya6v8AWWGYf6q1L7jR77pkQxfEZnuvWyLMjPjoG8YIV9rwp0IrPi1ugpz+EuhpXNM8VQ==
X-Received: by 2002:a05:620a:2907:b0:80a:72d7:f0cd with SMTP id af79cd13be357-85aed8cbc11mr225513785a.56.1758771469267;
        Wed, 24 Sep 2025 20:37:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7bfb413sm2245821fa.56.2025.09.24.20.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 20:37:47 -0700 (PDT)
Date: Thu, 25 Sep 2025 06:37:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, dianders@chromium.org,
        m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 10/17] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Message-ID: <ykj7xrnpagbtftr7wt2vkyc4d4u4k5nmxsir433jzz7lhc3oq3@gaq4kicsrlpr>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-11-damon.ding@rock-chips.com>
 <tsgfxlkxty653crmzmwsr7p6slf27pxf6n6to5p7zvi6wsl444@525tz5uhbj44>
 <2870c278-3c65-4d8f-ace3-1fd5b03af2b4@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2870c278-3c65-4d8f-ace3-1fd5b03af2b4@rock-chips.com>
X-Proofpoint-ORIG-GUID: xkdjEeF4viVyussKTeQc6IpOjHnG61Zi
X-Proofpoint-GUID: xkdjEeF4viVyussKTeQc6IpOjHnG61Zi
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d4b90f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=e-wIutcIwHs2mBw2ZVAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX9t0et8PEnmL+
 V/1MU4KkDeVCMMxnXD5T+MISHh6wzry6UHhNtgpUg22cHnMQE4t4/R3vU+Ywe8gYbdF0mUpz04m
 3ToSZV/UcdPvW8yd/XVzd0Xg31LNIQPr3QAtPddXbbO31zuc460x2bTNwMhumBu5XGNJ74N1Ta9
 6OqkVuJOLkKqwI50eTY/Xq8YpsxRw7J9A4eDmEPClOjsCQrUuKhgcWWKj70AXX/hlZrgs+acHek
 6df6JBL00d/CWYZuOKdTx/x11HNL55m4m2M0sMjyQveu/JdPVKFHlDOb2rv26yWGxGJgdwezrlU
 pu+rET/qcGJVXK6dBdyqWJwE912Oyx1KHFKLfPBYwvBpPpiqYeDZLFNn0mwl4JxOKx2qtHgHS2W
 LqtfgnYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Wed, Sep 24, 2025 at 05:14:57PM +0800, Damon Ding wrote:
> Hi Dmitry,
> 
> On 9/12/2025 7:03 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 12, 2025 at 04:58:39PM +0800, Damon Ding wrote:
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
> > > 
> > > Changes in v5:
> > > - Set the flag fo drm_bridge_attach() to DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > >    for next bridge attachment of Exynos side.
> > > - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
> > >    the downstream device is a panel, a bridge or neither.
> > > - Remove the calls to &analogix_dp_plat_data.get_modes().
> > > ---
> > >   .../drm/bridge/analogix/analogix_dp_core.c    | 151 ++++++++----------
> > >   .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
> > >   drivers/gpu/drm/exynos/exynos_dp.c            |  25 +--
> > >   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
> > >   include/drm/bridge/analogix_dp.h              |   3 +-
> > >   5 files changed, 95 insertions(+), 96 deletions(-)
> > > 
> > > @@ -1532,6 +1487,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
> > >   int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> > >   {
> > > +	struct drm_bridge *bridge = &dp->bridge;
> > >   	int ret;
> > >   	dp->drm_dev = drm_dev;
> > > @@ -1545,7 +1501,23 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> > >   		return ret;
> > >   	}
> > > -	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> > > +	if (dp->plat_data->panel)
> > > +		/* If the next is a panel, the EDID parsing is checked by the panel driver */
> > > +		bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
> > > +	else if (dp->plat_data->next_bridge)
> > > +		/* If the next is a bridge, the supported operations depend on the next bridge */
> > > +		bridge->ops = 0;
> > 
> > And what if the next bridge is dp_connector without a separate HPD pin?
> 
> This case was indeed not taken into account.
> 
> If the next is a bridge, it should be better to set DRM_BRIDGE_OP_DETECT and
> return connector_status_connected in analogix_dp_bridge_detect(). This
> ensures the connection status remains connected for both the dp-connector
> and the bridges without DRM_BRIDGE_OP_DETECT.

Maybe OP_EDID | OP_DETECT? I think, we need to fix drm_bridge_connector
to stop preferring OP_EDID bridges over OP_MODES if the latter one is
enountered later in the chain. In other words inside
drm_bridge_connector_init() clear bridge_edid if OP_MODES is encountered
and vice versa. This way you can always declare OP_EDID here (after
converting to panel bridge) and then letting panel's OP_MODES take over
mode declaration. Would you please include such a patch in the next
iteration?

> 
> > 
> > > +	else
> > > +		/* In DP mode, the EDID parsing and HPD detection should be supported */
> > > +		bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> > > +
> > > +	bridge->of_node = dp->dev->of_node;
> > > +	bridge->type = DRM_MODE_CONNECTOR_eDP;
> > > +	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
> > > +	if (ret)
> > > +		goto err_unregister_aux;
> > > +
> > > +	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
> > >   	if (ret) {
> > >   		DRM_ERROR("failed to create bridge (%d)\n", ret);
> > >   		goto err_unregister_aux;
> > 
> 
> Best regards,
> Damon
> 

-- 
With best wishes
Dmitry
