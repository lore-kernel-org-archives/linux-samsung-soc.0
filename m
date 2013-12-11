From: Matt Porter <matt.porter@linaro.org>
Subject: Re: [PATCH v4 5/9] usb: s3c-hsotg: Use the new Exynos USB phy driver
 with the generic phy framework
Date: Wed, 11 Dec 2013 10:15:56 -0500
Message-ID: <20131211151556.GB6279@beef>
References: <1386246579-25141-1-git-send-email-k.debski@samsung.com>
 <1386246579-25141-6-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:40437 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751036Ab3LKPQC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Dec 2013 10:16:02 -0500
Received: by mail-ie0-f181.google.com with SMTP id e14so11238107iej.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2013 07:16:00 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1386246579-25141-6-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, kishon@ti.com, t.figa@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org

On Thu, Dec 05, 2013 at 01:29:35PM +0100, Kamil Debski wrote:
> Change the used phy driver to the new Exynos USB phy driver that uses the
> generic phy framework.
> 
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  .../devicetree/bindings/usb/samsung-hsotg.txt      |    4 ++++
>  drivers/usb/gadget/s3c-hsotg.c                     |   11 ++++++-----
>  2 files changed, 10 insertions(+), 5 deletions(-)

This is only applying with fuzz against -rc3, needs an update. It's
otherwise still working fine on my BCM Capri board.

-Matt
