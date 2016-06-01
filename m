From: Mark yao <mark.yao@rock-chips.com>
Subject: Re: [PATCH v2 06/10] drm/rockchip: analogix_dp: make panel detect to
 an optional action
Date: Wed, 1 Jun 2016 11:53:12 +0800
Message-ID: <574E5C28.1030504@rock-chips.com>
References: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
 <1464066155-22777-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464066155-22777-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>, David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Mark Yao <yzq@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, emil.l.velikov@gmail.com, Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 2016=E5=B9=B405=E6=9C=8824=E6=97=A5 13:02, Yakir Yang wrote:
> Some boards don't need to declare a panel device node, like the
> display interface is DP monitors, so it's necessary to make the
> panel detect to an optional action.
>
> Signed-off-by: Yakir Yang<ykk@rock-chips.com>
> ---
Looks for me, So:

Acked-by: Mark Yao <mark.yao@rock-chips.com>

--=20
=EF=BC=ADark Yao
