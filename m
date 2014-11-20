From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration
 to module init
Date: Thu, 20 Nov 2014 16:26:46 +0100
Message-ID: <546E0836.8000604@collabora.co.uk>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk> <546DF598.6030701@samsung.com> <546DFA97.1030006@collabora.co.uk> <546E0364.9000009@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:33129 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103AbaKTP0v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 10:26:51 -0500
In-Reply-To: <546E0364.9000009@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Kevin Hilman <khilman@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hello Inki,

On 11/20/2014 04:06 PM, Inki Dae wrote:
>> BTW, it would be great if exynos-drm-next is pulled in linux-next. That is
>> what most people use to test integration issues so you can catch earlier any
>> regression that may arise.
>> 
>> You have to email Stephen Rothwell <sfr@canb.auug.org.au> and point to your
>> tree and branch and he will be able to add it to linux-next.
> 
> Thanks for information. Actually, I received a similar email privately
> before. However, exynos-drm-next should go to drm-next first and than to
> mainline by Dave who is DRM subsystem maintainer. I think all vendor
> specific drm drivers would need to be checked by drm subsystem
> maintainer because these changes might be affect drm subsystem or other
> vendor specific drm drivers before go to mainline.
>

This is orthogonal to the normal upstreaming path. linux-next is an integration
tree that is created daily. So all the remote branches are merged and a git tag
published. The branch does not get rebased and history is not preserved between
two published linux-next tags.

This is just to test the integration of different subsystems to be sure that a
commit in one tree does not cause a regression in another one so issues can be
spot earlier. For example in the case of $subject, a change in the OF caused a
regression in the Exynos DRM driver.
 
> If needed, I will make a new branch, which is based on top of linux-next
> so other people can check their systems.
>

You don't really need another branch, git will take care of merge everything
in linux-next :)
 
> Thanks,
> Inki Dae
> 

Best regards,
Javier
