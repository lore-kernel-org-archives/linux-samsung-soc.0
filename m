From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 0/2] 3rd Round Samsung stuff for v3.12
Date: Thu, 29 Aug 2013 16:57:35 -0700
Message-ID: <20130829235735.GG29606@quad.lixom.net>
References: <235001cea389$b2059380$1610ba80$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:41268 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753722Ab3H2X6O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Aug 2013 19:58:14 -0400
Received: by mail-pb0-f49.google.com with SMTP id xb4so1105429pbc.22
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Aug 2013 16:58:13 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <235001cea389$b2059380$1610ba80$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Mike Turquette' <mturquette@linaro.org>

On Wed, Aug 28, 2013 at 09:58:23AM +0900, Kukjin Kim wrote:
> Hi Arnd, Olof and Kevin,
> 
> Sorry for a bit late pull-request.
> 
> Here is s3c64xx DT series and common clk stuff. It took some time due to
> dependency problem with the clk tree, and fixed now by merge clk-s3c64xx
> branch in Mike's clk tree. So many clock patches are included in 1st
> pull-request but most of them are for Samsung clk stuff.
> 
> So I think, this branches would be sent to mainline after clk stuff during
> merge window. Anyway, Tomasz's s3c64xx patches have been posted long time
> and look nice to support for s3c64xx with DT.
> 
> If any problems, please kindly let me know.

Hi,

We're out of time for 3.12 now. Please send these as soon as -rc1 is cut and
we'll queue them up for 3.13.


-Olof
