From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH 0/2] ARM: Samsung: I2C code cleanup
Date: Tue, 5 Jul 2011 16:54:41 +0530
Message-ID: <CAHfPSqA6YtSeb-A7QPTuVSgjFuPyF52REw=Vit6xU31B+RenHg@mail.gmail.com>
References: <1309519992-3026-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:38404 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932165Ab1GELZB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 07:25:01 -0400
Received: by iwn6 with SMTP id 6so5107675iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2011 04:25:01 -0700 (PDT)
In-Reply-To: <1309519992-3026-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: sbkim73@samsung.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Kukjin,

Can you kindly, review the following patchset and let me know the comme=
nts.

On 1 July 2011 17:03, Naveen Krishna Chatradhi <ch.naveen@samsung.com> =
wrote:
> Does the same job, while saving few lines of code.
>
> =A0o To Kukjin Kim, Sangbeom Kim and Ben Dooks
>
> Naveen Krishna Chatradhi (2):
> =A0ARM: Samsung: Use generic set_plat_data function
> =A0ARM: Samsung: Cleanup I2C code in plat-samsung
>
> =A0arch/arm/plat-samsung/dev-i2c0.c =A0 =A0 =A0 =A0 | =A0 14 ++++++--=
------
> =A0arch/arm/plat-samsung/dev-i2c1.c =A0 =A0 =A0 =A0 | =A0 24 ++++++++=
----------------
> =A0arch/arm/plat-samsung/dev-i2c2.c =A0 =A0 =A0 =A0 | =A0 24 ++++++++=
----------------
> =A0arch/arm/plat-samsung/dev-i2c3.c =A0 =A0 =A0 =A0 | =A0 24 ++++++++=
----------------
> =A0arch/arm/plat-samsung/dev-i2c4.c =A0 =A0 =A0 =A0 | =A0 24 ++++++++=
----------------
> =A0arch/arm/plat-samsung/dev-i2c5.c =A0 =A0 =A0 =A0 | =A0 24 ++++++++=
----------------
> =A0arch/arm/plat-samsung/dev-i2c6.c =A0 =A0 =A0 =A0 | =A0 24 ++++++++=
----------------
> =A0arch/arm/plat-samsung/dev-i2c7.c =A0 =A0 =A0 =A0 | =A0 24 ++++++++=
----------------
> =A0arch/arm/plat-samsung/include/plat/iic.h | =A0 =A02 ++
> =A09 files changed, 64 insertions(+), 120 deletions(-)
>
> --
> 1.7.2.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Shine bright,
(: Nav :)
