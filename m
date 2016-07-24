From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 2/4] drm/rockchip: add an common abstracted PSR driver
Date: Sun, 24 Jul 2016 15:08:50 +0800
Message-ID: <57946982.7050209@rock-chips.com>
References: <1468469704-12440-1-git-send-email-ykk@rock-chips.com>
 <1468469749-12636-1-git-send-email-ykk@rock-chips.com>
 <CAD=FV=U-9WoyZTyj0weDxVkZjQ7ESc+pwJXX=19JuGrOCrsKcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:55510 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751562AbcGXHI5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Jul 2016 03:08:57 -0400
In-Reply-To: <CAD=FV=U-9WoyZTyj0weDxVkZjQ7ESc+pwJXX=19JuGrOCrsKcQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Sean Paul <seanpaul@chromium.org>, Tomasz Figa <tfiga@chromium.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Emil Velikov <emil.l.velikov@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>

Doug,

On 07/23/2016 12:04 PM, Doug Anderson wrote:
> Yakir,
>
> On Wed, Jul 13, 2016 at 9:15 PM, Yakir Yang <ykk@rock-chips.com> wrote:
>> +static void psr_set_state(struct psr_drv *psr, enum psr_state state)
>> +{
>> +       mutex_lock(&psr->state_mutex);
>> +
>> +       if (psr->state == state) {
>> +               mutex_unlock(&psr->state_mutex);
>> +               return;
>> +       }
>> +
>> +       psr->state = state;
>> +       switch (state) {
>> +       case PSR_ENABLE:
>> +               psr->set(psr->encoder, true);
>> +               break;
>> +
>> +       case PSR_DISABLE:
>> +       case PSR_FLUSH:
>> +               psr->set(psr->encoder, false);
>> +               break;
>> +       };
>> +
>> +       mutex_unlock(&psr->state_mutex);
>> +}
>> +
>> +static void psr_flush_handler(unsigned long data)
>> +{
>> +       struct psr_drv *psr = (struct psr_drv *)data;
>> +
>> +       if (!psr || psr->state != PSR_FLUSH)
>> +               return;
>> +
>> +       psr_set_state(psr, PSR_ENABLE);
> As mentioned in a separate thread, this is probably not OK.
> psr_set_state() grabs a mutex and that might sleep.  ...but
> psr_flush_handler() is a timer.  I'm nearly certain that timers can't
> sleep.
>
> I believe this is the source of "sleeping function called from invalid
> context" that I've seen at times.

Thanks for your reported, i have wrote a patch[0] to fix this problem in 
my v5. If you're happy to review, that would be great ;)

[0]: https://patchwork.kernel.org/patch/9244805/

- Yakir

>
> -Doug
>
>
>
