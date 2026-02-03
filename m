Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7033A63ED;
	Tue,  3 Feb 2026 14:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770127792; cv=none; b=n/grUVotOMmjDrotiTx0L8zGdRU0XNVAcndx0cdQhOqTbpOmwFdEcsSWRcHRzcoriTAAbwJLm0vEezncWV48OHQmSCDvcip7UnMdXIjVZmI0rejPNR5KWjy6Fc7mCRHbXO9TpbjEKJznCSKbPQtY5lLpX+AoeDPF4aRK9lt3XHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770127792; c=relaxed/simple;
	bh=Rv0gnZrGTVnHq8ksG/uGGrkDZi1zIa4ztL46UEkonLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5pr2h+H8qY3YPAettQ37iRF843xPMmKaYVHeQmXexE1LQxNZ9Oc5kGrJUhGSyA09q/05f1ljiUZOFoAiQN3oYkHKtUSn6z42l/dx5qh2kTJ1vW9YeQmG1kpmEgjjDDzzq9dJ/hofE8RqCkpvBzs85k37C1dvfY5thEnWgzZ3Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QP1vaF/q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QP1vaF/q"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AA6CA5B2;
	Tue,  3 Feb 2026 15:09:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770127745;
	bh=Rv0gnZrGTVnHq8ksG/uGGrkDZi1zIa4ztL46UEkonLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QP1vaF/qoOoTBXHPASYDi3HJe2FmO+pobt2RlBUxJF0hAgilkmQ+sAxpCisOQR058
	 rAIBf/hU7mmVDZi2gn8Ik0+Yc/jrD75aLWjNNQRrF1W6XRBxbiGTYTsI4HjC/LdrFE
	 s/P/zP/t+p4sFm/xjtW23cZZu9j6yFOfaUuQzi/0=
Date: Tue, 3 Feb 2026 16:09:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
	sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
	alim.akhtar@samsung.com, jingoohan1@gmail.com,
	p.zabel@pengutronix.de, hjc@rock-chips.com, heiko@sntech.de,
	andy.yan@rock-chips.com, dianders@chromium.org,
	m.szyprowski@samsung.com, jani.nikula@intel.com,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v8 05/18] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
Message-ID: <20260203140945.GC12013@killaraus>
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-6-damon.ding@rock-chips.com>
 <DG2S064XPGXL.1MQDAKWZEK50K@bootlin.com>
 <7256ecf9-b10b-428c-a1a6-e35e80a686ed@rock-chips.com>
 <9e1da672-a52d-4ec3-a20a-fe6f8ca15496@rock-chips.com>
 <DG58VCQ54OZA.2QHGR8JFIATY2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DG58VCQ54OZA.2QHGR8JFIATY2@bootlin.com>

On Tue, Feb 03, 2026 at 11:11:50AM +0100, Luca Ceresoli wrote:
> On Tue Feb 3, 2026 at 2:31 AM CET, Damon Ding wrote:
> > On 2/2/2026 10:54 AM, Damon Ding wrote:
> >> On 1/31/2026 8:33 PM, Luca Ceresoli wrote:
> >>> On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
> >>>> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
> >>>> out of imx/ subdir for multi-platform use. The driver is also renamed
> >>>> to make it more generic and suitable for platforms other than i.MX.
> >>>>
> >>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> >>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>>
> >>>> ---
> >>>>
> >>>> Changes in v7:
> >>>> - Rename legacy-bridge to of-display-mode-bridge.
> >>>> - Remove unnecessary API drm_bridge_is_legacy().
> >>>
> >>> ...
> >>>
> >>>> --- a/drivers/gpu/drm/bridge/Kconfig
> >>>> +++ b/drivers/gpu/drm/bridge/Kconfig
> >>>> @@ -244,6 +244,16 @@ config DRM_NXP_PTN3460
> >>>>       help
> >>>>         NXP PTN3460 eDP-LVDS bridge chip driver.
> >>>>
> >>>> +config DRM_OF_DISPLAY_MODE_BRIDGE
> >>>> +    tristate
> >>>> +    depends on DRM_BRIDGE && OF
> >>>> +    help
> >>>> +      This is a DRM bridge implementation that uses
> >>>> of_get_drm_display_mode
> >>>> +      to acquire display mode.
> >>>> +
> >>>> +      Newer designs should not use this bridge and should use proper
> >>>> panel
> >>>> +      driver instead.
> >>>
> >>> "Newer designs should not use this bridge", but in patch 8 you are
> >>> introducing a new use ot devm_drm_of_display_mode_bridge(). Shouldn't you
> >>> instead "use proper panel driver instead" in patch 8?
> >>>
> >>> Can you point to the conversation where the converstaion where Dmitry
> >>> suggested this change? Maybe it already contains the answer to my
> >>> qustion. Also adding a link to that conversation in the commit message
> >>> woule be useful.
> >>>
> >>
> >> First of all, thanks for your reviews on this patch series.
> >>
> >> link: https://lore.kernel.org/all/
> >> xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22/
> >>
> >> I think it may be a misleading issue caused by directly copying the
> >> previous Kconfig description. Now that the new
> >> devm_drm_of_display_mode_bridge() helper has been added, drivers using
> >> the panel-bridge framework can rely on it to maintain compatibility with
> >> legacy display mode parsing.
> 
> Ah, I think I got the point: the mode description in device tree is legacy,
> but the driver itself is not legacy and will be current until we need to
> support legacy device tree. Correct?
> 
> If that's correct, this patch looks OK to me with a new Kconfig help text.

The devm_drm_of_display_mode_bridge() function needs documentation
though, with a warning that tells it must not be used in new drivers.
Catching new users in checkpatch.pl (or somewhere else) would be ideal.

I would also not create a separate module for this and move the function
to drm_bridge.c, but I don't mind that much if the consensus is that a
separate module is better.

> >> It would be better to update the comment as follows:
> >>
> >> This is a DRM bridge implementation that uses of_get_drm_display_mode to
> >> acquire display mode.
> >>
> >> It exists for compatibility with legacy display mode parsing, in order
> >> to conform to the panel-bridge framework.
> >>
> >
> > Dmitry, what's you take on this?
> 
> Dmitry's opinion would be much more relevant than mine. I don't know much
> myself about this driver.

-- 
Regards,

Laurent Pinchart
