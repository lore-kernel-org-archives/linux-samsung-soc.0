From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3.18 1/2] ARM: exynos_defconfig: Enable options to mount a
 rootfs via NFS
Date: Wed, 7 Feb 2018 11:45:33 +0100
Message-ID: <CAJKOXPd-tftXW6DGthCbzXxaHWpVyVhe-45vBLpxha+T26zNwA@mail.gmail.com>
References: <CAJKOXPfsvXfONa8gT1-Vfa1qme3kC2DQBhHHLtkmTdSA+-zRKQ@mail.gmail.com>
 <7cb705ff603f159efe60c5c43e65e4648fca5113.1517997302.git.guillaume.tucker@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753454AbeBGKpg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Feb 2018 05:45:36 -0500
In-Reply-To: <7cb705ff603f159efe60c5c43e65e4648fca5113.1517997302.git.guillaume.tucker@collabora.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>

On Wed, Feb 7, 2018 at 11:21 AM, Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
> From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>
> commit 19f79ccf6d77409cd138bce8db206cdac7fd5ea7 upstream.
>
> This patch enables the options to mount a rootfs over NFS and also
> support for automatic configuration of IP addresses during boot as
> needed by NFS.
>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Signed-off-by: Kukjin Kim <kgene@kernel.org>
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> ---
>  arch/arm/configs/exynos_defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
