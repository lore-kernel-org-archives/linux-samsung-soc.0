From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Update x and y properties for mms114 touchscreen
Date: Fri, 26 Jan 2018 09:10:01 +0100
Message-ID: <CAJKOXPcSZ7XM0On6Qs1yhy0zNEWXp4hvq43Hh+tk9Mx7w1SXLg@mail.gmail.com>
References: <CGME20180126060503epcas2p4befe2d3d43f4a2158b1e1a123bf7906f@epcas2p4.samsung.com>
 <20180126060454.18082-1-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180126060454.18082-1-andi.shyti@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Simon Shields <simon@lineageos.org>, Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jan 26, 2018 at 7:04 AM, Andi Shyti <andi.shyti@samsung.com> wrote:
> The mms114 binding [1] specifies that the 'x' and 'y' should be
> called respectively 'touchscreen-size-x' and 'touchscreen-size-y'
> in coherence with the touchscreen [2] binding.
>
> Update the mms114 node for trats2 and trats dts according to the
> binding.
>
> [1] Documentation/devicetree/bindings/input/touchscreen/mms114.txt
> [2] Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
>
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> ---
> Hi Krzysztof,
>
> this patch depends on Simon's patchset [1] and must be applied after
> that. If you want I can ping you when the patch gets or you can take
> it in the next cycle.
>
> Andi

Thanks, looks good. Indeed I would appreciate if you gave me a ping
once dependency gets into Linus's tree.

Best regards,
Krzysztof

>
> [1] https://marc.info/?l=linux-kernel&m=151682273403098&w=2
