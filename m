From: Dariusz Marcinkiewicz <darekm@google.com>
Subject: Re: [PATCH v7 9/9] drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register
Date: Wed, 28 Aug 2019 14:38:02 +0200
Message-ID: <CALFZZQHZrVSaKhTSH6suOc0epMQzcgxAHddoJGxvtdhSp1tW0Q@mail.gmail.com>
References: <20190814104520.6001-1-darekm@google.com> <CGME20190814104630epcas3p44755443f37e78b2613f7dda35d71bb71@epcas3p4.samsung.com>
 <20190814104520.6001-10-darekm@google.com> <6bbfb6f8-15c2-9ad2-8857-898f4c6435a3@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6bbfb6f8-15c2-9ad2-8857-898f4c6435a3@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi.

On Wed, Aug 28, 2019 at 10:39 AM Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
>
> nit: I think err_rpm_disable or err_pm_runtime_disable could be better
>      label names.
>
Submitted v7.1 which replaces err_runtime_disable with err_rpm_disable.

Thank you.
