From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration
 to module init
Date: Wed, 19 Nov 2014 11:09:29 +0100
Message-ID: <546C6C59.8060306@collabora.co.uk>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>	<7hh9xwxsev.fsf@deeprootsystems.com> <20141118202836.GB23031@joana> <7h4mtwxh2p.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:59524 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753988AbaKSKJf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 05:09:35 -0500
In-Reply-To: <7h4mtwxh2p.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>, Gustavo Padovan <gustavo@padovan.org>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hello Kevin,

On 11/18/2014 11:46 PM, Kevin Hilman wrote:
>>> Is anyone at Samsung testing linux-next?  If so, on what platforms?  It
>>> would really be nice if your linux-next work was tested on these
>>> publically-available 542x/5800 platforms (peach-pi, peach-pit,
>>> odroid-xu3) which would also allow lots of others to help you test and
>>> validate.
>>
>> It would also be good to add drm-exynos-next to the daily linux-next build.
>> Currently drm-exynos-next is ahead of linux-next. This patch from Javier for
>> example only applies on linux-next.
> 
> Which tree is the drm-exynos-next branch in?
> 

It is in Inki Dae's drm-exynos tree:

git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

Best regards,
Javier
