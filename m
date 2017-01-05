From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v7 3/4] drm/panel: Add support for S6E3HA2 panel driver on
 TM2 board
Date: Thu, 5 Jan 2017 20:09:05 +0200
Message-ID: <CAJKOXPdD_u0NOixwkEekiF71RDfddkAkJGaKqBhETBwDPA3_1g@mail.gmail.com>
References: <CGME20170105102012epcas1p4ddeb577ea84b5c2cdf7029666b2091c1@epcas1p4.samsung.com>
 <1483611609-23522-1-git-send-email-hoegeun.kwon@samsung.com> <1483611609-23522-4-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483611609-23522-4-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: robh@kernel.org, thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org, Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Donghwa Lee <dh09.lee@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jan 5, 2017 at 12:20 PM, Hoegeun Kwon <hoegeun.kwon@samsung.com> wrote:
> This patch add support for MIPI-DSI based S6E3HA2 AMOLED panel
> driver. This panel has 1440x2560 resolution in 5.7-inch physical
> panel in the TM2 device.
>
> Signed-off-by: Donghwa Lee <dh09.lee@samsung.com>
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  .../bindings/display/panel/samsung,s6e3ha2.txt     |  28 +
>  drivers/gpu/drm/panel/Kconfig                      |   6 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      | 754 +++++++++++++++++++++
>  4 files changed, 789 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
>  create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
>
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
> new file mode 100644
> index 0000000..da4c291

This should be a separate patch, preferably first one in the series. See:
Documentation/devicetree/bindings/submitting-patches.txt
Since you already got reviews and tests, I think you can retain them
in both patches (so dt-bindings patch will have reviewed-by-Andrzej
and the code will have review+tested).

Best regards,
Krzysztof
