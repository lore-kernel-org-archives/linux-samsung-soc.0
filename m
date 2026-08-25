Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628B132C94A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Aug 2026 18:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683203; cv=pass; b=JIK8i8V3KYwnAsLS3oTmiY4FLaYEnm1V42UYkT1v5PcBXtopVqYLpxo6RnDBpY1k/mxxPo+Xc476HkYhUVWsr0CdPl1y4yxszcD4MQsKSc5DhPJkawOI1/Wemh6GpUwvUet/uRj/rEFWAuIDUWI4MBKBfWETwuGIiJTw5jfoc0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683203; c=relaxed/simple;
	bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJRNvw1ta0SMid9Ow5nkcpcbodb7ySyCwVJDmvVMTMgUi3mR77r+3gPpKlSX+QYGEBENvCkoJL1GnuvTsgiuUL/Uej9p1vA++XodNBRnb774ZYPQeX6Spm5RkeQaKNgFR2u9LV+Ybf08cDPYqLpL35RUxwCxJ26fKZmLnuBskeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/WMQGl2; arc=pass smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/WMQGl2"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-45eb2e6402aso166185fac.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Aug 2026 11:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787683200; cv=none;
        d=google.com; s=arc-20260327;
        b=UF+jv0/1QyfzNGsgtr/6oN8meq9dHdLUTAbpfcM9WYNtwPxA2sQYBfVttnaG8iLTtn
         +M50oq2B46ugbHRJaC7ozE/98T+Sg2noTrDdipI947bJFhXAALedu++MrBqnlY3mZWv9
         CCsUbjPWA1ViTFSjehwwIVyCKR5zZB+hLtfZFHvLategsLcxya9ITvJF+g+f/jbyubJK
         HsLbnvpy8kzwKPc80eox1DMqX4FidVe65Sv/b/7kEXloSA/bOxfuih+SVNkTdI7ioM7Z
         Wl8/KSx0hQJ6qts7Rz8P+UfZPE87NapG3GzggkC3gLl95noK21nqf/1omx4Dm3TzLhPH
         2Grw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        fh=1HnnUKm3WAmxdJXp8FJNy/2ATvkICSMBsGIKTt95TkU=;
        b=BDwfG/uorN8Ug65G0Zy9nYyjexwbKTEq2J9pgg6YrFzTJHaf61kalk3rhyK4odPn+y
         FiFdLtM1yuk/ZHV6zRvZVC6C6G9YJEMNI9y5HAGVqYeY+yFoVgkXD5CipLAcya/IN2pV
         trVONvibrLd0jY8Y/hu/MNQadOsjDuG0Xg1MnKkwzICHkyVjynH3Qo+GPEGKEkIF/quK
         b6kzeSkEooGiaJgYMTJ3z8IuGO/TFQdNIjS9tvXnk8hijqqKIRRRUJmLI52oF7dYoK9x
         fckm3ciSGO+WkzySA8QBx/bIsnJsFojbqs3sfTRcjfdsMbxpEdslg7uCzaREBgSnr901
         6w4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787683200; x=1788288000; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        b=K/WMQGl2ZdGLQuaSQqD9iQu02BHFLpl/p3H3OZdZxR/bBDGQp5KNu2iVpg36hNlfhg
         WoQEFDr8krOgQIpMU0V3j280JREazubY2O2YsEF6z+07m5w9CIaqAAjBnkdEYRlQu+y+
         pD/XRWpuHfeGLjDfmy9Ig9pH50RXIICyAOcdw9XFFVtDZZriIcDMJqBqzBEo78Yg+k9E
         MhhuGygE6O/X7SL+/HsL9VQ6F6OsRGK/97YA9rz8erSo/DNvgtudBgbpEEnZlI/8GUMX
         21CmXKNzOwECkSY1y9d0pN1/DCKPfXzELHF+QyZeBKWFEePIAzj6Y9UzjhBWJQkC+VKU
         eAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683200; x=1788288000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        b=eoUsK5WvRXd2s2UO/uNcobLPEPexNyHd03VQ6b/pEzXLI+LLokwwzMvGeb1eyD6C0j
         1EUDxwu9Lmc9Wp0TIHXhW9V5uGA/jGsHZzIZ2XkmABy2wKTEoR7VU5JoEuv3FS+Z17Q/
         H7nKmQ0sJViYvifN7jmaxdl4BjspDK2WSf/EQtPigth8peKl91qqKpydLdZNor3/iMbT
         OJGifLWEonIEjtPPhtRg9diOmlL/ys/j0umqYSH0xzs+P/Zq42eGSU01x2IRQtPq87Hp
         BTGXrgq0enwFl36undqvRbGl9O6af6CCvsHT6DljausQOIr3VsKFtFGJy0RU6BinmoHC
         ubXg==
X-Forwarded-Encrypted: i=1; AHgh+RrHO/kQETTTrUjR1xKTXnWBO9q2EqbPT5uNSpTO31OKnmyB6AeCsKGy+wKTDutrMixuooe/+4Famvgfo/lnZRk74A==@vger.kernel.org
X-Gm-Message-State: AFuF++niN3XmcRArXJqj15aUDkvammcmQDmqjBpuYdUpmZFoSQ77if9O
	kSfsD9HNiNFD7dwNfGtijLgdlIgkGstVgjok841p14QvhUzYbTBrTs+Q6ufmg87X72VNa7buMyt
	9JL/BOXWF8/eZPvDFWoMfHZk3zoYCfbs=
X-Gm-Gg: AR+sD10Ih2FIwCu9U8csxIWde3G+oROqzBOmarcZgSLmByRIQiaWTHQz9fbYloaXVBX
	RhzFxHOYl0gqFAvZbcIeoxiJWrjlcllPyVCXgQKPODweZNfh+hHMf+iJ6sn56fGIqC+b2Ane2XI
	+IG1tRoRQ+baOxqunXyEkLd1V/MLn2tay0Ym8i1z3B/EW4Z0wg6f4fY7XdSHxKR9zHDGmZv8em1
	JpRrkclCRS2XJnQl1HmIdJyHJ1sof9Tivctu4M/AY+hQYngj/kk4kbL3NGQJeVOPQc9u+O2tvTv
	m46w/9EoZLUWKrf5tpI9qCNab1JcfGD+x0UzMtoI0LJ1hg==
X-Received: by 2002:a05:6870:f623:b0:435:16e9:f288 with SMTP id
 586e51a60fabf-4659bb24b93mr1602806fac.20.1787683200126; Tue, 25 Aug 2026
 11:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com> <e393996a-3ef1-4c43-b762-af8cd0f2a4b6@suse.de>
In-Reply-To: <e393996a-3ef1-4c43-b762-af8cd0f2a4b6@suse.de>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 25 Aug 2026 20:39:49 +0200
X-Gm-Features: AcwNN1Va3aTr02pKhzBqoinFUkwxjfSbh2WQ-EpZwUvKwCIdS5rdnwq9NOj-ZWw
Message-ID: <CAJpoHp56yo+eQAYjvR3ez=HTSzapCd3dYppo=MdPx-Lm4J4DQg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] drm/drm_simple: remove drm_simple_encoder_init
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, David Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey,

> Diogo, do you want to send out another revision? Otherwise it's time to
> get these patches merged.

I would keep them as is, unless you see anything that should really be
improved before merging.

Best regards,
Diogo
