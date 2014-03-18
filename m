From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] drm/exynos: Fix (more) freeing issues in exynos_drm_drv.c
Date: Tue, 18 Mar 2014 14:45:57 +0900
Message-ID: <01a301cf426d$55d080b0$01718210$@samsung.com>
References: <1395026886-14325-1-git-send-email-djkurtz@chromium.org>
 <CAAQKjZMeeyD+6fhCaGk9qzX0oLTS=vHU86Y7gF9ZnbwcpTT7Kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAAQKjZMeeyD+6fhCaGk9qzX0oLTS=vHU86Y7gF9ZnbwcpTT7Kg@mail.gmail.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Inki Dae' <inki.dae@samsung.com>, 'Daniel Kurtz' <djkurtz@chromium.org>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, 'DRI mailing list' <dri-devel@lists.freedesktop.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Inki Dae wrote:
> 
> Applied.
> 
> Thanks,
> Inki Dae
> 
> 2014-03-17 12:28 GMT+09:00 Daniel Kurtz <djkurtz@chromium.org>:
> > The following commit [0] fixed a use-after-free, but left the subdrv
> open
> > in the error path.
> >
> > [0] commit 6ca605f7c70895a35737435f17ae9cc5e36f1466
> > drm/exynos: Fix freeing issues in exynos_drm_drv.c
> >
> > Change-Id: I452e944bf090fb11434d9e34213c890c41c15d73

This should be removed when Inki apply this.

Thanks,
Kukjin

> > Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_drv.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
