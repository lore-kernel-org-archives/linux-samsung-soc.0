From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH V4 00/10] drm: exynos: few patches to enhance bridge chip
 support
Date: Mon, 23 Jun 2014 19:28:04 +0530
Message-ID: <CAPdUM4Mpo_9A_+4k9ctcXKnctKOdgxkEH4Sv0TO-4Y8dZ8aiow@mail.gmail.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
 <CAEC9eQOp0jiZC-XqqQX7S7Dbu-_bi2unpVU2P4zAQ7VmopD27A@mail.gmail.com>
 <CAAQKjZPHc2KfmNyfchP68BJiPUFyAO_keCHMBc1YuYTj_J0kVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAAQKjZPHc2KfmNyfchP68BJiPUFyAO_keCHMBc1YuYTj_J0kVQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay kumar <ajaynumb@gmail.com>, =?ISO-8859-1?Q?St=E9phane_Marchesin?= <marcheu@chromium.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Ajay, Inki,

I tested this series for Exynos5420 based peach-pit board,
Exynos5800 based Peach-pi board and Exynos5250 based
Snow board. I verified with the chrome test environment and
able to see upto Login Screen. DPMS on/off functionality and
S2R is also working fine for Display. therefore:

Tested-by: Rahul Sharma <rahul.sharma@samsung.com>

Regards,
Rahul Sharma.

On 20 June 2014 21:21, Inki Dae <inki.dae@samsung.com> wrote:
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
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
