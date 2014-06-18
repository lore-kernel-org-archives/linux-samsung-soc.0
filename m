From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 03/10] mfd: cros_ec: Allow static din/dout buffers with
 cros_ec_register()
Date: Wed, 18 Jun 2014 08:53:16 +0100
Message-ID: <20140618075316.GI21030@lee--X1>
References: <1402954800-28215-1-git-send-email-dianders@chromium.org>
 <1402954800-28215-4-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:37135 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754208AbaFRHxW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 03:53:22 -0400
Received: by mail-ie0-f176.google.com with SMTP id rd18so397903iec.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2014 00:53:22 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1402954800-28215-4-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, swarren@wwwdotorg.org, olof@lixom.net, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, sjg@chromium.org, Wolfram Sang <wsa@the-dreams.de>, broonie@kernel.org, sameo@linux.intel.com, linux-kernel@vger.kernel.org

On Mon, 16 Jun 2014, Doug Anderson wrote:

> From: Bill Richardson <wfrichar@chromium.org>
>=20
> The lower-level driver may want to provide its own buffers. If so,
> there's no need to allocate new ones.  This already happens to work
> just fine (since we check for size of 0 and use devm allocation), but
> it's good to document it.
>=20
> [dianders: Resolved conflicts; documented that no code changes needed
> on mainline]
>=20
> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
>  include/linux/mfd/cros_ec.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.=
h
> index 7e9fe6e..2ee3190 100644
> --- a/include/linux/mfd/cros_ec.h
> +++ b/include/linux/mfd/cros_ec.h
> @@ -68,8 +68,8 @@ struct cros_ec_msg {
>   * We use this alignment to keep ARM and x86 happy. Probably word
>   * alignment would be OK, there might be a small performance advanta=
ge
>   * to using dword.
> - * @din_size: size of din buffer
> - * @dout_size: size of dout buffer
> + * @din_size: size of din buffer to allocate (zero to use static din=
)
> + * @dout_size: size of dout buffer to allocate (zero to use static d=
out)

Why don't these use your new format i.e. doutsize, etc?

>   * @command_send: send a command
>   * @command_recv: receive a command
>   * @ec_name: name of EC device (e.g. 'chromeos-ec')

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
