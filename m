From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [alsa-devel] [PATCH 1/4] ARM: Kconfig: Add audio support dependency
Date: Mon, 3 Jan 2011 10:37:29 +0900
Message-ID: <AANLkTinnzD+cB6QuFJ4NK+-ASLDoTw6EgJiXJBreuzTD@mail.gmail.com>
References: <1293171965-24416-1-git-send-email-sw.youn@samsung.com>
	<1293172569-21465-1-git-send-email-sw.youn@samsung.com>
	<20110102140517.GJ4935@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:54798 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751782Ab1ACBha convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Jan 2011 20:37:30 -0500
Received: by wwa36 with SMTP id 36so13775718wwa.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 02 Jan 2011 17:37:29 -0800 (PST)
In-Reply-To: <20110102140517.GJ4935@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Seungwhan Youn <sw.youn@samsung.com>, alsa-devel@alsa-project.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, jassi.brar@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk

On Sun, Jan 2, 2011 at 11:05 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Fri, Dec 24, 2010 at 03:36:09PM +0900, Seungwhan Youn wrote:
>
>> This patch adds Samsung ASoC audio support dependency for Samsung So=
Cs.
>
>> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
>
>> + =C2=A0 =C2=A0 select ASOC_SAMSUNG if SND_SOC
>
> Hrm, if we're going to do this we probably ought to be doing it for a=
ll
> architectures. =C2=A0It's a good idea, we don't tend to have multiple
> possible architectures supported for a given architecture. =C2=A0Sinc=
e the
> second patch didn't apply I'll leave this one too, and patches 3 and =
4,
> though they all look good.

Yes, I think so, but I didn't think that far when I made these
patches. If you don't mind, can I re-make this patch-set for all
architectures with your 'Requested-by'?
