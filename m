From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 01/10] mfd: cros_ec: Fix the comment on cros_ec_remove()
Date: Wed, 18 Jun 2014 08:57:04 +0100
Message-ID: <20140618075704.GK21030@lee--X1>
References: <1402954800-28215-1-git-send-email-dianders@chromium.org>
 <1402954800-28215-2-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1402954800-28215-2-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, swarren@wwwdotorg.org, olof@lixom.net, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, sjg@chromium.org, Wolfram Sang <wsa@the-dreams.de>, broonie@kernel.org, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 16 Jun 2014, Doug Anderson wrote:

> From: Bill Richardson <wfrichar@chromium.org>
>=20
> This comment was incorrect, so update it.
>=20
> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
> Signed-off-by: Simon Glass <sjg@chromium.org>

How many people did it take to write this patch? ;)

Acked-by: Lee Jones <lee.jones@linaro.org>

> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
>  include/linux/mfd/cros_ec.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.=
h
> index 887ef4f..7e9fe6e 100644
> --- a/include/linux/mfd/cros_ec.h
> +++ b/include/linux/mfd/cros_ec.h
> @@ -148,8 +148,7 @@ int cros_ec_prepare_tx(struct cros_ec_device *ec_=
dev,
>  /**
>   * cros_ec_remove - Remove a ChromeOS EC
>   *
> - * Call this to deregister a ChromeOS EC. After this you should call
> - * cros_ec_free().
> + * Call this to deregister a ChromeOS EC, then clean up any private =
data.
>   *
>   * @ec_dev: Device to register
>   * @return 0 if ok, -ve on error

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
