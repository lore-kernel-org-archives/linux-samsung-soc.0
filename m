From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 0/3] mfd: ChromeOS EC Kconfig dependency cleanup
Date: Fri, 7 Aug 2015 02:03:13 +0200
Message-ID: <CABxcv=kG=pSprUdoscAFgCF=S5CccvHO0mP+tjnumNeEjsVckg@mail.gmail.com>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f169.google.com ([209.85.160.169]:36155 "EHLO
	mail-yk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753215AbbHGADO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Aug 2015 20:03:14 -0400
Received: by ykeo23 with SMTP id o23so76269725yke.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2015 17:03:13 -0700 (PDT)
In-Reply-To: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>

Hello Lee,

On Thu, Jun 25, 2015 at 2:20 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
>
> This is a trivial series that do some changes to the dependency for the
> ChromeOS EC drivers Kconfig symbols. The patches are on top of Paul's
> patch "mfd: fix dependency warning for CHROME_PLATFORMS on !X86, !ARM":
> https://lkml.org/lkml/2015/6/20/219.
>
> Paul fixed a warning about unmet dependencies but I think the correct fix
> is to remove unneded dependencies. So that is what this series do and are
> composed of the following patches:
>
>
> Javier Martinez Canillas (3):
>   platform/chrome: Don't make CHROME_PLATFORMS depends on X86 || ARM
>   mfd: Remove MFD_CROS_EC depends on X86 || ARM
>   mfd: Remove MFD_CROS_EC_SPI depends on OF
>
>  drivers/mfd/Kconfig             | 3 +--
>  drivers/platform/chrome/Kconfig | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)
>

The warning that this series fixes has appeared again in linux-next.
You said some time ago that applied the patches for 4.3 [0] and indeed
I remember the warning going away at some point.

Do you know what happened with this patches? I see 3/3 in linux-next
but no 1/3 and 2/3.

[0]: https://lkml.org/lkml/2015/6/25/115

Thanks a lot and best regards,
Javier
