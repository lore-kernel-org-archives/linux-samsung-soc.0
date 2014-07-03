From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 01/10] mfd: cros_ec: Fix the comment on
 cros_ec_remove()
Date: Thu, 3 Jul 2014 08:27:09 +0100
Message-ID: <20140703072709.GA29114@lee--X1>
References: <1403115247-8853-1-git-send-email-dianders@chromium.org>
 <1403115247-8853-2-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:55969 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754292AbaGCH1Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jul 2014 03:27:16 -0400
Received: by mail-ig0-f178.google.com with SMTP id hn18so1165073igb.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Jul 2014 00:27:16 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1403115247-8853-2-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, swarren@wwwdotorg.org, olof@lixom.net, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, sjg@chromium.org, Wolfram Sang <wsa@the-dreams.de>, broonie@kernel.org, sameo@linux.intel.com, linux-kernel@vger.kernel.org

On Wed, 18 Jun 2014, Doug Anderson wrote:

> From: Bill Richardson <wfrichar@chromium.org>
>=20
> This comment was incorrect, so update it.
>=20
> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
> Changes in v2: None
>=20
>  include/linux/mfd/cros_ec.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Very well, patch applied than.

Clause: There is a chance that this patch might not be seen in -next
for ~24-48hrs.  If it's not there by 72hrs, feel free to poke.

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
