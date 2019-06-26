From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH 0/2] Associate ddc adapters with connectors
Date: Wed, 26 Jun 2019 08:50:47 +0200
Message-ID: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
References: <cover.1561452052.git.andrzej.p@collabora.com>
 <20190625100351.52ddptvb2gizaepi@shell.armlinux.org.uk>
 <817ccfba-754c-6a28-8d75-63f70605fd43@collabora.com>
 <20190625133639.GA16031@arch-x1c3>
 <20190625140755.GT12905@phenom.ffwll.local>
 <20190625141032.5jiy2oekb3olaejd@shell.armlinux.org.uk>
 <20190625142031.GV12905@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625142031.GV12905@phenom.ffwll.local>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Emil Velikov <emil.velikov@collabora.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, kernel@collabora.com, Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 25.06.2019 o 16:20, Daniel Vetter pisze:
> On Tue, Jun 25, 2019 at 03:10:32PM +0100, Russell King - ARM Linux admin wrote:
>> On Tue, Jun 25, 2019 at 04:07:55PM +0200, Daniel Vetter wrote:
>>> Otherwise I like this. Biggest problem I'm seeing here is rolling this out
>>> everywhere, this is a lot of work. And without widespread adoptions it's
>>> not terribly useful for userspace.
>>
>> There will be cases where it's not possible, because the I2C bus is
>> hidden behind a chip that doesn't give you direct access to the DDC
>> bus.
> 
> Oh sure, plus lots of connectors where there's just not ddc bus at all.
> But if we only roll this out for a handful of drivers it's also not great,
> that's what I meant. Looking at
> 
> $ git grep drm_do_get_edid
> 
> there's only very few drivers where the ddc bus is hidden. There's a lot
> more where it's not, and I think a big series to tackle those would serve
> extremely well to make a case for this sysfs link.
> -Daniel
> 

I will respond with a v3 then, including as many drivers as possible.
Those will be compile-tested only, though.

Andrzej
