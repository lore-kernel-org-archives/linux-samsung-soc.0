From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: add OF graph between USB-PHY
 and MUIC
Date: Fri, 22 Jun 2018 12:56:25 +0200
Message-ID: <CAJKOXPeyh=oGE90Uz9nMxd-JgNORmoG3xPcMSHUrbnjccu5U2g@mail.gmail.com>
References: <20180515121239.18192-1-a.hajda@samsung.com> <CGME20180515121251eucas1p160dd3dcff49f0dad845ed6be98f33bbe@eucas1p1.samsung.com>
 <20180515121239.18192-3-a.hajda@samsung.com> <20180620182844.5nmlj5djbjgwy3wn@kozik-lap>
 <20180622103910eucas1p239a4f8545b3ef340fe5d0a8b954c48ac~6dUIg5f5F1882718827eucas1p2e@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180622103910eucas1p239a4f8545b3ef340fe5d0a8b954c48ac~6dUIg5f5F1882718827eucas1p2e@eucas1p2.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 22 June 2018 at 12:39, Andrzej Hajda <a.hajda@samsung.com> wrote:
> On 20.06.2018 20:28, Krzysztof Kozlowski wrote:
>> On Tue, May 15, 2018 at 02:12:39PM +0200, Andrzej Hajda wrote:
>>> OF graph describes USB data lanes between USB-PHY and respective MUIC.
>>> Since graph is present and DWC driver can use it to get extcon, obsolete
>>> extcon property can be removed.
>>>
>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>> ---
>>>  .../dts/exynos/exynos5433-tm2-common.dtsi     | 19 ++++++++++++++++++-
>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>> dtc W=1 now complains with:
>> ===
>> Warning (graph_child_address):
>> /soc/hsi2c@14d90000/max77843@66/max77843-muic/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> ===
>>
>> Do you plan to add more ports soon?
>
> There could be a link between UART and MUIC, it could be beneficial for
> the platform - there is no point to feed UART with data when UART output
> is muxed-out by MUIC.
> So I plan to investigate it but this is not on my short list :)
> Alternatively one can create graphs without using it atm.

In that case could you remove here the address/size-cells to fix the
warning? I see that code uses -1 in of_graph_get_remote_node() so it
should not depend on the reg number.

Best regards,
Krzysztof
