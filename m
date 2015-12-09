From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v10 0/17] Add Analogix Core Display Port Driver
Date: Wed, 9 Dec 2015 11:49:10 +0800
Message-ID: <5667A4B6.4090708@rock-chips.com>
References: <1449470239-30667-1-git-send-email-ykk@rock-chips.com>
 <1982691.ZDuzTFTUUe@diego>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0425248987=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1982691.ZDuzTFTUUe@diego>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Thierry Reding <treding@nvidia.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, javier@osg.samsung.com, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jingoo Han <jingoohan1@gmail.com>, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, ajaynumb@gmail.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============0425248987==
Content-Type: multipart/alternative;
 boundary="------------060306070009070207050204"

This is a multi-part message in MIME format.
--------------060306070009070207050204
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

Thanks a lot for great debugging.

On 12/08/2015 11:33 PM, Heiko St=FCbner wrote:
> Hi Yakir,
>
> Am Montag, 7. Dezember 2015, 14:37:19 schrieb Yakir Yang:
>>     The Samsung Exynos eDP controller and Rockchip RK3288 eDP controll=
er
>> share the same IP, so a lot of parts can be re-used. I split the commo=
n
>> code into bridge directory, then rk3288 and exynos only need to keep
>> some platform code. Cause I can't find the exact IP name of exynos dp
>> controller, so I decide to name dp core driver with "analogix" which I
>> find in rk3288 eDP TRM
> [...]
>
>> Changes in v10:
>> - Correct the ROCKCHIP_ANALOGIX_DP indentation in Kconfig to tabs here
>> (Heiko) - Fix the wrong macro value of
>> GRF_EDP_REF_CLK_SEL_INTER_HIWORD_MASK BIT(4) -> BIT(20)
>> - Remove the surplus "plat_data" check. (Heiko)
>> -       switch (dp->plat_data && dp->plat_data->dev_type) {
>> +       switch (dp->plat_data->dev_type) {
>> - Revert parts of Gustavo Padovan's changes in commit:
>> 	drm/exynos: do not start enabling DP at bind() phase
>>    Add dp phy poweron function in bind time.
> The hotplug issue is still present, but I think I found the cause. When
> the first detect call happens, the display simply is still off. I just =
did
> some very basic tracing [0] and it seems the display simply is not enab=
led
> when it is supposed to get detected.

Aha, thanks, make a lot of sense.

> And it seems injecting a drm_panel_prepare early for _testing_ [1] real=
ly
> did make the hotplug work on both my jerry and minnie.
>
> So I guess we should somehow make sure the panel is actually powered wh=
en
> detection is running. Although I'm not sure yet, how that should look l=
ike.

Agree, panel should be powered up before DP controller start to detect=20
hotplug signal.

> Intuition suggests, making drm_panel calls nestable (similar to
> clk_prepare/unprepare, etc) and simply wrapping the detection code
> in a prepare-unprepare calls, but I'm not sure if Thierry might have ot=
her
> ideas ;-)

Due to the panel power status would influence the hotplug status, so I=20
think we don't
need to unprepared the panel unless in driver enter into suspend time.=20
Things I want:

1. Prepared the panel in driver *bind time*
2. Enable the panel in driver *bridge->enable time*
3. Disable the panel in driver *bridge->disable time*
4. Unprepared the panel in driver*suspend time *
5. Re-prepared the panel in driver *resume time*

> Also my "log" below suggests some sort of mismatch between
> prepare/unprepare calls, as there are a lot more of the prepare-side.

Yes, it's a typo too. I shouldn't place the panel->prepare in=20
connector->get_modes,
cause userspace would try to call get_modes once it receive the hotplug=20
event, so
there wouldn't have a match between panel prepare/unprepare.

Previously, I just want to ensure that panel should be power-up when=20
driver try to
read the EDID from panel, so for now must remove the prepare from=20
get_modes time  :)

> And the locking issue also seems to be still there [2].

Hmm, I haven't meet this dead lock on my chromebook (ChromeOS + 4.4-rc3=20
Kernel)

After look at the dead lock trace, I guess this dead lock would happened=20
when hotplug
event happened in bridge->disable time, not sure.  Would try to find=20
more in trace log
and try to reproduce this.


- Yakir

>
> Heiko
>
>
> [0]
> [    2.797383] analogix_dp_reset
> [    2.800709] analogix_dp_init_hpd
> [    2.803960] analogix_dp_init_video
> [    2.807653] rockchip-drm display-subsystem: bound ff970000.dp (ops r=
ockchip_dp_component_ops)
> [    2.817176] [drm] Supports vblank timestamp caching Rev 2 (21.10.201=
3).
> [    2.823799] [drm] No driver support for vblank timestamp query.
> [    2.829947] analogix_dp_detect
> [    2.833015] analogix_dp_get_plug_in_status: hpd status 0
> ...
> [    2.893425] analogix_dp_get_plug_in_status: hpd status 0
> [    2.893456] rockchip-dp ff970000.dp: failed to get hpd plug status, =
try to force hpd
> [    2.893458] analogix_dp_force_hpd
> [    2.893464] analogix_dp_get_plug_in_status: hpd status 112
> [    2.893470] panel_simple_prepare
> [    2.952183] rockchip-dp ff970000.dp: EDID data does not include any =
extensions.
> [    2.961727] panel_simple_get_modes
> [    3.432154] analogix_dp_detect
> [    3.432158] analogix_dp_get_plug_in_status: hpd status 120
> [    3.432160] panel_simple_prepare
> [    3.433731] rockchip-dp ff970000.dp: EDID data does not include any =
extensions.
> [    3.443268] panel_simple_get_modes
> [    3.444668] panel_simple_prepare
> [    3.444755] analogix_dp_reset
> [    3.445078] analogix_dp_init_hpd
> [    3.445096] panel_simple_disable
> [    3.455349] analogix_dp_init_video
> [    3.558323] rockchip-dp ff970000.dp: Timeout of video streamclk ok
> [    3.558326] rockchip-dp ff970000.dp: unable to config video
> [    3.558328] panel_simple_enable
> [    3.573915] analogix_dp_detect
> [    3.573919] analogix_dp_get_plug_in_status: hpd status 72
> [    3.573921] panel_simple_prepare
>
>
> [1]
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/=
gpu/drm/rockchip/analogix_dp-rockchip.c
> index 3990951..0c2dca5 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -399,6 +399,8 @@ static int rockchip_dp_probe(struct platform_device=
 *pdev)
>  =20
>          dp->plat_data.panel =3D panel;
>  =20
> +drm_panel_prepare(dp->plat_data.panel);
> +
>          /*
>           * We just use the drvdata until driver run into component
>           * add function, and then we would set drvdata to null, so
>
>
> [2]
> [   11.971277] panel_simple_get_modes
> [  OK  ] Started LSB: X display manager for KDE.
> [  OK  ] Started LSB: Speech Dispatcher.
> [   12.007120] panel_simple_disable
> [   12.012323]
> [   12.013820] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   12.019993] [ INFO: possible circular locking dependency detected ]
> [   12.026250] 4.4.0-rc3+ #2755 Not tainted
> [   12.030165] -------------------------------------------------------
> [  12.036417] Xorg/793 is trying to acquire lock:
> [   12.040855]  ((&dp->hotplug_work)){+.+...}[   12.040870]
> [   12.040870] but task is already holding lock:
> [   12.040871]  (crtc_ww_class_mutex){+.+.+.}, at: [<c0383600>] drm_mod=
eset_lock+0x84/0x104
> [   12.040881]
> [   12.040881] which lock already depends on the new lock.
> [   12.040881]
> [   12.040882]
> [   12.040882] the existing dependency chain (in reverse order) is:
> [   12.040883]
> [   12.040883] -> #2 (crtc_ww_class_mutex){+.+.+.}:
> [   12.040887]        [<c0756374>] mutex_lock_nested+0x78/0x41c
> [   12.040893]        [<c038365c>] drm_modeset_lock+0xe0/0x104
> [   12.040896]        [<c0377888>] drm_mode_getconnector+0x168/0x38c
> [   12.040902]        [<c036ae58>] drm_ioctl+0x274/0x408
> [   12.040907]        [<c017cbc8>] do_vfs_ioctl+0x670/0x750
> [   12.040911]        [<c017cd04>] SyS_ioctl+0x5c/0x84
> [   12.040914]        [<c000ff80>] ret_fast_syscall+0x0/0x1c
> [   12.040920]
> [   12.040920] -> #1 (&dev->mode_config.mutex){+.+.+.}:
> [   12.040924]        [<c0756374>] mutex_lock_nested+0x78/0x41c
> [   12.040928]        [<c035b3b4>] drm_helper_hpd_irq_event+0x40/0x150
> [   12.040934]        [<c038e0b0>] analogix_dp_hotplug+0x24/0x28
> [   12.040938]        [<c00450c4>] process_one_work+0x328/0x668
> [   12.040942]        [<c0046334>] worker_thread+0x2cc/0x41c
> [   12.040945]        [<c004bbe8>] kthread+0xf4/0x10c
> [   12.040950]        [<c0010010>] ret_from_fork+0x14/0x24
> [   12.040954]
> [   12.040954] -> #0 ((&dp->hotplug_work)){+.+...}:
> [   12.040958]        [<c007f4ac>] lock_acquire+0x178/0x218
> [   12.040963]        [<c00437d0>] flush_work+0x4c/0x22c
> [   12.040966]        [<c038e45c>] analogix_dp_bridge_disable+0x74/0xf0
> [   12.040970]        [<c0385ef4>] drm_bridge_disable+0x34/0x38
> [   12.040973]        [<c0359044>] drm_crtc_helper_set_mode+0x200/0x424
> [   12.040977]        [<c0359a38>] drm_crtc_helper_set_config+0x6c0/0x9=
88
> [   12.040981]        [<c0373ba8>] drm_mode_set_config_internal+0x60/0x=
dc
> [   12.040984]        [<c0378938>] drm_mode_setcrtc+0x3cc/0x474
> [   12.040988]        [<c036ae58>] drm_ioctl+0x274/0x408
> [   12.040991]        [<c017cbc8>] do_vfs_ioctl+0x670/0x750
> [   12.040994]        [<c017cd04>] SyS_ioctl+0x5c/0x84
> [   12.040997]        [<c000ff80>] ret_fast_syscall+0x0/0x1c
> [   12.041001]
> [   12.041001] other info that might help us debug this:
> [   12.041001]
> [   12.041002] Chain exists of:
> [   12.041002]   (&dp->hotplug_work) --> &dev->mode_config.mutex --> cr=
tc_ww_class_mutex
> [   12.041007]
> [   12.041008]  Possible unsafe locking scenario:
> [   12.041008]
> [   12.041009]        CPU0                    CPU1
> [   12.041010]        ----                    ----
> [   12.041011]   lock(crtc_ww_class_mutex);
> [   12.041013]                                lock(&dev->mode_config.mu=
tex);
> [   12.041016]                                lock(crtc_ww_class_mutex)=
;
> [   12.041018]   lock((&dp->hotplug_work));
> [   12.041020]
> [   12.041020]  *** DEADLOCK ***
> [   12.041020]
> [   12.041023] 3 locks held by Xorg/793:
> [   12.041023]  #0:  (&dev->mode_config.mutex){+.+.+.}, at: [<c0383d48>=
] drm_modeset_lock_all+0x50/0xd8
> [   12.041030]  #1:  (crtc_ww_class_acquire){+.+.+.}, at: [<c0383d58>] =
drm_modeset_lock_all+0x60/0xd8
> [   12.041037]  #2:  (crtc_ww_class_mutex){+.+.+.}, at: [<c0383600>] dr=
m_modeset_lock+0x84/0x104
> [   12.041044]
> [   12.041044] stack backtrace:
> [   12.041048] CPU: 3 PID: 793 Comm: Xorg Not tainted 4.4.0-rc3+ #2755
> [   12.041049] Hardware name: Rockchip (Device Tree)
> [   12.041059] [<c0019914>] (unwind_backtrace) from [<c0014bcc>] (show_=
stack+0x20/0x24)
> [   12.041066] [<c0014bcc>] (show_stack) from [<c02c4484>] (dump_stack+=
0x84/0xb8)
> [   12.041072] [<c02c4484>] (dump_stack) from [<c007a2b8>] (print_circu=
lar_bug+0x278/0x2cc)
> [   12.041078] [<c007a2b8>] (print_circular_bug) from [<c007e850>] (__l=
ock_acquire+0x14a0/0x1aec)
> [   12.041082] [<c007e850>] (__lock_acquire) from [<c007f4ac>] (lock_ac=
quire+0x178/0x218)
> [   12.041086] [<c007f4ac>] (lock_acquire) from [<c00437d0>] (flush_wor=
k+0x4c/0x22c)
> [   12.041091] [<c00437d0>] (flush_work) from [<c038e45c>] (analogix_dp=
_bridge_disable+0x74/0xf0)
> [   12.041097] [<c038e45c>] (analogix_dp_bridge_disable) from [<c0385ef=
4>] (drm_bridge_disable+0x34/0x38)
> [   12.041102] [<c0385ef4>] (drm_bridge_disable) from [<c0359044>] (drm=
_crtc_helper_set_mode+0x200/0x424)
> [   12.041108] [<c0359044>] (drm_crtc_helper_set_mode) from [<c0359a38>=
] (drm_crtc_helper_set_config+0x6c0/0x988)
> [   12.041114] [<c0359a38>] (drm_crtc_helper_set_config) from [<c0373ba=
8>] (drm_mode_set_config_internal+0x60/0xdc)
> [   12.041119] [<c0373ba8>] (drm_mode_set_config_internal) from [<c0378=
938>] (drm_mode_setcrtc+0x3cc/0x474)
> [   12.041124] [<c0378938>] (drm_mode_setcrtc) from [<c036ae58>] (drm_i=
octl+0x274/0x408)
> [   12.041129] [<c036ae58>] (drm_ioctl) from [<c017cbc8>] (do_vfs_ioctl=
+0x670/0x750)
> [   12.041134] [<c017cbc8>] (do_vfs_ioctl) from [<c017cd04>] (SyS_ioctl=
+0x5c/0x84)
> [   12.041138] [<c017cd04>] (SyS_ioctl) from [<c000ff80>] (ret_fast_sys=
call+0x0/0x1c)
> [   12.041210] panel_simple_unprepare
> [   12.041359] panel_simple_prepare
> [   12.101638] analogix_dp_reset
> [   12.101879] analogix_dp_init_hpd
> [   12.101897] panel_simple_disable
> [   12.108543] analogix_dp_irq_handler: irq-type 0
> [   12.110452] rockchip-dp ff970000.dp: Link Training Clock Recovery su=
ccess
> [   12.111900] rockchip-dp ff970000.dp: Link Training success!
> [   12.113384] analogix_dp_init_video
> [   12.215825] rockchip-dp ff970000.dp: Timeout of video streamclk ok
> [   12.215829] rockchip-dp ff970000.dp: unable to config video
> [   12.215832] panel_simple_enable
> ,at: [<c0043784>] flush_work+0x0/0x22c
>
>
>
>


--------------060306070009070207050204
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dwindows-1252"
      http-equiv=3D"Content-Type">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    Hi Heiko,<br>
    <br>
    Thanks a lot for great debugging.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 12/08/2015 11:33 PM, Heiko St=FCbne=
r
      wrote:<br>
    </div>
    <blockquote cite=3D"mid:1982691.ZDuzTFTUUe@diego" type=3D"cite">
      <pre wrap=3D"">Hi Yakir,

Am Montag, 7. Dezember 2015, 14:37:19 schrieb Yakir Yang:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">   The Samsung Exynos eDP controller and Rockchip =
RK3288 eDP controller
share the same IP, so a lot of parts can be re-used. I split the common
code into bridge directory, then rk3288 and exynos only need to keep
some platform code. Cause I can't find the exact IP name of exynos dp
controller, so I decide to name dp core driver with "analogix" which I
find in rk3288 eDP TRM
</pre>
      </blockquote>
      <pre wrap=3D"">[...]

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Changes in v10:
- Correct the ROCKCHIP_ANALOGIX_DP indentation in Kconfig to tabs here
(Heiko) - Fix the wrong macro value of
GRF_EDP_REF_CLK_SEL_INTER_HIWORD_MASK BIT(4) -&gt; BIT(20)
- Remove the surplus "plat_data" check. (Heiko)
-       switch (dp-&gt;plat_data &amp;&amp; dp-&gt;plat_data-&gt;dev_type=
) {
+       switch (dp-&gt;plat_data-&gt;dev_type) {
- Revert parts of Gustavo Padovan's changes in commit:
	drm/exynos: do not start enabling DP at bind() phase
  Add dp phy poweron function in bind time.
</pre>
      </blockquote>
      <pre wrap=3D"">The hotplug issue is still present, but I think I fo=
und the cause. When
the first detect call happens, the display simply is still off. I just di=
d
some very basic tracing [0] and it seems the display simply is not enable=
d
when it is supposed to get detected.</pre>
    </blockquote>
    <br>
    Aha, thanks, make a lot of sense.<br>
    <br>
    <blockquote cite=3D"mid:1982691.ZDuzTFTUUe@diego" type=3D"cite">
      <pre wrap=3D"">And it seems injecting a drm_panel_prepare early for=
 _testing_ [1] really
did make the hotplug work on both my jerry and minnie.

So I guess we should somehow make sure the panel is actually powered when
detection is running. Although I'm not sure yet, how that should look lik=
e.
</pre>
    </blockquote>
    <br>
    Agree, panel should be powered up before DP controller start to
    detect hotplug signal.<br>
    <br>
    <blockquote cite=3D"mid:1982691.ZDuzTFTUUe@diego" type=3D"cite">
      <pre wrap=3D"">Intuition suggests, making drm_panel calls nestable =
(similar to
clk_prepare/unprepare, etc) and simply wrapping the detection code
in a prepare-unprepare calls, but I'm not sure if Thierry might have othe=
r
ideas ;-)
</pre>
    </blockquote>
    <br>
    Due to the panel power status would influence the hotplug status, so
    I think we don't<br>
    need to unprepared the panel unless in driver enter into suspend
    time. Things I want:<br>
    <br>
    1. Prepared the panel in driver <b>bind time</b><br>
    2. Enable the panel in driver <b>bridge-&gt;enable time</b><br>
    3. Disable the panel in driver <b>bridge-&gt;disable time</b><br>
    4. Unprepared the panel in driver<b> suspend time </b><br>
    5. Re-prepared the panel in driver <b>resume time</b><br>
    <br>
    <blockquote cite=3D"mid:1982691.ZDuzTFTUUe@diego" type=3D"cite">
      <pre wrap=3D"">Also my "log" below suggests some sort of mismatch b=
etween
prepare/unprepare calls, as there are a lot more of the prepare-side.
</pre>
    </blockquote>
    <br>
    Yes, it's a typo too. I shouldn't place the panel-&gt;prepare in
    connector-&gt;get_modes,<br>
    cause userspace would try to call get_modes once it receive the
    hotplug event, so<br>
    there wouldn't have a match between panel prepare/unprepare. <br>
    <br>
    <meta http-equiv=3D"content-type" content=3D"text/html;
      charset=3Dwindows-1252">
    Previously, I just want to ensure that panel should be power-up when
    driver try to<br>
    read the EDID from panel, so for now must remove the prepare from
    get_modes time=A0 :)<br>
    <br>
    <blockquote cite=3D"mid:1982691.ZDuzTFTUUe@diego" type=3D"cite">
      <pre wrap=3D"">And the locking issue also seems to be still there [=
2].
</pre>
    </blockquote>
    <br>
    Hmm, I haven't meet this dead lock on my chromebook (ChromeOS +
    4.4-rc3 Kernel)<br>
    <br>
    After look at the dead lock trace, I guess this dead lock would
    happened when hotplug<br>
    event happened in bridge-&gt;disable time, not sure.=A0 Would try to
    find more in trace log<br>
    and try to reproduce this.<br>
    <br>
    <br>
    - Yakir<br>
    <br>
    <blockquote cite=3D"mid:1982691.ZDuzTFTUUe@diego" type=3D"cite">
      <pre wrap=3D"">

Heiko


[0]
[    2.797383] analogix_dp_reset
[    2.800709] analogix_dp_init_hpd
[    2.803960] analogix_dp_init_video
[    2.807653] rockchip-drm display-subsystem: bound ff970000.dp (ops roc=
kchip_dp_component_ops)
[    2.817176] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013)=
.
[    2.823799] [drm] No driver support for vblank timestamp query.
[    2.829947] analogix_dp_detect
[    2.833015] analogix_dp_get_plug_in_status: hpd status 0
...
[    2.893425] analogix_dp_get_plug_in_status: hpd status 0
[    2.893456] rockchip-dp ff970000.dp: failed to get hpd plug status, tr=
y to force hpd
[    2.893458] analogix_dp_force_hpd
[    2.893464] analogix_dp_get_plug_in_status: hpd status 112
[    2.893470] panel_simple_prepare
[    2.952183] rockchip-dp ff970000.dp: EDID data does not include any ex=
tensions.
[    2.961727] panel_simple_get_modes
[    3.432154] analogix_dp_detect
[    3.432158] analogix_dp_get_plug_in_status: hpd status 120
[    3.432160] panel_simple_prepare
[    3.433731] rockchip-dp ff970000.dp: EDID data does not include any ex=
tensions.
[    3.443268] panel_simple_get_modes
[    3.444668] panel_simple_prepare
[    3.444755] analogix_dp_reset
[    3.445078] analogix_dp_init_hpd
[    3.445096] panel_simple_disable
[    3.455349] analogix_dp_init_video
[    3.558323] rockchip-dp ff970000.dp: Timeout of video streamclk ok
[    3.558326] rockchip-dp ff970000.dp: unable to config video
[    3.558328] panel_simple_enable
[    3.573915] analogix_dp_detect
[    3.573919] analogix_dp_get_plug_in_status: hpd status 72
[    3.573921] panel_simple_prepare


[1]
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
index 3990951..0c2dca5 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -399,6 +399,8 @@ static int rockchip_dp_probe(struct platform_device *=
pdev)
=20
        dp-&gt;plat_data.panel =3D panel;
=20
+drm_panel_prepare(dp-&gt;plat_data.panel);
+
        /*
         * We just use the drvdata until driver run into component
         * add function, and then we would set drvdata to null, so


[2]
[   11.971277] panel_simple_get_modes
[  OK  ] Started LSB: X display manager for KDE.
[  OK  ] Started LSB: Speech Dispatcher.
[   12.007120] panel_simple_disable
[   12.012323]=20
[   12.013820] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   12.019993] [ INFO: possible circular locking dependency detected ]
[   12.026250] 4.4.0-rc3+ #2755 Not tainted
[   12.030165] -------------------------------------------------------
[  12.036417] Xorg/793 is trying to acquire lock:
[   12.040855]  ((&amp;dp-&gt;hotplug_work)){+.+...}[   12.040870]=20
[   12.040870] but task is already holding lock:
[   12.040871]  (crtc_ww_class_mutex){+.+.+.}, at: [&lt;c0383600&gt;] drm=
_modeset_lock+0x84/0x104
[   12.040881]=20
[   12.040881] which lock already depends on the new lock.
[   12.040881]=20
[   12.040882]=20
[   12.040882] the existing dependency chain (in reverse order) is:
[   12.040883]=20
[   12.040883] -&gt; #2 (crtc_ww_class_mutex){+.+.+.}:
[   12.040887]        [&lt;c0756374&gt;] mutex_lock_nested+0x78/0x41c
[   12.040893]        [&lt;c038365c&gt;] drm_modeset_lock+0xe0/0x104
[   12.040896]        [&lt;c0377888&gt;] drm_mode_getconnector+0x168/0x38=
c
[   12.040902]        [&lt;c036ae58&gt;] drm_ioctl+0x274/0x408
[   12.040907]        [&lt;c017cbc8&gt;] do_vfs_ioctl+0x670/0x750
[   12.040911]        [&lt;c017cd04&gt;] SyS_ioctl+0x5c/0x84
[   12.040914]        [&lt;c000ff80&gt;] ret_fast_syscall+0x0/0x1c
[   12.040920]=20
[   12.040920] -&gt; #1 (&amp;dev-&gt;mode_config.mutex){+.+.+.}:
[   12.040924]        [&lt;c0756374&gt;] mutex_lock_nested+0x78/0x41c
[   12.040928]        [&lt;c035b3b4&gt;] drm_helper_hpd_irq_event+0x40/0x=
150
[   12.040934]        [&lt;c038e0b0&gt;] analogix_dp_hotplug+0x24/0x28
[   12.040938]        [&lt;c00450c4&gt;] process_one_work+0x328/0x668
[   12.040942]        [&lt;c0046334&gt;] worker_thread+0x2cc/0x41c
[   12.040945]        [&lt;c004bbe8&gt;] kthread+0xf4/0x10c
[   12.040950]        [&lt;c0010010&gt;] ret_from_fork+0x14/0x24
[   12.040954]=20
[   12.040954] -&gt; #0 ((&amp;dp-&gt;hotplug_work)){+.+...}:
[   12.040958]        [&lt;c007f4ac&gt;] lock_acquire+0x178/0x218
[   12.040963]        [&lt;c00437d0&gt;] flush_work+0x4c/0x22c
[   12.040966]        [&lt;c038e45c&gt;] analogix_dp_bridge_disable+0x74/=
0xf0
[   12.040970]        [&lt;c0385ef4&gt;] drm_bridge_disable+0x34/0x38
[   12.040973]        [&lt;c0359044&gt;] drm_crtc_helper_set_mode+0x200/0=
x424
[   12.040977]        [&lt;c0359a38&gt;] drm_crtc_helper_set_config+0x6c0=
/0x988
[   12.040981]        [&lt;c0373ba8&gt;] drm_mode_set_config_internal+0x6=
0/0xdc
[   12.040984]        [&lt;c0378938&gt;] drm_mode_setcrtc+0x3cc/0x474
[   12.040988]        [&lt;c036ae58&gt;] drm_ioctl+0x274/0x408
[   12.040991]        [&lt;c017cbc8&gt;] do_vfs_ioctl+0x670/0x750
[   12.040994]        [&lt;c017cd04&gt;] SyS_ioctl+0x5c/0x84
[   12.040997]        [&lt;c000ff80&gt;] ret_fast_syscall+0x0/0x1c
[   12.041001]=20
[   12.041001] other info that might help us debug this:
[   12.041001]=20
[   12.041002] Chain exists of:
[   12.041002]   (&amp;dp-&gt;hotplug_work) --&gt; &amp;dev-&gt;mode_conf=
ig.mutex --&gt; crtc_ww_class_mutex
[   12.041007]=20
[   12.041008]  Possible unsafe locking scenario:
[   12.041008]=20
[   12.041009]        CPU0                    CPU1
[   12.041010]        ----                    ----
[   12.041011]   lock(crtc_ww_class_mutex);
[   12.041013]                                lock(&amp;dev-&gt;mode_conf=
ig.mutex);
[   12.041016]                                lock(crtc_ww_class_mutex);
[   12.041018]   lock((&amp;dp-&gt;hotplug_work));
[   12.041020]=20
[   12.041020]  *** DEADLOCK ***
[   12.041020]=20
[   12.041023] 3 locks held by Xorg/793:
[   12.041023]  #0:  (&amp;dev-&gt;mode_config.mutex){+.+.+.}, at: [&lt;c=
0383d48&gt;] drm_modeset_lock_all+0x50/0xd8
[   12.041030]  #1:  (crtc_ww_class_acquire){+.+.+.}, at: [&lt;c0383d58&g=
t;] drm_modeset_lock_all+0x60/0xd8
[   12.041037]  #2:  (crtc_ww_class_mutex){+.+.+.}, at: [&lt;c0383600&gt;=
] drm_modeset_lock+0x84/0x104
[   12.041044]=20
[   12.041044] stack backtrace:
[   12.041048] CPU: 3 PID: 793 Comm: Xorg Not tainted 4.4.0-rc3+ #2755
[   12.041049] Hardware name: Rockchip (Device Tree)
[   12.041059] [&lt;c0019914&gt;] (unwind_backtrace) from [&lt;c0014bcc&g=
t;] (show_stack+0x20/0x24)
[   12.041066] [&lt;c0014bcc&gt;] (show_stack) from [&lt;c02c4484&gt;] (d=
ump_stack+0x84/0xb8)
[   12.041072] [&lt;c02c4484&gt;] (dump_stack) from [&lt;c007a2b8&gt;] (p=
rint_circular_bug+0x278/0x2cc)
[   12.041078] [&lt;c007a2b8&gt;] (print_circular_bug) from [&lt;c007e850=
&gt;] (__lock_acquire+0x14a0/0x1aec)
[   12.041082] [&lt;c007e850&gt;] (__lock_acquire) from [&lt;c007f4ac&gt;=
] (lock_acquire+0x178/0x218)
[   12.041086] [&lt;c007f4ac&gt;] (lock_acquire) from [&lt;c00437d0&gt;] =
(flush_work+0x4c/0x22c)
[   12.041091] [&lt;c00437d0&gt;] (flush_work) from [&lt;c038e45c&gt;] (a=
nalogix_dp_bridge_disable+0x74/0xf0)
[   12.041097] [&lt;c038e45c&gt;] (analogix_dp_bridge_disable) from [&lt;=
c0385ef4&gt;] (drm_bridge_disable+0x34/0x38)
[   12.041102] [&lt;c0385ef4&gt;] (drm_bridge_disable) from [&lt;c0359044=
&gt;] (drm_crtc_helper_set_mode+0x200/0x424)
[   12.041108] [&lt;c0359044&gt;] (drm_crtc_helper_set_mode) from [&lt;c0=
359a38&gt;] (drm_crtc_helper_set_config+0x6c0/0x988)
[   12.041114] [&lt;c0359a38&gt;] (drm_crtc_helper_set_config) from [&lt;=
c0373ba8&gt;] (drm_mode_set_config_internal+0x60/0xdc)
[   12.041119] [&lt;c0373ba8&gt;] (drm_mode_set_config_internal) from [&l=
t;c0378938&gt;] (drm_mode_setcrtc+0x3cc/0x474)
[   12.041124] [&lt;c0378938&gt;] (drm_mode_setcrtc) from [&lt;c036ae58&g=
t;] (drm_ioctl+0x274/0x408)
[   12.041129] [&lt;c036ae58&gt;] (drm_ioctl) from [&lt;c017cbc8&gt;] (do=
_vfs_ioctl+0x670/0x750)
[   12.041134] [&lt;c017cbc8&gt;] (do_vfs_ioctl) from [&lt;c017cd04&gt;] =
(SyS_ioctl+0x5c/0x84)
[   12.041138] [&lt;c017cd04&gt;] (SyS_ioctl) from [&lt;c000ff80&gt;] (re=
t_fast_syscall+0x0/0x1c)
[   12.041210] panel_simple_unprepare
[   12.041359] panel_simple_prepare
[   12.101638] analogix_dp_reset
[   12.101879] analogix_dp_init_hpd
[   12.101897] panel_simple_disable
[   12.108543] analogix_dp_irq_handler: irq-type 0
[   12.110452] rockchip-dp ff970000.dp: Link Training Clock Recovery succ=
ess
[   12.111900] rockchip-dp ff970000.dp: Link Training success!
[   12.113384] analogix_dp_init_video
[   12.215825] rockchip-dp ff970000.dp: Timeout of video streamclk ok
[   12.215829] rockchip-dp ff970000.dp: unable to config video
[   12.215832] panel_simple_enable
,at: [&lt;c0043784&gt;] flush_work+0x0/0x22c




</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------060306070009070207050204--


--===============0425248987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0425248987==--
