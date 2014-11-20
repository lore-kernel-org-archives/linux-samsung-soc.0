From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration
 to module init
Date: Thu, 20 Nov 2014 15:28:39 +0100
Message-ID: <546DFA97.1030006@collabora.co.uk>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk> <546DF598.6030701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:33051 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103AbaKTO2p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 09:28:45 -0500
In-Reply-To: <546DF598.6030701@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Kevin Hilman <khilman@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hello Inki,

On 11/20/2014 03:07 PM, Inki Dae wrote:
> Could you re-base this patch on top of exynos-drm-next? I tried to
> separate sub drivers into independent drivers but it seems that we need
> more times. So I will merge your patch.
> 

Sure, I'll rebase on top of exynos-drm-next and re-post so you can apply it.

BTW, it would be great if exynos-drm-next is pulled in linux-next. That is
what most people use to test integration issues so you can catch earlier any
regression that may arise.

You have to email Stephen Rothwell <sfr@canb.auug.org.au> and point to your
tree and branch and he will be able to add it to linux-next.

> Thanks,
> Inki Dae
> 

Best regards,
Javier
