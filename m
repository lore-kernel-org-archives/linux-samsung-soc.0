From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v4 2/5] ARM: dts: Prepare exynos5410-odroidxu device tree
Date: Mon, 16 Mar 2015 11:58:43 +0100
Message-ID: <CABxcv=kXkMkGkq=xjEBkfzdeFZ7XHDhneAxCgANoMDZ4u2Z4yw@mail.gmail.com>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de>
	<1426456834-6308-3-git-send-email-afaerber@suse.de>
	<CABxcv==cnFQ75qaykfkOcFo8FNqkzVswu8iYOB3riZJT9=4U_Q@mail.gmail.com>
	<5506B02D.3000400@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:34068 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750862AbbCPK6o convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Mar 2015 06:58:44 -0400
Received: by wggv3 with SMTP id v3so36364824wgg.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Mar 2015 03:58:43 -0700 (PDT)
In-Reply-To: <5506B02D.3000400@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?B?6rmA7ZWZ7KO8?= <ruppi.kim@hardkernel.com>, Tomasz Figa <tomasz.figa@gmail.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hello Andreas,

On Mon, Mar 16, 2015 at 11:27 AM, Andreas F=C3=A4rber <afaerber@suse.de=
> wrote:
> Am 16.03.2015 um 08:56 schrieb Javier Martinez Canillas:
>>
>> I think this should be defined in exynos5410.dtsi instead since is a=
n
>> IP block in the SoC and referenced in the .dts using a label to chan=
ge
>> the clock-frequency in the board.
>
> I hope you understood that this is a literal copy of smdk5410, so I'm
> not going to make random changes here. If the Samsung guys want to ma=
ke
> this change for smdk5410, then fine, but otherwise - like for Snow an=
d
> Spring - I want to keep the diff -u low between the two.
>

Yes I did understand that it was a copy but I thought it could be
improved anyways. But I don't have a strong opinion either to block
this series and always both DTS can be changed as a follow-up. So I'm
ok with your decision to keeping the delta to the minimum for now.

>>
>> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.=
uk>
>
> Thanks, first review after posting for the third time... ;)
>

You are welcome.

I usually try to review new Exynos5 DTS but I missed your series
before because I was not in the cc list. I only noticed now because
you talked about it on irc.

> Regards,
> Andreas
>

Best regards,
Javier
