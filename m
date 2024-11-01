Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89789155324;
	Fri,  1 Nov 2024 10:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730458797; cv=none; b=Og58lJ24CBp5QK2oZm3lZxxu48zS2LuUj0kZ7EH5fxTiL2Wsalo1dSky2laNlnrkQcJGAjWr4Gk8Uf/rHS2fQLAx0sbiGiE7eD+6oOn5Xy5GRaYIoAb3Q/1GT6PonwKLHAVWgYfOen4TLWqVDFpjVr1+xKUDKr9LVME8KpoCVdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730458797; c=relaxed/simple;
	bh=ue70Ww36EcBDEZaGYurD6rsjfoEbrn4L9zEF9CmzN+A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D/BsunXOChYEnzM+4kMq6bh6LkXMq0ZC2bW5LTY+2VG9TzvWFNg9feINEPpfnRy2pZjL8KeX7CnKTJTZ3zfujdBuYHTVhDQQmweDMx2HKs4PJ/ol0jToyImmx6Fp5L3L/kpYt1whFD3m5FsbNc8HLzX+KkjMXnxJ9Tp4Fk4Tugs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUNeavb4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUNeavb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730458795; x=1761994795;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ue70Ww36EcBDEZaGYurD6rsjfoEbrn4L9zEF9CmzN+A=;
  b=VUNeavb4S59HV0KiWDIiQlOXKlxVqTifUWNjtfhc1EF8qVN2LOMWsa/x
   NfQgTAYeoRsOex2GHISzDm2XrokS++gpkJu6NSnGRxuCkecv+/6ZBatxR
   KnxrviVS9Zvs2BIggzJJQLHnh2zdzULs6U7lW5v7HY44jY6/nvpzbC+26
   1lC9z7t6+6LOtJKebff7UiAxZVW7RW4c5ZIO6Uh68/qPCzhaTS3R4eZJY
   EKLcAqUWK8M9JRbtx28ljPZpM2P+j3LQc7WkP45oL5l4aCUVx51GxVD1n
   X5w5Qgdiw88eIQvEg6pa3NscnyPfeUDl8k+EcGZS5iKyjsERjvDbkiPDq
   A==;
X-CSE-ConnectionGUID: Jxw9JT2BQVuDdWmA2rImWQ==
X-CSE-MsgGUID: NeoSFPoeQvS0XKMxLOfsfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29651789"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="29651789"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:59:53 -0700
X-CSE-ConnectionGUID: 6ur4aUqYSmO1fR4NBhLZlw==
X-CSE-MsgGUID: tT97F7GiSFm1AAgVezXLiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83365995"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.234])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:59:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Phong LE <ple@baylibre.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King
 <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy
 Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH RFC v2 6/7] drm/display/hdmi: implement connector update
 functions
In-Reply-To: <20241101-drm-bridge-hdmi-connector-v2-6-739ef9addf9e@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
 <20241101-drm-bridge-hdmi-connector-v2-6-739ef9addf9e@linaro.org>
Date: Fri, 01 Nov 2024 12:59:38 +0200
Message-ID: <871pzvjk2t.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 01 Nov 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> The HDMI Connectors need to perform a variety of tasks when the HDMI
> connector state changes. Such tasks include setting or invalidating CEC
> address, notifying HDMI codec driver, updating scrambler data, etc.
>
> Implementing such tasks in a driver-specific callbacks is error prone.
> Start implementing the generic helper function (currently handling only
> the HDMI Codec framework) to be used by driver utilizing HDMI Connector
> framework.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 56 +++++++++++++++++++++++++
>  include/drm/display/drm_hdmi_state_helper.h     |  4 ++
>  2 files changed, 60 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index feb7a3a759811aed70c679be8704072093e2a79b..dc9d0cc162b2197dcbadda26686a9c5652e74107 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -748,3 +748,59 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
> +
> +/**
> + * __drm_atomic_helper_connector_hdmi_update_edid - Update the HDMI Connector basing on passed EDID
> + * @connector: A pointer to the HDMI connector
> + * @drm_edid: EDID to process
> + *
> + * This function should be called as a part of the .detect() / .detect_ctx()
> + * and .force() callbacks, updating the HDMI-specific connector's data. The
> + * function consumes passed EDID, there is no need to free it afterwards. Most
> + * of the drivers should be able to use
> + * @drm_atomic_helper_connector_hdmi_update() instead.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int
> +__drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
> +					       const struct drm_edid *drm_edid)
> +{
> +	drm_edid_connector_update(connector, drm_edid);
> +	drm_edid_free(drm_edid);

Not fond of splitting resource management responsibilities
asymmetrically like this.

> +
> +	if (!drm_edid) {
> +		drm_connector_hdmi_codec_plugged_notify(connector, false);

Is it a good idea to tie connection status to EDID presence at the
helper level? Nearly the same, but still orthogonal.

> +
> +		// TODO: also handle CEC and scramber, HDMI sink disconnected.
> +
> +		return 0;
> +	}
> +
> +	drm_connector_hdmi_codec_plugged_notify(connector, true);
> +
> +	// TODO: also handle CEC and scramber, HDMI sink is now connected.
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_update_edid);

Feels wrong to export and document double underscored functions to
actually be used.

> +
> +/**
> + * drm_atomic_helper_connector_hdmi_update - Update the HDMI Connector after reading the EDID
> + * @connector: A pointer to the HDMI connector
> + *
> + * This function should be called as a part of the .detect() / .detect_ctx()
> + * and .force() callbacks, updating the HDMI-specific connector's data.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int
> +drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector)
> +{
> +	const struct drm_edid *drm_edid = drm_edid_read(connector);
> +
> +	return __drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update);
> diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
> index 2d45fcfa461985065a5e5ad67eddc0b1c556d526..ea0980aa25cbbfdd36f44201888c139b0ee943da 100644
> --- a/include/drm/display/drm_hdmi_state_helper.h
> +++ b/include/drm/display/drm_hdmi_state_helper.h
> @@ -20,4 +20,8 @@ int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector
>  int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
>  						       struct drm_atomic_state *state);
>  
> +int __drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
> +						   const struct drm_edid *drm_edid);
> +int drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector);
> +
>  #endif // DRM_HDMI_STATE_HELPER_H_

-- 
Jani Nikula, Intel
