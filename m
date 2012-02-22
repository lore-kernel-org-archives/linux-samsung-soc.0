From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH 1/2] ARM: S3C24XX: Move s3c2443-clock.c to mach-s3c24xx
Date: Wed, 22 Feb 2012 23:21:13 +0530
Message-ID: <CAJe_ZheGxcM+FsHv6hQ59hVTbes22D=5zBFsEiDzwd+wN1pK2g@mail.gmail.com>
References: <201202212221.41744.heiko@sntech.de>
	<201202212226.01189.heiko@sntech.de>
	<201202221718.01137.arnd@arndb.de>
	<201202221828.53363.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:52175 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753119Ab2BVRvP convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Feb 2012 12:51:15 -0500
Received: by lagu2 with SMTP id u2so327960lag.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2012 09:51:14 -0800 (PST)
In-Reply-To: <201202221828.53363.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org

On 22 February 2012 22:58, Heiko St=FCbner <heiko@sntech.de> wrote:
>
>> No objections on the patch, but please use 'git format-patch -M' whe=
n
>> moving files so that we can see which parts have changed in the proc=
ess.
> the results of -M look really nice, thanks for the hint and I will tr=
y to
> remember it :-)
>
The -M option is as easy to forget as it is useful.
I wonder if that could be made the default with format-patch ?

-j
