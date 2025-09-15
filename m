Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2935822D4FF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 03:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757907719; cv=none; b=kRUUXOP1DafoSVh48RfxHgrklSejeGmz7P8HdUQKJJb0zPmOmmZQZqW369fadVAYh6oGlCSQYMpQuMTIdCjG5GIXgSBcDjjWeOjH8M15jSdhuOiTieJ9HZ79/o6jZ7Uh7+WJQVzNX6AwBZca3ENSHb001lc/j6PHY1S12etXPac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757907719; c=relaxed/simple;
	bh=/zTUcZn7NzD3ckRvD3MPlU1/DCx/44y0tweUchu8two=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KY5aOoK0O2+wL/0TJB9D93ML3zNOGyhkUKHvNlMuuf0cb4ByFSVeyGKooTN9Sy1dq6cGYxPCF+eEJx0LdIGhJdO93/FUbhEpOHw+qnOWSaD6nyMoNPWOFUBKRrZubfBSlH8C4E3oSC4+YR8RvDCjsslxd/KWMZAdhsC0eXi9EyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ncuv8p2b; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ncuv8p2b"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b07d4d24d09so379851666b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 20:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757907716; x=1758512516; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RBcrzXcJywxMgHMPsR2Yuv2hoXzKHdj6vn06NKKyqo0=;
        b=Ncuv8p2b/SKR8/Rdpwbt4tDaQPo6D+G5GRH0gaWWKRu5i7GZExZJ2sw42SdhN0bx3x
         49KLnuUYSa3FBqW8js8dJg3pxkMdkYTWKHRMwYfAuKEXro2XQIz11ah+/fDIFBSKJ3Ik
         SIVMUOZfUdLHcu+2TsoR2IZTMTBxEBZdz2Ng8F/NFhpO4PJby0JMM0mmYtcQxASNYs/D
         vcrMz9E03dVxiTmxeadYQieLXOdMlZyChEqmaV5mNhDkcZfUWn/RwPGC8w7MMAblEgYL
         aCXlGiV48B1R4tIEQoMZSA5sGSTcMF83t288tDD+ef2JoTXKjk3mtcCR1u0R7T/HywGx
         zsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757907716; x=1758512516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBcrzXcJywxMgHMPsR2Yuv2hoXzKHdj6vn06NKKyqo0=;
        b=b/+r9ANiOwotcMBswE10xOLmgKuNH8AIZQ57NhNKxSm2dey+GlopjsbbVamKKJebQ4
         9V6iaJKASYcO6L0sOH/dspN3Y76qulKB25h9AXmkuI5c/wyUL1IRbHV8neuk7RVg7z82
         JbSM/KhtCwJVDGbwzu53Rx3mSJ69ghSGZg8Fr69c/w64o6gQ2qOueJIwMHoy4yK+PWbp
         UJrn0AQQNXCWCheRW4ONm7g53qwV65m3TK89qJyOeFVFlGEqgLDLGXYVNxyYLI74OgiU
         Fu90wZbXRVmn6Z569T1uJdFhgywpyfGWBaCIPVuDEZyfVQUU14ZqDCXkmKC2B/O+m5/R
         ncXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPs7iCHXsYiPq8rgHbGq9WKvZ4ryLPib51eQa3NdypbEDSA9HpsXTX7MZjmnbAHymSpkOrC/Nz5YdaHAFypNHdUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL5/EUHYkiaeTNZ2fW6/fB4zWK3VWratl1AkOEj0XLKYGmULr9
	CzolLOxm74+cGrtwhcYVrHOFHk0pcjT6bP7cJsWpTdmEuOrppdtELa6OyViFpbhghZJ8e4ZlfJi
	ODwblzexJoTfiRD85ball5rurFdHMTdRyhaXt
X-Gm-Gg: ASbGncteqyIInBZYhnmE5HfXzluaNMuMK/2nNOCwIJIP/0wzbsyS+02bO0E1eDPHI6w
	A7W/WgiGY6gtdhHLH0n7AqsevDo/x0XxGyhszNRcKkFrLCJnminnqEKBp9QfeqWwnmP5j4znenc
	KsX55co4a6+4oM05ptHSxGbs0aCBaO8v53fWf99veOK5XPvlHuJozVCYt8nTDDA9a/xBuxo9/NH
	2KWpZczK4E/0k7r
X-Google-Smtp-Source: AGHT+IFKMMiQj/EmVbLhBhpf7bD4rE+j6QNew2p++ITSee+6uicU7xqOB08bfh4j/viBhaH8QlYrqM57nANgt8PcVxY=
X-Received: by 2002:a17:906:4ec1:b0:b07:b311:3b90 with SMTP id
 a640c23a62f3a-b07e3fb4087mr586042566b.45.1757907716243; Sun, 14 Sep 2025
 20:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250914031522.33155-1-inki.dae@samsung.com>
In-Reply-To: <20250914031522.33155-1-inki.dae@samsung.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 15 Sep 2025 13:41:44 +1000
X-Gm-Features: Ac12FXz1FF4b7hOxjjzBTbz6jFWwkCq2xvlOvTCad4mE280oDrZv-SH3k4C7vzs
Message-ID: <CAPM=9txNEQXDU6rKHxTVXej7fxgrbbd_X+emHejwA4a7s9aoaw@mail.gmail.com>
Subject: Re: [GIT PULL] drm-misc-next
To: Inki Dae <inki.dae@samsung.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <dev@lankhorst.se>
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Inki,

I've already gotten the last drm-misc-next pull for 6.18 in my tree,
there are some patches being pulled in that might be for 6.19? or do
we want to get another drm-misc-next pull into 6.18?

Dave.

On Sun, 14 Sept 2025 at 13:15, Inki Dae <inki.dae@samsung.com> wrote:
>
> Hi Dave and Daniel,
>
>    Add DSIM bridge drvier support for Exynos7870 SoC.
>
> Please kindly let me know if there is any problem.
>
> Thanks,
> Inki Dae
>
> The following changes since commit c08c931060c7e44452e635e115913dd88214848c:
>
>   drm/gem/shmem: Extract drm_gem_shmem_release() from drm_gem_shmem_free() (2025-09-12 19:04:37 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-misc-next-for-v6.18
>
> for you to fetch changes up to 17308ab685acba947fb35e52fada2b97f346b8cd:
>
>   drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge (2025-09-14 11:53:09 +0900)
>
> ----------------------------------------------------------------
> New feature
> Add DSIM bridge driver support for Exynos7870
> . Introduces Exynos7870 DSIM IP block support in the samsung-dsim bridge driver.
> Document Exynos7870 DSIM compatible in dt-bindings
> . Adds exynos7870 compatible string and required clocks in device tree schema.
>
> ----------------------------------------------------------------
> Kaustabh Chakraborty (12):
>       drm/bridge: samsung-dsim: support separate LINK and DPHY status registers
>       drm/bridge: samsung-dsim: add SFRCTRL register
>       drm/bridge: samsung-dsim: add flag to control header FIFO wait
>       drm/bridge: samsung-dsim: allow configuring bits and offsets of CLKCTRL register
>       drm/bridge: samsung-dsim: allow configuring the MAIN_VSA offset
>       drm/bridge: samsung-dsim: allow configuring the VIDEO_MODE bit
>       drm/bridge: samsung-dsim: allow configuring PLL_M and PLL_S offsets
>       drm/bridge: samsung-dsim: allow configuring the PLL_STABLE bit
>       drm/bridge: samsung-dsim: increase timeout value for PLL_STABLE
>       drm/bridge: samsung-dsim: add ability to define clock names for every variant
>       dt-bindings: samsung,mipi-dsim: document exynos7870 DSIM compatible
>       drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge
>
>  .../bindings/display/bridge/samsung,mipi-dsim.yaml |  27 ++
>  drivers/gpu/drm/bridge/samsung-dsim.c              | 353 ++++++++++++++++-----
>  include/drm/bridge/samsung-dsim.h                  |  16 +-
>  3 files changed, 308 insertions(+), 88 deletions(-)
