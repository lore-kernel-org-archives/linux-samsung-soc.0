From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH V8 00/14] drm/exynos: few patches to enhance bridge chip
 support
Date: Wed, 19 Nov 2014 10:51:49 +0100
Message-ID: <546C6835.7040802@collabora.co.uk>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>	<CAEC9eQOrKw2Z1q-ztFfadXmsL3CTcAkkv9kcS2QnDOAVSh2AuQ@mail.gmail.com>	<546C646C.4060303@collabora.co.uk> <CAEC9eQPz_7QeL7EDorb-OxiTjcb1tVUDbEbzbER4Yu2wSNNaxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:59493 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753542AbaKSJv4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 04:51:56 -0500
In-Reply-To: <CAEC9eQPz_7QeL7EDorb-OxiTjcb1tVUDbEbzbER4Yu2wSNNaxQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Sean Paul <seanpaul@google.com>, Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>, gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hello Ajay,

On 11/19/2014 10:38 AM, Ajay kumar wrote:
> Hi Javier,
> 
> In the cover letter, I have mentioned that it is tested on Linus tree:
> 
> "This series is based on master branch of Linus tree at:
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
> 
> Kindly test the patches with that.
> 

That's what I did... Linus' master branch is a moving target and if you
look at his current HEAD, it is commit fc14f9c1 ("Linux 3.18-rc5") but
as I said before, at least two patches that are needed didn't land in
Linus' tree yet. These are:

0ef76ae ("ARM: exynos_defconfig: Enable options for display panel support")
e35e305 ("drm/panel: simple: Add AUO B116XW03 panel support")

IOW, linux.git master branch + this series is not enough to have display
working AFAICT so I was wondering if I'm missing something else.

Do you have a public tree somewhere with the branch you are using to test?

Best regards,
Javier
