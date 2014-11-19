From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH V8 00/14] drm/exynos: few patches to enhance bridge chip
 support
Date: Wed, 19 Nov 2014 12:20:53 +0100
Message-ID: <546C7D15.10605@collabora.co.uk>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com> <CAEC9eQOrKw2Z1q-ztFfadXmsL3CTcAkkv9kcS2QnDOAVSh2AuQ@mail.gmail.com> <546C646C.4060303@collabora.co.uk> <20141119105527.GA5396@luxor.wired.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:59624 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750960AbaKSLVF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 06:21:05 -0500
In-Reply-To: <20141119105527.GA5396@luxor.wired.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Sean Paul <seanpaul@google.com>, Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>, gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hello Paolo,

On 11/19/2014 11:55 AM, Paolo Pisati wrote:
> to get a working framebuffer out of linus 318rc4 on my peach pi, i had
> to cherry pick these 3 patches:
> 
> arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy

I was missing this patch, I've display working now. Thanks for the pointer!

If someone else is interested, I've pushed a branch [0] with 3.18-rc5 + all
the needed patches.

Ajay, feel free to add to your series:

Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier

[0]: git://git.collabora.co.uk/git/user/javier/linux.git wip/exynos/dp-integ
