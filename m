From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: samsung: Save defconfig for Exynos, S3C and S5P configs
Date: Wed, 7 Jun 2017 21:49:58 +0200
Message-ID: <CAK8P3a2_rLigHqnOkHPM+x2GDrwdGnwJOqEbY7YTsQRUXT_eJg@mail.gmail.com>
References: <20170607181846.13539-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:33772 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751190AbdFGTt7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Jun 2017 15:49:59 -0400
In-Reply-To: <20170607181846.13539-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>

On Wed, Jun 7, 2017 at 8:18 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Some configs for Samsung ARM SoCs were not updated for some time and
> they still contain obsolete Kconfig entries.  Generate new defconfig for
> all Samsung ARM architectures (Exynos, S3C24xx, S3C64xx, S5Pv210).
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Hi Krzysztof,

Updating the defconfig files is good, but I'm always a little unsure
about loss of
information when we do that. Would it be possible for you to split this patch
into two halves, with one of them just reordering the entries that moved,
and the second one removing the entries that have disappeared, with an
explanation for why they are no longer there? That would let us see whether
the change was intentional and avoid problems from renamed Kconfig
symbols that are no longer enabled afterwards.

      Arnd
