From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [RFC PATCH v1 0/2]
Date: Wed, 1 Jun 2016 10:41:48 +0800
Message-ID: <574E4B6C.6000908@rock-chips.com>
References: <1464701856-8695-1-git-send-email-ykk@rock-chips.com>
 <20160531143831.GK7231@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0387948251=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160531143831.GK7231@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Heiko Stuebner <heiko@sntech.de>, tfiga@chromium.org, Jingoo Han <jingoohan1@gmail.com>, David Airlie <airlied@linux.ie>, Thierry Reding <treding@nvidia.com>, dianders@chromium.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============0387948251==
Content-Type: multipart/alternative;
 boundary="------------090200050106070608060206"

This is a multi-part message in MIME format.
--------------090200050106070608060206
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 05/31/2016 10:38 PM, Daniel Vetter wrote:
> On Tue, May 31, 2016 at 09:37:36PM +0800, Yakir Yang wrote:
>> The full name of PSR is Panel Self Refresh, panel device could refresh
>> itself with the hardware framebuffer in panel, this would make a lots
>> of sense to save the power consumption.
>>
>> For example, when desktop haven't change the context for a long time,
>> then we could refresh the data to the hardware framebuffer of panel,
>> and then let panel enter into PSR mode. After that system could poweroff
>> the LCDC controller and eDP controller, just let panel refresh the screen
>> by itself.
>>
>> It's hard to decide when panel should enter into PSR or exit from PSR, in
>> this time I chose to let the drm_vblank enable/disable event driver the PSR.
>>
>> This thread is based on Mark's RK3399 VOP thread[0] and my RK3399 eDP
>> thread[1].
>>
>> [0]: https://patchwork.kernel.org/patch/8886041/
>> [1]: https://patchwork.kernel.org/patch/9132713/
> Looks like you didn't wire up the drm_framebuffer->funcs->dirty callback
> for manual upload of simple clients like bootsplash or fbdev. I think
> that's needed. At least it's needed for every other manual upload dsi and
> edp psr implementation.
> -Daniel

That's great, thanks for your remind. Seems like userspace which does
frontbuffer rendering must call this ioctl to flush out the changes on
manual-update display outputs. It's helpful to hook this callback to
notify eDP refresh the eDP RFB(remote frame buffer).

But I think this is hard to used on Rockchip eDP controller, Rockchip eDP
driver just used two modes, Sink Device PSR_S0 (PSR inactive), and Sink
Device PSR_S2 (PSR active, display from RFB).

I think the "dirty" callback is only used when Sink device enter into PSR_S3
mode (PSR active, capture and display), need to update the remote frame
buffer. But on Rockchip platform the panel would be very easy to lose frame
in this PSR mode. I'm confused in this case, so I didn't enable that.

If we didn't enable the PSR_S3 mode, then we don't need to update the panel
remote frame buffer, so this "->dirty" callback would be unused in this 
case.

Thanks,
- Yakir


>> - Yakir
>> Thanks,
>>
>>
>> Yakir Yang (2):
>>    drm/rockchip: add a notify event about vblank enable/disable
>>    drm/rockchip: analogix: add eDP PSR function
>>
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  69 ++++++++++++++
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   5 +
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  54 +++++++++++
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h  |  28 ++++++
>>   drivers/gpu/drm/rockchip/Makefile                  |   2 +-
>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  65 +++++++++++++
>>   drivers/gpu/drm/rockchip/rockchip_drm_notify.c     | 105 +++++++++++++++++++++
>>   drivers/gpu/drm/rockchip/rockchip_drm_notify.h     |  33 +++++++
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  96 +++++++++++++++++++
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |   3 +
>>   drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |   2 +
>>   include/drm/bridge/analogix_dp.h                   |   3 +
>>   12 files changed, 464 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_notify.c
>>   create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_notify.h
>>
>> -- 
>> 1.9.1
>>
>>


--------------090200050106070608060206
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Daniel,<br>
    <br>
    <div class="moz-cite-prefix">On 05/31/2016 10:38 PM, Daniel Vetter
      wrote:<br>
    </div>
    <blockquote cite="mid:20160531143831.GK7231@phenom.ffwll.local"
      type="cite">
      <pre wrap="">On Tue, May 31, 2016 at 09:37:36PM +0800, Yakir Yang wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">The full name of PSR is Panel Self Refresh, panel device could refresh
itself with the hardware framebuffer in panel, this would make a lots
of sense to save the power consumption.

For example, when desktop haven't change the context for a long time,
then we could refresh the data to the hardware framebuffer of panel,
and then let panel enter into PSR mode. After that system could poweroff
the LCDC controller and eDP controller, just let panel refresh the screen
by itself.

It's hard to decide when panel should enter into PSR or exit from PSR, in
this time I chose to let the drm_vblank enable/disable event driver the PSR.

This thread is based on Mark's RK3399 VOP thread[0] and my RK3399 eDP
thread[1].

[0]: <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/8886041/">https://patchwork.kernel.org/patch/8886041/</a>
[1]: <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/9132713/">https://patchwork.kernel.org/patch/9132713/</a>
</pre>
      </blockquote>
      <pre wrap="">
Looks like you didn't wire up the drm_framebuffer-&gt;funcs-&gt;dirty callback
for manual upload of simple clients like bootsplash or fbdev. I think
that's needed. At least it's needed for every other manual upload dsi and
edp psr implementation.
-Daniel
</pre>
    </blockquote>
    <br>
    That's great, thanks for your remind. Seems like userspace which
    does<br>
    frontbuffer rendering must call this ioctl to flush out the changes
    on<br>
    manual-update display outputs. It's helpful to hook this callback to<br>
    notify eDP refresh the eDP RFB(remote frame buffer).<br>
    <br>
    But I think this is hard to used on Rockchip eDP controller,
    Rockchip eDP<br>
    driver just used two modes, Sink Device PSR_S0 (PSR inactive), and
    Sink<br>
    Device PSR_S2 (PSR active, display from RFB). <br>
    <br>
    I think the "dirty" callback is only used when Sink device enter
    into PSR_S3<br>
    mode (PSR active, capture and display), need to update the remote
    frame<br>
    buffer. But on Rockchip platform the panel would be very easy to
    lose frame<br>
    in this PSR mode. I'm confused in this case, so I didn't enable
    that.<br>
    <br>
    If we didn't enable the PSR_S3 mode, then we don't need to update
    the panel<br>
    remote frame buffer, so this "-&gt;dirty" callback would be unused
    in this case.<br>
    <meta http-equiv="content-type" content="text/html;
      charset=windows-1252">
    <br>
    Thanks,<br>
    - Yakir<br>
    <br>
    <br>
    <blockquote cite="mid:20160531143831.GK7231@phenom.ffwll.local"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">
- Yakir
Thanks,


Yakir Yang (2):
  drm/rockchip: add a notify event about vblank enable/disable
  drm/rockchip: analogix: add eDP PSR function

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  69 ++++++++++++++
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   5 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  54 +++++++++++
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h  |  28 ++++++
 drivers/gpu/drm/rockchip/Makefile                  |   2 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  65 +++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_notify.c     | 105 +++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_notify.h     |  33 +++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  96 +++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |   3 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |   2 +
 include/drm/bridge/analogix_dp.h                   |   3 +
 12 files changed, 464 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_notify.c
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_notify.h

-- 
1.9.1


</pre>
      </blockquote>
      <pre wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------090200050106070608060206--


--===============0387948251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0387948251==--
