From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 0/2] Associate ddc adapters with connectors
Date: Tue, 25 Jun 2019 15:10:32 +0100
Message-ID: <20190625141032.5jiy2oekb3olaejd@shell.armlinux.org.uk>
References: <cover.1561452052.git.andrzej.p@collabora.com>
 <20190625100351.52ddptvb2gizaepi@shell.armlinux.org.uk>
 <817ccfba-754c-6a28-8d75-63f70605fd43@collabora.com>
 <20190625133639.GA16031@arch-x1c3>
 <20190625140755.GT12905@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190625140755.GT12905@phenom.ffwll.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Emil Velikov <emil.velikov@collabora.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, kernel@collabora.com, Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jun 25, 2019 at 04:07:55PM +0200, Daniel Vetter wrote:
> Otherwise I like this. Biggest problem I'm seeing here is rolling this out
> everywhere, this is a lot of work. And without widespread adoptions it's
> not terribly useful for userspace.

There will be cases where it's not possible, because the I2C bus is
hidden behind a chip that doesn't give you direct access to the DDC
bus.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
