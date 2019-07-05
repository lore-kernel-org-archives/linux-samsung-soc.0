From: Colin Ian King <colin.king@canonical.com>
Subject: Re: drm/exynos: scaler: Reset hardware before starting the operation
 (bug report)
Date: Fri, 5 Jul 2019 17:09:06 +0100
Message-ID: <c67b4671-aabc-df13-e9c7-ccbc25337b7c@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Static analysis on today's linux-next has found a potential error in the
following commit:

commit 280e54c9f614c88292685383cf2d65057586e9fb
Author: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Date:   Thu Jun 7 13:06:08 2018 +0200

    drm/exynos: scaler: Reset hardware before starting the operation

In the following code the retry counter does not appear to be
decremented, so potentially the loop could get stuck forever if the H/W
does not change state:

static inline int scaler_reset(struct scaler_context *scaler)
{
        int retry = SCALER_RESET_WAIT_RETRIES;

        scaler_write(SCALER_CFG_SOFT_RESET, SCALER_CFG);
        do {
                cpu_relax();
        } while (retry > 1 &&
                 scaler_read(SCALER_CFG) & SCALER_CFG_SOFT_RESET);

        do {
                cpu_relax();
                scaler_write(1, SCALER_INT_EN);
        } while (retry > 0 && scaler_read(SCALER_INT_EN) != 1);

        return retry ? 0 : -EIO;
}

Maybe I'm missing something here subtle.

Colin
