From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH V4 00/10] drm: exynos: few patches to enhance bridge chip support
Date: Mon, 23 Jun 2014 18:15:02 +0200
Message-ID: <CABxcv=mH4Z_Gm6Owj-2idQGc71R8wr1_VbMFHMZOiHUXP+4Xcg@mail.gmail.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
	<CAEC9eQOp0jiZC-XqqQX7S7Dbu-_bi2unpVU2P4zAQ7VmopD27A@mail.gmail.com>
	<CAAQKjZPHc2KfmNyfchP68BJiPUFyAO_keCHMBc1YuYTj_J0kVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:36122 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755244AbaFWQPG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 12:15:06 -0400
Received: by mail-we0-f176.google.com with SMTP id u56so7379463wes.35
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jun 2014 09:15:03 -0700 (PDT)
In-Reply-To: <CAAQKjZPHc2KfmNyfchP68BJiPUFyAO_keCHMBc1YuYTj_J0kVQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>

Hello,

On Fri, Jun 20, 2014 at 5:51 PM, Inki Dae <inki.dae@samsung.com> wrote:
> 2014-06-20 17:06 GMT+09:00 Ajay kumar <ajaynumb@gmail.com>:
>> ping.
>
> I will have a review soon but I'm afraid that I cannot have a test yet
> because I have no any board with panel based on eDP and LVDS so wait
> for until I get a board.
> Otherwise, can anyone give me tested-by? and I'd happy to give me
> reviewed-by so that I can pick this patch series up.
>
> Thanks,
> Inki Dae
>

I've also tested this series on an Exynos5420 Peach pit board and LVDS
display was working for me.

Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier

>>
>> On Wed, Jun 11, 2014 at 11:56 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
>>> This series is based on exynos-drm-next branch of Inki Dae's tree at:
>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>>>
>>> I have tested this after adding few DT changes for exynos5250-snow,
>>> exynos5420-peach-pit and exynos5800-peach-pi boards.
>>>
>>> This patchset also consolidates various inputs from the drm community
>>> regarding the bridge chaining concept:
>>> (1) [RFC V2 0/3] drm/bridge: panel and chaining
>>>         http://www.spinics.net/lists/linux-samsung-soc/msg30160.html
>>> (2) [RFC V3 0/3] drm/bridge: panel and chaining
>>>         http://www.spinics.net/lists/linux-samsung-soc/msg30507.html
>>>
>>> Changes since V2:
>>>         -- Address comments from Jingoo Han for ps8622 driver
>>>         -- Address comments from Daniel, Rob and Thierry regarding
>>>            bridge chaining
>>>         -- Address comments from Thierry regarding the names for
>>>            new drm_panel functions
>>>
>>> Changes since V3:
>>>         -- Remove hotplug based initialization of exynos_dp
>>>         -- Make exynos_dp work directly with drm_panel, remove
>>>            dependency on panel_binder
>>>         -- Minor cleanups in panel_binder and panel_lvds driver
>>>
>>> The following patches can be divided into 2 groups:
>>>         patches 1 to 4: add drm_panel support to exynos_dp(peach-pi)
>>>         patches 5 to 10: chaining of bridges and drm_panel(snow and peach-pit)
>>>
>>> Ajay Kumar (8):
>>>   [PATCH V4 1/10] drm/exynos: Move DP setup out of hotplug workqueue
>>>   [PATCH V4 2/10] drm/panel: add prepare and unprepare routines
>>>   [PATCH V4 3/10] drm/exynos: dp: modify driver to support drm_panel
>>>   [PATCH V4 4/10] drm/panel: Add driver for lvds/edp based panels
>>>   [PATCH V4 5/10] drm/bridge: add helper functions to support bridge chain
>>>   [PATCH V4 6/10] drm/bridge: Add a driver which binds drm_bridge with drm_panel
>>>   [PATCH V4 7/10] drm/bridge: ptn3460: Support bridge chaining
>>>   [PATCH V4 8/10] drm/exynos: dp: create bridge chain using ptn3460 and
>>>                   panel_binder
>>>
>>> Vincent Palatin (1):
>>>   [PATCH V4 9/10] drm/bridge: Add ps8622/ps8625 bridge driver
>>>
>>> Rahul Sharma (1):
>>>   [PATCH V4 10/10] drm/exynos: Add ps8622 lvds bridge discovery to DP driver
>>>
>>>  .../devicetree/bindings/drm/bridge/ps8622.txt      |   21 +
>>>  .../devicetree/bindings/panel/panel-lvds.txt       |   50 +++
>>>  .../devicetree/bindings/video/exynos_dp.txt        |    2 +
>>>  drivers/gpu/drm/bridge/Kconfig                     |   15 +
>>>  drivers/gpu/drm/bridge/Makefile                    |    2 +
>>>  drivers/gpu/drm/bridge/panel_binder.c              |  193 ++++++++
>>>  drivers/gpu/drm/bridge/ps8622.c                    |  475 ++++++++++++++++++++
>>>  drivers/gpu/drm/bridge/ptn3460.c                   |  136 +-----
>>>  drivers/gpu/drm/exynos/Kconfig                     |    1 +
>>>  drivers/gpu/drm/exynos/exynos_dp_core.c            |   87 +++-
>>>  drivers/gpu/drm/exynos/exynos_dp_core.h            |    2 +
>>>  drivers/gpu/drm/panel/Kconfig                      |   10 +
>>>  drivers/gpu/drm/panel/Makefile                     |    1 +
>>>  drivers/gpu/drm/panel/panel-lvds.c                 |  262 +++++++++++
>>>  include/drm/bridge/panel_binder.h                  |   44 ++
>>>  include/drm/bridge/ps8622.h                        |   41 ++
>>>  include/drm/bridge/ptn3460.h                       |   15 +-
>>>  include/drm/drm_crtc.h                             |   72 +++
>>>  include/drm/drm_panel.h                            |   18 +
>>>  19 files changed, 1309 insertions(+), 138 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/drm/bridge/ps8622.txt
>>>  create mode 100644 Documentation/devicetree/bindings/panel/panel-lvds.txt
>>>  create mode 100644 drivers/gpu/drm/bridge/panel_binder.c
>>>  create mode 100644 drivers/gpu/drm/bridge/ps8622.c
>>>  create mode 100644 drivers/gpu/drm/panel/panel-lvds.c
>>>  create mode 100644 include/drm/bridge/panel_binder.h
>>>  create mode 100644 include/drm/bridge/ps8622.h
>>>
>>> --
>>> 1.7.9.5
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
