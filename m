From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] drm/exynos: Fix (more) freeing issues in exynos_drm_drv.c
Date: Mon, 17 Mar 2014 09:45:51 +0530
Message-ID: <CAK9yfHx5XFA1GyoHsRMgh2FpQ-4+pe=5302ZBJYUK6hLwdVLSQ@mail.gmail.com>
References: <1395026919-14467-1-git-send-email-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395026919-14467-1-git-send-email-djkurtz@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene.kim@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Daniel,

Thanks for the patch.

On 17 March 2014 08:58, Daniel Kurtz <djkurtz@chromium.org> wrote:
> The following commit [0] fixed a use-after-free, but left the subdrv open
> in the error path.
>
> [0] commit 6ca605f7c70895a35737435f17ae9cc5e36f1466
> drm/exynos: Fix freeing issues in exynos_drm_drv.c
>
> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>

Acked-by: Sachin Kamat <sachin.kamat@linaro.org>

-- 
With warm regards,
Sachin
