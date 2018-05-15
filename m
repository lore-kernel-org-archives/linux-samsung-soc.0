From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: add OF graph between USB-PHY
 and MUIC
Date: Tue, 15 May 2018 14:19:15 +0200
Message-ID: <CAJKOXPdxtek3yhr=LoHYwmqoLGPTZtpONR3iOseCi50ZiY=m_Q@mail.gmail.com>
References: <CGME20180515121251eucas1p160dd3dcff49f0dad845ed6be98f33bbe@eucas1p1.samsung.com>
 <20180515121239.18192-1-a.hajda@samsung.com> <20180515121239.18192-3-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180515121239.18192-3-a.hajda@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, May 15, 2018 at 2:12 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> OF graph describes USB data lanes between USB-PHY and respective MUIC.
> Since graph is present and DWC driver can use it to get extcon, obsolete
> extcon property can be removed.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  .../dts/exynos/exynos5433-tm2-common.dtsi     | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)

As we discussed for v1 - since this was not split into two, I'll apply
it once first patch hits mainline.

Best regards,
Krzysztof
