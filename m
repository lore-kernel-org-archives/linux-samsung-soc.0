From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: drm/exynos: scaler: Reset hardware before starting the
 operation (bug report)
Date: Mon, 22 Jul 2019 19:05:58 +0200
Message-ID: <9ceb6d17-6d1b-3d6d-2baa-1a31e57fe21d@samsung.com>
References: <CGME20190705160911epcas2p2754c2c703cc6086f7f1715e1840deb1b@epcas2p2.samsung.com>
        <c67b4671-aabc-df13-e9c7-ccbc25337b7c@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c67b4671-aabc-df13-e9c7-ccbc25337b7c@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Ian King <colin.king@canonical.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 2019-07-05 18:09, Colin Ian King wrote:
> Static analysis on today's linux-next has found a potential error in the
> following commit:
>
> commit 280e54c9f614c88292685383cf2d65057586e9fb
> Author: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> Date:   Thu Jun 7 13:06:08 2018 +0200
>
>      drm/exynos: scaler: Reset hardware before starting the operation
>
> In the following code the retry counter does not appear to be
> decremented, so potentially the loop could get stuck forever if the H/W
> does not change state:
>
> static inline int scaler_reset(struct scaler_context *scaler)
> {
>          int retry = SCALER_RESET_WAIT_RETRIES;
>
>          scaler_write(SCALER_CFG_SOFT_RESET, SCALER_CFG);
>          do {
>                  cpu_relax();
>          } while (retry > 1 &&
>                   scaler_read(SCALER_CFG) & SCALER_CFG_SOFT_RESET);
>
>          do {
>                  cpu_relax();
>                  scaler_write(1, SCALER_INT_EN);
>          } while (retry > 0 && scaler_read(SCALER_INT_EN) != 1);
>
>          return retry ? 0 : -EIO;
> }
>
> Maybe I'm missing something here subtle.

Right. Indeed there is missing decrementation of the 'retry' variable. I 
suggest to add it to both loops and reset retry value to 
SCALER_RESET_WAIT_RETRIES between them.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
