From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v3 2/4] drm/rockchip: add an common abstracted PSR driver
Date: Wed, 13 Jul 2016 00:10:13 +0900
Message-ID: <CAAFQd5CrT_bM+VLpzqZqu7p=32YYkTrNZw75FkPwx-LteUCBGw@mail.gmail.com>
References: <1467364685-21390-1-git-send-email-ykk@rock-chips.com>
 <1467364754-21674-1-git-send-email-ykk@rock-chips.com> <CAOw6vbKMWEEDEqw0_ba_FGO-2mOBg3uanQzk5nbnCtowWdLu9w@mail.gmail.com>
 <20160712123826.GU23520@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160712123826.GU23520@phenom.ffwll.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>, Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Doug Anderson <dianders@chromium.org>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Cc: Yakir Yang <ykk@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jul 12, 2016 at 9:38 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, Jul 01, 2016 at 02:00:00PM -0400, Sean Paul wrote:
>> On Fri, Jul 1, 2016 at 5:19 AM, Yakir Yang <ykk@rock-chips.com> wrote:
>> > The PSR driver have exported four symbols for specific device driver:
>> > - rockchip_drm_psr_register()
>> > - rockchip_drm_psr_unregister()
>> > - rockchip_drm_psr_enable()
>> > - rockchip_drm_psr_disable()
>> > - rockchip_drm_psr_flush()
>> >
>> > Encoder driver should call the register/unregister interfaces to hook
>> > itself into common PSR driver, encoder have implement the 'psr_set'
>> > callback which use the set PSR state in hardware side.
>> >
>> > Crtc driver would call the enable/disable interfaces when vblank is
>> > enable/disable, after that the common PSR driver would call the encoder
>> > registered callback to set the PSR state.
>> >
>>
>> This feels overly complicated. It seems like you could cut out a bunch
>> of code by just coding the psr functions into vop and
>> analogix_dp-rockchip. I suppose the only reason to keep it abstracted
>> would be if you plan on supporting psr in a different encoder or crtc
>> in rockchip, or if you're planning on moving this into drm core.
>
> Agreed on the layers of indirection. Also, you end up with 3 delayed
> timers in total:
> - defio timer from fbdev emulation
> - timer in this abstraction
> - delayed work in the psr backend driver

Maybe I'm missing something obvious (don't know how the PSR is
implemented in hardware or in other drivers), but why do we need all
these timers? Couldn't we just trigger a fake page flip on fb dirty
call?

Best regards,
Tomasz
