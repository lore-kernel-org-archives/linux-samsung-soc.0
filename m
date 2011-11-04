From: Girish K S <girish.shivananjappa@linaro.org>
Subject: Re: [PATCH] mmc: core: Fix setting power notify state variable for
 non eMMC
Date: Fri, 4 Nov 2011 07:29:50 -0400
Message-ID: <CAGxe1ZEeHU0w5yOfwa14nD_ZRe+c6PD1+o=6w1QAagPhNF7zyA@mail.gmail.com>
References: <1320403967-2940-1-git-send-email-girish.shivananjappa@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:52617 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753791Ab1KDL3v convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Nov 2011 07:29:51 -0400
In-Reply-To: <1320403967-2940-1-git-send-email-girish.shivananjappa@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-mmc@vger.kernel.org
Cc: cjb@laptop.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, Girish K S <girish.shivananjappa@linaro.org>

On 4 November 2011 06:52, Girish K S <girish.shivananjappa@linaro.org> =
wrote:
> This patch skips the setting of the power notify state variable
> for non eMMC 4.5 devices. Also fixes the problem of omap_hsmmc
> noisy/broken for suspend resume reported by kevin Hilman.
>
> cc: Chris Ball <cjb@laptop.org>
> Signed-off-by: Girish K S <girish.shivananjappa@linaro.org>
> ---
> =A0drivers/mmc/core/mmc.c | =A0 10 +++++++---
> =A01 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 3627044..4db73a9 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -882,10 +882,14 @@ static int mmc_init_card(struct mmc_host *host,=
 u32 ocr,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 card-=
>ext_csd.generic_cmd6_time);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (err && err !=3D -EBADMSG)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto free_card;
> - =A0 =A0 =A0 }
>
> - =A0 =A0 =A0 if (!err)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 card->poweroff_notify_state =3D MMC_POW=
ERED_ON;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* The err can be -EBADMSG or 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* so check for success and update th=
e flag
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!err)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 card->poweroff_notify_s=
tate =3D MMC_POWERED_ON;
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * Activate high speed (if supported)
> --
> 1.7.4.1
>
>Hi Chris,
              this patch is based on for-linus branch.
 Regards
Girish K S
