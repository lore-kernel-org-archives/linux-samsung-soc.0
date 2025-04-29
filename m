Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1576228A408
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 08:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916056; cv=none; b=PczGVFST3eTg1ssjgdzUwfUxB556KnqcKAXbtgJmO7Xnua5zNGdbmrMMO/HqMS0BCiV+eewNsfXfiRgN51GNGtjr8Z0lAGE/Hpp3RqiE1KbfxPPou9/gu2Au5qc0vEa66tfyy7qrovbBbSghNHt1q90By4qjb/TP41NbWWkQ84E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916056; c=relaxed/simple;
	bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UWScKWq6B2t6wY55tt0ITTvA0nHVq5hWtIvtS+ZIwFVj7/7Pn6EIj9JKM2hvaO7bkp6GQQSOn4UF7vgGAn2q6lDwvRZyXXy0wWZ5stspU5QoYoADtf3caJUBwjffQZiHzgy4EOvd97P+fJ2xMeks6NOHES50N84UFvd8OX2pNnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ansbdwJx; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ansbdwJx"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30ddad694c1so63175161fa.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916052; x=1746520852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
        b=ansbdwJxsueyefFM/ctUcCC6V8SAelIg4fyKH0DNmeisPkebKtqXUHrNQVqfENhfvo
         /+xit3qJOdMQNIxjRfKCjBsxY2jgxaKdC9yYi5qsMAbJn/zV1cYNMbu/w4+loB87L643
         DH0iVgtbCj6WQeJ0sbJ7sNEfSrSsGMP1adYk92DE/R/9ycX53FcJURUwQsxFhMD6m4Ai
         T+HRIAFJccEWJbCk8+vatZJzmsTisFrWvgBUure1gbQ0+JaJ9Of4s58IKYvHqEa8LScR
         UCmvWxEUobYTFF9R4MH7dqF8MXy9MWi4sSVnogYjOCJV9F0dCattldNwJT0oODZa8Tnd
         BmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916052; x=1746520852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
        b=GCFTeXVidDHhjbTJLKzghIyAgm1xfUjMHySl1SI4iDjLe/b7cz3SG3gqNvpJ9JWwGg
         +gW7nvRd6AAT0hU6cBjleePvn1JOCU4ZIEmakWxJ7gsQdRJR6kCsGxvxzHpkc67XHHet
         U4w93Q0WUIPdTmKKGXIO996d7cVpdWXhAuIm0uQU56QVI4SP0emqEMA9fQWxoQHliMMd
         xcTdwYnhvm4RWH6oo8R7zF8iAW8LTKjce9l4D8g2GzrVTPUelKE/8DIx33YIz/6XPHuB
         JB16fPOpqpqS7hngKBGkZFZ7OGjyjtySMNk+MgoGm1MQPqEFjVlNq82Tv6bXAvbnEaCy
         B32g==
X-Forwarded-Encrypted: i=1; AJvYcCVZyYZ6z/Tey3LTxLEknVmj06AWfUSnwc6GPulqy9r7cn4CIBpOtsW77Tu2eYf/9Q5Q1ZnMoGTC7GGH2ZIsJUE+4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3HzTFxgy2OrENMQKDq0jLCbo8PTKhDjt7H6AI5QXsXRegGP+S
	Z7rWw11izyrjPk3Qk9LLoQU76XDuSz568dxxThppDXOeGpw3/tixZ+ByueNr9WHxvzMrhcngSvl
	VWodAXhaQ8ZJ5Txxaxvn3n9DBN2yYDirYrF3fpw==
X-Gm-Gg: ASbGncsJlbxSHEnmf9jNOgP7I4O436DvykO+WySOfZxdR+HW1s4SRd01onqNA46rro8
	fNMPfYzNW9oTQZlGUUpvN7TaSRHyoPnfIGtDC+fRC0uAcMsNtM+A/CGPh+viPW2s1YLf5545oyX
	5RrRbsVUEfNEX51i8hiLo7vg==
X-Google-Smtp-Source: AGHT+IEUiqYB296CVrwZ+xxBw7BC+pTcJa/x+6Bu5GNB2EvNhnBwa7BLSUJNRUMp+Ehtf1mLBoE9JSmzpMhMYJBukms=
X-Received: by 2002:a2e:bc0b:0:b0:30d:894a:a538 with SMTP id
 38308e7fff4ca-31d34b6c243mr8766341fa.21.1745916052135; Tue, 29 Apr 2025
 01:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:40:41 +0200
X-Gm-Features: ATxdqUEhPh2HxY_cKMawBJnfuogL8n7jPhFvg8U9jTR5km8hYrNkb1VPdIYXtGQ
Message-ID: <CACRpkdZt8zem0hFUiq3-Z1feNZHRh3R=Y0cEtK=pVt=bJ9Qf1g@mail.gmail.com>
Subject: Re: [PATCH v2 15/34] drm/mcde: convert to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 9:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
