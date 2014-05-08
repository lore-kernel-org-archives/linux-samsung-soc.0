From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC V2 0/3] drm/bridge: panel and chaining
Date: Thu, 08 May 2014 08:41:00 +0200
Message-ID: <536B26FC.507@samsung.com>
References: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: daniel.vetter@ffwll.ch, joshi@samsung.com, ajaynumb@gmail.com, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 05/05/2014 09:52 PM, Ajay Kumar wrote:
> This patchset is based on exynos-drm-next-todo branch of Inki Dae's tree at:
> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
> 
> I have just put up Rob's and Sean's idea of chaining up the bridges
> in code, and have implemented basic panel controls as a chained bridge.
> This works well with ptn3460 bridge chip on exynos5250-snow board.
> 
> Still need to make use of standard list calls and figure out proper way
> of deleting the bridge chain. So, this is just a rough version.

As I understand this patchset tries to solve two things:
1. Implement panel as drm_bridge, to ease support for hardware chains:
Crtc -> Encoder -> Bridge -> Panel
2. Add support to drm_bridge chaining, to allow software chains:
drm_crtc -> drm_encoder -> drm_bridge -> drm_bridge,panel

It is done using Russian doll schema, ops from the bridge calls the same
ops from the next bridge and the next bridge ops can do the same.

This schema means that all the bridges including the last one are seen
from the drm core point of view as a one big drm_bridge. Additionally in
this particular case, the first bridge (ptn3460) implements connector
so it is hard to guess what is the location of the 2nd bridge in video
stream chain, sometimes it is after the connector, sometimes before.
All this is quite confusing.

But if you look at the bridge from upstream video interface point of
view it is just a panel, edp panel in case of ptn3460, ie ptn3460 on its
video input side acts as a panel. On the output side it expects a panel,
lvds panel in this case.

So why not implement ptn3460 bridge as drm_panel which internally uses
another drm_panel. With this approach everything fits much better.
You do not need those (pre|post)_(enable|disable) calls, you do not need
to implement connector in the bridge and you have a driver following
linux driver model. And no single bit changed in drm core.

I have implemented this way DSI/LVDS bridge, it was sent as RFC [1][2].
It was not accepted as Inki preferred drm_bridge but as I see the
problems with drm_bridges I have decide to attract attention to much
more cleaner solution.

[1]: http://permalink.gmane.org/gmane.linux.drivers.devicetree/61559
[2]: http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/27044

Regards
Andrzej


> 
> Ajay Kumar (3):
>   [RFC V2 1/3] drm: implement chaining of drm bridges
>   [RFC V2 2/3] drm/bridge: add a dummy panel driver to support lvds bridges
>   [RFC V2 3/3] drm/bridge: ptn3460: support bridge chaining
> 
>  .../bindings/drm/bridge/bridge_panel.txt           |  45 ++++
>  drivers/gpu/drm/bridge/Kconfig                     |   6 +
>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>  drivers/gpu/drm/bridge/bridge_panel.c              | 240 +++++++++++++++++++++
>  drivers/gpu/drm/bridge/ptn3460.c                   |  21 +-
>  drivers/gpu/drm/drm_crtc.c                         |  13 +-
>  include/drm/bridge/bridge_panel.h                  |  37 ++++
>  include/drm/drm_crtc.h                             |   2 +
>  8 files changed, 360 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt
>  create mode 100644 drivers/gpu/drm/bridge/bridge_panel.c
>  create mode 100644 include/drm/bridge/bridge_panel.h
> 
