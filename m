From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v3 0/2] Add support for the S6E3HA2 panel on TM2 board
Date: Mon, 02 Jan 2017 13:06:30 +0100
Message-ID: <5aa24b42-6879-6f01-06d1-def32ef8d727@samsung.com>
References: <CGME20161230065850epcas5p3ecad04edde7dfe1f2ad3c86815dcc377@epcas5p3.samsung.com>
 <1483081108-32055-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1483081108-32055-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>, robh@kernel.org, thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 30.12.2016 07:58, Hoegeun Kwon wrote:
> Purpose of this patch is add support for S6E3HA2 AMOLED panel on
> the TM2 board. The first patch adds support for S6E3HA2 panel
> device tree document and driver, the second patch add support for
> S6E3HA2 panel device tree.
>
> Changes for V3:
>
> - In the DT binding document, made it clearly that the panel is a
>   child node of dsi.
> - Fix reset-gpio active from high to low.
> - Is the OF graph saying related to [1]?

Yes, video-interfaces described in [1] are OF graphs described in [2]
with additional properties specific for video pipelines.

[2]: Documentation/devicetree/bindings/graph.txt

>   Althogh the panel is a child of dsi, I think OF graph necessary.
>   because if a remote-endpoint is not specified, the dsi also
>   panel is not probed.

OK, I see the issue: dsi driver requires presence of DSI_PORT_OUT
endpoint, because it needs to read MIPI-DSI burst and esc clock
frequencies from these nodes, however it does not use it to get panel
node, panel node is get by .attach callback. Probably these clock
frequencies should be passed via struct mipi_dsi_device.
So as for now I think it would be simpler to leave OF graph, as it is
already used this way in other drivers.

> - The display-timings has been fixed to be provided by the device
>   driver. however, I think display-timings is necessary in dts.
>   because if dts does not have display-timings, dsi will not load.

After examining drivers it looks like these timings, beside panel, are
read by MIC driver, and this is wrong. MIC driver shouldn't peek into
other driver's nodes, it can use DRM callbacks (mode_fixup, mode_set) to
get necessary information. And more importantly display-timings in
panels are not accepted by panels maintainer AFAIK, see [1] for rationale.

[1]:
https://sietch-tagr.blogspot.de/2016/04/display-panels-are-not-special.html

Regards
Andrzej

>
> [1]: Documentation/devicetree/bindings/media/video-interfaces.txt
>
> Hoegeun Kwon (1):
>   drm/panel: Add support for S6E3HA2 panel driver on TM2 board
>
> Hyungwon Hwang (1):
>   arm64: dts: exynos: Add support for S6E3HA2 panel device on TM2 board
>
>  .../bindings/display/panel/samsung,s6e3ha2.txt     |  58 ++
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      |  31 +
>  drivers/gpu/drm/panel/Kconfig                      |   6 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      | 741 +++++++++++++++++++++
>  5 files changed, 837 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
>  create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
>
