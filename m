From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 06/15] drm/exynos: dpi: Add support for panel prepare and
 unprepare routines
Date: Fri, 01 Aug 2014 18:24:42 +0900
Message-ID: <53DB5CDA.3010901@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406828534-10072-7-git-send-email-ajaykumar.rs@samsung.com>
 <20140801090444.GB21724@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19799 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750708AbaHAJYo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 05:24:44 -0400
In-reply-to: <20140801090444.GB21724@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, cpgs@samsung.com

On 2014=EB=85=84 08=EC=9B=94 01=EC=9D=BC 18:04, Thierry Reding wrote:
> On Thu, Jul 31, 2014 at 11:12:05PM +0530, Ajay Kumar wrote:
>> Modify exynos_dpi driver to support the new panel calls:
>> prepare and unprepare.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_dpi.c |    8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> Looks good to me. Inki, can I have your Acked-by to take this through
> the panel tree?

Of course.

Acked-by: Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

>=20
> Thierry
>=20
