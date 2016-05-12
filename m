From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 1/4] drm: add generic zpos property
Date: Thu, 12 May 2016 15:25:29 -0400
Message-ID: <CABxcv=n7x11umV6Vky17u+9307sbG8gdJhQsK2qztC1ogHuOMw@mail.gmail.com>
References: <1463048902-9388-1-git-send-email-benjamin.gaignard@linaro.org>
	<20160512133607.GW27098@phenom.ffwll.local>
	<1638804.ANJKIQ8pGq@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:32964 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752943AbcELTZa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 May 2016 15:25:30 -0400
Received: by mail-io0-f195.google.com with SMTP id x35so11904318ioi.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 May 2016 12:25:29 -0700 (PDT)
In-Reply-To: <1638804.ANJKIQ8pGq@avalon>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linaro-mm-sig@lists.linaro.org, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Ville Syrjala <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Vincent Abriou <vincent.abriou@st.com>, Fabien Dessenne <fabien.dessenne@st.com>

>
> And please update the subject as well to include the version number. You can
> use
>
> $ git format-patch --cover --subject-prefix 'PATCH vX'
>

And git even has a -v option now, so this could just be:

$ git format-patch --cover -vX

Best regards,
Javier
