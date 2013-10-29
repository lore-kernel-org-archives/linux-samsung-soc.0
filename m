From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: dts: use 'status' property for PCIe nodes
Date: Tue, 29 Oct 2013 12:46:35 -0700
Message-ID: <20131029194635.GB19870@quad.lixom.net>
References: <002601ced46d$dbfa97c0$93efc740$%han@samsung.com>
 <526FD936.8040604@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:54900 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751379Ab3J2Tq4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Oct 2013 15:46:56 -0400
Received: by mail-pa0-f53.google.com with SMTP id kx10so495648pab.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Oct 2013 12:46:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <526FD936.8040604@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Jingoo Han <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org

On Tue, Oct 29, 2013 at 08:50:14AM -0700, Kukjin Kim wrote:
> On 10/28/13 23:12, Jingoo Han wrote:
> >Set the default status for PCIe to disabled in the exynos5440.dtsi
> >file and let the board dts files such as exynos5440-ssdk5440.dts
> >enable the PCIe. However, keep the PCIe for SD5v1 board disabled,
> >because there is no PCIe slot on SD5v1 board.
> >
> >Signed-off-by: Jingoo Han<jg1.han@samsung.com>
> 
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
> 
> Olof, please pick this into your tree directly :-)
> 
> If any problems, please kindly let me know.

Done, thanks.

-Olof
