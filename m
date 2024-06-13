Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C1A57CB9
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jun 2024 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718262943; cv=none; b=Wxk1adn13BHJ+KAAhIiGGf/UiiyPvl12YSnafY6YBKAqDZiT9zfM+tH0wPOM7qh7+eSQQ0r8RnXaTPC9PCmq9Ukg5U+BN2YfJfVWmGqu810Kr0a2wSmIS6V+UhotgieYe8cJ4B58Rb1uRzqjeNRHwtXVj8lA5oODXw7iMAEQh0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718262943; c=relaxed/simple;
	bh=86SiUaK7umXo0q9XlMNvDC0EA+anrmucsKIX31UwYqg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uU0bK1PeKhNCaz39pbffbDvUZLS9zpNfE9DsonZzZjGm49tDHHJesBLrk5CYiWTSaLAnGpTvvIK2bpYIBajRssqU5o260nrkFGgFcPlTS51BZoUPQVYxBdFMzf+rw/NExyN3FxcxzS8a0pOZ8rAy2VqdQrRxU14BoxSJmHtf2D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlbhVNyL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlbhVNyL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718262941; x=1749798941;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=86SiUaK7umXo0q9XlMNvDC0EA+anrmucsKIX31UwYqg=;
  b=YlbhVNyLps54F0mGtSbJb5GPU7147rIipl9wlZZlUf8om/ZpBbi/H3iF
   haMlQV61PaswmQbNHQVEETvtkdXc4A1yun0bvK3+6F8k72QKxZAU6F8HM
   u8TEcrZwvWfVD5d671M1m5HU/aKXVXqjufcOZPIOkwawBPohAumf4e5HC
   P6SYMSPzxOlcDDUhIpevM28innNDGPOHIFU7UCpo/oefO5AFF/QuCYf0S
   DOgG0K4P51LrTtn39rUixSv7p4ycleG5wBznIjRYEl86JuLHMwwSXBved
   gPXluY1ng+PjLKzRR1Eziorgr3GRkHFkYTe76gl9M6cv2HKPpS1Y3dZjS
   Q==;
X-CSE-ConnectionGUID: vTQE/ulgRcCMb5t+CWxKyw==
X-CSE-MsgGUID: k3rTruspQ46aDvEcmEanvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="26465959"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="26465959"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 00:15:28 -0700
X-CSE-ConnectionGUID: P844oO/hQ6eUOKxjKr+nYg==
X-CSE-MsgGUID: FY0jzUReTNKGmfdBWQP2PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="71251354"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.112])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 00:15:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Inki Dae <daeinki@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 04/11] drm/exynos: hdmi: convert to struct drm_edid
In-Reply-To: <CAAQKjZNhUzyUO4rjPZGGrp=0MsTdQvT2ij3bVV91oDcYjk9EDg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1715691257.git.jani.nikula@intel.com>
 <2fe0b4deb4f2ab255735cd6e1a657a17e0d45784.1715691257.git.jani.nikula@intel.com>
 <CAAQKjZNhUzyUO4rjPZGGrp=0MsTdQvT2ij3bVV91oDcYjk9EDg@mail.gmail.com>
Date: Thu, 13 Jun 2024 10:15:20 +0300
Message-ID: <87wmmtia9j.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Jun 2024, Inki Dae <daeinki@gmail.com> wrote:
> Hi, Jani Nikula,
>
> Thanks for your contribution and sorry for being late. Below are my comme=
nts.
>
> 2024=EB=85=84 5=EC=9B=94 14=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:57,=
 Jani Nikula <jani.nikula@intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>>
>> Prefer the struct drm_edid based functions for reading the EDID and
>> updating the connector.
>>
>> The functional change is that the CEC physical address gets invalidated
>> when the EDID could not be read.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> ---
>>
>> Cc: Inki Dae <inki.dae@samsung.com>
>> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
>> Cc: Kyungmin Park <kyungmin.park@samsung.com>
>> Cc: Krzysztof Kozlowski <krzk@kernel.org>
>> Cc: Alim Akhtar <alim.akhtar@samsung.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-samsung-soc@vger.kernel.org
>> ---
>>  drivers/gpu/drm/exynos/exynos_hdmi.c | 23 +++++++++++++----------
>>  1 file changed, 13 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exyn=
os/exynos_hdmi.c
>> index e968824a4c72..9033e8b66816 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> @@ -883,27 +883,30 @@ static const struct drm_connector_funcs hdmi_conne=
ctor_funcs =3D {
>>  static int hdmi_get_modes(struct drm_connector *connector)
>>  {
>>         struct hdmi_context *hdata =3D connector_to_hdmi(connector);
>> -       struct edid *edid;
>> +       const struct drm_display_info *info =3D &connector->display_info;
>> +       const struct drm_edid *drm_edid;
>>         int ret;
>>
>>         if (!hdata->ddc_adpt)
>>                 return 0;
>>
>> -       edid =3D drm_get_edid(connector, hdata->ddc_adpt);
>> -       if (!edid)
>> +       drm_edid =3D drm_edid_read_ddc(connector, hdata->ddc_adpt);
>
> drm_edid_read_ddc function can return NULL for an error. Could you add
> an exception handling?

If it returns NULL, the below code intentionally passes NULL to
drm_edid_connector_update() to reset the EDID. After that,
cec_notifier_set_phys_addr() also resets the source physical
address. And !drm_edid is handled after that.

>
>> +
>> +       drm_edid_connector_update(connector, drm_edid);
>
> Ditto. drm_edid_connector_update function can return a negative value
> for an error.

Okay.cg

>
>> +
>> +       cec_notifier_set_phys_addr(hdata->notifier, info->source_physica=
l_address);
>> +
>> +       if (!drm_edid)
>>                 return 0;
>>
>> -       hdata->dvi_mode =3D !connector->display_info.is_hdmi;
>> +       hdata->dvi_mode =3D !info->is_hdmi;
>
> Above change wouldn't be related to this patch.

Yeah, reuses info which is for info->source_physical_address which would
be too long otherwise. Can add another intermediate patch for that.

>
>>         DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
>>                           (hdata->dvi_mode ? "dvi monitor" : "hdmi monit=
or"),
>> -                         edid->width_cm, edid->height_cm);
>> -
>> -       drm_connector_update_edid_property(connector, edid);
>> -       cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
>> +                         info->width_mm / 10, info->height_mm / 10);
>
> The purpose of this patch would be to replace edid with drm_edid so
> how about updating the above change like below?
>     drm_edid->edid->width_cm, erm_edid->edid->height_cm);

struct drm_edid is an opaque type and drm_edid->edid is not available
for drivers to look at.

BR,
Jani.

>
> Thanks,
> Inki Dae
>
>>
>> -       ret =3D drm_add_edid_modes(connector, edid);
>> +       ret =3D drm_edid_connector_add_modes(connector);
>>
>> -       kfree(edid);
>> +       drm_edid_free(drm_edid);
>>
>>         return ret;
>>  }
>> --
>> 2.39.2
>>
>>

--=20
Jani Nikula, Intel
