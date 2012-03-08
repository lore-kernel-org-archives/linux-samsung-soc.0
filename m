From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: S3C2440: Fixed build error for s3c244x
Date: Thu, 8 Mar 2012 08:59:33 -0800
Message-ID: <CAOesGMhkZLGRYi3QTko0gcbj3MJ4vZE6mddEFLFsMhdx9fkx9Q@mail.gmail.com>
References: <1331200116-2424-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:37660 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753298Ab2CHQ7f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Mar 2012 11:59:35 -0500
Received: by wgbdr13 with SMTP id dr13so699005wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Mar 2012 08:59:33 -0800 (PST)
In-Reply-To: <1331200116-2424-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: arnd@arndb.de, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Thu, Mar 8, 2012 at 1:48 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Fixed following:
> arch/arm/mach-s3c2440/s3c244x.c: In function 's3c244x_restart':
> arch/arm/mach-s3c2440/s3c244x.c:209: error: expected declaration or statement at end of input
> make[1]: *** [arch/arm/mach-s3c24xx/s3c244x.o] Error 1
> make: *** [arch/arm/mach-s3c24xx] Error 2
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks, applied to fixes and I'll send out a pull request for the branch today.


-Olof
