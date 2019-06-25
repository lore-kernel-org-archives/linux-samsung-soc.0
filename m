From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 0/2] Associate ddc adapters with connectors
Date: Tue, 25 Jun 2019 11:16:55 +0100
Message-ID: <20190625101655.n246vbwtupb4eoyz@shell.armlinux.org.uk>
References: <cover.1561452052.git.andrzej.p@collabora.com>
 <20190625100351.52ddptvb2gizaepi@shell.armlinux.org.uk>
 <817ccfba-754c-6a28-8d75-63f70605fd43@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <817ccfba-754c-6a28-8d75-63f70605fd43@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jun 25, 2019 at 12:14:27PM +0200, Andrzej Pietrasiewicz wrote:
> Hi Russell,
> 
> W dniu 25.06.2019 o 12:03, Russell King - ARM Linux admin pisze:
> > On Tue, Jun 25, 2019 at 11:46:34AM +0200, Andrzej Pietrasiewicz wrote:
> > > It is difficult for a user to know which of the i2c adapters is for which
> > > drm connector. This series addresses this problem.
> > > 
> > > The idea is to have a symbolic link in connector's sysfs directory, e.g.:
> > > 
> > > ls -l /sys/class/drm/card0-HDMI-A-1/i2c-2
> > > lrwxrwxrwx 1 root root 0 Jun 24 10:42 /sys/class/drm/card0-HDMI-A-1/i2c-2 \
> > > 	-> ../../../../soc/13880000.i2c/i2c-2
> > 
> > Don't you want the symlink name to be "i2c" or something fixed, rather
> > than the name of the i2c adapter?  Otherwise, you seem to be encumbering
> > userspace with searching the directory to try and find the symlink.
> > 
> 
> Thank you for your comment. So you imagine something on the lines of:
> 
> lrwxrwxrwx 1 root root 0 Jun 24 10:42 /sys/class/drm/card0-HDMI-A-1/ddc \
>  	-> ../../../../soc/13880000.i2c/i2c-2
> 
> ?

Exactly.

> This makes sense to me, I will send a v2.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
