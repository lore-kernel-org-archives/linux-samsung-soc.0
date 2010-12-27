From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [alsa-devel] [PATCH 2/4] ARM: SAMSUNG: Add SMDK audio configuration
Date: Mon, 27 Dec 2010 10:31:09 +0900
Message-ID: <AANLkTimPj554qSkpydNQWWbkX71qpZ9CwNfU+EmUATWw@mail.gmail.com>
References: <1293171965-24416-1-git-send-email-sw.youn@samsung.com>
	<1293172938-23615-1-git-send-email-sw.youn@samsung.com>
	<20101224114904.GA15926@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:49100 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753282Ab0L0BbK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 26 Dec 2010 20:31:10 -0500
Received: by wwi17 with SMTP id 17so8400378wwi.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Dec 2010 17:31:09 -0800 (PST)
In-Reply-To: <20101224114904.GA15926@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Seungwhan Youn <sw.youn@samsung.com>, alsa-devel@alsa-project.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, jassi.brar@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk

On Fri, Dec 24, 2010 at 8:49 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Fri, Dec 24, 2010 at 03:42:18PM +0900, Seungwhan Youn wrote:
>
>> =C2=A0 =C2=A0 =C2=A0 select S3C_DEV_HSMMC
>> + =C2=A0 =C2=A0 select SMDK_HAS_WM9710_AC97 if ASOC_SAMSUNG
>> =C2=A0 =C2=A0 =C2=A0 help
>
> There's no need for the ifs here - since the actual machine driver is=
 a
> user visible control and the SMDK_HAS_ are just dependencies for that
> it's more normal to just select the symbol.

The 'if' seems to be necessary, otherwise we get 'unmet direct
dependency' warning message and the menuconfig shows messed up.
