From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 0/3] Fix power domains handling on exynos542x
Date: Fri, 06 Feb 2015 10:18:57 +0100
Message-ID: <54D48701.10105@collabora.co.uk>
References: <1423139739-19881-1-git-send-email-a.hajda@samsung.com> <54D381F4.2080701@collabora.co.uk> <54D450B6.6010409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54D450B6.6010409@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Liquid.Acid@gmx.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Joonyoung,

On 02/06/2015 06:27 AM, Joonyoung Shim wrote:
> On 02/05/2015 11:45 PM, Javier Martinez Canillas wrote:
>> 
>> I also tested on an Exynos5420 Peach Pit Chromebook and both the "Power
>> domain power-domain disable failed" message and the system crash are gone.
>> 
> 
> Really gone out "Power domain power-domain disable failed" message?
> 
> Still i get the message from second try,
> 
> # modetest -M exynos -s 23@21:1920x1080
> setting mode 1920x1080@XR24 on connectors 23, crtc 21
> 
> # modetest -M exynos -s 23@21:1920x1080
> setting mode 1920x1080@XR24 on connectors 23, crtc 21
> 
> [   39.608881] Power domain power-domain disable failed
> # modetest -M exynos -s 23@21:1920x1080
> setting mode 1920x1080@XR24 on connectors 23, crtc 21
> 
> [   42.827637] Power domain power-domain disable failed
> ...
>

You are right, I tested that if I execute:

# for val in 1 0; do echo $val > /sys/class/drm/card0/device/graphics/fb0/blank; done

many times I see the "Power domain power-domain disable failed" message
again and there is no output in the HDMI display when dpms on.

But even in that case, the imprecise external abort does not happen when the
exynos_mixer driver tries to access the mixer registers and the system does
not crash anymore.

So I think that Andrzej's patches are at least a step in the right direction.
 
Best regards,
Javier
