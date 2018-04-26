From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 00/24] device link, bridge supplier <-> drm device
Date: Fri, 27 Apr 2018 01:09:14 +0200
Message-ID: <8a9fcd8c-962d-1acc-c2ba-74a3d8f59590@axentia.se>
References: <20180426223139.16740-1-peda@axentia.se>
 <1881012.XPHlTWYXH6@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1881012.XPHlTWYXH6@avalon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, David Airlie <airlied@linux.ie>, Peter Senna Tschudin <peter.senna@collabora.com>, Martin Donnelly <martin.donnelly@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 2018-04-27 00:40, Laurent Pinchart wrote:
> Hi Peter,
> 
> Thank you for the patches.
> 
> On Friday, 27 April 2018 01:31:15 EEST Peter Rosin wrote:
>> Hi!
>>
>> It was noted by Russel King [1] that bridges (not using components)
>> might disappear unexpectedly if the owner of the bridge was unbound.
>> Jyri Sarha had previously noted the same thing with panels [2]. Jyri
>> came up with using device links to resolve the panel issue, which
>> was also my (independent) reaction to the note from Russel.
>>
>> This series builds up to the addition of that link in the last
>> patch, but in my opinion the other 23 patches do have merit on their
>> own.
>>
>> The last patch needs testing, while the others look trivial. That
>> said, I might have missed some subtlety.
> 
> I don't think this is the way to go. We have a real lifetime management 
> problem with bridges, and device links are just trying to hide the problem 
> under the carpet. They will further corner us by making a real fix much more 
> difficult to implement. I'll try to comment further in the next few days on 
> what I think a better solution would be, but in a nutshell I believe that 
> drm_bridge objects need to be refcounted, with a .release() operation to free 
> the bridge resources when the reference count drops to zero. This shouldn't be 
> difficult to implement and I'm willing to help.

Ok, sp 24/24 is dead, and maybe 23/24 too. But how do you feel about dropping
.of_node in favour of .owner? That gets rid of ugly #ifdefs...

I also have the nagging feeling that .driver_private serves very little real
purpose if there is a .owner so that you can do

	dev_get_drvdata(bridge->owner)

for the cases where the container_of macro is not appropriate.

Cheers,
Peter
