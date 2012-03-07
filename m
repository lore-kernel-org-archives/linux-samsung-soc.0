From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/3] S3C24XX: Enable DMA on S3C2416 by sharing S3C2443-DMA
Date: Wed, 07 Mar 2012 03:18:07 -0800
Message-ID: <4F5743EF.20603@samsung.com>
References: <201203041842.35420.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:36424 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751092Ab2CGLSL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Mar 2012 06:18:11 -0500
Received: by mail-tul01m020-f174.google.com with SMTP id uo6so6773643obb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Mar 2012 03:18:11 -0800 (PST)
In-Reply-To: <201203041842.35420.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 03/04/12 09:42, Heiko St=FCbner wrote:
> The S3C2416/2450 contains the same DMA register layout as the S3C2443=
=2E
> Therefore it can simply share this dma selection definition.
>
> As we use the S3C2443_DMA the S3C2416_DMA is no longer necessary. The
> third patch removes this remnant of the S3C24XX merge.
>
> The whole series was made on top of the recent S3C24XX merge.
>
Good, applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
