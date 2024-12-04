Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097BB18C018;
	Wed,  4 Dec 2024 07:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733298151; cv=none; b=qiemF0TQmyUvIVk6xjT5P3ZhZ3Nbo9mP4AKWnkqz8/JMOZ4mATZvvHLFdQTdVSxTOcHF+74uiLKdWHBwaN8LPJeOrMNUhTpUCZ14mKeldEb7XuBSNxPaqAPX77vWoW6cN+dTfIy9KXJd0tP1TzgkRYWnzN8DmrNvyX0KPAXWX4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733298151; c=relaxed/simple;
	bh=gK06+f1C0mBtgYKTZ09XhG1sOVFjumSjIgGeM6ZwmU0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GZClMp0tx6sIPHEQcBs8F153OVyjIMwwV1NU6uPAAuFDJnLn+eNUFWkaUyIRPWqVdAfD2FBs9Nvs2K0Gd5D1EfGLp5t+og0NagWCi9pMnZwnrsLDNNxTsiGoWp6k96fYwAd3LE1Q5QNbCPjibCtXss3XcaYfrZ7/4WGYSWMCMMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYXYyHz8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYXYyHz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733298149; x=1764834149;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=gK06+f1C0mBtgYKTZ09XhG1sOVFjumSjIgGeM6ZwmU0=;
  b=WYXYyHz84iIAWp+m5AF+h6hqgYlBcYtnR3lhBO8Svs2Gy7FRIZX1pUxV
   U+8KT8bQZjrv243Mc+MeV4WgWomtPVnmQond4UfuJtJAfcfnFKhM4RrED
   3Pl5snha1HBn9MJZ54K076ikIAN+S4081km3jOoWE0zVZTY5sAY/IRYft
   FaJeFJyw/h6DfHRD1GCYy57ZvPmF5ZMi09cxwZ9tygwTuhqO3zLTx+q6x
   bcCx9iwxkhN8RELFM+ziN3pytCJGCrpoLMUdFsZcqeA5MLDx4ngUF+Xby
   eaQcPEXd3gubhUn/v6zC+JB77dWWbHNuqumfr5UL0O5vPZ4+JYKxvhkde
   w==;
X-CSE-ConnectionGUID: pyF0pVkGRp+r4bkz/8RDpw==
X-CSE-MsgGUID: rGb5/4BoQLuTKXHR/equxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="21132182"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="21132182"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:42:27 -0800
X-CSE-ConnectionGUID: ztyXjIeiR26vOG8EeEOB9Q==
X-CSE-MsgGUID: MiRNI+71Qr6pKR5u1cWLig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="131139278"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost) ([10.245.246.205])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:42:14 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Phong LE
 <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy
 Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 7/9] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_update_edid()
In-Reply-To: <txzri7x4pdeakx4juandk3hfhsbx3dhlulxfuehqlmrr7b3wpw@jaunqktsro6x>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-7-b5316e82f61a@linaro.org>
 <87a5dc4zd5.fsf@intel.com>
 <txzri7x4pdeakx4juandk3hfhsbx3dhlulxfuehqlmrr7b3wpw@jaunqktsro6x>
Date: Wed, 04 Dec 2024 09:42:11 +0200
Message-ID: <87v7vz3ne4.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 04 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Tue, Dec 03, 2024 at 04:25:58PM +0200, Jani Nikula wrote:
>> On Sun, 01 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>> > +	drm_edid = drm_bridge_edid_read(bridge, connector);
>> > +	if (!drm_edid_valid(drm_edid)) {
>> 
>> What's the case this check is for?
>> 
>> My preference would be that bridge->funcs->edid_read() uses
>> drm_edid_read*() family of functions that do the checks and return the
>> EDID.
>> 
>> There are some cases that just allocate a blob and return it. Would be
>> nice if they could be converted, but in the mean time could use
>> drm_edid_valid() right there. Additional validity checks are redundant.
>
> This was c&p from drm_bridge_connector_get_modes_edid(). If you think
> that the check is redundant, could you please send a patch dropping the
> check?

Mmmh. It's just scary to *remove* them, and that's the reason I didn't
want you to add one in the first place! :)

BR,
Jani.


-- 
Jani Nikula, Intel
