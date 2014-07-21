From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V5 00/12] drm/exynos: few patches to enhance bridge chip support
Date: Mon, 21 Jul 2014 17:03:22 +0530
Message-ID: <CAEC9eQNmFYYrcW6xK1a_i4p3fONhjEGCEh+P0s0kurMn_A_zHw@mail.gmail.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
	<53CCC668.8090602@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f172.google.com ([209.85.220.172]:48319 "EHLO
	mail-vc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754157AbaGULdX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jul 2014 07:33:23 -0400
Received: by mail-vc0-f172.google.com with SMTP id im17so11929706vcb.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2014 04:33:22 -0700 (PDT)
In-Reply-To: <53CCC668.8090602@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>, "cpgs ." <cpgs@samsung.com>

Hi Inki,

On Mon, Jul 21, 2014 at 1:21 PM, Inki Dae <inki.dae@samsung.com> wrote:
> On 2014=EB=85=84 07=EC=9B=94 18=EC=9D=BC 05:43, Ajay Kumar wrote:
>> This series is based on exynos-drm-next branch of Inki Dae's tree at=
:
>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>>
>> This patchset also consolidates various inputs from the drm communit=
y
>> regarding the bridge chaining concept:
>> (1) [RFC V2 0/3] drm/bridge: panel and chaining
>>       http://www.spinics.net/lists/linux-samsung-soc/msg30160.html
>> (2) [RFC V3 0/3] drm/bridge: panel and chaining
>>       http://www.spinics.net/lists/linux-samsung-soc/msg30507.html
>>
>> I have tested this after adding few DT changes for exynos5250-snow,
>> exynos5420-peach-pit and exynos5800-peach-pi boards.
>>
>> The V4 series of this particular patchset was also tested by:
>> Rahul Sharma <rahul.sharma@samsung.com>
>> Javier Martinez Canillas <javier@dowhile0.org>
>>
>> Changes since V2:
>>       -- Address comments from Jingoo Han for ps8622 driver
>>       -- Address comments from Daniel, Rob and Thierry regarding
>>          bridge chaining
>>       -- Address comments from Thierry regarding the names for
>>          new drm_panel functions
>>
>> Changes since V3:
>>       -- Remove hotplug based initialization of exynos_dp
>>       -- Make exynos_dp work directly with drm_panel, remove
>>          dependency on panel_binder
>>       -- Minor cleanups in panel_binder and panel_lvds driver
>>
>> Changes since V4:
>>       -- Use gpiod interface for panel-lvds and ps8622 drivers.
>>       -- Address comments from Javier.
>>       -- Fix compilation issues when PANEL_BINDER is selected as mod=
ule.
>>       -- Split Documentation patches from driver patches.
>>       -- Rebase on top of the tree.
>
> Hi Ajay,
>
> Thanks for your contribution.
>
> I am reviewing your patch series. Sorry for late. Below is my comment=
=2E
>
> How about using graph concept to bind eDP, LVDS bridge, and Panel? Yo=
ur
> patch tries to bind bridge driver using find_bridge function, and thi=
s
> function tries to find bridge device node directly using
> of_find_compatible_node() again, which in turn make eDP driver to add
> all codes related to all bridge devices including all relevant bridge
> headers: i.e., if there are five bridge devices then eDP driver shoul=
d
> try to find all of them. That is really not good.
I agree.

> So my opinion is to define the relationship between eDP, LVDS, and Pa=
nel
> using graph concept: eDP context would have panel and bridge object
> according to graph definition of device tree.
>
> As a result, eDP context has already bridge_chain object for lvds bri=
dge
> device and panel_binder->bridge object in exynos_drm_attach_lcd_bridg=
e
> function context so it can add bridge_chain object  to
> panel_binder->bridge as is there. I think lvds bridge device drivers
> could follow Linux driver model with this approach.
Sorry, I didn't quite understand the graph concept. Already Thierry sug=
gested
of having a common repository for list of supported bridges. That way, =
we can
move out bridge detection stuff from exynos_dp to a common file.

Ajay

> Rob, it seems to need at least your ACK so that I can merge this patc=
h
> series to exynos-drm-next.
>
> Thanks,
> Inki Dae
>
>>
>> Ajay Kumar (9):
>>   [RESEND PATCH V5 01/12] drm/exynos: Move DP setup out of hotplug w=
orkqueue
>>   [RESEND PATCH V5 02/12] drm/panel: add prepare and unprepare routi=
nes
>>   [RESEND PATCH V5 03/12] drm/exynos: dp: modify driver to support d=
rm_panel
>>   [PATCH V5 04/12] drm/panel: Add driver for lvds/edp based panels
>>   [PATCH V5 05/12] Documentation: Add DT bindings for panel-lvds dri=
ver
>>   [RESEND PATCH V5 06/12] drm/bridge: add helper functions to suppor=
t bridge chain
>>   [PATCH V5 07/12] drm/bridge: Add a driver which binds drm_bridge w=
ith drm_panel
>>   [RESEND PATCH V5 08/12] drm/bridge: ptn3460: Support bridge chaini=
ng
>>   [RESEND PATCH V5 09/12] drm/exynos: dp: create bridge chain using =
ptn3460 and panel_binder
>>
>> Vincent Palatin (2):
>>   [PATCH V5 10/12] Documentation: Add DT bindings for ps8622/ps8625 =
bridge driver
>>   [PATCH V5 11/12] drm/bridge: Add ps8622/ps8625 bridge driver
>>
>> Rahul Sharma (1):
>>   [RESEND PATCH V5 12/12] drm/exynos: Add ps8622 lvds bridge discove=
ry to DP driver
>>
>>  .../devicetree/bindings/drm/bridge/ps8622.txt      |   21 +
>>  .../devicetree/bindings/panel/panel-lvds.txt       |   50 ++
>>  .../devicetree/bindings/video/exynos_dp.txt        |    2 +
>>  drivers/gpu/drm/bridge/Kconfig                     |   15 +
>>  drivers/gpu/drm/bridge/Makefile                    |    2 +
>>  drivers/gpu/drm/bridge/panel_binder.c              |  193 ++++++++
>>  drivers/gpu/drm/bridge/ps8622.c                    |  476 +++++++++=
+++++++++++
>>  drivers/gpu/drm/bridge/ptn3460.c                   |  137 +-----
>>  drivers/gpu/drm/exynos/Kconfig                     |    1 +
>>  drivers/gpu/drm/exynos/exynos_dp_core.c            |   87 +++-
>>  drivers/gpu/drm/exynos/exynos_dp_core.h            |    2 +
>>  drivers/gpu/drm/panel/Kconfig                      |   10 +
>>  drivers/gpu/drm/panel/Makefile                     |    1 +
>>  drivers/gpu/drm/panel/panel-lvds.c                 |  268 +++++++++=
++
>>  include/drm/bridge/panel_binder.h                  |   44 ++
>>  include/drm/bridge/ps8622.h                        |   41 ++
>>  include/drm/bridge/ptn3460.h                       |   15 +-
>>  include/drm/drm_crtc.h                             |   72 +++
>>  include/drm/drm_panel.h                            |   18 +
>>  19 files changed, 1316 insertions(+), 139 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/drm/bridge/ps8=
622.txt
>>  create mode 100644 Documentation/devicetree/bindings/panel/panel-lv=
ds.txt
>>  create mode 100644 drivers/gpu/drm/bridge/panel_binder.c
>>  create mode 100644 drivers/gpu/drm/bridge/ps8622.c
>>  create mode 100644 drivers/gpu/drm/panel/panel-lvds.c
>>  create mode 100644 include/drm/bridge/panel_binder.h
>>  create mode 100644 include/drm/bridge/ps8622.h
>>
>
