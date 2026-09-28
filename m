Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D5D377AB9
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618972; cv=none; b=uWf2wSJegszJb2/cFzBj66bpHk7vudpzefu8LFYsVFfG8rqJS8Hy1xYSO2Q6Eh8EfK6teswGy+eiU4LHe2axmyBArHaVku98/tXKRNS7tx+D08OVqbIdT+AZMI+2Iu1x8NV/sdQ2ZETTyIqxw87um006sTbLQfcBsk2p/ct7xBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618972; c=relaxed/simple;
	bh=IJl8ZLVeSLK/3tm4qT2HpxIpgkaGExTUeW/aig9VFu8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=plXADwQ5E+/qN1cL0dedGKedfcr7Fi+D2RbZgYMA6QPqwpu6LtQ5FYZsVVSmcSWmT1ZLsSHOyTsKIf5adi+/YtDV33IoE+KOyDmB6nMSJW1JvzPd04CFsX+8in5orWTy3eOjlBQBlKZ/ZnWrhRBVe78iHruzG12dyGU+hG7Q3RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PJhbHkIR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PYFbVzmm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PJhbHkIR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PYFbVzmm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790618969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
	b=PJhbHkIRBFID5cswJ92776vll2KD9fgt0nDXJiPT4OZ0f/SvgmDkX8UF87Anx6/UkrWjPP
	5fzw94ZOd6SAHBX8zdIdHM+amGsRhWyLrT6KKRv9c8ZVZev/4ilzX8ghONdSJyg4rG8uGk
	ohi3QePa1nJcfZw2sf5/pvMfBxfM0ZE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-3KGmCbszPGGO_i2XYkBpRQ-1; Mon, 28 Sep 2026 14:09:28 -0400
X-MC-Unique: 3KGmCbszPGGO_i2XYkBpRQ-1
X-Mimecast-MFC-AGG-ID: 3KGmCbszPGGO_i2XYkBpRQ_1790618967
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e7631c43aso34555915e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 11:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790618967; x=1791223767; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
        b=PYFbVzmmvZVGu/BkEygo6A2l/I0inpwH16sicqv/jgL8kEyBqZBILrYckSlQswYwiE
         n9DSKJordvyihg7YUPiR1aJO3+eGeSnXZxDznkw2o+4URA1bUudncN4zynoFiI4GOVbJ
         oLUsXRR2HEb7FP+KWcWE/PdX9WOmclUFC/ANinFByD720twiuaFqh3/h4qU5YRmMqh7z
         dq3IUVcB0BkeEzksBsvq+Ki8x4sYpZdNfvWGGyGp/t+VFT1/0xGo8ptIqcCxt7PJl9Be
         YipQYntnPiPoVuD89Ed+vGA76K6FyG1v8Mxo4z/ZGWT+MPUWoiB7fPvEJlczVqMA84Zi
         Kc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618967; x=1791223767;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
        b=e2V2iCnEl4JjchJ+T9riELr2qHBoeE079SUnaGrb2s80zf7nkOu3hPkYtAwBz4zjce
         XPZ262cLVKGk6y1CVGhI7pRHT9gcXSFzFwFApY6ukyhWb0g38SM2KdjCJVOy0nbCglQ8
         INlZ3k+LwYZiW0haPHh3oVYyuavVVzHEpN4IzcIhyB4lEysZIoj1JDY8j//hGbiWgzoT
         gSYW9+QOQugX45BFhKU1qDG8oDe7oncFQpjEMxvaXHOiNv5m7wsWZ2++GvrHtktbr/hD
         wjRg02uqcL2F7lPdVpogUJ8x/9YVE6P5C7MB1UC5ih5HqgRHF4Bw/MptY68Wmmme+MK8
         Vx6g==
X-Forwarded-Encrypted: i=1; AKwUvBy5vr5bnFlGFgDNyUW+nVEm2NDmwqqZZRL6fxjAlAnpVjTvAVu3tCICocYW/ce0rQ3iw20P6pi5Pt2rmbrt7nva6A==@vger.kernel.org
X-Gm-Message-State: AFuF++mvwqmnpahpkuAZwv4CAr8GBp8bsM0JXQtZyxG+aBSJnyqHomP/
	XbQUxqt0iDU0KP12HSaIY1diNL95TlewoVcAR80WGpIZbzq2VVrjWqTHvLWx28w41koGU/8Zw20
	Cc4TgSilyt5fhJ6LUvaFJSfuRim+evAIc6f4AVMQGOGx2unyUG6GfENXSUnv+3qbO0H2zQKuo
X-Gm-Gg: AYBFou39s35vehmKriUHtoVdp0QiVnEmlwgGL9h30cr/X9L/17d7lIgGnbHRMDuiVjH
	KIicRUxnHVAqEAyoeu66bvQ+84xhxigRSDj5oijgjX5axgiO6oGohyYMVcNjBWeC/02nWyjlMni
	fUF5fX56ppOOz4diStfyVTTzoFH3z+t6CuSp2k4LvarnS+JjTpgrz9WjVD1A3LW6ImF/PPTtvdS
	mNnNAC+Jg9jlHzqyBQ4Vx/Erh7d8qoXfULe1xmi391Fl0QOPVknaihlF7BVpHOKry0PkcRdLYMj
	c0nvY+rr1om7vyM/3p95QnvBvgjXWhv1A3C31mWQNO0tSONO5u1Hu02vJAg+S1HoZZXDpn3TNN5
	r7QiWKbdmUwEZutSzJnUEs1n2Qg3wlcVoyisnTBPIGYnPdEKb54qEb7PIljYFq+QHEg==
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fe66f4c7dmr231739815e9.18.1790618966869;
        Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fe66f4c7dmr231739375e9.18.1790618966445;
        Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d10cb7dsm3533065e9.0.2026.09.28.11.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:09:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, Alexander.Deucher@amd.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, sashiko-reviews@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 1/2] drm/fbdev: Move fbdev module parameters next to
 module init
In-Reply-To: <20260928080323.23909-2-tzimmermann@suse.de>
References: <20260928080323.23909-1-tzimmermann@suse.de>
 <20260928080323.23909-2-tzimmermann@suse.de>
Date: Mon, 28 Sep 2026 20:09:23 +0200
Message-ID: <xlv133utfdt8.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Define the parameters for fbdev emulation in the source file with the
> module-initialization and exit code of drm_kms_helper.ko. The parameters
> control some aspects of DRM's fbdev emulation. Common usage looks like
>
>   drm_kms_helper.drm_fbdev_overalloc=200
>
> on the kernel's command line. This has been possible for many years
> and changing it would likely upset users.
>
> The emulation code is supposed to be moved into the module for DRM
> clients. Keeping the parameters in drm_kms_helper.ko avoids breaking
> systems the use them in the way described above.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

