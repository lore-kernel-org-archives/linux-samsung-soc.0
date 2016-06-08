From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v2 0/10] Add RK3399 eDP support and fix some bugs to
 analogix_dp driver.
Date: Wed, 8 Jun 2016 19:11:09 +0800
Message-ID: <5757FD4D.4000308@rock-chips.com>
References: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1783781447=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, emil.l.velikov@gmail.com, Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Mark Yao <yzq@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============1783781447==
Content-Type: multipart/alternative;
 boundary="------------080803000003000508060904"

This is a multi-part message in MIME format.
--------------080803000003000508060904
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Inki, Jingoo

Would you like to take a look at this patch-set :)

The first version[1] of this patch-set was sent at 'April 25, 2016', 
about one month ago, but i haven't got too much reviewed :(

But thanks to Javier, we can say this series works rightly both on 
Exynos platform and Rockchip platform. And Mark also have reviewed the 
Rockchip side code, so it would be very nice that i could get some 
reviewed/acked from Samsung before i start to prepare my pull request ;)

BR,
- Yakir

[1]: https://patchwork.freedesktop.org/patch/83406/


On 05/24/2016 01:01 PM, Yakir Yang wrote:
> Hi all,
>
> This series have been posted about one month, still no comments, help here :(
>
> RK3399 and RK3288 shared the same eDP IP controller, only some light
> difference with VOP configure and GRF configure.
>
> Also same misc fix to analogix_dp driver:
> - Hotplug invalid which report by Dan Carpenter
> - Make panel detect to an optional action
> - correct the register bit define error in ANALOGIX_DP_PLL_REG_1
>
>
> Changes in v2:
> - new patch in v2
> - rebase with drm-next, fix some conflicts
> - new patch in v2
>
> Yakir Yang (10):
>    drm/bridge: analogix_dp: rename RK3288_DP to ROCKCHIP_DP
>    drm/rockchip: analogix_dp: split the lcdc select setting into device
>      data
>    drm/bridge: analogix_dp: correct the register bit define error in
>      ANALOGIX_DP_PLL_REG_1
>    drm/bridge: analogix_dp: some rockchip chips need to flip REF_CLK bit
>      setting
>    drm/rockchip: analogix_dp: add rk3399 eDP support
>    drm/rockchip: analogix_dp: make panel detect to an optional action
>    drm/bridge: analogix_dp: introduce connector mode_valid callback to
>      plat driver
>    drm/rockchip: analogix_dp: correct the connector display color format
>      and bpc
>    drm/rockchip: analogix_dp: update the comments about why need to
>      hardcode VOP output mode
>    drm/bridge: analogix_dp: fix no drm hpd event when panel plug in
>
>   .../bindings/display/bridge/analogix_dp.txt        |   1 +
>   .../display/rockchip/analogix_dp-rockchip.txt      |   2 +-
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  19 ++-
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   8 +-
>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  12 +-
>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h  |   5 +-
>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 157 ++++++++++++++-------
>   include/drm/bridge/analogix_dp.h                   |  10 ++
>   8 files changed, 152 insertions(+), 62 deletions(-)
>


--------------080803000003000508060904
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Inki, Jingoo<br>
    <br>
    Would you like to take a look at this patch-set :)<br>
    <br>
    The first version[1] of this patch-set was sent at 'April 25, 2016',
    about one month ago, but i haven't got too much reviewed :(<br>
    <br>
    But thanks to Javier, we can say this series works rightly both on
    Exynos platform and Rockchip platform. And Mark also have reviewed
    the Rockchip side code, so it would be very nice that i could get
    some reviewed/acked from Samsung before i start to prepare my pull
    request ;)<br>
    <br>
    BR,<br>
    <meta http-equiv="content-type" content="text/html;
      charset=windows-1252">
    - Yakir<br>
    <br>
    [1]: <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/83406/">https://patchwork.freedesktop.org/patch/83406/</a><br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 05/24/2016 01:01 PM, Yakir Yang
      wrote:<br>
    </div>
    <blockquote
      cite="mid:1464066086-21967-1-git-send-email-ykk@rock-chips.com"
      type="cite">
      <pre wrap="">Hi all,

This series have been posted about one month, still no comments, help here :(

RK3399 and RK3288 shared the same eDP IP controller, only some light
difference with VOP configure and GRF configure.

Also same misc fix to analogix_dp driver:
- Hotplug invalid which report by Dan Carpenter
- Make panel detect to an optional action
- correct the register bit define error in ANALOGIX_DP_PLL_REG_1


Changes in v2:
- new patch in v2
- rebase with drm-next, fix some conflicts
- new patch in v2

Yakir Yang (10):
  drm/bridge: analogix_dp: rename RK3288_DP to ROCKCHIP_DP
  drm/rockchip: analogix_dp: split the lcdc select setting into device
    data
  drm/bridge: analogix_dp: correct the register bit define error in
    ANALOGIX_DP_PLL_REG_1
  drm/bridge: analogix_dp: some rockchip chips need to flip REF_CLK bit
    setting
  drm/rockchip: analogix_dp: add rk3399 eDP support
  drm/rockchip: analogix_dp: make panel detect to an optional action
  drm/bridge: analogix_dp: introduce connector mode_valid callback to
    plat driver
  drm/rockchip: analogix_dp: correct the connector display color format
    and bpc
  drm/rockchip: analogix_dp: update the comments about why need to
    hardcode VOP output mode
  drm/bridge: analogix_dp: fix no drm hpd event when panel plug in

 .../bindings/display/bridge/analogix_dp.txt        |   1 +
 .../display/rockchip/analogix_dp-rockchip.txt      |   2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  19 ++-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   8 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  12 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h  |   5 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 157 ++++++++++++++-------
 include/drm/bridge/analogix_dp.h                   |  10 ++
 8 files changed, 152 insertions(+), 62 deletions(-)

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------080803000003000508060904--


--===============1783781447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1783781447==--
