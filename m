From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH V8 00/14] drm/exynos: few patches to enhance bridge chip
 support
Date: Fri, 12 Dec 2014 10:51:50 +0100
Message-ID: <548ABAB6.6010200@collabora.co.uk>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com> <CAEC9eQOrKw2Z1q-ztFfadXmsL3CTcAkkv9kcS2QnDOAVSh2AuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:33815 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965582AbaLLJwA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Dec 2014 04:52:00 -0500
In-Reply-To: <CAEC9eQOrKw2Z1q-ztFfadXmsL3CTcAkkv9kcS2QnDOAVSh2AuQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Sean Paul <seanpaul@google.com>, Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Hello,

On 11/18/2014 07:20 AM, Ajay kumar wrote:
> On Sat, Nov 15, 2014 at 3:24 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
>> This series is based on master branch of Linus tree at:
>> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>

This series has been in the mailing lists for months and have been tested
by many people. What else is missing before it can be merged?

It would be great to have proper display support on platforms that have a
eDP to LVDS bridge chip (e.g: Snow, Peach Pit and Spring Chromebooks) and
everything is in place but this series which had been missing many kernel
releases already.

>>
>> Changes since V7:
>>         -- Address comments from Tomi and Laurent:
>>                 -- Use videoports and endpoints to represent the connection between
>>                    encoder, bridge and the panel, instead of using phandles.
>>         -- Address comments from Daniel:
>>                 -- Make the patch description more descriptive.
>>                 -- remove device pointer from drm_bridge, and just use
>>                    device_node instead.
>>                 -- don't pass encoder pointer to bridge_attach.
>>         -- Address comments from Sean Paul:
>>                 -- Remove bridge from mode_config, and pull out drm_bridge
>>                    functions from drm_crtc.c to drm_bridge.c
>>

Tomi and Laurent,

You asked Ajay to change his series to use the video port and enpoints DT
bindings instead of phandles, could you please review his latest version?

I guess is now too late for 3.19 since we are in the middle of the merge
window but it would be great if this series can at least made it to 3.20.

Thanks a lot and best regards,
Javier
