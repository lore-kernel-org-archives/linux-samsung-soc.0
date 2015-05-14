From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/1] drm/bridge: ptn3460: Fix I2C ID table to match the
 reported modalias
Date: Thu, 14 May 2015 08:08:56 -0700
Message-ID: <CAD=FV=UGGrJmVQ9yXRDdSvS6YcueOkwDrY4qooKiLQyo6iX=-w@mail.gmail.com>
References: <1431613889-32737-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431613889-32737-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Thierry Reding <treding@nvidia.com>, Olof Johansson <olof@lixom.net>, David Airlie <airlied@linux.ie>, Ajay Kumar <ajaykumar.rs@samsung.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

Javier,

On Thu, May 14, 2015 at 7:31 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> I2C drivers that support OF, have both an I2C and OF device ID tables
> that are used to fill the supported module aliases. But currently the
> I2C core only uses the OF table to match a device with a driver and
> the aliases information are always reported in the form i2c:<name>.
>
> The client->name is used as the name postfix and when booting with OF
> this is obtained with of_modalias_node() which drops the compatible
> string vendor prefix.
>
> So for I2C drivers, the I2C and OF device ID tables should be keep in
> sync in order to make module auto-loading to work but the I2C device
> entries shouldn't have the vendor prefix since that is not reported.
>
> Before this patch:
>
> MODALIAS=i2c:ptn3460
>
> $ modinfo | grep alias
> alias:          i2c:nxp,ptn3460
> alias:          of:N*T*Cnxp,ptn3460*
>
> After this patch:
>
> MODALIAS=i2c:ptn3460
>
> $ modinfo | grep alias
> alias:          i2c:ptn3460
> alias:          of:N*T*Cnxp,ptn3460*
>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  drivers/gpu/drm/bridge/ptn3460.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Doug Anderson <dianders@chromium.org>
