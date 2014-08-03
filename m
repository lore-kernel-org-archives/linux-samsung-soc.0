From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 07/15] drm/exynos: dsi: Add support for panel prepare and
 unprepare routines
Date: Sun, 3 Aug 2014 16:58:19 +0900
Message-ID: <CAAQKjZMVwc+5ErcL7JJfrAan--ga6nG+xEVuKuJz8xQHytFKuw@mail.gmail.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
	<1406828534-10072-8-git-send-email-ajaykumar.rs@samsung.com>
	<20140801090505.GC21724@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:57859 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751278AbaHCH6V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Aug 2014 03:58:21 -0400
In-Reply-To: <20140801090505.GC21724@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com

2014-08-01 18:05 GMT+09:00 Thierry Reding <thierry.reding@gmail.com>:
> On Thu, Jul 31, 2014 at 11:12:06PM +0530, Ajay Kumar wrote:
>> Modify exynos_dsi driver to support the new panel calls:
>> prepare and unprepare.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c |   12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> And this one as well.

Acked-by: Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

>
> Thierry
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
