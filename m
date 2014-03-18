From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH] drm/exynos: Fix (more) freeing issues in exynos_drm_drv.c
Date: Tue, 18 Mar 2014 14:59:40 +0800
Message-ID: <CAGS+omAH4AmY8Xg2Y9-x+gJGson9dize2xRMJ=V3NH7AP5Oeyw@mail.gmail.com>
References: <1395026886-14325-1-git-send-email-djkurtz@chromium.org>
 <CAAQKjZMeeyD+6fhCaGk9qzX0oLTS=vHU86Y7gF9ZnbwcpTT7Kg@mail.gmail.com>
 <01a301cf426d$55d080b0$01718210$@samsung.com>
 <CAAQKjZPCq=d_mcWbpVhpMhXr1G3sDD7=BQ3cqOiqQ6_TTWfMCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAAQKjZPCq=d_mcWbpVhpMhXr1G3sDD7=BQ3cqOiqQ6_TTWfMCA@mail.gmail.com>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sachin Kamat <sachin.kamat@linaro.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Mar 18, 2014 at 2:08 PM, Inki Dae <inki.dae@samsung.com> wrote:
> 2014-03-18 14:45 GMT+09:00 Kukjin Kim <kgene.kim@samsung.com>:
>> Inki Dae wrote:
>>>
>>> Applied.
>>>
>>> Thanks,
>>> Inki Dae
>>>
>>> 2014-03-17 12:28 GMT+09:00 Daniel Kurtz <djkurtz@chromium.org>:
>>> > The following commit [0] fixed a use-after-free, but left the subdrv
>>> open
>>> > in the error path.
>>> >
>>> > [0] commit 6ca605f7c70895a35737435f17ae9cc5e36f1466
>>> > drm/exynos: Fix freeing issues in exynos_drm_drv.c
>>> >
>>> > Change-Id: I452e944bf090fb11434d9e34213c890c41c15d73
>>
>> This should be removed when Inki apply this.
>>
>
> No, Daniel's patch just complements above previous one that is what I missed.
>

Inki,

Ah, sorry for the original double post.  The first one (with the
"Change-Id") went out too soon, and I forgot to ask for it to be
ignored.
Hopefully you picked up the second patch with the corrected commit message.

Thanks,
Daniel


> Thanks,
> Inki Dae
>
>> Thanks,
>> Kukjin
>>
>>> > Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
>>> > ---
>>> >  drivers/gpu/drm/exynos/exynos_drm_drv.c | 10 +++++++---
>>> >  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
