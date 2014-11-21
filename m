From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration
 to module init
Date: Fri, 21 Nov 2014 12:19:30 +0100
Message-ID: <546F1FC2.8060905@collabora.co.uk>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>	<546DF598.6030701@samsung.com>	<546DFA97.1030006@collabora.co.uk>	<546E0364.9000009@samsung.com>	<546E0836.8000604@collabora.co.uk> <CAAQKjZOGn5+tvLWmBi2QU47+h3-AYCpk8XRQWrJeQL=5Oga2aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:34242 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750734AbaKULTh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 06:19:37 -0500
In-Reply-To: <CAAQKjZOGn5+tvLWmBi2QU47+h3-AYCpk8XRQWrJeQL=5Oga2aQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Kevin Hilman <khilman@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hello Inki,

On 11/20/2014 06:01 PM, Inki Dae wrote:
> Ah, sorry. There was my misunderstanding. drm-next already is merged
> to linux-next so I think we can do the integration test if
> exynos-drm-next is merged to drm-next earlier. Anyway, I will try to
> consider your opinion.
> 

Cool, having exynos-drm-next in linux-next will be very useful indeed.

BTW, I didn't have time to forward port $subject yesterday but Gustavo
did and posted a series [0] that supersedes $subjects and also solves
other issues. It would be great if you can take a loot to those patches.

Best regards,
Javier

[0]: http://www.spinics.net/lists/linux-samsung-soc/msg39306.html
