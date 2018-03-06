From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v5 0/6] dt-bindings: add bindings for USB physical
 connector
Date: Tue, 6 Mar 2018 13:53:34 +0100
Message-ID: <c4a773b6-a24e-4e72-3cc4-ebafeac232c1@samsung.com>
References: <CGME20180227071137eucas1p104aeeb0fd926fe985e250174d9d65b2e@eucas1p1.samsung.com>
        <20180227071134.28063-1-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180227071134.28063-1-a.hajda@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Rob, Chanwoo, Krzysztof,


On 27.02.2018 08:11, Andrzej Hajda wrote:
> Hi,
>
> Thanks for reviews of previous iterations.
>
> This patchset introduces USB physical connector bindings, together with
> working example.
> I have removed RFC prefix - the patchset seems to be heading
> to a happy end :)
>
> v5: fixed extra parenthesis in dts, renamed extcon function.
> v4: improved binding descriptions, added missing reg in dts.
> v3: Separate binding for Samsung 11-pin connector, added full-blown USB-C
>     example.
> v2: I have addressed comments by Rob and Laurent, thanks 
>
> Changes in datail are described in the patches.
>
> Regards
> Andrzej
>
>
> Andrzej Hajda (5):
>   dt-bindings: add bindings for USB physical connector
>   dt-bindings: add bindings for Samsung micro-USB 11-pin connector
>   arm64: dts: exynos: add micro-USB connector node to TM2 platforms
>   arm64: dts: exynos: add OF graph between MHL and USB connector
>   extcon: add possibility to get extcon device by OF node
>
> Maciej Purski (1):
>   drm/bridge/sii8620: use micro-USB cable detection logic to detect MHL

It looks like all patches received R-B or acks (I forgot add Krzysztof's
acks for dts part).
Now I have a question how to merge them.
The only functional dependency is between bridge and extcon, and from
the formal PoV bindings should be merged 1st.
I can merge it:
1. All patches via drm-misc tree.
2. All patches except dts via drm-misc, and Krzysztof will merge dts via
samsung-soc tree.

Is it OK, for all? Better ideas?

Regards
Andrzej


>
>  .../connector/samsung,usb-connector-11pin.txt      | 49 +++++++++++
>  .../bindings/connector/usb-connector.txt           | 75 +++++++++++++++++
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 38 ++++++++-
>  drivers/extcon/extcon.c                            | 44 +++++++---
>  drivers/gpu/drm/bridge/sil-sii8620.c               | 97 +++++++++++++++++++++-
>  include/linux/extcon.h                             |  6 ++
>  6 files changed, 293 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/connector/samsung,usb-connector-11pin.txt
>  create mode 100644 Documentation/devicetree/bindings/connector/usb-connector.txt
>
