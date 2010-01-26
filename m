From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: Samsung: New driver for AC97 controllers
Date: Tue, 26 Jan 2010 15:16:54 +0900
Message-ID: <1b68c6791001252216t5a91b9a9t92edb5e515ddd434@mail.gmail.com>
References: <1264485091-13750-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from qw-out-2122.google.com ([74.125.92.25]:35589 "EHLO
	qw-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751537Ab0AZGQz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2010 01:16:55 -0500
Received: by qw-out-2122.google.com with SMTP id 8so105328qwh.37
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Jan 2010 22:16:55 -0800 (PST)
In-Reply-To: <1264485091-13750-1-git-send-email-jassisinghbrar@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, lrg@slimlogic.co.uk, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Tue, Jan 26, 2010 at 2:51 PM,  <jassisinghbrar@gmail.com> wrote:
> From: Jassi Brar <jassi.brar@samsung.com>
>
> Hi,
> =C2=A0I am going to submit new driver for the AC97-ver-2.0 controller=
s found in
> Samsung SoCs. The driver is named generic s3c-ac97.c
> =C2=A0The driver has been tested for on s3c64xx and newer SoCs and is=
 confirmed
> to support Playback/Capture and VRA.
>
> =C2=A0A machine driver, for SMDKs with wm9713 as AC97 codec attached,=
 has also
> been added. The driver is generic enough to be used as such with newe=
r SoCs.
>
> =C2=A0The controller driver patch is meant for Mark Brown's for-2.6.3=
4
> =C2=A0Other patches apply cleanly against the Ben Dooks' next-samsung
>
> =C2=A0The s3c-ac97.c is meant to replace s3c2443-ac97.c after someone=
 confirms
> Playback/Capture to work fine. My smdk2443 seems to not play any soun=
d though
> the DAI link is establised and the codec detected fine.
I forgot to mention that that's the status with new s3c-ac97.c as well =
as
 old s3c2443-ac97.c .... now read on please.

> So, my opinion is that the new driver is atleast as good as the old o=
ne.
> If that is good enough, I have patches ready that switch the only two=
 users
> of s3c2443-ac97.c(smdk2443 and ln2440sbc) to use this new driver.
>
> Regards.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
