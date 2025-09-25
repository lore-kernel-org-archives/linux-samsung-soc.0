Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E93C2417E6
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 22:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758838898; cv=none; b=UjkofdLWmxPnm3ARbhNmnSP4IUJxDoo+4DeQzuve05aJDn1mBuDZkquqmRiL3TmULO/MqXNijRsBmZ2BwECO98nQjvS/ItGKQdE19yUgaCS7LApbnGI/7LKQaPfIqO9/YvwmeHIGNAQTlAXeoRKZ+hzTwafGDbk6sqPR2y67h6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758838898; c=relaxed/simple;
	bh=+nZDpgErPKlsBYr8SGrK/ZDzx0PkooCV3ZfWcpePsFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmMNezpiPOsQH0D6Bi9Z5qBN6cLoi0iCVYEfNfWNUTRzbFpPmrUhmGnu0ZDa84r1266voMNzyHI452W1IVLP3P79SYe/N8YhTVjUFZRRcWV6sQ+3uZhfTSYdSh2H6L2JG9WzIFdjCnZ5R919APsYL77fiJBEUllLCwCyqfRDXJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MAZeOmvk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAZeOmvk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIUuML006031
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 22:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aoTfqDMQtgNp8uKI6NaCQod1
	KhD8aF7dBolg9fIYyjM=; b=MAZeOmvkPjKC32lFD2F+OE6mpbrhBaW5mKvBQNe6
	tM1Pb8YBK5DDsvX/hmxhWhhKwV2dKs8/zfyklHHGC7vxhvHBSkNA5ZNThn4lnkBO
	QQh4wUfoh5cKxqOvH0GhMFc2JfSnEEDugaQ3rNceSM/PZ/dh9D+eHrxk2qyI2dMy
	lfU1ku9t0z+gVtbNCWxTkvf5loyw0EFZCSfYty4Q3Pmw4eunLVQYfurSUVBAAp6F
	oxpWWoSPH2Uy/rS84xVRnfUglz0kLWfPa0NK6ajypxVErks1nacawLcwTNtiYdu/
	5kapW/j7H3X9lec6+cztABI+8Ej4CuIDGQtBaexI+Hl2Fg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db320hdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 22:21:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4bf85835856so40247761cf.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 15:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758838894; x=1759443694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoTfqDMQtgNp8uKI6NaCQod1KhD8aF7dBolg9fIYyjM=;
        b=qLihuOl2UC8LXVLKO0sCR5DE8UWQlZYyBlyVypHBmQFShGE9aunNb8MLCGwpR4Ubbd
         t6A+qJbdZykijMCniyUG56VcFI8UPtFO1WVrKEIHBPKWM3qW8S5mAlMM3r/LpE+ELKI8
         7/rzj+4sZkUMzICGrTrBvAnswQcEPsdGdwCrg9Te2o0IBQg10TWpi2onvzCWMZBqG8Zk
         t1bwUg+vgkW7gAdH7QjRD2I6Frg8Zn0MgT1dgWl6HPYv7nQCY+QQpBsAdfTGE0bHcEai
         uWm+Id8hbR5cMH41PdY8N+XX4m2duLALSUQOuv1B1iwHZbth6c83COa4DPNLlAOszIsk
         J9gA==
X-Forwarded-Encrypted: i=1; AJvYcCUBNMQtfF9uUmrLt2xwcxvpCijjmWSDewvNol8z5Ej5M7vZa//KFL9XQJSinb9m6J+4gw5WQTg6B15grM55yguqgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsWKZt2f1lwAXSjDFmtJghY7V3NwkNqCc1xpBMh6gPKyA0Caq/
	xhMfPLX+mVBm89ssjtRxfXtDJ/8mWVzq+Uq2sMsAAsFDzyyKTaYHiXN6Tc/rRQ9eiTGo9Zf55hl
	/nwTV/6DtcYkdHY0KxODXZjhh6/EiJMlYBikDNPhxG6YP0ZcXjnavP2dmzVxPVXEhOvLVTb2LbA
	==
X-Gm-Gg: ASbGncuAxgPEt2EV5qHNd+WT54mxIjw7rRTLVDy0fS8OFJDrsBKdgxo7L+BWEyz4zMu
	PKQbpemp6JFtuXejsOgpfcnzz1SbVGCD7D5F5/fj4alWhCY4sFv2GsGVboG6ujs7Q9pikyx4Cmg
	MSAnkhqRheYlVAfUm+gm7gfTxcnF2pPFcPl7VlZVq4VIgeR5VL7WjTOtN6qr2cPTVskB2NxASBc
	C9CCsOPwhXXYd0adNAAi0doaDshP90F1xp22jewf846wcQfAut3TFRmisBxhWCkYq5CxQXXpykE
	l5PDzYGbKrQXBL9jEhYyeljLDH79pZzyLQFkjiqg29JsZZIy8bZCY6FyTue6axeu5JKzVXDjF+R
	HG2+E+33yMpCdvYcnao969Wg/4jr4aaEA6baS1Wq97W+lNc5rXF3g
X-Received: by 2002:a05:622a:190e:b0:4b7:acab:852b with SMTP id d75a77b69052e-4dacd2444dfmr53076111cf.26.1758838893923;
        Thu, 25 Sep 2025 15:21:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+ndE8As98QEszHZ6NDkq+zsmIILHZCa3+sexpBqWme3ZRaECjD3Wj4Ezi0fMLWu39g+sHHg==
X-Received: by 2002:a05:622a:190e:b0:4b7:acab:852b with SMTP id d75a77b69052e-4dacd2444dfmr53075521cf.26.1758838893328;
        Thu, 25 Sep 2025 15:21:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a3304fsm1171495e87.122.2025.09.25.15.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 15:21:31 -0700 (PDT)
Date: Fri, 26 Sep 2025 01:21:28 +0300
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
Message-ID: <jzy37mcxvonlnouvsyepgyld4uxcsvlgxyj6upm4hek3fmavll@api4pfbjzi33>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-11-damon.ding@rock-chips.com>
 <tsgfxlkxty653crmzmwsr7p6slf27pxf6n6to5p7zvi6wsl444@525tz5uhbj44>
 <2870c278-3c65-4d8f-ace3-1fd5b03af2b4@rock-chips.com>
 <ykj7xrnpagbtftr7wt2vkyc4d4u4k5nmxsir433jzz7lhc3oq3@gaq4kicsrlpr>
 <7babd32a-6b20-4e4b-9c40-594520a183bb@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7babd32a-6b20-4e4b-9c40-594520a183bb@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d5c06f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=ZqRDvNvAEryDotfT4VUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: c51q_C1k8gx5CfHPS7y3ynCm6XklNQ4P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfXxCLNqY5kxOwu
 6JT+2SzKlQfHPW+mQ4hJDPQPHPMMKAkNWhqWtQbPNWr+v7stkY5KiCNp9h3RtlKLkP2/ZckpfMM
 yZUbRuiYLOmkNkRG4Ah+W+Kmy9VXKBBJN+HC2XimdH3al8pPKPGjCcAvUcHqwJTFq+8FDJkp+uu
 aIqpV059NnkgOi4INMezDIJhIoLviQ/+GIjjA9WceLBmYEnTKt9f23idhtoKJY3mKVnLFngeKYn
 S8nH7JCiOEEIxySYkBjxoUwC7g6pWfP0ckmwZ467awSMLgF9nqZs3WaV/tR+RWsca7nfMrjhBHo
 Y5ghjpbBmoyRIUfFFjAbGJOiXc3IU373F62T+xbXFThFOzhq1ViNFgp57+PxnKJvKuhTdT9CfKB
 AL49whUUs24GA99x3jKeyMLrbjlqOg==
X-Proofpoint-GUID: c51q_C1k8gx5CfHPS7y3ynCm6XklNQ4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172

On Thu, Sep 25, 2025 at 03:33:45PM +0800, Damon Ding wrote:
> Hi Dmitry,
> 
> On 9/25/2025 11:37 AM, Dmitry Baryshkov wrote:
> > On Wed, Sep 24, 2025 at 05:14:57PM +0800, Damon Ding wrote:
> > > Hi Dmitry,
> > > 
> > > On 9/12/2025 7:03 PM, Dmitry Baryshkov wrote:
> > > > On Fri, Sep 12, 2025 at 04:58:39PM +0800, Damon Ding wrote:
> > > > > Apply drm_bridge_connector helper for Analogix DP driver.
> > > > > 
> > > > > The following changes have been made:
> > > > > - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
> > > > >     and &drm_connector_helper_funcs.
> > > > > - Remove unnecessary parameter struct drm_connector* for callback
> > > > >     &analogix_dp_plat_data.attach.
> > > > > - Remove &analogix_dp_device.connector.
> > > > > - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
> > > > >     &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
> > > > > - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
> > > > >     &drm_bridge_funcs.edid_read().
> > > > > 
> > > > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > > > > 
> > > > > ------
> > > > > 
> > > > > Changes in v2:
> > > > > - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
> > > > >     DRM_BRIDGE_OP_EDID.
> > > > > - Add analogix_dp_bridge_edid_read().
> > > > > - Move &analogix_dp_plat_data.skip_connector deletion to the previous
> > > > >     patches.
> > > > > 
> > > > > Changes in v3:
> > > > > - Rebase with the new devm_drm_bridge_alloc() related commit
> > > > >     48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc()
> > > > >     API").
> > > > > - Expand the commit message.
> > > > > - Call drm_bridge_get_modes() in analogix_dp_bridge_get_modes() if the
> > > > >     bridge is available.
> > > > > - Remove unnecessary parameter struct drm_connector* for callback
> > > > >     &analogix_dp_plat_data.attach.
> > > > > - In order to decouple the connector driver and the bridge driver, move
> > > > >     the bridge connector initilization to the Rockchip and Exynos sides.
> > > > > 
> > > > > Changes in v4:
> > > > > - Expand analogix_dp_bridge_detect() parameters to &drm_bridge and
> > > > >     &drm_connector.
> > > > > - Rename the &analogix_dp_plat_data.bridge to
> > > > >     &analogix_dp_plat_data.next_bridge.
> > > > > 
> > > > > Changes in v5:
> > > > > - Set the flag fo drm_bridge_attach() to DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > > > >     for next bridge attachment of Exynos side.
> > > > > - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
> > > > >     the downstream device is a panel, a bridge or neither.
> > > > > - Remove the calls to &analogix_dp_plat_data.get_modes().
> > > > > ---
> > > > >    .../drm/bridge/analogix/analogix_dp_core.c    | 151 ++++++++----------
> > > > >    .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
> > > > >    drivers/gpu/drm/exynos/exynos_dp.c            |  25 +--
> > > > >    .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
> > > > >    include/drm/bridge/analogix_dp.h              |   3 +-
> > > > >    5 files changed, 95 insertions(+), 96 deletions(-)
> > > > > 
> > > > > @@ -1532,6 +1487,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
> > > > >    int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> > > > >    {
> > > > > +	struct drm_bridge *bridge = &dp->bridge;
> > > > >    	int ret;
> > > > >    	dp->drm_dev = drm_dev;
> > > > > @@ -1545,7 +1501,23 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> > > > >    		return ret;
> > > > >    	}
> > > > > -	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> > > > > +	if (dp->plat_data->panel)
> > > > > +		/* If the next is a panel, the EDID parsing is checked by the panel driver */
> > > > > +		bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
> > > > > +	else if (dp->plat_data->next_bridge)
> > > > > +		/* If the next is a bridge, the supported operations depend on the next bridge */
> > > > > +		bridge->ops = 0;
> > > > 
> > > > And what if the next bridge is dp_connector without a separate HPD pin?
> > > 
> > > This case was indeed not taken into account.
> > > 
> > > If the next is a bridge, it should be better to set DRM_BRIDGE_OP_DETECT and
> > > return connector_status_connected in analogix_dp_bridge_detect(). This
> > > ensures the connection status remains connected for both the dp-connector
> > > and the bridges without DRM_BRIDGE_OP_DETECT.
> > 
> > Maybe OP_EDID | OP_DETECT? I think, we need to fix drm_bridge_connector
> > to stop preferring OP_EDID bridges over OP_MODES if the latter one is
> > enountered later in the chain. In other words inside
> > drm_bridge_connector_init() clear bridge_edid if OP_MODES is encountered
> > and vice versa. This way you can always declare OP_EDID here (after
> > converting to panel bridge) and then letting panel's OP_MODES take over
> > mode declaration. Would you please include such a patch in the next
> > iteration?
> > 
> 
> I see. Following your suggestions, the logic will be:
> 
> 1.If the later bridge declares OP_MODES and
> &drm_bridge_connector.bridge_edid already exists, the
> &drm_bridge_connector.bridge_edid should be set to NULL.
> 2.If the later bridge declares OP_EDID and
> &drm_bridge_connector.bridge_modes already exists, the
> &drm_bridge_connector.bridge_modes should be set to NULL.
> 3.If the later bridge declares both OP_EDID and OP_MODES, set
> &drm_bridge_connector.bridge_modes and &drm_bridge_connector.bridge_edid to
> it(preserving the existing behavior).

Yes. And then the get_modes() will defer its functionality to the last
bridge that declares either of those.

> 
> I will add a new commit with necessary code comments to implement this in
> v6.

Yes, thanks!

> 
> > > 
> > > > 
> > > > > +	else
> > > > > +		/* In DP mode, the EDID parsing and HPD detection should be supported */
> > > > > +		bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> > > > > +
> > > > > +	bridge->of_node = dp->dev->of_node;
> > > > > +	bridge->type = DRM_MODE_CONNECTOR_eDP;
> > > > > +	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
> > > > > +	if (ret)
> > > > > +		goto err_unregister_aux;
> > > > > +
> > > > > +	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
> > > > >    	if (ret) {
> > > > >    		DRM_ERROR("failed to create bridge (%d)\n", ret);
> > > > >    		goto err_unregister_aux;
> > > > 
> > > 
> 
> Best regards,
> Damon
> 

-- 
With best wishes
Dmitry
